//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ufmt.br.bolsa.auxilio.siafi.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CadastroCredorSiafi
    {
        public long IdCadastroCredor { get; set; }
        public string HeaderCadastroCredor { get; set; }
        public string DetalheCadastroCredor { get; set; }
        public string TraillerCadastroCredor { get; set; }
        public string MesEdital { get; set; }
        public string Edital { get; set; }
        public System.DateTime DataCriacao { get; set; }
        public Nullable<int> NumeroRemessa { get; set; }
    }
}
