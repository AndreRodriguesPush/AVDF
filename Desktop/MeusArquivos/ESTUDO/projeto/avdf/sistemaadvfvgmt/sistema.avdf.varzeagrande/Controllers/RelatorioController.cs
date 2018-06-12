using sistema.avdf.varzeagrande.Models;
using sistema.avdf.varzeagrande.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace sistema.avdf.varzeagrande.Controllers
{
    public class RelatorioController : Controller
    {
        // GET: Relatorio
        public ActionResult Index()
        {

            //if (Session["usuarioLogadoID"] != null)
            //{

            using (var db3 = new /*idbavdfvgEntities*/elluscosmeticos_idbcitystateEntities1())
            {
                //var cadastroAssociados = db3.pessoa.Include("tb_estados").Include("tb_cidades").ToList();
                //.Include("aspctosocial").Include("patologia")
                //ViewBag.Pessoa = cadastroAssociados;

                var cadastroAssociados = (
                                            from ps in db3.pessoa
                                            join aspsoc in db3.aspectosocial on ps.pessoaUID equals aspsoc.pessoaID
                                            join pato in db3.patologia on ps.pessoaUID equals pato.pessoaUID
                                            join e in db3.tb_estados on ps.estadoUID equals e.id
                                            join c in db3.tb_cidades on ps.cidadeUID equals c.id
                                            where ps.status == (int)EnumStatus.ATIVO
                                            select new ViewModelPessoaADVF
                                            {
                                                PessoaUID = ps.pessoaUID,
                                                Nome = ps.nome,
                                                Cpf = ps.cpf,
                                                Rg = ps.rg,
                                                SiglaEstado = e.uf,
                                                NomeCidade = c.nome
                                            }).ToList();

                List<ViewModelPessoaADVF> p = new List<ViewModelPessoaADVF>();

                foreach (var item in cadastroAssociados.ToList())
                {
                    ViewModelPessoaADVF associados = new ViewModelPessoaADVF(item);
                    p.Add(associados);
                };

                return View(p);

            }
            //}
            //else
            //{
            //    return RedirectToAction("Login","Home");
            //}

        }

        public ActionResult CarteiraAssociado(int pessoaUID)
        {
            using (var db3 = new /*idbavdfvgEntities*/elluscosmeticos_idbcitystateEntities1())
            {
                var cadastroAssociados = (
                                            from ps in db3.pessoa
                                            join aspsoc in db3.aspectosocial on ps.pessoaUID equals aspsoc.pessoaID
                                            join pato in db3.patologia on ps.pessoaUID equals pato.pessoaUID
                                            join e in db3.tb_estados on ps.estadoUID equals e.id
                                            join c in db3.tb_cidades on ps.cidadeUID equals c.id
                                            select new ViewModelPessoaADVF
                                            {
                                                PessoaUID = ps.pessoaUID,
                                                Nome = ps.nome,
                                                Cpf = ps.cpf,
                                                Rg = ps.rg,
                                                SiglaEstado = e.uf,
                                                NomeCidade = c.nome
                                            }).FirstOrDefault();

                                            return View(cadastroAssociados);
            }
        }
    }
}