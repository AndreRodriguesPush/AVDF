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
    
    public partial class dbd2bc5f7b2c4340389de9a7a7009d623cEntities : DbContext
    {
        public dbd2bc5f7b2c4340389de9a7a7009d623cEntities()
            : base("name=dbd2bc5f7b2c4340389de9a7a7009d623cEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tb_cidades> tb_cidades { get; set; }
        public virtual DbSet<tb_estados> tb_estados { get; set; }
    }
}
