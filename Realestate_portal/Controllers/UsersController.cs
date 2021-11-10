using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using Postal;
using Realestate_portal.Models;
using Realestate_portal.Services.Contracts;

namespace Realestate_portal.Controllers
{
    public class UsersController : Controller
    {
        private Realstate_agentsEntities db;
        private IGeneral generalClass;


        public UsersController(IGeneral _generalClass, Realstate_agentsEntities _db)
        {
            generalClass = _generalClass;
            db = _db;
        }

        [HttpPost]
        public ActionResult changeProfilePicture(int id)
        {
            var path = "";
            var fileName = "";


            try
            {

                if (Request.Files.Count > 0)
                {

                    for (int i = 0; i < Request.Files.Count; i++)
                    {
                        var file = Request.Files[i];

                        fileName = Path.GetFileName(file.FileName);

                        path = Path.Combine(Server.MapPath("~/Content/Uploads/Images/profiles/"), fileName);
                        file.SaveAs(path);
                    }

                    var user = (from a in db.Sys_Users where (a.ID_User == id) select a).FirstOrDefault();
                    user.Image = "~/Content/Uploads/Images/profiles/" + fileName;
                    user.Last_update = DateTime.UtcNow;
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();

                    Session["activeUser"] = user;


                    var result = "SUCCESS";
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
                else {


                    var result = "No image";
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                var result = ex.Message;
                return Json(result, JsonRequestBehavior.AllowGet);

            }

        }





        // GET: Users/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sys_Users sys_Users = db.Sys_Users.Find(id);
            if (sys_Users == null)
            {
                return HttpNotFound();
            }
            return View(sys_Users);
        }

        // GET: Users/Create
        public ActionResult Create(int broker=0)
        {

            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "Users";
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
                //FIN HEADER

                if (r.Contains("Agent"))
                {
                    ViewBag.rol = "Agent";

                }
                else if (r.Contains("Admin"))
                {
                    ViewBag.rol = "Admin";


                }
                else
                {
                    ViewBag.rol = "SA";
                }

                ViewBag.activeuser = activeuser;
                ViewBag.selbroker = broker;
                ViewBag.ID_Company = new SelectList(db.Sys_Company, "ID_Company", "Name");
                return View();
            }
            else
            {

                return RedirectToAction("Login", "Portal", new { access = false });

            }

   
        }

        
        // GET: Users/Edit/5
        public ActionResult EditAgent(int? id, string modulo, int broker=0)
        {

            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "Users";
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
                ViewBag.modulo = modulo;

                if (r.Contains("Agent"))
                {
                    ViewBag.rol = "Agent";

                }
                else if(r.Contains("Admin"))
                {
                    ViewBag.rol = "Admin";


                }
                else
                {
                    ViewBag.rol = "SA";
                }

                Sys_Users sys_Users = db.Sys_Users.Find(id);
                ViewBag.activeuser = activeuser;
                ViewBag.selbroker = broker;
                ViewBag.ID_Company = new SelectList(db.Sys_Company, "ID_Company", "Name", sys_Users.ID_Company);
                return View(sys_Users);

            }
            else
            {

                return RedirectToAction("Login", "Portal", new { access = false });

            }



        }

      
        // GET: Users/Edit/5
        public ActionResult Edit(int? id, string modulo, int broker=0)
        {

            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "Users";
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

                //Filtros SA

                var lstCompanies = (from a in db.Sys_Company select a).ToList();
                ViewBag.lstCompanies = lstCompanies;

                ViewBag.rol = "";
                ViewBag.modulo = modulo;

                if (r.Contains("Agent"))
                {
                    ViewBag.rol = "Agent";
                    var brokersel = (from b in db.Sys_Users where (b.ID_Company == activeuser.ID_Company && b.Roles.Contains("Admin")) select b).FirstOrDefault();
                    ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User) select usd).FirstOrDefault();

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
                            ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User) select usd).FirstOrDefault();

                        }
                        else
                        {

                            ViewBag.rol = "SA";

                            ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_Company == broker && usd.Roles.Contains("Admin")) select usd).FirstOrDefault();
                            var brokersel = (from b in db.Sys_Users where (b.ID_Company == broker && b.Roles.Contains("Admin")) select b).FirstOrDefault();

                        }
                    }



                }
                ViewBag.selbroker = broker;
                Sys_Users sys_Users = db.Sys_Users.Find(id);

                ViewBag.ID_Company = new SelectList(db.Sys_Company, "ID_Company", "Name", sys_Users.ID_Company);
                return View(sys_Users);

            }
            else
            {

                return RedirectToAction("Login", "Portal", new { access = false });

            }



        }


        // GET: Users/Edit/5
        public ActionResult EditAdminB(int? id, int brokerupd, string modulo, int broker = 0)
        {

            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "Users";
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

                //Filtros SA

                var lstCompanies = (from a in db.Sys_Company select a).ToList();
                ViewBag.lstCompanies = lstCompanies;

                ViewBag.rol = "";
                ViewBag.modulo = modulo;

                if (r.Contains("Agent"))
                {
                    ViewBag.rol = "Agent";
                    var brokersel = (from b in db.Sys_Users where (b.ID_Company == activeuser.ID_Company && b.Roles.Contains("Admin")) select b).FirstOrDefault();
                    ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User) select usd).FirstOrDefault();

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
                            ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User) select usd).FirstOrDefault();

                        }
                        else
                        {

                            ViewBag.rol = "SA";

                            ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_Company == broker && usd.Roles.Contains("Admin")) select usd).FirstOrDefault();
                            var brokersel = (from b in db.Sys_Users where (b.ID_Company == broker && b.Roles.Contains("Admin")) select b).FirstOrDefault();

                        }
                    }



                }
                ViewBag.selbroker = broker;
                Sys_Users sys_Users = db.Sys_Users.Find(id);

                ViewBag.ID_Company = new SelectList(db.Sys_Company, "ID_Company", "Name", sys_Users.ID_Company);
                return View(sys_Users);

            }
            else
            {

                return RedirectToAction("Login", "Portal", new { access = false });

            }



        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAdminB(int ID_User, string Name,string Email,string Password,Boolean Active)
        {
            var sys_Users = db.Sys_Users.Find(ID_User);
            try
            {
          
                sys_Users.Name = Name;
                sys_Users.Email = Email;
                sys_Users.Password = Password;
                sys_Users.Active = Active;
                db.Entry(sys_Users).State = EntityState.Modified;
                db.SaveChanges();
                TempData["exito"] = "Data saved successfully.";
                return RedirectToAction("Edit", "Sys_Company", new { id = sys_Users.ID_Company });

            }
            catch (Exception ex)
            {
                TempData["advertencia"] = "Something went wrong." + ex.Message;
                return RedirectToAction("Edit", "Sys_Company", new { id = sys_Users.ID_Company });
            }


        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
      
        // GET: Users/Delete/5
        public ActionResult Delete(int? id)
        {
            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "CRM";
                ViewData["Page"] = "Users";
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


                if (r.Contains("Agent"))
                {
                    ViewBag.rol = "Agent";

                }
                else
                {
                    ViewBag.rol = "Admin";


                }


                Sys_Users sys_Users = db.Sys_Users.Find(id);

                return View(sys_Users);

            }
            else
            {

                return RedirectToAction("Login", "Portal", new { access = false });

            }

        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Sys_Users sys_Users = db.Sys_Users.Find(id);
            db.Sys_Users.Remove(sys_Users);
            db.SaveChanges();
            return RedirectToAction("Users", "CRM");
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
