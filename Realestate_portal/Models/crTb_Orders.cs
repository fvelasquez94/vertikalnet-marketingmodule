
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace Realestate_portal.Models
{

using System;
    using System.Collections.Generic;
    
public partial class crTb_Orders
{

    public int ID_order { get; set; }

    public System.DateTime Date { get; set; }

    public int ID_user { get; set; }

    public string Status { get; set; }

    public Nullable<int> ID_Company { get; set; }



    public virtual Sys_Company Sys_Company { get; set; }

}

}