
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
    
public partial class Payment_Intent
{

    public int id { get; set; }

    public string payment_intent_id { get; set; }

    public decimal shipping { get; set; }

    public decimal price { get; set; }

    public int user_id { get; set; }

    public int items { get; set; }

    public string status { get; set; }

    public int orderid { get; set; }



    public virtual marketing_orders marketing_orders { get; set; }

    public virtual Sys_Users Sys_Users { get; set; }

}

}