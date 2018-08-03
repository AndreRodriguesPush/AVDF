--HEADER do Cadastro de Credor:
Declare @REMESSA CHAR(4)= '0009';
Declare @COD_UG CHAR(6)='154045';
Declare @CPF_RESPONSAVEL VARCHAR(11) = '01263612156';
Declare @DATA_GERACAO VARCHAR(8) = Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/','');
Declare @HORA_GERACAO VARCHAR(6) = replace(convert(varchar, getdate(), 108),':','');


DECLARE @HeaderCadastroCredor VARCHAR(2000);
DECLARE @DetalheCadastroCredor VARCHAR(1000);
DECLARE @Trailler VARCHAR(1350);


SET @HeaderCadastroCredor= '1'+dbo.FormataStringBatch(@DATA_GERACAO,0,8)
          +dbo.FormataStringBatch(@HORA_GERACAO,0,6)
		  +'CREDOR'
		  +dbo.FormataStringBatch(@REMESSA,0,4)
		  +@COD_UG
		  +@CPF_RESPONSAVEL
		  +dbo.FormataStringBatch('',1,1303)--FILLER NÃO PREENCHE NADA
			

--DETALHE do Cadastro de Credor:
Declare @CPF VARCHAR(11);
Declare @NOME VARCHAR(45);
Declare @ENDERECO VARCHAR(65);
Declare @CODIGO_MUNICIPIO_SIAFI CHAR(4);
Declare @CODIGO_PAIS CHAR(3);
Declare @TELEFONE CHAR(45);
Declare @FAX CHAR(45);
Declare @CEP_UFMT CHAR(8);
Declare	@NOME_BANCO_BOLSISTA VARCHAR (100);
Declare @CODIGO_BANCO_BOLSISTA CHAR(3);
Declare @AGENCIA CHAR(4);
Declare @CONTA_CORRENTE CHAR(10);
Declare @TIPO_CONTA CHAR(1);
Declare @UG_SUPRIDORA CHAR(6);
Declare @GESTAO_SUPRIDORA CHAR(5);

SET		@CPF					= (SELECT replace(replace(a.cpf,'.',''),'-','') FROM dbbolsasprae.bolsa.aluno a WHERE a.cpf='06188078105'); 
SET		@NOME					= (SELECT dbo.FN_FORMATAR_TEXTO(a.nome) FROM dbbolsasprae.bolsa.aluno a WHERE a.cpf='06188078105'); 
SET		@ENDERECO				= (SELECT dbo.FN_FORMATAR_TEXTO(a.rua+a.numero+a.bairro+a.cidade) FROM dbbolsasprae.bolsa.aluno a WHERE a.rga='201811732019');
SET		@CODIGO_MUNICIPIO_SIAFI = '9067';  --=>Código Município de Cbá como padrão (SELECT a.CodigoMunicipioSIAFI FROM dbbolsasprae.bolsa.aluno a WHERE a.rga='201811732019');
SET		@CODIGO_PAIS			= '130';--012
SET		@TELEFONE				= (SELECT replace(replace(a.telefone,' ',''),'-','') FROM dbbolsasprae.bolsa.aluno a WHERE a.rga='201811732019');
SET		@CEP_UFMT				= 78060900;
SET		@NOME_BANCO_BOLSISTA	= (SELECT d.banco FROM dbbolsasprae.bolsa.dadosbancario d WHERE d.rga='201811732019' group by d.banco);
SET		@CODIGO_BANCO_BOLSISTA	= (SELECT d.BancoUID FROM dbbolsasprae.bolsa.Banco d WHERE d.NomeBanco like @NOME_BANCO_BOLSISTA);
SET		@AGENCIA				= (SELECT replace(d.agencia,'-','') FROM dbbolsasprae.bolsa.dadosbancario d WHERE d.rga='201811732019' group by d.agencia); 			
SET     @CONTA_CORRENTE			= (SELECT replace(d.conta,'-','') FROM dbbolsasprae.bolsa.dadosbancario d WHERE d.rga='201811732019' group by d.conta); 
SET		@TIPO_CONTA				=  '1';--CREDORA
SET		@UG_SUPRIDORA			= '154045';
SET		@GESTAO_SUPRIDORA		= '26276'; --15262

SET @DetalheCadastroCredor =  
        '2'+dbo.FormataStringBatch(@CPF,1,14)
		+dbo.FormataStringBatch(@NOME,1,45)
		+dbo.FormataStringBatch(@NOME,1,19)
		+'2'+dbo.FormataStringBatch(@ENDERECO,1,65)
		+@CODIGO_MUNICIPIO_SIAFI
		+'MT'+@CODIGO_PAIS
		+dbo.FormataStringBatch(@TELEFONE,1,45)
		+dbo.FormataStringBatch('',1,45)
		+dbo.FormataStringBatch('MOTIVO INCLUSAO',1,140)
		+dbo.FormataStringBatch(@CEP_UFMT,0,8)
		+dbo.FormataStringBatch('0'+@CODIGO_BANCO_BOLSISTA+@AGENCIA+@CONTA_CORRENTE+@TIPO_CONTA,1,580)		 		 

 --FROM dbbolsasprae.bolsa.aluno as a, dbbolsasprae.bolsa.CodigoMunicipioSiafi AS m
 --Trailler
 Declare @QTDE_REGISTRO_FITA INT = (SELECT count(a.cpf) AS CONTADOR_REMESSA FROM dbbolsasprae.bolsa.aluno a WHERE a.cpf=@CPF group by a.cpf);

SET @Trailler= '9'+dbo.FormataStringBatch(@QTDE_REGISTRO_FITA,0,7)+dbo.FormataStringBatch('',1,1337)
------------------------------------------------------------------------------------------------------------------------------------
select @HeaderCadastroCredor
select @DetalheCadastroCredor
select @Trailler
----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO bolsa.CadastroCredorSiafi(HeaderCadastroCredor, DetalheCadastroCredor, TraillerCadastroCredor)
VALUES(@HeaderCadastroCredor,@DetalheCadastroCredor,@Trailler)

SELECT * FROM bolsa.CadastroCredorSiafi






 -----------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx----------------------------------------------------------       
 --CRIAÇÃO DA TABELA TEMPORÁRIA:

 --IF (Object_id('@Tbl_CadastroCredorSiafi') Is Not Null) 
	--BEGIN	
		--Declare @Tbl_CadastroCredorSiafi Table(
		--	--IdRemessa INT IDENTITY PRIMARY KEY NOT NULL,
		--	HeaderCadastroCredor VARCHAR(2000) NOT NULL,
		--	DetalheCadastroCredor VARCHAR(1000) NOT NULL,
		--	Trailler VARCHAR(1350) NOT NULL
		--	)
		--INSERT INTO @Tbl_CadastroCredorSiafi (HeaderCadastroCredor,DetalheCadastroCredor,Trailler) 
		--VALUES(@HeaderCadastroCredor,@DetalheCadastroCredor,@Trailler)
	--END	
    
	--SELECT * from @Tbl_CadastroCredorSiafi

 --INSERT INTO #NUMERO_REMESSA_TEMP (CPF,QtdeRegistro) VALUES(@CPF,@QTDE_REGISTRO_FITA)
--SELECT dbo.FormataStringBatch(IdRemessa+1,0,4) AS REMESSA, CPF, QtdeRegistro FROM #NUMERO_REMESSA_TEMP
 --TRUNCATE TABLE #NUMERO_REMESSA_TEMP
 --DROP TABLE #NUMERO_REMESSA_TEMP


-- SELECT * FROM dbbolsasprae.bolsa.CadastroCredor

