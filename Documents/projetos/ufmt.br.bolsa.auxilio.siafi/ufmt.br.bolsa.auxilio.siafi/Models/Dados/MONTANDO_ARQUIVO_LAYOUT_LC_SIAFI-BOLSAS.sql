
--HEADER da Lista de Credores (LC):
Declare @TIPO_REGISTRO CHAR(1)='1';
Declare @CODIGO_ARQUIVO CHAR(2)= 'LC';
Declare @DATA_GERACAO_FITA VARCHAR(8) = Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/','');
Declare @SEQUENCIAL_GERACAO_ARQ_DIA VARCHAR(4)=  (Left(Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/',''),4));
Declare @ANO_REFERENCIA VARCHAR(4) = (RIGHT(Replace(Convert(varchar(10),Convert(date,GetDate(),106),103),'/',''),4));
Declare @UG_RESPONSAVEL VARCHAR(6)='154045';
Declare @CPF_RESPONSAVEL VARCHAR(11) = '01263612156';
Declare @NAO_PREENCHER VARCHAR(213)='';


SELECT
	@TIPO_REGISTRO+@CODIGO_ARQUIVO+dbo.FormataStringBatch(@DATA_GERACAO_FITA,0,8)+@SEQUENCIAL_GERACAO_ARQ_DIA+@ANO_REFERENCIA+
	@UG_RESPONSAVEL+@CPF_RESPONSAVEL+dbo.FormataStringBatch(@NAO_PREENCHER,1,213) AS LC_HEADER


--DETALHE da Lista de Credores (LC):
/*Declare @TIPO_REGISTRO_DETALHE char(1)='2';
Declare @TIPO_CREDOR_CPF char(1)='2';
Declare @FAVORECIDO_CPF varchar(14); --CPF tem 11 posições, preencher com espaços alfa num.1 do parâmetro.

Declare @CODIGO_BANCO varchar(3);
Declare @CODIGO_AGENCIA varchar(4);
Declare @CODIGO_CONTA_CORRENTE varchar(10);
Declare @VALOR_CREDITO VARCHAR(17);

Declare @UG_EMITENTE varchar(5)='154045';
Declare @GESTAO_EMITENTE varchar(6)='15262';
Declare @NUMERO_LISTA varchar(6);
Declare @TIPO_LISTA VARCHAR(1)='';
Declare @SUPRIMENTO_FUNDOS char(1)='n';
Declare @TIPO_PAGAMENTO char(1) = '1';
Declare @FILLER varchar(179);*/

--SELECT 
--    @FAVORECIDO_CPF=l.cpf
--   ,@CODIGO_BANCO=idbufmt.dbo.FormataStringBatch(l.banco,0,3)
--   ,@CODIGO_AGENCIA=l.agencia
--   ,@CODIGO_CONTA_CORRENTE=l.conta 
--   ,@VALOR_CREDITO=l.Valor 
--FROM dbbolsasprae.bolsa.ListaCredorSIAFI as l
--WHERE l.cpf='05206277177'


SELECT
	'2'+'2'+dbo.FormataStringBatch(l.cpf,1,14)
	+dbo.FormataStringBatch(l.Banco,0,3)+dbo.FormataStringBatch(l.agencia,0,4)
	+dbo.FormataStringBatch(l.Conta,1,10)+dbo.FormataStringBatch(l.Valor,0,17)
    +'154045'+'15262'+dbo.FormataStringBatch(l.NumeroLC,0,6)+dbo.FormataStringBatch('',1,1)
	+'N'+'1'+dbo.FormataStringBatch('',1,179) AS DETALHE_LC
FROM dbbolsasprae.bolsa.ListaCredor as l WHERE l.NumeroLC='400005'

--TRAILLER da Lista de Credores (LC):
DECLARE @CONTADOR VARCHAR(10);
SELECT @CONTADOR=count(l.IdListaCredor) FROM dbbolsasprae.bolsa.ListaCredor AS l WHERE l.NumeroLC='400005' 

SELECT '9'+dbo.FormataStringBatch('',1,2)+dbo.FormataStringBatch(@CONTADOR,0,6)+dbo.FormataStringBatch('',1,240) AS TRAILLER
