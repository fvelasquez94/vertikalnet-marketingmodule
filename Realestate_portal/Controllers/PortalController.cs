using Ionic.Zip;
using Newtonsoft.Json;
using Postal;
using Realestate_portal.Models;
using Realestate_portal.Models.ViewModels.CRM;
using Realestate_portal.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace Realestate_portal.Controllers
{
    public class PortalController : Controller
    {
        private Realstate_agentsEntities db;
        private IGeneral generalClass;
        private Cls_GoogleCalendar cls_GoogleCalendar = new Cls_GoogleCalendar();
        private Imarket repo;
        //Credentials

        public PortalController(IGeneral _generalClass, Realstate_agentsEntities _db, Imarket _repo)
        {
            generalClass = _generalClass;
            db = _db;
            repo = _repo;
        }

        public ActionResult Log_out()
        {
            Session.RemoveAll();
            //Global_variables.active_user.Name = null;
            //Global_variables.active_Departments = null;
            //Global_variables.active_Roles = null;
            if (Request.Cookies["correo"] != null)
            {
                var c = new HttpCookie("correo");
                c.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(c);
            }
            if (Request.Cookies["pass"] != null)
            {
                var c = new HttpCookie("pass");
                c.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(c);
            }
            if (Request.Cookies["rememberme"] != null)
            {
                var c = new HttpCookie("rememberme");
                c.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(c);
            }



            return RedirectToAction("Login", "Portal", new { access = true, logpage=2 });
        }


        [HttpGet]
        public ActionResult markasread()
        {
          
            try
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;
                db.Database.ExecuteSqlCommand("update Sys_Notifications set Active=0 where ID_user={0}", activeuser.ID_User);

                return Redirect(Request.UrlReferrer.ToString());
            }
            catch {
                return Redirect(Request.UrlReferrer.ToString());
            }

           

        }

        public ActionResult Login(bool access = true, int? logpage = 0)
        {
            if (access == false)
            {
                if (logpage == 0)
                {
                    TempData["advertencia"] = "Expired Session.";
                }
                else if (logpage == 1)
                {
                    TempData["advertencia"] = "Wrong email or password.";
                }
                else{
                 
                }

            }

            HttpCookie aCookieCorreo = Request.Cookies["correo"];
            HttpCookie aCookiePassword = Request.Cookies["pass"];
            HttpCookie aCookieRememberme = Request.Cookies["rememberme"];
            ViewBag.correo = "";
            ViewBag.pass = "";
            ViewBag.remember = false;
            //try
            //{
            //    var correo = Server.HtmlEncode(aCookieCorreo.Value).ToString();
            //    var pass = Server.HtmlEncode(aCookiePassword.Value).ToString();
            //    int remember = Convert.ToInt32(Server.HtmlEncode(aCookieRememberme.Value));

            //    if (remember == 1) { ViewBag.remember = true; } else { ViewBag.remember = false; }
            //    ViewBag.correo = correo;
            //    ViewBag.pass = pass;

            //}
            //catch
            //{
            //    ViewBag.remember = false;

            //}



            return View();
        }

        public ActionResult Log_in(string email, string password, bool? rememberme)
        {
            if (rememberme == null) { rememberme = true; }
            rememberme = true;
            Session["activeUser"] = (from a in db.Sys_Users where (a.Email == email && a.Password == password && a.Active == true) select a).FirstOrDefault();
            if (Session["activeUser"] != null)
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                ///PARA RECORDAR DATOS
                if (rememberme == true)
                {
                    if (Request.Cookies["correo"] != null)
                    {
                        if (Request.Cookies["correo"] != null)
                        {
                            var c = new HttpCookie("correo");
                            c.Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies.Add(c);
                        }
                        if (Request.Cookies["pass"] != null)
                        {
                            var c = new HttpCookie("pass");
                            c.Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies.Add(c);
                        }
                        if (Request.Cookies["rememberme"] != null)
                        {
                            var c = new HttpCookie("rememberme");
                            c.Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies.Add(c);
                        }

                        HttpCookie aCookie = new HttpCookie("correo");
                        aCookie.Value = activeuser.Email.ToString();
                        aCookie.Expires = DateTime.Now.AddMonths(3);

                        HttpCookie aCookie2 = new HttpCookie("pass");
                        aCookie2.Value = activeuser.Password.ToString();
                        aCookie2.Expires = DateTime.Now.AddMonths(3);

                        HttpCookie aCookie3 = new HttpCookie("rememberme");
                        aCookie3.Value = "1";
                        aCookie3.Expires = DateTime.Now.AddMonths(3);


                        Response.Cookies.Add(aCookie);
                        Response.Cookies.Add(aCookie2);
                        Response.Cookies.Add(aCookie3);
                    }
                    else
                    {
                        HttpCookie aCookie = new HttpCookie("correo");
                        aCookie.Value = activeuser.Email.ToString();
                        aCookie.Expires = DateTime.Now.AddMonths(3);

                        HttpCookie aCookie2 = new HttpCookie("pass");
                        aCookie2.Value = activeuser.Password.ToString();
                        aCookie2.Expires = DateTime.Now.AddMonths(3);

                        HttpCookie aCookie3 = new HttpCookie("rememberme");
                        aCookie3.Value = "1";
                        aCookie3.Expires = DateTime.Now.AddMonths(3);


                        Response.Cookies.Add(aCookie);
                        Response.Cookies.Add(aCookie2);
                        Response.Cookies.Add(aCookie3);
                    }
                }
                else
                {
                    if (Request.Cookies["correo"] != null)
                    {
                        var c = new HttpCookie("correo");
                        c.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(c);
                    }
                    if (Request.Cookies["pass"] != null)
                    {
                        var c = new HttpCookie("pass");
                        c.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(c);
                    }
                    if (Request.Cookies["rememberme"] != null)
                    {
                        var c = new HttpCookie("rememberme");
                        c.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(c);
                    }

                }


                if (activeuser.Roles.Contains("SA"))
                {
                    ViewBag.rol = "SA";
                    return RedirectToAction("Index", "Market", null);
                }
                else if (activeuser.Roles.Contains("Admin"))
                {
                    ViewBag.rol = "Admin";

                    return RedirectToAction("Index", "Market", null);
                }
                else if (activeuser.Roles.Contains("Agent"))
                {
                    ViewBag.rol = "Agent";

                    return RedirectToAction("Index", "Market", null);
                }





            }

            return RedirectToAction("Login", "Portal", new { access = false, logpage = 1 });
        }


        public ActionResult Appointment(int? id, string idproperty, string property, string price, string listingtype, string urlimg)
        {

            try
            {

                if (idproperty != "" && idproperty != null) { ViewBag.hasproperty = 1; } else { ViewBag.hasproperty = 0; }

            }
            catch
            {
                ViewBag.hasproperty = 0;

            }

            ViewBag.idproperty = idproperty;
            ViewBag.property = property;
            ViewBag.price = price;
            ViewBag.listingtype = listingtype;
            ViewBag.urlimg = urlimg;

            return View();
        }

        public ActionResult AppointmentCareers(string sub)
        {
            ViewBag.modulo = sub;
            return View();
        }
        public ActionResult Process(int? id, string idproperty, string property, string price, string listingtype, string urlimg)
        {

            try
            {

                if (idproperty != "" && idproperty != null) { ViewBag.hasproperty = 1; } else { ViewBag.hasproperty = 0; }

            }
            catch
            {
                ViewBag.hasproperty = 0;

            }

            ViewBag.idproperty = idproperty;
            ViewBag.property = property;
            ViewBag.price = price;
            ViewBag.listingtype = listingtype;
            ViewBag.urlimg = urlimg;

            return View();
        }
        public ActionResult Forgot_password(bool token = false, bool email = false, string errorconsole="")
        {
            if (token == true)
            {
                ViewData["msgnotexist"] = "";
                ViewBag.msg = "Your password has been changed successfully! Your new password has been sent to your email address.";
            }
            else
            {
                if (email == true)
                {
                    ViewData["msgnotexist"] = "This email does not exist.";
                }
                else
                {
                    ViewData["msgnotexist"] = "";
                }

                ViewBag.msg = "";
            }

            ViewBag.errorconsole = errorconsole;

            return View();
        }

        public ActionResult Reset_pass(string email)
        {


            Sys_Users User = (from a in db.Sys_Users where (a.Email == email && a.Active==true) select a).FirstOrDefault();
            if (User != null)
            {
                User.Password = "pgr2020";
                db.Entry(User).State = EntityState.Modified;
                db.SaveChanges();

                try
                {
                    if (User.Email != "")
                    {
                        //Send the email
                        dynamic semail = new Email("reset_password");
                        semail.To = User.Email.ToString();
                        semail.From = "support@s7ven.co";
                        semail.user = User.Name + " " + User.LastName;
                        semail.email = User.Email;
                        semail.password = User.Password;

                        semail.Send();
                        return RedirectToAction("Forgot_password", "Portal", new { token = true, email = false, errorconsole="" });
                    }
                    else {
                        return RedirectToAction("Forgot_password", "Portal", new { token = false, email = true, errorconsole = "No email configured" });
                    }

                    //FIN email
                }
                catch (Exception ex) {
                    return RedirectToAction("Forgot_password", "Portal", new { token = false, email = true, errorconsole = ex.Message });

                }


            }

            return RedirectToAction("Forgot_password", "Portal", new { token = false, email = true,errorconsole = "No user email found" });
        }


        public ActionResult test_API()
        {
            Cls_GoogleCalendar sevent = new Cls_GoogleCalendar();
            sevent.Test_googleEvents();
            return View();
        }

        public ActionResult PGR_Market(int broker = 0)
        {
            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "PGR Market";
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
                    var brokersel = (from b in db.Sys_Users where (b.ID_Company == activeuser.ID_Company && b.Roles.Contains("Admin")) select b).FirstOrDefault();
                    ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User) select usd).FirstOrDefault();

                }
                else
                {
                    if (r.Contains("SA") && broker == 0)
                    {
                        ViewBag.rol = "SA";
                        ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_Company == activeuser.ID_Company && usd.Roles.Contains("Admin")) select usd).FirstOrDefault();
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
                var lstCompanies = (from a in db.Sys_Company select a).ToList();
                ViewBag.lstCompanies = lstCompanies;

           

                return View();

            }
            else
            {

                return RedirectToAction("Login", "Portal", new { access = false });

            }
        }
        // END - Credentials
        public ActionResult Dashboard(int broker = 0)
        {
            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewBag.CartItems = repo.GetCartCount();
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "Dashboard";
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

                //Filtros SA

                var lstCompanies = (from a in db.Sys_Company select a).ToList();
                ViewBag.lstCompanies= lstCompanies;
                //
          
                if (r.Contains("Agent"))
                {
                    ViewBag.rol = "Agent";
                    var brokersel = (from b in db.Sys_Users where (b.ID_Company == activeuser.ID_Company && b.Roles.Contains("Admin"))select b).FirstOrDefault();
                    ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User) select usd).FirstOrDefault();
                    ViewBag.userdataBroker = (from usd in db.Sys_Users where (usd.Roles.Contains("Admin") && usd.ID_Company==activeuser.ID_Company) select usd).FirstOrDefault();

                }
                else
                {
                    if(r.Contains("SA") && broker==0)
                    {
                        ViewBag.rol = "SA";
                        ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User && usd.Roles.Contains("SA")) select usd).FirstOrDefault();
                        ViewBag.userdataBroker = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User && usd.Roles.Contains("SA")) select usd).FirstOrDefault();

                        var brokersel = (from b in db.Sys_Users where (b.ID_Company == activeuser.ID_Company && b.Roles.Contains("Admin")) select b).FirstOrDefault();
                        RedirectToAction("Dashboard", "Portal", new { broker = brokersel.ID_Company });
                    }
                    else
                    {
                        ViewBag.rol = "Admin";
                        if (broker == 0)
                        {
                            ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User) select usd).FirstOrDefault();
                            ViewBag.userdataBroker = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User) select usd).FirstOrDefault();
                        }
                        else
                        {

                            ViewBag.rol = "SA";
                           
                            ViewBag.userdata = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User && usd.Roles.Contains("SA")) select usd).FirstOrDefault();
                            ViewBag.userdataBroker = (from usd in db.Sys_Users where (usd.ID_User == activeuser.ID_User && usd.Roles.Contains("SA")) select usd).FirstOrDefault();
                            var brokersel = (from b in db.Sys_Users where (b.ID_Company == broker && b.Roles.Contains("Admin")) select b).FirstOrDefault();
                        }
                    }
                    


                }

                ViewBag.selbroker = broker;
                //POST TYPE: 1-BROKER | 2-AGENT | 3-ADMIN
                //BROKER MESSAGE

                int likepost = 0;
                int idparentpost = 0;

               

                var quote = "";
                var author = "";


                var today = DateTime.Today.ToString("yyyy-MM-dd");
    

                ViewBag.quote = quote;
                ViewBag.author = author;

                ViewBag.idparentpost = idparentpost;
                ViewBag.likepost = likepost;

                ViewBag.totalcustomers = 0;
                ViewBag.totalgainsprojected = 0;
                ViewBag.totalgains = 0;               
                return View();

            }
            else
            {

                return RedirectToAction("Login", "Portal", new { access = false });

            }
        }
       
       
       


     
     
        public ActionResult Obtener_actividadesConflicto(DateTime horainicio)
        {
            var events = cls_GoogleCalendar.get_events(horainicio);

            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
            string result = javaScriptSerializer.Serialize(events);
            return Json(result, JsonRequestBehavior.AllowGet);
        }


      



    



        public ActionResult Download_imageMarketing(int id)
        {

            var fileDB = (from a in db.Tb_Marketing where (a.ID_marketing == id) select a).FirstOrDefault();

            var path = fileDB.T_image;
            var file = Server.MapPath(path);


            return File(file, "image/jpeg");

        }

      



        public class Routes_calendar
        {
            public string title { get; set; }
            public string url { get; set; }
            public string start { get; set; }
            public string end { get; set; }
            public string className { get; set; }
            public string time { get; set; }
            public string category { get; set; }


        }

        public ActionResult GetExistEmail(string email)
        {
            try
            {
                var lstusers = (from a in db.Sys_Users where (a.Email == email) select a).ToList();

                if (lstusers.Count > 0)
                {
                    return Json("si", JsonRequestBehavior.AllowGet);
                }
                else {
                    return Json("no", JsonRequestBehavior.AllowGet);
                }

               

            }
            catch
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }


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