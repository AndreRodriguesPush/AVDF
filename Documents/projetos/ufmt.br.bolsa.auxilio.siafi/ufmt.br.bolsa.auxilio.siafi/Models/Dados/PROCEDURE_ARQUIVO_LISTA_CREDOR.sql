ALTER PROCEDURE ARQUIVO_LISTA_DE_CREDOR_SIAFI(
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
	--
	SET @HEADER_LISTA_DE_CREDOR = @TIPO_REGISTRO+@CODIGO_ARQUIVO+dbo.FormataStringBatch(@DATA_GERACAO_FITA,0,8)+@SEQUENCIAL_GERACAO_ARQ_DIA+@ANO_REFERENCIA+
		@UG_RESPONSAVEL+'01263612156'+dbo.FormataStringBatch(@NAO_PREENCHER,1,213) --AS LC_HEADER

		--@CPF_RESPONSAVEL
    Declare @NUMERO_LISTA AS VARCHAR(6);
	Declare @DETALHE_LISTA_DE_CREDOR AS VARCHAR(250);
	SET @NUMERO_LISTA='000317';--400007
	/*Detlhe da Lista de Credores*/
	SELECT @DETALHE_LISTA_DE_CREDOR='2'+'2'+dbo.FormataStringBatch(l.cpf,0,14)
	+dbo.FormataStringBatch(l.Banco,0,3)+dbo.FormataStringBatch(l.agencia,0,4)
	+dbo.FormataStringBatch(l.Conta,1,10)+dbo.FormataStringBatch(l.Valor,0,17)
    +'154045'+'15262'+dbo.FormataStringBatch(l.NumeroLC,0,6)+dbo.FormataStringBatch('',1,1)
	+'N'+'1'+dbo.FormataStringBatch('',1,179) --AS DETALHE_LC
	FROM dbbolsasprae.bolsa.ListaCredor as l WHERE l.NumeroLC=@NUMERO_LISTA


	/*Trailler da Lista de Credores*/
	DECLARE @CONTADOR VARCHAR(10);
	SELECT @CONTADOR=count(L.IdListaCredor) FROM dbbolsasprae.bolsa.ListaCredor AS l WHERE l.NumeroLC='000317' 
	SELECT '9'+dbo.FormataStringBatch('',1,2)+dbo.FormataStringBatch(@CONTADOR,0,6)+dbo.FormataStringBatch('',1,240) --AS TRAILLER

	END


--	EXEC ARQUIVO_LISTA_DE_CREDOR_SIAFI @NUMERO_LISTA='400007',@CPF_RESPONSAVEL='01263612156'