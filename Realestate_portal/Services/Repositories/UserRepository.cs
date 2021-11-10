using Realestate_portal.Models;
using Realestate_portal.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Realestate_portal.Services.Repositories
{
    public class UserRepository : Controller, IUser 
    {
        private Realstate_agentsEntities db;
        private IGeneral general;
        public UserRepository(Realstate_agentsEntities _db, IGeneral _general)
        {
            db = _db;
            general = _general;
        }

        //
        // Summary:
        //     gets the users defined in the Session as Sys_USers object
        public Sys_Users GetUser()
        {
        
            return general.GetUser();
        }


        public string GetUserRole()
        {
            var activeuser = GetUser();

            if (activeuser.Roles.Contains("SA"))
            {
               return "SA";
            }
            else if (activeuser.Roles.Contains("Admin"))
            {
                return  "Admin";
            }
            else
            {
                return  "Agent";
            }
        }
 
        public List<Sys_Notifications> SetUserNotifications()
        {
            var activeuser = GetUser();
            DateTime now = DateTime.Today;
            List<Sys_Notifications> lstAlerts = (from a in db.Sys_Notifications where (a.ID_user == activeuser.ID_User && a.Active == true) select a).OrderByDescending(x => x.Date).Take(4).ToList();
            return lstAlerts;
        }

        public (int properties,string projectedGains, string gains) SetProjectedGains()
        {
            var activeuser = GetUser();
            var properties = 0;
            var projectedGains = "";
            var gain="";
        
            return (properties, projectedGains, gain);
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