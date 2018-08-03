using GerenciamentoBolsasAuxiliosSiafi.Models.DAO;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GerenciamentoBolsasAuxiliosSiafi.Models.DAL
{
    public class DALCriaArquivoListaCredor
    {
        public byte[] ArquivoListaCredor(string mes)
        {
            var sb = new StringBuilder();
            var listaCredorSiafi = new DAOListaCredorSiafi();

            var listaCredor = listaCredorSiafi.GetDetalheListaCredorSiafi(mes);
            var final = listaCredor.Count() - 1;

            var header = listaCredor.First().HeaderListaCredor + Environment.NewLine;
            sb.Append(header);

            for (int i = 0; i < listaCredor.Count; i++)
            {
                var detalhe = listaCredor[i].DetalheListaCredor + Environment.NewLine;
                sb.Append(detalhe);
            }

            var trailler = listaCredor.First().TraillerListaCredor;
            sb.Append(trailler);

            byte[] dataAsBytes = sb.ToString().SelectMany(s => System.Text.Encoding.UTF8.GetBytes(s.ToString())).ToArray();
            return dataAsBytes;
        }

    }
}