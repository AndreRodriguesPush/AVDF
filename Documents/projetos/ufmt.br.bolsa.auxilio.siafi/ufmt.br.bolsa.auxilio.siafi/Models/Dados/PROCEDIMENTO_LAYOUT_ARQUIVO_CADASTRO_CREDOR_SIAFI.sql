ALTER PROCEDURE ARQUIVO_CADASTRO_CREDOR_SIAFI (
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
 