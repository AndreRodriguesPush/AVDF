﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace sistema.avdf.varzeagrande.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class db67266d6c26b84ce087efa7a2013bd241Entities : DbContext
    {
        public db67266d6c26b84ce087efa7a2013bd241Entities()
            : base("name=db67266d6c26b84ce087efa7a2013bd241Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AspectoSocial> AspectoSocial { get; set; }
        public virtual DbSet<PatologiaPessoa> PatologiaPessoa { get; set; }
        public virtual DbSet<pessoa> Pessoa { get; set; }
    }
}