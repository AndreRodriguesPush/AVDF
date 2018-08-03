using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ufmt.br.bolsa.auxilio.siafi.Models.Repositorio;
using ufmt.br.bolsa.auxilio.siafi.Models.ViewModel;

namespace GerenciamentoBolsasAuxiliosSiafi.Models.ViewModel
{
    public class ViewModelRelatorioDownloadArquivo
    {
        public long IdRelatorio { get; set; }
        public DateTime Mes { get; set; }
        public String Edital { get; set; }
        public enum TipoArquivo { CR, LC };

        public List<ViewModelCampus> ListaCampus { get; set; }
        public List<ViewModelUnidadeProReitoria> ListaProReitoria { get; set; }

        public ViewModelRelatorioDownloadArquivo()
        {}

        public ViewModelRelatorioDownloadArquivo(Repositorio repo)
        {
            ListaCampus = repo.GetListaCampus();
            ListaProReitoria = repo.GetListaProReitoria();
          
        }

      

    }
}
