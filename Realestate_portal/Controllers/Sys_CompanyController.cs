using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Postal;
using Realestate_portal.Models;
using Realestate_portal.Services.Contracts;

namespace Realestate_portal.Controllers
{
    public class Sys_CompanyController : Controller
    {
        private Realstate_agentsEntities db;
        private IGeneral generalClass;

        public Sys_CompanyController(IGeneral _generalClass, Realstate_agentsEntities _db)
        {
            generalClass = _generalClass;
            db = _db;
        }

        // GET: Sys_Company
        public ActionResult Index(int broker=0)
        {
            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;
                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "Sys_Company";
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

                ViewBag.rol = "SA";
                var lstCompanies = (from a in db.Sys_Company select a).ToList();
                ViewBag.lstCompanies = lstCompanies;
                //
                List<Sys_Company> lstBrokers = new List<Sys_Company>();
                lstBrokers = db.Sys_Company.ToList();


              
                return View(lstBrokers);

            }
            else
            {
                return RedirectToAction("Login", "Portal", new { access = false });
            }
        }

        // GET: Sys_Company/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sys_Company sys_Company = db.Sys_Company.Find(id);
            if (sys_Company == null)
            {
                return HttpNotFound();
            }
            return View(sys_Company);
        }

        // GET: Sys_Company/Create
        public ActionResult Create()
        {
            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;
                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "Sys_Company";
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
                //FIN HEADER

                ViewBag.ID_User = new SelectList(db.Sys_Users, "ID_User", "Name");
                return View();

            }else
            {
                return RedirectToAction("Login", "Portal", new { access = false });
            }
        }

        // POST: Sys_Company/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
     
        // GET: Sys_Company/Edit/5
        public ActionResult Edit(int? id)
        {

            if (generalClass.checkSession())
            {

                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "Posts";
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
                //FIN HEADER

                List<Sys_Users> lstuseradmin = new List<Sys_Users>();
                lstuseradmin = (from c in db.Sys_Users where (c.ID_Company == id && c.Roles.Contains("Admin")) select c).ToList();
                ViewBag.users = lstuseradmin;
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }

                Sys_Company sys_Company = db.Sys_Company.Find(id);

                if (sys_Company == null)
                {
                    return HttpNotFound();
                }
                return View(sys_Company);
            }
            else
            {
                return RedirectToAction("Login", "Portal", new { access = false });
            }

                
        }

        // POST: Sys_Company/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_Company,Name,Web,ShortName")] Sys_Company sys_Company, HttpPostedFileBase logo)
        {

            sys_Company.Logo = "";
            if (ModelState.IsValid)
            {
               

                try
                {
                    if (sys_Company.Logo == null)
                    {
                        sys_Company.Logo = "";
                    }
                    else
                    {
                        string fName = Path.GetFileName(logo.FileName);
                        // string fName = Path.GetFileName(imagen.FileName);
                        string fPath = Path.Combine(Server.MapPath("~/Content/Uploads/Images/logos/"), fName);
                        logo.SaveAs(fPath);

                        sys_Company.Logo = "~/Content/Uploads/Images/logos/" + logo.FileName;
                    }
                    
                }
                catch
                {

                }

                db.Entry(sys_Company).State = EntityState.Modified;
               
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sys_Company);
        }

        // GET: Sys_Company/Delete/5
        public ActionResult Delete(int? id)
        {
            if (generalClass.checkSession())
            {
                Sys_Users activeuser = Session["activeUser"] as Sys_Users;

                //HEADER
                //ACTIVE PAGES
                ViewData["Menu"] = "Portal";
                ViewData["Page"] = "Posts";
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
                //FIN HEADER


                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Sys_Company sys_Company = db.Sys_Company.Find(id);
                if (sys_Company == null)
                {
                    return HttpNotFound();
                }
                return View(sys_Company);
            }
            else
            {
                return RedirectToAction("Login", "Portal", new { access = false });
            }
        }

        // POST: Sys_Company/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Sys_Company sys_Company = db.Sys_Company.Find(id);
            db.Sys_Company.Remove(sys_Company);
            db.SaveChanges();
            return RedirectToAction("Index");
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
