using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sistema.avdf.varzeagrande.Models.ViewModel
{
    public class ViewModelPessoaADVF
    {
        //Dados Pessoais
        public long PessoaUID { get; set; }
        public String Nome { get; set; }
        public String Sexo { get; set; }
        public DateTime DataNascimento { get; set; }
        public tb_estados Estados { get; set; }
        public tb_cidades Cidades { get; set; }
        public String SiglaEstado { get; set; }
        public String NomeCidade { get; set; }
        public int Estado { get; set; }
        public int Cidade { get; set; }
        public String Rg { get; set; }
        public String Cpf { get; set; }
        public String NomeMae { get; set; }
        public String NomePai { get; set; }
        public String CepResidencia { get; set; }
        public String RuaResidencia { get; set; }
        public String CasaResidencia { get; set; }
        public String BairroResidencia { get; set; }
        public String QuadraResidencia { get; set; }
        public String ComplementoResidencia { get; set; }
        public String Telefone1 { get; set; }
        public String Telefone2 { get; set; }
        public String Telefone3 { get; set; }
        public DateTime DataCadastro { get; set; }

        //Patologia
        public long PatologiaUID { get; set; }
        public bool Patologia { get; set; }
        public String CausaPatologia { get; set; }
        public String DeficienciaApresentada { get; set; }
        public int TipoDeficiencia { get; set; }
        public int AcessibilidadeMobilidade { get; set; }
        public bool DeficienciaColuna { get; set; }
        public String DescDeficienciaColuna { get; set; }
        public bool UsaAparelho { get; set; }
        public String DescTipoAparelho { get; set; }

        //Aspectos Sociais
        public long AspecSocialUID { get; set; }
        public bool CarteiraPasseLivre { get; set; }
        public String DescCarteiraPasseLivre { get; set; }
        public bool UtilizaProjeto { get; set; }
        public String DescUtilizaProjeto { get; set; }
        public bool BpcLoas { get; set; }
        public bool RecebeAposentadoria { get; set; }
        public int SituacaoMoradia { get; set; }
        public decimal RendaFamiliar { get; set; }
        public bool Trabalhando { get; set; }
        public String DescTrabalhando { get; set; }
        public int GrauEscolaridade { get; set; }
        public String DescProfissao { get; set; }
        public int EstadoCivil { get; set; }
        public bool TemFilhos { get; set; }
        public int QtdeFilhos { get; set; }
        public String NomeConjuge { get; set; }
        public String SexoConjuge { get; set; }
        public DateTime DataNascimentoConjuge { get; set; }
        public int NaturalidadeEstadoConjuge { get; set; }
        public int NaturalidadeCidadeConjuge { get; set; }
        public String RgConjuge { get; set; }
        public String CpfConjuge { get; set; }
        public String Nte { get; set; }
        public String SessaoEleitoral { get; set; }
        public String ZonaEleitoral { get; set; }
        public String NomeMaeConjuge { get; set; }
        public String NomePaiConjuge { get; set; }
        public int Status { get; set; }

        public ViewModelPessoaADVF() { }

        public ViewModelPessoaADVF(ViewModelPessoaADVF pessoa)
        {
            //Dados Pessoais
            this.PessoaUID = pessoa.PessoaUID;
            this.Nome = pessoa.Nome;
            this.Sexo = pessoa.Sexo;
            this.DataNascimento = pessoa.DataNascimento;
            this.Cidade = pessoa.Cidade;
            this.Estado = pessoa.Estado;
            this.SiglaEstado = pessoa.SiglaEstado;
            this.NomeCidade = pessoa.NomeCidade;
            this.Cpf = pessoa.Cpf;
            this.Rg = pessoa.Rg;
            this.NomeMae = pessoa.NomeMae;
            this.NomePai = pessoa.NomePai;
            this.CepResidencia = pessoa.CepResidencia;
            this.RuaResidencia = pessoa.RuaResidencia;
            this.CasaResidencia = pessoa.CasaResidencia;
            this.BairroResidencia = pessoa.BairroResidencia;
            this.QuadraResidencia = pessoa.QuadraResidencia;
            this.ComplementoResidencia = pessoa.ComplementoResidencia;
            this.Telefone1 = pessoa.Telefone1;
            this.Telefone2 = pessoa.Telefone2;
            this.Telefone3 = pessoa.Telefone3;
            this.DataCadastro = pessoa.DataCadastro;
            this.Status = pessoa.Status;

            //Dados Patologia
            this.Patologia = pessoa.Patologia;
            this.CausaPatologia = pessoa.CausaPatologia;
            this.DeficienciaApresentada = pessoa.DeficienciaApresentada;
            this.TipoDeficiencia = pessoa.TipoDeficiencia;
            this.AcessibilidadeMobilidade = pessoa.AcessibilidadeMobilidade;
            this.DeficienciaColuna = pessoa.DeficienciaColuna;
            this.DescDeficienciaColuna = pessoa.DescDeficienciaColuna;
            this.UsaAparelho = pessoa.UsaAparelho;
            this.DescTipoAparelho = pessoa.DescTipoAparelho;

            //Aspectos Sociais
            this.CarteiraPasseLivre = pessoa.CarteiraPasseLivre;
            this.DescCarteiraPasseLivre = pessoa.DescCarteiraPasseLivre;
            this.UtilizaProjeto = pessoa.UtilizaProjeto;
            this.DescUtilizaProjeto = pessoa.DescUtilizaProjeto;
            this.BpcLoas = pessoa.BpcLoas;
            this.RecebeAposentadoria = pessoa.RecebeAposentadoria;
            this.SituacaoMoradia = pessoa.SituacaoMoradia;
            this.RendaFamiliar = pessoa.RendaFamiliar;
            this.Trabalhando = pessoa.Trabalhando;
            this.DescTrabalhando = pessoa.DescTrabalhando;
            this.GrauEscolaridade = pessoa.GrauEscolaridade;
            this.DescProfissao = pessoa.DescProfissao;
            this.EstadoCivil = pessoa.EstadoCivil;
            this.TemFilhos = pessoa.TemFilhos;
            this.QtdeFilhos = pessoa.QtdeFilhos;
            this.NomeConjuge = pessoa.NomeConjuge;
            this.SexoConjuge = pessoa.SexoConjuge;
            this.DataNascimentoConjuge = pessoa.DataNascimentoConjuge;
            this.NaturalidadeEstadoConjuge = pessoa.NaturalidadeEstadoConjuge;
            this.NaturalidadeCidadeConjuge = pessoa.NaturalidadeCidadeConjuge;
            this.RgConjuge = pessoa.RgConjuge;
            this.CpfConjuge = pessoa.CpfConjuge;
            this.Nte = pessoa.Nte;
            this.SessaoEleitoral = pessoa.SessaoEleitoral;
            this.ZonaEleitoral = pessoa.ZonaEleitoral;
            this.NomeMaeConjuge = pessoa.NomeMaeConjuge;
            this.NomePaiConjuge = pessoa.NomePaiConjuge;

        }

        public ViewModelPessoaADVF(pessoa p, tb_estados estado, tb_cidades cidade)
        {
            //Dados Pessoais
            this.PessoaUID = p.pessoaUID;
            this.Nome = p.nome;
            this.Sexo = p.sexo;
            this.DataNascimento = (DateTime)p.dataNascimento;
            this.Cidades.nome = cidade.nome;
            this.Estados.nome = estado.nome;
            this.Cpf = p.cpf;
            this.Rg = p.rg;
            this.NomeMae = p.nomeMae;
            this.NomePai = p.nomePai;
            this.CepResidencia = p.cep;
            this.RuaResidencia = p.rua;
            this.CasaResidencia = p.casa;
            this.BairroResidencia = p.bairro;
            this.QuadraResidencia = p.quadra;
            this.ComplementoResidencia = p.complemento;
            this.Telefone1 = p.telefone1;
            this.Telefone2 = p.telefone2;
            this.Telefone3 = p.telefone3;
            this.DataCadastro = (DateTime)p.dataCadastro;
        }

        public ViewModelPessoaADVF(pessoa pessoa)
        {
            Nome = pessoa.nome;
            PessoaUID = pessoa.pessoaUID;
        }

    }
}