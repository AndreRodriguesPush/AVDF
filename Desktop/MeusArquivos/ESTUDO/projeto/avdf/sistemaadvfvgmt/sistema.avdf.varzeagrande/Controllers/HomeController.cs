using sistema.avdf.varzeagrande.Models;
using sistema.avdf.varzeagrande.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace sistema.avdf.varzeagrande.Controllers
{
    public class HomeController : Controller
    {

        //public ActionResult Login()
        //{

        //    return View();

        //}

        //[HttpPost]
        //public ActionResult Login(String Login, String Senha)
        //{
        //    try
        //    {
        //        using (var db = new /*idbavdfvgEntities*/ elluscosmeticos_idbcitystateEntities1())
        //        {
        //            var loginUsuario = db.usuarioavdf.Where(x => x.email.Equals(Login) && x.senhaUsuario.Equals(Senha)).FirstOrDefault();

        //            if (loginUsuario != null)
        //            {
        //                Session["UsuarioLogadoID"] = loginUsuario.usuarioUID;
        //                Session["NomeUsuarioLogado"] = loginUsuario.loginUsuario;
        //                return RedirectToAction("Index", "Relatorio");
        //            }

        //        }
        //        return View("Login");
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }

        //}

        public ActionResult Index()
        {
            //if (Session["usuarioLogadoID"] != null)
            //{
            //    //var pessoa = (ViewModelPessoaADVF)Session["Pessoa"];
            //    //using (var db = new idbavdfvgEntities())
            //    //{
            //    //    var loginUsuario = db.pessoa.Where(x => x.nome.Equals(pessoa.Nome)).FirstOrDefault();
            //    //    ViewBag.NomeUsuario(loginUsuario.nome);
            //    //    ViewBag.PessoaUID(loginUsuario.pessoaUID);
            //    //}
            //    return View();
            //}
            //else
            //{
            //    return RedirectToAction("CadastroADVF");
            //}
            return View();
        }

        //[HttpPost]
        //public ActionResult SalvaLogin(String Login, String Email, String Senha)
        //{
        //    using (var db = new /*idbavdfvgEntities*/ elluscosmeticos_idbcitystateEntities1())
        //    {
        //        var usuarioAVDF = new usuarioavdf()
        //        {
        //            loginUsuario = Login,
        //            email = Email,
        //            senhaUsuario = Senha,
        //            pessoaUID = 0,
        //            dataCadastro = DateTime.Now
        //        };
        //        db.usuarioavdf.Add(usuarioAVDF);
        //        db.SaveChanges();

        //        return View("Login");
        //    }
        //}

        public ActionResult CadastroADVF()
        {
            using (var db = new /*idbavdfvgEntities*/ dbd2bc5f7b2c4340389de9a7a7009d623cEntities())
            {
                ViewBag.ListaEstados = db.tb_estados.ToList().OrderBy(x => x.nome);

                return View();
            }
        }

        [HttpPost]
        public JsonResult ListaCidade(int uf)
        {
            using (var db = new /*idbavdfvgEntities*/ dbd2bc5f7b2c4340389de9a7a7009d623cEntities())
            {
                var listaCidades = db.tb_cidades.Where(c => c.estado == uf).ToList().OrderBy(x => x.nome);

                return Json(listaCidades);
            }
        }

        [HttpPost]
        public ActionResult SalvarDados(ViewModelPessoaADVF p)
        {
            try
            {
                using (var db3 = new /*idbavdfvgEntities*/elluscosmeticos_idbcitystateEntities1())
                {
                    var Cpf = "";
                    var dataNascimento = "";

                    if (p.Cpf == null)
                    {
                        Cpf = "00000000000";
                    }
                    else
                    {
                        Cpf = p.Cpf.Trim();
                        Cpf = Cpf.ToString().Replace(".", "").Replace("-", "");
                    }
                    if (p.DataNascimento == null)
                    {

                        dataNascimento = "00/00/0000";
                    }
                    else
                    {

                        dataNascimento = p.DataNascimento.Date.ToString();
                    }

                    var pessoa = new pessoa()
                    {
                        nome = p.Nome,
                        sexo = p.Sexo,
                        dataNascimento = DateTime.Parse(dataNascimento),
                        estadoUID = (int)p.Estado,/*p.Estado.id*/
                        cidadeUID = (int)p.Cidade,/*p.Cidade.id*/
                        rg = p.Rg,
                        cpf = Cpf,
                        nomeMae = p.NomeMae,
                        nomePai = p.NomePai,
                        cep = p.CepResidencia,
                        rua = p.RuaResidencia,
                        casa = p.CasaResidencia,
                        bairro = p.BairroResidencia,
                        quadra = p.QuadraResidencia,
                        complemento = p.ComplementoResidencia,
                        telefone1 = p.Telefone1,
                        telefone2 = p.Telefone2,
                        telefone3 = p.Telefone3,
                        dataCadastro = DateTime.Now,
                        status = (int)EnumStatus.ATIVO,
                    };
                    db3.pessoa.Add(pessoa);

                    var PatologiaPessoa = new patologia()
                    {
                        pessoaUID = pessoa.pessoaUID,
                        patologia1 = p.Patologia ? true : false,
                        causaPatologia = p.CausaPatologia,
                        deficienciaApresentada = p.DeficienciaApresentada,
                        tipoDeficiencia = p.TipoDeficiencia,
                        acessibilidadeMobilidade = p.AcessibilidadeMobilidade,
                        deficienciaColuna = p.DeficienciaColuna ? true : false,
                        usaAparelho = p.UsaAparelho ? true : false,
                        descTipoAparelho = p.DescTipoAparelho,
                        dataCadastro = DateTime.Now
                    };
                    db3.patologia.Add(PatologiaPessoa);

                    var CpfConjuge = "";
                    var dataNascConjuge = "";

                    if (p.CpfConjuge == null)
                    {
                        CpfConjuge = "00000000000";
                    }
                    else
                    {
                        CpfConjuge = p.CpfConjuge.Trim();
                        CpfConjuge = CpfConjuge.ToString().Replace(".", "").Replace("-", "");
                    }

                    if (p.DataNascimentoConjuge == null)
                    {
                        dataNascConjuge = "00/00/0000";
                    }
                    else
                    {
                        dataNascConjuge = p.DataNascimentoConjuge.Date.ToString();
                    }

                    var AspectoSocial = new aspectosocial()
                    {
                        pessoaID = pessoa.pessoaUID,
                        carteiraPasseLivre = p.CarteiraPasseLivre ? true : false,
                        descCarteiraPasseLivre = p.DescCarteiraPasseLivre,
                        utilizaProjeto = p.UtilizaProjeto,
                        descUtilizaProjeto = p.DescUtilizaProjeto,
                        bpcLoas = p.BpcLoas,
                        recebeAposentadoria = p.RecebeAposentadoria,
                        situacaoMoradia = p.SituacaoMoradia,
                        rendaFamiliar = p.RendaFamiliar,
                        trabalhando = p.Trabalhando,
                        descTrabalhando = p.DescTrabalhando,
                        grauEscolaridade = p.GrauEscolaridade,
                        descProfissao = p.DescProfissao,
                        estadoCivil = p.EstadoCivil,
                        temFilhos = p.TemFilhos,
                        qtdeFilhos = p.QtdeFilhos,
                        nomeConjuge = p.NomeConjuge,
                        sexoConjuge = p.SexoConjuge,
                        dataNascimentoConjuge = DateTime.Parse(dataNascConjuge), /*DateTime.Parse(dataNascConjuge)*/
                        naturalidadeEstadoConjuge = p.NaturalidadeEstadoConjuge,
                        naturalidadeCidadeConjuge = p.NaturalidadeCidadeConjuge,
                        rgConjuge = p.RgConjuge,
                        cpfConjuge = CpfConjuge,
                        nte = p.Nte,
                        sessaoEleitoral = p.SessaoEleitoral,
                        zonaEleitoral = p.ZonaEleitoral,
                        nomeMaeConjuge = p.NomeMaeConjuge,
                        nomePaiConjuge = p.NomePaiConjuge,
                        dataCadastro = DateTime.Now
                    };
                    db3.aspectosocial.Add(AspectoSocial);
                    //Salva no DB
                    db3.SaveChanges();
                }
            }
            catch (Exception)
            {
                throw;
            }

            return View();
        }

        [HttpPost]
        public ActionResult Sair()
        {
            Session.Abandon();
            return RedirectToAction("/Home/Login");

        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}