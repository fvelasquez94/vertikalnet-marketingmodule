
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
    
public partial class Receipt
{

    public int id { get; set; }

    public int user_id { get; set; }

    public int order_id { get; set; }

    public string location { get; set; }

    public string file_name { get; set; }



    public virtual marketing_orders marketing_orders { get; set; }

    public virtual Sys_Users Sys_Users { get; set; }

}

}
