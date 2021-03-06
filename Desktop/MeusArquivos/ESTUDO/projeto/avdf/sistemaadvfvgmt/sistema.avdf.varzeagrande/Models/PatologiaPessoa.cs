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
    
    public partial class PatologiaPessoa
    {
        public long patologiaUID { get; set; }
        public long pessoaUID { get; set; }
        public Nullable<bool> patologiaCongenita { get; set; }
        public Nullable<bool> patologiaAdquirida { get; set; }
        public string causaPatologia { get; set; }
        public string deficienciaApresentada { get; set; }
        public Nullable<int> tipoDeficiencia { get; set; }
        public Nullable<int> acessibilidadeMobilidade { get; set; }
        public Nullable<bool> deficienciaColuna { get; set; }
        public string descDeficienciaColuna { get; set; }
        public Nullable<bool> usaAparelho { get; set; }
        public string descTipoAparelho { get; set; }
        public System.DateTime dataCadastro { get; set; }
    
        public virtual pessoa Pessoa { get; set; }
    }
}
