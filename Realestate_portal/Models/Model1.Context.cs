﻿

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
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class Realstate_agentsEntities : DbContext
{
    public Realstate_agentsEntities()
        : base("name=Realstate_agentsEntities")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<crTb_OrderDetails> crTb_OrderDetails { get; set; }

    public virtual DbSet<crTb_Orders> crTb_Orders { get; set; }

    public virtual DbSet<label> labels { get; set; }

    public virtual DbSet<Marketing_order_details> Marketing_order_details { get; set; }

    public virtual DbSet<Receipt> Receipts { get; set; }

    public virtual DbSet<saved_labels> saved_labels { get; set; }

    public virtual DbSet<Saved_Templates> Saved_Templates { get; set; }

    public virtual DbSet<Sys_Company> Sys_Company { get; set; }

    public virtual DbSet<Sys_Notifications> Sys_Notifications { get; set; }

    public virtual DbSet<Sys_Roles> Sys_Roles { get; set; }

    public virtual DbSet<Tb_Marketing> Tb_Marketing { get; set; }

    public virtual DbSet<Tb_Reminders> Tb_Reminders { get; set; }

    public virtual DbSet<Template_categories> Template_categories { get; set; }

    public virtual DbSet<Template_Details> Template_Details { get; set; }

    public virtual DbSet<Template_type> Template_type { get; set; }

    public virtual DbSet<Billing_Shipping_details> Billing_Shipping_details { get; set; }

    public virtual DbSet<Shipping_Details> Shipping_Details { get; set; }

    public virtual DbSet<Payment_Intent> Payment_Intent { get; set; }

    public virtual DbSet<marketing_orders> marketing_orders { get; set; }

    public virtual DbSet<signs_description> signs_description { get; set; }

    public virtual DbSet<Template_dimensions> Template_dimensions { get; set; }

    public virtual DbSet<template_pricing> template_pricing { get; set; }

    public virtual DbSet<label_color> label_color { get; set; }

    public virtual DbSet<Template_colors> Template_colors { get; set; }

    public virtual DbSet<Sys_Users> Sys_Users { get; set; }

    public virtual DbSet<Tb_Customers> Tb_Customers { get; set; }

    public virtual DbSet<T_Company_Type> T_Company_Type { get; set; }

}

}
