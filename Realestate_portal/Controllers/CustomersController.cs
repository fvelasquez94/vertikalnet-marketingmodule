using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Postal;
using Realestate_portal.Models;
using Realestate_portal.Models.ViewModels.CRM;
using Realestate_portal.Services.Contracts;

namespace Realestate_portal.Controllers
{
    public class CustomersController : Controller
    {
        private Realstate_agentsEntities db;
        private IGeneral generalClass;
        private Cls_GoogleCalendar cls_GoogleCalendar = new Cls_GoogleCalendar();


        public CustomersController(IGeneral _generalClass, Realstate_agentsEntities _db)
        {
            generalClass = _generalClass;
            db = _db;
        }


        // GET: Tb_Customers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tb_Customers tb_Customers = db.Tb_Customers.Find(id);
            if (tb_Customers == null)
            {
                return HttpNotFound();
            }
            return View(tb_Customers);
        }





        [HttpPost]
        public ActionResult NewCareerfromWeb(string firstname, string lastname, string email, string telephone, DateTime date, DateTime time, string licensedagent, string way, string modulo)
        {
            try
            {

                var details = "Name: " + firstname + " " + lastname + "<br>";
                details += "Email: " + email + "<br>";
                details += "Tel: " + telephone + "<br>";
              
              
                var titlemodu = "";

                if (modulo == "")
                {

                }
                else if (modulo == "Careers") {
                    titlemodu = "New Appointment for Careers";
                    details += "Licensed Agent: " + licensedagent + "<br>";
                }
                else if (modulo == "Sponsorship")
                {
                    titlemodu = "New Appointment for Sponsorship";
                }
                else if (modulo == "Virtual")
                {
                    titlemodu = "New Appointment for Virtual Brokerage";
                    details += "Real State Broker: " + licensedagent + "<br>";
                }
                details += "Form of contact: " + way + "<br>";
                //Enviamos notificacion a GOOGLE CALENDAR
                try
                {
                    cls_GoogleCalendar.POST_googleEvents(date, time, titlemodu, details);
                }
                catch { }

                //

                var admins = (from a in db.Sys_Users where (a.Roles.Contains("Admin") && a.ID_Company == 1) select a).ToList();


                if (admins.Count > 0)
                {
                    foreach (var item in admins)
                    {
                        try
                        {
                            //Enviamos correo para notificar
                            dynamic emailtosend = new Email("newNotification_lead");
                            emailtosend.To = item.Email;
                            emailtosend.From = "customercare@premiumgrealty.com";
                            emailtosend.leadname = firstname + " " + lastname;
                            emailtosend.leademail = email;

                            emailtosend.subject = "New Appointment - PGR WEB";
                            emailtosend.Send();
                        }
                        catch
                        {

                        }

                    }
            




                }

                try
                {
                    //Enviamos correo para notificar
                    dynamic emailtosend = new Email("newNotification_client");
                    emailtosend.To = email;
                    emailtosend.From = "customercare@premiumgrealty.com";

                    emailtosend.subject = "Request information for Careers - Premium Group Realty NY";
                    emailtosend.Send();
                }
                catch
                {

                }



                var result = "SUCCESS";
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                var resulterror = ex.Message;
                return Json(resulterror, JsonRequestBehavior.AllowGet);
            }



        }

  


 


       





        // GET: Tb_Customers/Delete/5
        public ActionResult Delete(int? id, int broker=0)
        {
            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "CRM";
                ViewData["Page"] = "Properties";
                ViewBag.menunameid = "";
                ViewBag.submenunameid = "";
                List<string> s = new List<string>(activeuser.Department.Split(new string[] { "," }, StringSplitOptions.None));
                ViewBag.lstDepartments = JsonConvert.SerializeObject(s);
                List<string> r = new List<string>(activeuser.Roles.Split(new string[] { "," }, StringSplitOptions.None));
                ViewBag.lstRoles = JsonConvert.SerializeObject(r);
                //NOTIFICATIONS
                DateTime now = DateTime.Today;
                List<Sys_Notifications> lstAlerts = (from a in db.Sys_Notifications where (a.ID_user == activeuser.ID_User && a.Active == true) select a).OrderByDescending(x => x.Date).Take(4).ToList();
                ViewBag.notifications = lstAlerts;
                ViewBag.userID = activeuser.ID_User;
                ViewBag.userName = activeuser.Name + " " + activeuser.LastName;
                ViewBag.rol = "";

                //Filtros SA

                var lstCompanies = (from a in db.Sys_Company select a).ToList();
                ViewBag.lstCompanies = lstCompanies;




                if (r.Contains("Agent"))
                {
                    ViewBag.rol = "Agent";

                }
                else
                {
                    if (r.Contains("SA") && broker == 0)
                    {
                        ViewBag.rol = "SA";
                        ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_Company == activeuser.ID_Company) select usd).FirstOrDefault();
                        var brokersel = (from b in db.Sys_Users where (b.ID_Company == activeuser.ID_Company && b.Roles.Contains("Admin")) select b).FirstOrDefault();
                        RedirectToAction("Dashboard", "Portal", new { broker = brokersel.ID_Company });
                    }
                    else
                    {
                        ViewBag.rol = "Admin";
                        if (broker == 0)
                        {
                        }
                        else
                        {
                            ViewBag.rol = "SA";

                        }
                    }

                }
                Tb_Customers tb_Customers = db.Tb_Customers.Find(id);

                ViewBag.selbroker = broker;
                return View(tb_Customers);
               


            }
            else
            {

                return RedirectToAction("Login", "Portal", new { access = false });

            }

        }


        public ActionResult Success()
        {
            return View();
        }

        // POST: Tb_Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tb_Customers tb_Customers = db.Tb_Customers.Find(id);
            db.Tb_Customers.Remove(tb_Customers);
            db.SaveChanges();
            return RedirectToAction("Customers", "CRM");
        }

      [HttpPost]
        public ActionResult DeleteByAjax(int id)
        {
            var result="";
            try
            {
                Tb_Customers tb_Customers = db.Tb_Customers.Find(id);
                db.Tb_Customers.Remove(tb_Customers);
                db.SaveChanges();

                 result = "SUCCESS";
            }
            catch(Exception EX)
            {
                 result = "An error occurred "+EX.Message;
            }
            

            
            return Json(result);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
