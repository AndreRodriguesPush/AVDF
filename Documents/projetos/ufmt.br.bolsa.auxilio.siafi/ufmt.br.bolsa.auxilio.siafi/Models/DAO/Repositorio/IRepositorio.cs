using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ufmt.br.bolsa.auxilio.siafi.Models.Repositorio
{
    interface IRepositorio
    {
        List<ViewModel.ViewModelCampus> GetListaCampus();

        List<ViewModel.ViewModelUnidadeProReitoria> GetListaProReitoria();
    }
}
