/*    ==Parâmetros de Script==

    Versão do Servidor de Origem : SQL Server 2017 (14.0.1000)
    Edição do Mecanismo de Banco de Dados de Origem : Microsoft SQL Server Enterprise Edition
    Tipo do Mecanismo de Banco de Dados de Origem : SQL Server Autônomo

    Versão do Servidor de Destino : SQL Server 2017
    Edição de Mecanismo de Banco de Dados de Destino : Microsoft SQL Server Standard Edition
    Tipo de Mecanismo de Banco de Dados de Destino : SQL Server Autônomo
*/
USE [dbbolsasprae]
GO
/****** Object:  Schema [bolsa]    Script Date: 19/07/2018 16:01:46 ******/
CREATE SCHEMA [bolsa]
GO
/****** Object:  Schema [m2ss]    Script Date: 19/07/2018 16:01:46 ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_FORMATAR_TEXTO]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_FORMATAR_TEXTO]
(
    @TEXTO VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
 
    DECLARE @TEXTO_FORMATADO VARCHAR(MAX)
     
    -- O trecho abaixo possibilita que caracteres como "º" ou "ª"
    -- sejam convertidos para "o" ou "a", respectivamente
    SET @TEXTO_FORMATADO = UPPER(@TEXTO)
        COLLATE sql_latin1_general_cp1250_ci_as
 
    -- O trecho abaixo remove acentos e outros caracteres especiais,
    -- substituindo os mesmos por letras normais
    SET @TEXTO_FORMATADO = @TEXTO_FORMATADO
        COLLATE sql_latin1_general_cp1251_ci_as
 
    RETURN @TEXTO_FORMATADO
 
END
GO
/****** Object:  UserDefinedFunction [dbo].[FormataStringBatch]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FormataStringBatch](
	@entrada varchar(200),
	@tipo smallint, -- 0 para numero, 1 para alfa
	@tamanho int)
returns varchar(200)
as
begin
	declare @retorno varchar(200)
	set @entrada = ltrim(rtrim(@entrada))
	if len(@entrada) > @tamanho				-- passou um valor maior que o esperado então quebra ele
		set @retorno = left(@entrada,@tamanho)
	else if len(@entrada) > @tamanho		-- passou um valor do tamanho esperado então não faz nada
		set @retorno = @entrada
	else									-- trata a entrada
	begin
		if @tipo = 0						-- numérico
			set @retorno = replicate('0',@tamanho - len(@entrada)) + @entrada
		else if @tipo = 1					-- alfa
			set @retorno = @entrada + replicate(' ',@tamanho - len(@entrada))
	end

	return @retorno
end
GO
/****** Object:  Table [bolsa].[aluno]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bolsa].[aluno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
	[nomeSocial] [varchar](100) NULL,
	[dia] [varchar](100) NULL,
	[mes] [varchar](100) NULL,
	[ano] [varchar](100) NULL,
	[sexo] [varchar](100) NULL,
	[estadoCivil] [varchar](100) NULL,
	[filho] [varchar](100) NULL,
	[rg] [varchar](100) NOT NULL,
	[cpf] [varchar](100) NULL,
	[naturalidade] [varchar](100) NULL,
	[nacionalidade] [varchar](100) NULL,
	[raca] [varchar](100) NULL,
	[rga] [bigint] NOT NULL,
	[curso] [varchar](100) NULL,
	[ingresso] [varchar](100) NULL,
	[semestreAtual] [varchar](100) NULL,
	[deficiencia] [varchar](100) NULL,
	[qualDeficiencia] [varchar](100) NULL,
	[formaIngresso] [varchar](100) NULL,
	[outraFormaDeIngresso] [varchar](100) NULL,
	[rua] [varchar](100) NULL,
	[numero] [varchar](100) NULL,
	[complemento] [varchar](100) NULL,
	[bairro] [varchar](100) NULL,
	[cep] [varchar](100) NULL,
	[cidade] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[telefone] [varchar](100) NULL,
	[donoEndereco] [varchar](100) NOT NULL,
	[ensinoFundamental] [varchar](100) NULL,
	[ensinoMedio] [varchar](100) NULL,
	[preVestibular] [varchar](100) NULL,
	[cursoSuperior] [varchar](100) NULL,
	[nomePai] [varchar](100) NULL,
	[nomeMae] [varchar](100) NULL,
	[ruaFamilia] [varchar](100) NULL,
	[complementoFamilia] [varchar](100) NULL,
	[bairroFamilia] [varchar](100) NULL,
	[cepFamilia] [varchar](100) NULL,
	[cidadeFamilia] [varchar](100) NULL,
	[telefoneFamilia] [varchar](100) NULL,
	[alunoReside] [varchar](100) NULL,
	[valorPago] [varchar](100) NULL,
	[outraSituacao] [varchar](100) NULL,
	[situacaoPais] [varchar](100) NULL,
	[valorPensao] [varchar](100) NULL,
	[parceiros] [varchar](100) NULL,
	[maeFalecida] [varchar](100) NULL,
	[dataMaeFalecimento] [varchar](100) NULL,
	[pensaoMaeFAlecida] [varchar](100) NULL,
	[profissaoMaeFalecida] [varchar](100) NULL,
	[paiFalecida] [varchar](100) NULL,
	[dataPaiFalecimento] [varchar](100) NULL,
	[pensaoPaiFAlecida] [varchar](100) NULL,
	[profissaoPaiFalecida] [varchar](100) NULL,
	[responsavelFalecida] [varchar](100) NULL,
	[dataResponsavelFalecimento] [varchar](100) NULL,
	[pensaoResponsavelFAlecida] [varchar](100) NULL,
	[profissaoResponsavelFalecida] [varchar](100) NULL,
	[residia] [varchar](100) NULL,
	[planoDeSaude] [varchar](100) NULL,
	[qualPlanoDeSaude] [varchar](100) NULL,
	[valorPlanoDeSaude] [varchar](100) NULL,
	[familiaReside] [varchar](100) NULL,
	[valorAluguel] [varchar](100) NULL,
	[valorImovelProprio] [varchar](100) NULL,
	[valorImovelHerenca] [varchar](100) NULL,
	[valorImovelFinanciado] [varchar](100) NULL,
	[nomeCedido] [varchar](100) NULL,
	[parentescoCedido] [varchar](100) NULL,
	[casaOcupada] [varchar](100) NULL,
	[esgoto] [varchar](100) NULL,
	[aguaTratada] [varchar](100) NULL,
	[iluminacaoPublica] [varchar](100) NULL,
	[coletaLixo] [varchar](100) NULL,
	[ruaPavimentada] [varchar](100) NULL,
	[postinho] [varchar](100) NULL,
	[correio] [varchar](100) NULL,
	[tvPaga] [varchar](100) NULL,
	[internet] [varchar](100) NULL,
	[empregada] [varchar](100) NULL,
	[outroImovel] [varchar](100) NULL,
	[outroImovelQuantidade] [varchar](100) NULL,
	[outroImovelValor] [varchar](100) NULL,
	[outroImovelRenda] [varchar](100) NULL,
	[outraRenda] [varchar](100) NULL,
	[outraRendaFonte] [varchar](100) NULL,
	[nomeOutraRenda] [varchar](100) NULL,
	[valorOutraRenda] [varchar](100) NULL,
	[problemaSaude] [varchar](100) NOT NULL,
	[membroProprietario] [varchar](100) NOT NULL,
	[veiculo] [varchar](100) NOT NULL,
	[justificativa] [varchar](1000) NOT NULL,
	[recebeuAuxilio] [varchar](50) NOT NULL,
	[naoSebeRecebeuAuxilio] [varchar](50) NOT NULL,
	[recebeEstagio] [varchar](50) NOT NULL,
	[nomeRecebeEstagio] [varchar](50) NOT NULL,
	[valorRecebeEstagio] [varchar](50) NOT NULL,
	[familiarRecebeBolsa] [varchar](50) NOT NULL,
	[peso] [int] NOT NULL,
	[campus] [varchar](1000) NOT NULL,
	[CodigoMunicipioSIAFI] [bigint] NULL,
 CONSTRAINT [PK_aluno] PRIMARY KEY CLUSTERED 
(
	[rga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bolsa].[analise]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bolsa].[analise](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rga] [bigint] NOT NULL,
	[alunoEspecial] [varchar](100) NULL,
	[desligamento] [varchar](100) NULL,
	[matriculadoEmCursoPrivado] [varchar](100) NULL,
	[analiseRenda] [varchar](100) NULL,
	[possuiTrabalho] [varchar](100) NULL,
	[EnsinoPublico] [varchar](100) NULL,
	[racaCor] [varchar](100) NULL,
	[familiaEnsinoSuperior] [varchar](100) NULL,
	[foraDaSede] [varchar](100) NULL,
	[rendaDoGrupo] [varchar](100) NULL,
	[rendaPercapita] [varchar](100) NULL,
	[documentacaoConstante] [varchar](max) NULL,
	[documentacaoFaltante] [varchar](max) NULL,
	[consideracoes] [varchar](max) NULL,
	[parecer] [varchar](1000) NULL,
	[cpf] [varchar](20) NULL,
	[rgcertidao] [varchar](20) NULL,
	[carteiratabalho] [varchar](20) NULL,
	[extrato] [varchar](20) NOT NULL,
	[historicoEscolar] [varchar](20) NOT NULL,
	[comprovanteDeRenda] [varchar](20) NOT NULL,
	[agua] [varchar](20) NOT NULL,
	[luz] [varchar](20) NOT NULL,
	[tel] [varchar](20) NOT NULL,
	[status] [varchar](100) NOT NULL,
	[data] [date] NOT NULL,
	[responsavel] [varchar](150) NOT NULL,
	[rendaMembro] [varchar](30) NOT NULL,
	[mor] [varchar](30) NOT NULL,
	[per] [varchar](30) NOT NULL,
	[ali] [varchar](30) NOT NULL,
	[ceu] [varchar](30) NOT NULL,
	[rendaPorCabeca] [varchar](30) NOT NULL,
	[diplomaEscolar] [varchar](30) NOT NULL,
	[iptu] [varchar](30) NOT NULL,
	[contratoAluguel] [varchar](30) NOT NULL,
	[casaFinanciada] [varchar](30) NOT NULL,
	[statusDeferimento] [varchar](30) NOT NULL,
	[indeferido] [varchar](300) NOT NULL,
	[outroIndeferido] [varchar](300) NOT NULL,
	[condicionalidade] [varchar](max) NOT NULL,
	[nome] [varchar](200) NOT NULL,
	[morFinal] [varchar](30) NOT NULL,
	[perFinal] [varchar](30) NOT NULL,
	[aliFinal] [varchar](30) NOT NULL,
	[recurso] [text] NOT NULL,
	[statusDeferimentoFinal] [varchar](100) NOT NULL,
	[indeferidoFinal] [varchar](30) NOT NULL,
	[outroIndeferidoFinal] [varchar](1000) NOT NULL,
	[condicionalidadeFinal] [varchar](1000) NOT NULL,
	[ceuFinal] [varchar](30) NOT NULL,
 CONSTRAINT [PK_analise] PRIMARY KEY CLUSTERED 
(
	[rga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [bolsa].[Banco]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bolsa].[Banco](
	[BancoUID] [varchar](3) NULL,
	[NomeBanco] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bolsa].[CadastroCredor]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bolsa].[CadastroCredor](
	[IdCadastroCredor] [int] IDENTITY(1,1) NOT NULL,
	[Remessa] [varchar](4) NULL,
	[CodigoUG] [varchar](6) NULL,
	[CPFServidorResponsavel] [varchar](11) NULL,
	[DataGeracao] [varchar](8) NULL,
	[HoraGeracao] [varchar](6) NULL,
	[CPFBolsista] [varchar](11) NULL,
	[NomeBolsista] [varchar](45) NULL,
	[EnderecoBolsista] [varchar](65) NULL,
	[CodigoMunicipioSIAFI] [varchar](4) NULL,
	[CodigoPaisSIAFI] [varchar](3) NULL,
	[TelefoneBolsista] [varchar](45) NULL,
	[FAXBolsista] [varchar](45) NULL,
	[CEPUFMT] [varchar](8) NULL,
	[CodigoBancoBolsista] [varchar](3) NULL,
	[AgenciaBancoBolsista] [varchar](4) NULL,
	[ContaCorrenteBolsista] [varchar](10) NULL,
	[TipoContaSIAFI] [varchar](1) NULL,
	[UGSupridoraSIAFI] [varchar](6) NULL,
	[GestaoSupridoraSIAFI] [varchar](5) NULL,
 CONSTRAINT [PK_bolsa.CadastroCredor] PRIMARY KEY CLUSTERED 
(
	[IdCadastroCredor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bolsa].[CadastroCredorSiafi]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bolsa].[CadastroCredorSiafi](
	[IdCadastroCredor] [bigint] IDENTITY(1,1) NOT NULL,
	[HeaderCadastroCredor] [varchar](2000) NOT NULL,
	[DetalheCadastroCredor] [varchar](1000) NOT NULL,
	[TraillerCadastroCredor] [varchar](1350) NOT NULL,
	[MesEdital] [varchar](2) NULL,
	[Edital] [varchar](10) NULL,
	[DataCriacao]  AS (getdate()),
	[NumeroRemessa] [int] NULL,
 CONSTRAINT [PK_CadastroCredorSiafi] PRIMARY KEY CLUSTERED 
(
	[IdCadastroCredor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bolsa].[CodigoMunicipioSiafi]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bolsa].[CodigoMunicipioSiafi](
	[IdSiafi] [nvarchar](255) NULL,
	[Uf] [nvarchar](255) NULL,
	[Municipio] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bolsa].[DadosBancario]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bolsa].[DadosBancario](
	[id] [int] NOT NULL,
	[rga] [bigint] NULL,
	[banco] [varchar](300) NULL,
	[agencia] [varchar](30) NULL,
	[conta] [varchar](30) NULL,
	[digito] [varchar](30) NULL,
 CONSTRAINT [PK_dadosbancario_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bolsa].[ListaCredor]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bolsa].[ListaCredor](
	[IdListaCredor] [bigint] IDENTITY(1,1) NOT NULL,
	[RGA] [varchar](50) NULL,
	[CPF] [varchar](11) NULL,
	[Banco] [varchar](5) NULL,
	[Agencia] [varchar](10) NULL,
	[Conta] [varchar](10) NULL,
	[Valor] [varchar](50) NULL,
	[NumeroLC] [varchar](6) NULL,
	[DataCriacao] [datetime] NULL,
	[NumeroRemessaLC] [int] NULL,
 CONSTRAINT [PK_ListaCredorSIAFI] PRIMARY KEY CLUSTERED 
(
	[IdListaCredor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bolsa].[ListaCredorSiafi]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bolsa].[ListaCredorSiafi](
	[IdListaCredor] [bigint] NOT NULL,
	[HeaderListaCredor] [varchar](250) NULL,
	[DetalheListaCredor] [varchar](250) NULL,
	[TraillerListaCredor] [varchar](250) NULL,
	[Mes]  AS (getdate()),
	[NumeroLista] [varchar](6) NULL,
 CONSTRAINT [PK_ListaCredorSiafi_1] PRIMARY KEY CLUSTERED 
(
	[IdListaCredor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-Alunoes]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-Alunoes](
	[Rga] [bigint] NULL,
	[IdAnalise] [bigint] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEdital] [bigint] NULL,
	[SolicitacaoPermanencia] [nvarchar](max) NULL,
	[SolicitacaoMoradia] [nvarchar](max) NULL,
	[SolicitacaoAlimentacao] [nvarchar](max) NULL,
	[SolicitacaoCeu] [nvarchar](max) NULL,
	[Campus] [nvarchar](max) NULL,
	[Nome] [nvarchar](max) NULL,
	[NomeSocial] [nvarchar](max) NULL,
	[Sexo] [nvarchar](max) NULL,
	[DataNascimento] [datetime] NULL,
	[EstadoCivil] [nvarchar](max) NULL,
	[PossuiFilhos] [nvarchar](max) NULL,
	[QtdFilhos] [int] NULL,
	[Cpf] [varchar](11) NOT NULL,
	[Rg] [nvarchar](max) NULL,
	[Naturalidade] [nvarchar](max) NULL,
	[Nacionalidade] [nvarchar](max) NULL,
	[Etnia] [nvarchar](max) NULL,
	[Curso] [nvarchar](max) NULL,
	[SemestreAtual] [nvarchar](max) NULL,
	[AnoIngresso] [nvarchar](max) NULL,
	[PossuiDeficiencia] [nvarchar](max) NULL,
	[QualDeficiencia] [nvarchar](max) NULL,
	[FormaDeIngresso] [nvarchar](max) NULL,
	[AlunoRua] [nvarchar](max) NULL,
	[AlunoNumero] [nvarchar](max) NULL,
	[AlunoBairro] [nvarchar](max) NULL,
	[AlunoComplemento] [nvarchar](max) NULL,
	[AlunoCep] [nvarchar](max) NULL,
	[Telefone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Cidade] [nvarchar](max) NULL,
	[Estado] [nvarchar](max) NULL,
	[EnsinoFundamental] [nvarchar](max) NULL,
	[EnsinoMedio] [nvarchar](max) NULL,
	[CursoPreVestibular] [nvarchar](max) NULL,
	[CursoSuperior] [nvarchar](max) NULL,
	[NomePai] [nvarchar](max) NULL,
	[NomeMae] [nvarchar](max) NULL,
	[FamiliaRua] [nvarchar](max) NULL,
	[FamiliaNumero] [nvarchar](max) NULL,
	[FamiliaBairro] [nvarchar](max) NULL,
	[FamiliaComplemento] [nvarchar](max) NULL,
	[FamiliaCep] [nvarchar](max) NULL,
	[FamiliaTelefone] [nvarchar](max) NULL,
	[FamiliaCidade] [nvarchar](max) NULL,
	[FamiliaEstado] [nvarchar](max) NULL,
	[DonoEndereco] [nvarchar](max) NULL,
	[SituacaoResidencia] [nvarchar](max) NULL,
	[ValorResidencia] [nvarchar](max) NULL,
	[OutroResidencia] [nvarchar](max) NULL,
	[ResponsavelSituacao] [nvarchar](max) NULL,
	[ResponsavelRecebePensao] [nvarchar](max) NULL,
	[ResponsavelValorPensao] [nvarchar](max) NULL,
	[ResponsavelParceiros] [nvarchar](max) NULL,
	[ResponsavelFalecido] [nchar](10) NULL,
	[EstudanteResidia] [nvarchar](max) NULL,
	[PlanoDeSaude] [nvarchar](max) NULL,
	[PlanoDeSaudeQual] [nvarchar](max) NULL,
	[PlanoDeSaudeValor] [nvarchar](max) NULL,
	[ProblemaDeSaude] [nvarchar](max) NULL,
	[AlunoResideEm] [nvarchar](max) NULL,
	[AlunoResideOutro] [nvarchar](max) NULL,
	[ImovelCondicao] [nvarchar](max) NULL,
	[ImovelValor] [nvarchar](max) NULL,
	[ImovelNomeCedido] [nvarchar](max) NULL,
	[ImovelParentescoCedido] [nvarchar](max) NULL,
	[BairroEsgoto] [nvarchar](max) NULL,
	[BairroAguaTratada] [nvarchar](max) NULL,
	[BairroIluminacao] [nvarchar](max) NULL,
	[BairroAsfalto] [nvarchar](max) NULL,
	[BairroPostinho] [nvarchar](max) NULL,
	[BairroTv] [nvarchar](max) NULL,
	[BairroInternet] [nvarchar](max) NULL,
	[BairroCorreio] [nvarchar](max) NULL,
	[BairroEnpregada] [nvarchar](max) NULL,
	[PossuiOutroImovel] [nvarchar](max) NULL,
	[PossuiPropriedadeRural] [nvarchar](max) NULL,
	[PossuiVeiculo] [nvarchar](max) NULL,
	[PossuiOutraFonteRenda] [nvarchar](max) NULL,
	[ContribuiuManutencaoDoestudante] [nchar](10) NULL,
	[RecebeuBolsa] [nvarchar](max) NULL,
	[ParticipouSelecao] [nvarchar](max) NULL,
	[Estagio] [nvarchar](max) NULL,
	[FamiliaRecebeBolsa] [nvarchar](max) NULL,
	[Justificativa] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-Alunoes] PRIMARY KEY CLUSTERED 
(
	[Cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-AnaliseAluno]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-AnaliseAluno](
	[Id] [bigint] NOT NULL,
	[IdServidor] [bigint] NULL,
	[RgaAluno] [bigint] NULL,
	[IdFamilia] [bigint] NULL,
	[AlunoEspecial] [nvarchar](max) NULL,
	[Desligamento] [nvarchar](max) NULL,
	[MatriculadoOutroCurso] [nvarchar](max) NULL,
	[AnaliseRenda] [nvarchar](max) NULL,
	[PossuiTrabalho] [nvarchar](max) NULL,
	[EscolaPublica] [nvarchar](max) NULL,
	[Etnia] [nvarchar](max) NULL,
	[FamiliaCursoSuperior] [nvarchar](max) NULL,
	[OrigemForaDaSede] [nvarchar](max) NULL,
	[RendaDaFamilia] [nvarchar](max) NULL,
	[RendaPerCapita] [nvarchar](max) NULL,
	[Consideracoes] [nvarchar](max) NULL,
	[Parecer] [nvarchar](max) NULL,
	[ResultadoAnalise] [nvarchar](max) NULL,
	[ResultadoMoradia] [int] NULL,
	[ResultadoPermanencia] [int] NULL,
	[ResultadoAlimentacao] [int] NULL,
	[MotivoIndeferido] [nvarchar](max) NULL,
	[MotivoOutro] [nvarchar](max) NULL,
	[Condicionalidade] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-AnaliseAluno] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-AnaliseDocumentacao]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-AnaliseDocumentacao](
	[Id] [bigint] NOT NULL,
	[IdFamilia] [bigint] NULL,
	[IdAnaliseAluno] [bigint] NULL,
	[DocumentacaoContante] [nvarchar](max) NULL,
	[DocumentacaoFaltante] [nvarchar](max) NULL,
	[Cpf] [nvarchar](max) NULL,
	[Rg] [nvarchar](max) NULL,
	[CarteiraDeTrabalho] [nvarchar](max) NULL,
	[ExtratoBancarios] [nvarchar](max) NULL,
	[HistoricoEscolar] [nvarchar](max) NULL,
	[Holerite] [nvarchar](max) NULL,
	[Renda] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-AnaliseDocumentacao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-Curso-Superior]    Script Date: 19/07/2018 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-Curso-Superior](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[StatusCurso] [nvarchar](max) NULL,
	[Curso] [nvarchar](max) NOT NULL,
	[Instituicao] [nvarchar](max) NULL,
	[Ano] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-Curso-Superior] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-DadosBancarios]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-DadosBancarios](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[Agencia] [nvarchar](max) NULL,
	[Conta] [nvarchar](max) NULL,
	[Digito] [nvarchar](max) NULL,
	[Banco] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Prae-Bolsa-DadosBancarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-DocumentacaoDoGrupoFamiliar]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-DocumentacaoDoGrupoFamiliar](
	[Id] [bigint] NOT NULL,
	[IdAnalise] [bigint] NULL,
	[ContaDeAgua] [nvarchar](max) NULL,
	[ContaLuz] [nvarchar](max) NULL,
	[ContaTelefone] [nvarchar](max) NULL,
	[Iptu] [nvarchar](max) NULL,
	[ContratoAluguel] [nvarchar](max) NULL,
	[ComprovanteCasaFinanciada] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-DocumentacaoDoGrupoFamiliar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-Edital]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-Edital](
	[Id] [bigint] NOT NULL,
	[IdServidor] [bigint] NULL,
	[NomeDoEdital] [nvarchar](max) NULL,
	[InicioEdital] [nvarchar](max) NULL,
	[FimEdital] [nvarchar](max) NOT NULL,
	[ProrrogacaoEdital] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-Edital] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-FamiliaEndereço]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-FamiliaEndereço](
	[Id] [bigint] NOT NULL,
	[IdFamilia] [bigint] NULL,
	[Rua] [nvarchar](max) NULL,
	[Numero] [nchar](10) NULL,
	[Bairro] [nvarchar](max) NULL,
	[Complemento] [nvarchar](max) NULL,
	[Cep] [nvarchar](max) NULL,
	[TelefoneDaFamilia] [nvarchar](50) NULL,
	[Estado] [nvarchar](max) NULL,
	[Cidade] [nvarchar](max) NULL,
	[DonoDoEndereco] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_FamiliaEndereço] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-FamiliaRecebeBolsa]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-FamiliaRecebeBolsa](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NOT NULL,
	[Nome] [nvarchar](max) NULL,
	[Auxilio] [nvarchar](max) NULL,
	[Parentesco] [nvarchar](max) NULL,
	[ParenteRga] [nvarchar](50) NULL,
	[Curso] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-FamiliaRecebeBolsa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-FazEstagio]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-FazEstagio](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[Tipo] [nvarchar](max) NULL,
	[Valor] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-FazEstagio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-MembroFamiliar]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-MembroFamiliar](
	[Id] [bigint] NOT NULL,
	[CpfAluno] [varchar](11) NULL,
	[Nome] [nvarchar](max) NULL,
	[Data] [date] NULL,
	[Cpf] [nvarchar](max) NULL,
	[SituacaoTrabalho] [nvarchar](max) NULL,
	[EstadoCivil] [nvarchar](max) NULL,
	[Parentesco] [nvarchar](max) NULL,
	[EscolaridadeGrau] [nvarchar](max) NULL,
	[EscolaridadeSituacao] [nvarchar](max) NULL,
	[EscolaridadeInstituicao] [nvarchar](max) NULL,
	[Profissao] [nvarchar](max) NULL,
	[Renda] [float] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_MembroFamiliar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-OutraRenda]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-OutraRenda](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[TipoDeRenda] [nvarchar](max) NULL,
	[Outro] [nvarchar](max) NULL,
	[Valor] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-OutraRenda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-OutroImovel]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-OutroImovel](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[TipoImovel] [nvarchar](max) NULL,
	[ValorImovel] [nvarchar](max) NULL,
	[ImovelGeraRenda] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-OutroImovel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-ParticipouSelecao]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-ParticipouSelecao](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[QuandoParticipou] [nvarchar](max) NULL,
	[MotivoIndeferimento] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-ParticipouSelecao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-PessoaContribuiu]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-PessoaContribuiu](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[Parentesco] [nvarchar](max) NULL,
	[Ocupacao] [nvarchar](max) NULL,
	[GrauEscolaridade] [nvarchar](max) NULL,
	[Periodicidade] [nvarchar](max) NULL,
	[Valor] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-PessoaContribuiu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-ProblemaSaude]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-ProblemaSaude](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[NomeDoente] [nvarchar](max) NULL,
	[NomeDoenca] [nvarchar](max) NULL,
	[IncapazDeTabalhar] [nchar](10) NULL,
	[DependeDeOutrasPessoas] [nchar](10) NULL,
	[RecebeBeneficio] [nchar](10) NULL,
	[GastosMensais] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-ProblemaSaude] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-PropriedadeRural]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-PropriedadeRural](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[NomeProprietario] [nvarchar](max) NULL,
	[Parentesco] [nvarchar](max) NULL,
	[Area] [nvarchar](max) NULL,
	[Cidade] [nvarchar](max) NULL,
	[AtividadePrincipal] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-PropriedadeRural] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-RecebeuBolsaPrae]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-RecebeuBolsaPrae](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[Quando] [nvarchar](max) NULL,
	[Periodo] [nvarchar](max) NULL,
	[Desligamento] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-RecebeuBolsaPrae] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-ResponsavelFalecido]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-ResponsavelFalecido](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[Parentesco] [nvarchar](max) NULL,
	[Nome] [nvarchar](max) NULL,
	[DataFalecimento] [nvarchar](max) NULL,
	[Profissao] [nvarchar](max) NULL,
	[Pensao] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-ResponsavelFalecido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-Telefone]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-Telefone](
	[Id] [bigint] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[Nome] [nvarchar](max) NULL,
	[Telefone] [nvarchar](max) NULL,
	[Cidade] [nvarchar](max) NULL,
	[Estado] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Prae-Bolsa-Telefone] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prae-Bolsa-Veiculo]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prae-Bolsa-Veiculo](
	[Id] [int] NOT NULL,
	[Cpf] [varchar](11) NULL,
	[Proprietario] [nvarchar](max) NULL,
	[Marca] [nvarchar](max) NULL,
	[Ano] [nvarchar](50) NULL,
	[VeiculoValor] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Veiculo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__nome__04E4BC85]  DEFAULT (NULL) FOR [nome]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__nomeSocia__05D8E0BE]  DEFAULT (NULL) FOR [nomeSocial]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__dia__06CD04F7]  DEFAULT (NULL) FOR [dia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__mes__07C12930]  DEFAULT (NULL) FOR [mes]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__ano__08B54D69]  DEFAULT (NULL) FOR [ano]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__sexo__09A971A2]  DEFAULT (NULL) FOR [sexo]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__estadoCiv__0A9D95DB]  DEFAULT (NULL) FOR [estadoCivil]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__filho__0B91BA14]  DEFAULT (NULL) FOR [filho]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__rg__0C85DE4D]  DEFAULT (NULL) FOR [rg]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__cpf__0D7A0286]  DEFAULT (NULL) FOR [cpf]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__naturalid__0E6E26BF]  DEFAULT (NULL) FOR [naturalidade]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__nacionali__0F624AF8]  DEFAULT (NULL) FOR [nacionalidade]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__raca__10566F31]  DEFAULT (NULL) FOR [raca]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__curso__114A936A]  DEFAULT (NULL) FOR [curso]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__ingresso__123EB7A3]  DEFAULT (NULL) FOR [ingresso]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__semestreA__1332DBDC]  DEFAULT (NULL) FOR [semestreAtual]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__deficienc__14270015]  DEFAULT (NULL) FOR [deficiencia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__qualDefic__151B244E]  DEFAULT (NULL) FOR [qualDeficiencia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__formaIngr__160F4887]  DEFAULT (NULL) FOR [formaIngresso]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__outraForm__17036CC0]  DEFAULT (NULL) FOR [outraFormaDeIngresso]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__rua__17F790F9]  DEFAULT (NULL) FOR [rua]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__numero__18EBB532]  DEFAULT (NULL) FOR [numero]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__complemen__19DFD96B]  DEFAULT (NULL) FOR [complemento]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__bairro__1AD3FDA4]  DEFAULT (NULL) FOR [bairro]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__cep__1BC821DD]  DEFAULT (NULL) FOR [cep]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__cidade__1CBC4616]  DEFAULT (NULL) FOR [cidade]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__email__1DB06A4F]  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__telefone__1EA48E88]  DEFAULT (NULL) FOR [telefone]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__ensinoFun__1F98B2C1]  DEFAULT (NULL) FOR [ensinoFundamental]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__ensinoMed__208CD6FA]  DEFAULT (NULL) FOR [ensinoMedio]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__preVestib__2180FB33]  DEFAULT (NULL) FOR [preVestibular]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__cursoSupe__22751F6C]  DEFAULT (NULL) FOR [cursoSuperior]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__nomePai__236943A5]  DEFAULT (NULL) FOR [nomePai]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__nomeMae__245D67DE]  DEFAULT (NULL) FOR [nomeMae]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__ruaFamili__25518C17]  DEFAULT (NULL) FOR [ruaFamilia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__complemen__2645B050]  DEFAULT (NULL) FOR [complementoFamilia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__bairroFam__2739D489]  DEFAULT (NULL) FOR [bairroFamilia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__cepFamili__282DF8C2]  DEFAULT (NULL) FOR [cepFamilia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__cidadeFam__29221CFB]  DEFAULT (NULL) FOR [cidadeFamilia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__telefoneF__2A164134]  DEFAULT (NULL) FOR [telefoneFamilia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__alunoResi__2B0A656D]  DEFAULT (NULL) FOR [alunoReside]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__valorPago__2BFE89A6]  DEFAULT (NULL) FOR [valorPago]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__outraSitu__2CF2ADDF]  DEFAULT (NULL) FOR [outraSituacao]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__situacaoP__2DE6D218]  DEFAULT (NULL) FOR [situacaoPais]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__valorPens__2EDAF651]  DEFAULT (NULL) FOR [valorPensao]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__parceiros__2FCF1A8A]  DEFAULT (NULL) FOR [parceiros]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__maeFaleci__30C33EC3]  DEFAULT (NULL) FOR [maeFalecida]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__dataMaeFa__31B762FC]  DEFAULT (NULL) FOR [dataMaeFalecimento]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__pensaoMae__32AB8735]  DEFAULT (NULL) FOR [pensaoMaeFAlecida]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__profissao__339FAB6E]  DEFAULT (NULL) FOR [profissaoMaeFalecida]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__paiFaleci__3493CFA7]  DEFAULT (NULL) FOR [paiFalecida]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__dataPaiFa__3587F3E0]  DEFAULT (NULL) FOR [dataPaiFalecimento]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__pensaoPai__367C1819]  DEFAULT (NULL) FOR [pensaoPaiFAlecida]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__profissao__37703C52]  DEFAULT (NULL) FOR [profissaoPaiFalecida]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__responsav__3864608B]  DEFAULT (NULL) FOR [responsavelFalecida]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__dataRespo__395884C4]  DEFAULT (NULL) FOR [dataResponsavelFalecimento]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__pensaoRes__3A4CA8FD]  DEFAULT (NULL) FOR [pensaoResponsavelFAlecida]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__profissao__3B40CD36]  DEFAULT (NULL) FOR [profissaoResponsavelFalecida]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__residia__3C34F16F]  DEFAULT (NULL) FOR [residia]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__planoDeSa__3D2915A8]  DEFAULT (NULL) FOR [planoDeSaude]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__qualPlano__3E1D39E1]  DEFAULT (NULL) FOR [qualPlanoDeSaude]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__valorPlan__3F115E1A]  DEFAULT (NULL) FOR [valorPlanoDeSaude]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__familiaRe__40058253]  DEFAULT (NULL) FOR [familiaReside]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__valorAlug__40F9A68C]  DEFAULT (NULL) FOR [valorAluguel]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__valorImov__41EDCAC5]  DEFAULT (NULL) FOR [valorImovelProprio]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__valorImov__42E1EEFE]  DEFAULT (NULL) FOR [valorImovelHerenca]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__valorImov__43D61337]  DEFAULT (NULL) FOR [valorImovelFinanciado]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__nomeCedid__44CA3770]  DEFAULT (NULL) FOR [nomeCedido]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__parentesc__45BE5BA9]  DEFAULT (NULL) FOR [parentescoCedido]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__casaOcupa__46B27FE2]  DEFAULT (NULL) FOR [casaOcupada]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__esgoto__47A6A41B]  DEFAULT (NULL) FOR [esgoto]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__aguaTrata__489AC854]  DEFAULT (NULL) FOR [aguaTratada]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__iluminaca__498EEC8D]  DEFAULT (NULL) FOR [iluminacaoPublica]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__coletaLix__4A8310C6]  DEFAULT (NULL) FOR [coletaLixo]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__ruaPavime__4B7734FF]  DEFAULT (NULL) FOR [ruaPavimentada]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__postinho__4C6B5938]  DEFAULT (NULL) FOR [postinho]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__correio__4D5F7D71]  DEFAULT (NULL) FOR [correio]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__tvPaga__4E53A1AA]  DEFAULT (NULL) FOR [tvPaga]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__internet__4F47C5E3]  DEFAULT (NULL) FOR [internet]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__empregada__503BEA1C]  DEFAULT (NULL) FOR [empregada]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__outroImov__51300E55]  DEFAULT (NULL) FOR [outroImovel]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__outroImov__5224328E]  DEFAULT (NULL) FOR [outroImovelQuantidade]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__outroImov__531856C7]  DEFAULT (NULL) FOR [outroImovelValor]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__outroImov__540C7B00]  DEFAULT (NULL) FOR [outroImovelRenda]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__outraRend__55009F39]  DEFAULT (NULL) FOR [outraRenda]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__outraRend__55F4C372]  DEFAULT (NULL) FOR [outraRendaFonte]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__nomeOutra__56E8E7AB]  DEFAULT (NULL) FOR [nomeOutraRenda]
GO
ALTER TABLE [bolsa].[aluno] ADD  CONSTRAINT [DF__aluno__valorOutr__57DD0BE4]  DEFAULT (NULL) FOR [valorOutraRenda]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__rga__59C55456]  DEFAULT (NULL) FOR [rga]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__alunoEs__5AB9788F]  DEFAULT (NULL) FOR [alunoEspecial]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__desliga__5BAD9CC8]  DEFAULT (NULL) FOR [desligamento]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__matricu__5CA1C101]  DEFAULT (NULL) FOR [matriculadoEmCursoPrivado]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__analise__5D95E53A]  DEFAULT (NULL) FOR [analiseRenda]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__possuiT__5E8A0973]  DEFAULT (NULL) FOR [possuiTrabalho]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__EnsinoP__5F7E2DAC]  DEFAULT (NULL) FOR [EnsinoPublico]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__racaCor__607251E5]  DEFAULT (NULL) FOR [racaCor]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__familia__6166761E]  DEFAULT (NULL) FOR [familiaEnsinoSuperior]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__foraDaS__625A9A57]  DEFAULT (NULL) FOR [foraDaSede]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__rendaDo__634EBE90]  DEFAULT (NULL) FOR [rendaDoGrupo]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__rendaPe__6442E2C9]  DEFAULT (NULL) FOR [rendaPercapita]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__documen__65370702]  DEFAULT (NULL) FOR [documentacaoConstante]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__ocument__662B2B3B]  DEFAULT (NULL) FOR [documentacaoFaltante]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__conside__671F4F74]  DEFAULT (NULL) FOR [consideracoes]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__parecer__681373AD]  DEFAULT (NULL) FOR [parecer]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__cpf__690797E6]  DEFAULT (NULL) FOR [cpf]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__rgcerti__69FBBC1F]  DEFAULT (NULL) FOR [rgcertidao]
GO
ALTER TABLE [bolsa].[analise] ADD  CONSTRAINT [DF__analise__carteir__6AEFE058]  DEFAULT (NULL) FOR [carteiratabalho]
GO
ALTER TABLE [bolsa].[DadosBancario] ADD  CONSTRAINT [DF__dadosbancar__rga__7F2BE32F]  DEFAULT (NULL) FOR [rga]
GO
ALTER TABLE [bolsa].[DadosBancario] ADD  CONSTRAINT [DF__dadosbanc__banco__00200768]  DEFAULT (NULL) FOR [banco]
GO
ALTER TABLE [bolsa].[DadosBancario] ADD  CONSTRAINT [DF__dadosbanc__agenc__01142BA1]  DEFAULT (NULL) FOR [agencia]
GO
ALTER TABLE [bolsa].[DadosBancario] ADD  CONSTRAINT [DF__dadosbanc__conta__02084FDA]  DEFAULT (NULL) FOR [conta]
GO
ALTER TABLE [bolsa].[DadosBancario] ADD  CONSTRAINT [DF__dadosbanc__digit__02FC7413]  DEFAULT (NULL) FOR [digito]
GO
ALTER TABLE [bolsa].[ListaCredor] ADD  CONSTRAINT [DF_ListaCredorSIAFI_DataCriacao]  DEFAULT (getdate()) FOR [DataCriacao]
GO
ALTER TABLE [dbo].[Prae-Bolsa-Alunoes]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-Alunoes_Prae-Bolsa-Edital] FOREIGN KEY([IdEdital])
REFERENCES [dbo].[Prae-Bolsa-Edital] ([Id])
GO
ALTER TABLE [dbo].[Prae-Bolsa-Alunoes] CHECK CONSTRAINT [FK_Prae-Bolsa-Alunoes_Prae-Bolsa-Edital]
GO
ALTER TABLE [dbo].[Prae-Bolsa-AnaliseAluno]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-AnaliseAluno_MembroFamiliar] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Prae-Bolsa-MembroFamiliar] ([Id])
GO
ALTER TABLE [dbo].[Prae-Bolsa-AnaliseAluno] CHECK CONSTRAINT [FK_Prae-Bolsa-AnaliseAluno_MembroFamiliar]
GO
ALTER TABLE [dbo].[Prae-Bolsa-AnaliseDocumentacao]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-AnaliseDocumentacao_Prae-Bolsa-AnaliseAluno] FOREIGN KEY([IdAnaliseAluno])
REFERENCES [dbo].[Prae-Bolsa-AnaliseAluno] ([Id])
GO
ALTER TABLE [dbo].[Prae-Bolsa-AnaliseDocumentacao] CHECK CONSTRAINT [FK_Prae-Bolsa-AnaliseDocumentacao_Prae-Bolsa-AnaliseAluno]
GO
ALTER TABLE [dbo].[Prae-Bolsa-Curso-Superior]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-Curso-Superior_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-Curso-Superior] CHECK CONSTRAINT [FK_Prae-Bolsa-Curso-Superior_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-DadosBancarios]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-DadosBancarios_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-DadosBancarios] CHECK CONSTRAINT [FK_Prae-Bolsa-DadosBancarios_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-DocumentacaoDoGrupoFamiliar]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-DocumentacaoDoGrupoFamiliar_Prae-Bolsa-AnaliseAluno] FOREIGN KEY([IdAnalise])
REFERENCES [dbo].[Prae-Bolsa-AnaliseAluno] ([Id])
GO
ALTER TABLE [dbo].[Prae-Bolsa-DocumentacaoDoGrupoFamiliar] CHECK CONSTRAINT [FK_Prae-Bolsa-DocumentacaoDoGrupoFamiliar_Prae-Bolsa-AnaliseAluno]
GO
ALTER TABLE [dbo].[Prae-Bolsa-FamiliaEndereço]  WITH CHECK ADD  CONSTRAINT [FK_FamiliaEndereço_MembroFamiliar] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Prae-Bolsa-MembroFamiliar] ([Id])
GO
ALTER TABLE [dbo].[Prae-Bolsa-FamiliaEndereço] CHECK CONSTRAINT [FK_FamiliaEndereço_MembroFamiliar]
GO
ALTER TABLE [dbo].[Prae-Bolsa-FamiliaRecebeBolsa]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-FamiliaRecebeBolsa_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-FamiliaRecebeBolsa] CHECK CONSTRAINT [FK_Prae-Bolsa-FamiliaRecebeBolsa_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-FazEstagio]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-FazEstagio_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-FazEstagio] CHECK CONSTRAINT [FK_Prae-Bolsa-FazEstagio_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-MembroFamiliar]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-MembroFamiliar_Prae-Bolsa-Alunoes] FOREIGN KEY([CpfAluno])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-MembroFamiliar] CHECK CONSTRAINT [FK_Prae-Bolsa-MembroFamiliar_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-OutraRenda]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-OutraRenda_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-OutraRenda] CHECK CONSTRAINT [FK_Prae-Bolsa-OutraRenda_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-OutroImovel]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-OutroImovel_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-OutroImovel] CHECK CONSTRAINT [FK_Prae-Bolsa-OutroImovel_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-ParticipouSelecao]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-ParticipouSelecao_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-ParticipouSelecao] CHECK CONSTRAINT [FK_Prae-Bolsa-ParticipouSelecao_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-PessoaContribuiu]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-PessoaContribuiu_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-PessoaContribuiu] CHECK CONSTRAINT [FK_Prae-Bolsa-PessoaContribuiu_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-ProblemaSaude]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-ProblemaSaude_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-ProblemaSaude] CHECK CONSTRAINT [FK_Prae-Bolsa-ProblemaSaude_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-PropriedadeRural]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-PropriedadeRural_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-PropriedadeRural] CHECK CONSTRAINT [FK_Prae-Bolsa-PropriedadeRural_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-RecebeuBolsaPrae]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-RecebeuBolsaPrae_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-RecebeuBolsaPrae] CHECK CONSTRAINT [FK_Prae-Bolsa-RecebeuBolsaPrae_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-ResponsavelFalecido]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-ResponsavelFalecido_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-ResponsavelFalecido] CHECK CONSTRAINT [FK_Prae-Bolsa-ResponsavelFalecido_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-Telefone]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-Telefone_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-Telefone] CHECK CONSTRAINT [FK_Prae-Bolsa-Telefone_Prae-Bolsa-Alunoes]
GO
ALTER TABLE [dbo].[Prae-Bolsa-Veiculo]  WITH CHECK ADD  CONSTRAINT [FK_Prae-Bolsa-Veiculo_Prae-Bolsa-Alunoes] FOREIGN KEY([Cpf])
REFERENCES [dbo].[Prae-Bolsa-Alunoes] ([Cpf])
GO
ALTER TABLE [dbo].[Prae-Bolsa-Veiculo] CHECK CONSTRAINT [FK_Prae-Bolsa-Veiculo_Prae-Bolsa-Alunoes]
GO
/****** Object:  StoredProcedure [dbo].[ARQUIVO_CADASTRO_CREDOR_SIAFI]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ARQUIVO_CADASTRO_CREDOR_SIAFI] (
	@REMESSA AS VARCHAR(4), 
	@CPF_RESPONSAVEL AS VARCHAR(11)
)
AS
	BEGIN

		--HEADER do Cadastro de Credor:
		Declare @COD_UG CHAR(6)='154045';
		Declare @DATA_GERACAO VARCHAR(8) = Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/','');
		Declare @HORA_GERACAO VARCHAR(6) = replace(convert(varchar, getdate(), 108),':','');

		SELECT '1'+dbo.FormataStringBatch(@DATA_GERACAO,0,8)
				  +dbo.FormataStringBatch(@HORA_GERACAO,0,6)
				  +'CREDOR'
				  +dbo.FormataStringBatch(@REMESSA,0,4)
				  +@COD_UG
				  +@CPF_RESPONSAVEL
				  +dbo.FormataStringBatch('',1,1303)--FILLER NÃO PREENCHE NADA
					AS HEADER_CR_SIAFI
	  --\FECHA HEADER CADASTRO CREDOR -----------------------------------------------------------------
	  
	  --DETALHE DO CADATRO DE CREDOR
	   SELECT 
	   
	   '2'+dbo.FormataStringBatch(c.CPFBolsista,1,14)
	   +dbo.FormataStringBatch(c.NomeBolsista,1,45)
	   +dbo.FormataStringBatch(c.NomeBolsista,1,19)
	   +'2'+dbo.FormataStringBatch(c.EnderecoBolsista,1,65)
	   +c.CodigoMunicipioSIAFI+'MT'+c.CodigoPaisSIAFI
	   +dbo.FormataStringBatch(c.TelefoneBolsista,1,45)
	   +dbo.FormataStringBatch('',1,45)
	   +dbo.FormataStringBatch('MOTIVO INCLUSAO',1,140)
	   +dbo.FormataStringBatch(c.CEPUFMT,0,8)
	   +dbo.FormataStringBatch('0'+c.CodigoBancoBolsista+c.AgenciaBancoBolsista+c.ContaCorrenteBolsista+'1',1,580)		    
	    FROM dbbolsasprae.bolsa.CadastroCredor as c

 --Trailler
 Declare @QTDE_REGISTRO_FITA INT = (SELECT count(a.IdCadastroCredor) AS CONTADOR_REMESSA FROM dbbolsasprae.bolsa.CadastroCredor a);
 SELECT '9'+dbo.FormataStringBatch(@QTDE_REGISTRO_FITA,0,7)+dbo.FormataStringBatch('',1,1337) AS TRAILLER
	  	
END		
		
--exec ARQUIVO_CADASTRO_CREDOR_SIAFI @REMESSA = '0001',@CPF_RESPONSAVEL='01263612156'
 
GO
/****** Object:  StoredProcedure [dbo].[ARQUIVO_CADASTRO_LISTA_CREDOR_SIAFI]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ARQUIVO_CADASTRO_LISTA_CREDOR_SIAFI](
	@REMESSA AS VARCHAR(4), 
	@CPF_RESPONSAVEL AS VARCHAR(11),
	@NUMERO_LISTA_CREDOR AS VARCHAR(6)
)
AS

	BEGIN

			--HEADER da Lista de Credores (LC):
				Declare @TIPO_REGISTRO CHAR(1)='1';
				Declare @CODIGO_ARQUIVO CHAR(2)= 'LC';
				Declare @DATA_GERACAO_FITA VARCHAR(8) = Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/','');
				Declare @SEQUENCIAL_GERACAO_ARQ_DIA VARCHAR(4)=  (Left(Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/',''),4));
				Declare @ANO_REFERENCIA VARCHAR(4) = (RIGHT(Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/',''),4));
				Declare @UG_RESPONSAVEL VARCHAR(6)='154045';
				Declare @NAO_PREENCHER VARCHAR(213)='';

			SELECT
				@TIPO_REGISTRO+@CODIGO_ARQUIVO+dbo.FormataStringBatch(@DATA_GERACAO_FITA,0,8)+@SEQUENCIAL_GERACAO_ARQ_DIA+@ANO_REFERENCIA+
				@UG_RESPONSAVEL+@CPF_RESPONSAVEL+dbo.FormataStringBatch(@NAO_PREENCHER,1,213) AS LC_HEADER


			--DETALHE da Lista de Credores (LC):
				SELECT
					'2'+'2'+dbo.FormataStringBatch(l.cpf,0,14)
					+dbo.FormataStringBatch(l.Banco,0,3)+dbo.FormataStringBatch(l.agencia,0,4)
					+dbo.FormataStringBatch(l.Conta,1,10)+dbo.FormataStringBatch(l.Valor,0,17)
					+'154045'+'15262'+dbo.FormataStringBatch(l.NumeroLC,0,6)+dbo.FormataStringBatch('',1,1)
					+'N'+'1'+dbo.FormataStringBatch('',1,179) AS DETALHE_LC
				FROM dbbolsasprae.bolsa.ListaCredorSIAFI as l WHERE l.NumeroLC=@NUMERO_LISTA_CREDOR

			--TRAILLER da Lista de Credores (LC):
				DECLARE @CONTADOR VARCHAR(10);
				SELECT @CONTADOR=count(l.IdListaCredor) FROM dbbolsasprae.bolsa.ListaCredorSIAFI AS l WHERE l.NumeroLC=@NUMERO_LISTA_CREDOR 

				SELECT '9'+dbo.FormataStringBatch('',1,2)+dbo.FormataStringBatch(@CONTADOR,0,6)+dbo.FormataStringBatch('',1,240) AS TRAILLER

	END
GO
/****** Object:  StoredProcedure [dbo].[ARQUIVO_LISTA_DE_CREDOR_SIAFI]    Script Date: 19/07/2018 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ARQUIVO_LISTA_DE_CREDOR_SIAFI](
	@NUMERO_LISTA AS VARCHAR(6) = '400007',
	@CPF_RESPONSAVEL AS VARCHAR(11)
)

AS
	BEGIN

		/*Header da Lista de Credores*/
	Declare @TIPO_REGISTRO CHAR(1)='1';
	Declare @CODIGO_ARQUIVO CHAR(2)= 'LC';
	Declare @DATA_GERACAO_FITA VARCHAR(8) = Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/','');
	Declare @SEQUENCIAL_GERACAO_ARQ_DIA VARCHAR(4)=  (Left(Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/',''),4));
	Declare @ANO_REFERENCIA VARCHAR(4) = (RIGHT(Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/',''),4));
	Declare @UG_RESPONSAVEL VARCHAR(6)='154045';
	Declare @NAO_PREENCHER VARCHAR(213)='';	

	DECLARE @HEADER_LISTA_DE_CREDOR VARCHAR(2000);
	DECLARE @DETALHE_LISTA_DE_CREDOR VARCHAR(1000);
	DECLARE @TRAILLER_LISTA_DE_CREDOR VARCHAR(1350);

	SET @HEADER_LISTA_DE_CREDOR = @TIPO_REGISTRO+@CODIGO_ARQUIVO+dbo.FormataStringBatch(@DATA_GERACAO_FITA,0,8)+@SEQUENCIAL_GERACAO_ARQ_DIA+@ANO_REFERENCIA+
		@UG_RESPONSAVEL+@CPF_RESPONSAVEL+dbo.FormataStringBatch(@NAO_PREENCHER,1,213) --AS LC_HEADER

	/*Detlhe da Lista de Credores*/
	SELECT @DETALHE_LISTA_DE_CREDOR='2'+'2'+dbo.FormataStringBatch(l.cpf,0,14)
	+dbo.FormataStringBatch(l.Banco,0,3)+dbo.FormataStringBatch(l.agencia,0,4)
	+dbo.FormataStringBatch(l.Conta,1,10)+dbo.FormataStringBatch(l.Valor,0,17)
    +'154045'+'15262'+dbo.FormataStringBatch(l.NumeroLC,0,6)+dbo.FormataStringBatch('',1,1)
	+'N'+'1'+dbo.FormataStringBatch('',1,179) --AS DETALHE_LC
	FROM dbbolsasprae.bolsa.ListaCredor as l WHERE l.NumeroLC=@NUMERO_LISTA--@NUMERO_LISTA

	/*Trailler da Lista de Credores*/
	DECLARE @CONTADOR VARCHAR(10);
	SELECT @CONTADOR=count(L.IdListaCredor) FROM dbbolsasprae.bolsa.ListaCredor AS l WHERE l.NumeroLC='000317' 

	SELECT '9'+dbo.FormataStringBatch('',1,2)+dbo.FormataStringBatch(@CONTADOR,0,6)+dbo.FormataStringBatch('',1,240) AS TRAILLER

	END
GO
