using GerenciamentoBolsasAuxiliosSiafi.Models.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GerenciamentoBolsasAuxiliosSiafi.Models.DAL
{
    public class DALCriaArquivoCredor
    {
        public byte[] ArquivoCadastroCredor(string edital)
        {
            var sb = new StringBuilder();
            var credorSiafi = new DAOCadastroCredorSiafi();

            var listaCredor = credorSiafi.GetDetalheCredorSiafi(edital);
            var final = listaCredor.Count() - 1;

            var header = listaCredor.First().HeaderCadastroCredor + Environment.NewLine;
            sb.Append(header);

            for (int i = 0; i < listaCredor.Count; i++)
            {
                var detalhe = listaCredor[i].DetalheCadastroCredor + Environment.NewLine;
                sb.Append(detalhe);
            }

            var trailler = listaCredor.First().TraillerCadastroCredor;
            sb.Append(trailler);

            byte[] dataAsBytes = sb.ToString().SelectMany(s => System.Text.Encoding.UTF8.GetBytes(s.ToString())).ToArray();
            return dataAsBytes;
        }

    }
}
