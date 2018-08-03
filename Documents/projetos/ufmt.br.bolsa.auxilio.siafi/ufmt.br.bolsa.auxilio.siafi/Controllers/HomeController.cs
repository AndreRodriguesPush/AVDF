using GerenciamentoBolsasAuxiliosSiafi.Models.DAL;
using GerenciamentoBolsasAuxiliosSiafi.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ufmt.br.bolsa.auxilio.siafi.Models;
using ufmt.br.bolsa.auxilio.siafi.Models.Repositorio;

namespace ufmt.br.bolsa.auxilio.siafi.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            var _repositorio = new Repositorio();
            var listas = new ViewModelRelatorioDownloadArquivo(_repositorio);

            return View(listas);
        }

        public ActionResult Home(string tipoArquivo, string edital, string mes)
        {
            DateTime ano = DateTime.Now;
            string anoDoisDigitos = ano.Year.ToString().Substring(2, 2).ToString();

            var cadastroCredor = new DALCriaArquivoCredor();
            var listaCredor = new DALCriaArquivoListaCredor();

            if (tipoArquivo.Equals("CR"))
            {
                var downloadFile = cadastroCredor.ArquivoCadastroCredor(edital);
                return File(downloadFile, "text/plain", "CR154045" + "." + anoDoisDigitos + "1");
            }
            else
            {
                var downloadFile = listaCredor.ArquivoListaCredor(mes);
                return File(downloadFile, "text/plain", "LC154045" + "." + anoDoisDigitos + "1");
            }
        }
    }
}