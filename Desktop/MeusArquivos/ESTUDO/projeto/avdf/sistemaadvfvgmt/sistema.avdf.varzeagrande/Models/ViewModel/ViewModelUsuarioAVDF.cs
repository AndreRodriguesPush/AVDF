using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sistema.avdf.varzeagrande.Models.ViewModel
{
    public class ViewModelUsuarioAVDF
    {
        public long UsuarioUID { get; set; }
        public String LoginUsuario { get; set; }
        public String SenhaUsuario { get; set; }
        public String EmailUsuario { get; set; }
        public DateTime Datacadastro { get; set; }
        public Boolean StatusUsuario { get; set; }
        //public long PessoaUID { get; set; }
    }

    public class ViewModelUsuarioADVF {}
}