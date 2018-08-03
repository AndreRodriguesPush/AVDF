using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ufmt.br.bolsa.auxilio.siafi.AlunoSigaReference;
using ufmt.br.bolsa.auxilio.siafi.LocalizacaoReference;

namespace ufmt.br.bolsa.auxilio.siafi.Models.Repositorio
{
    public class Repositorio : IRepositorio
    {
        public List<ViewModel.ViewModelCampus> GetListaCampus()
        {
            var local = new LocalizacaoClient();
            var listaCamp = local.GetCampiGeral();

            var listaCampus = listaCamp.Where(x => x.campusUID != 5)
                            .Select(x => new ViewModel.ViewModelCampus
                            {
                                CampusUID = x.campusUID,
                                NomeCampus = x.nome
                            }).ToList();

            return (listaCampus);

        }

        public List<ViewModel.ViewModelUnidadeProReitoria> GetListaProReitoria()
        {
            var unidade = new LocalizacaoClient();
            var listaUnd = unidade.GetUnidades(" ", 1, true, 1, 100);

            var listaUnidade = listaUnd.Where(x => x.UnidadeUID == 1376).Select(x => new ViewModel.ViewModelUnidadeProReitoria
            // var listaUnidade = listaUnd.Select(x => new ViewModel.ViewModelUnidadeProReitoria
            {
                UnidadeProReitoriaUID = x.UnidadeUID,
                NomeUnidadeProreitoria = x.Nome,
                SiglaProReitoria = x.Sigla
            }).ToList();

            return (listaUnidade);
        }

    }
}