
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
    
public partial class marketing_orders
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public marketing_orders()
    {

        this.Marketing_order_details = new HashSet<Marketing_order_details>();

        this.Payment_Intent = new HashSet<Payment_Intent>();

        this.Receipts = new HashSet<Receipt>();

        this.Saved_Templates = new HashSet<Saved_Templates>();

        this.Billing_Shipping_details = new HashSet<Billing_Shipping_details>();

    }


    public int id { get; set; }

    public int user_id { get; set; }

    public int items { get; set; }

    public decimal ttl_price { get; set; }

    public decimal taxes { get; set; }

    public decimal shipping { get; set; }

    public System.DateTime creation_date { get; set; }

    public string payment_intent_id { get; set; }

    public string status { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Marketing_order_details> Marketing_order_details { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Payment_Intent> Payment_Intent { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Receipt> Receipts { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Saved_Templates> Saved_Templates { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Billing_Shipping_details> Billing_Shipping_details { get; set; }

    public virtual Sys_Users Sys_Users { get; set; }

}

}
