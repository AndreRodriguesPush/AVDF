//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class tb_cidades
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_cidades()
        {
            this.pessoa = new HashSet<pessoa>();
        }
    
        public long id { get; set; }
        public long estado { get; set; }
        public string uf { get; set; }
        public string nome { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<pessoa> pessoa { get; set; }
        public virtual tb_estados tb_estados { get; set; }
    }
}