using Realestate_portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Realestate_portal.Services.Contracts
{
   public interface IUser
    {
        //
        // Summary:
        //     gets the users defined in the Session as Sys_USers object
        Sys_Users GetUser();        
        //
        // Summary:
        //     returns the user role defined in the Session as string 
        string GetUserRole();

        //
        // Summary:
        //     set user notifications as a ViewBag item 
        List<Sys_Notifications> SetUserNotifications();
        //
        // Summary:
        //     set projected gains as ViewBag Items
        (int properties, string projectedGains, string gains) SetProjectedGains();

    }
}
