
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
    
public partial class template_pricing
{

    public int id { get; set; }

    public decimal price { get; set; }

    public int dimensions { get; set; }

    public int quantity { get; set; }



    public virtual Template_dimensions Template_dimensions { get; set; }

}

}