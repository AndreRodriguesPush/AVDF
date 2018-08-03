using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ufmt.br.bolsa.auxilio.siafi.Models;

namespace GerenciamentoBolsasAuxiliosSiafi.Models.DAO
{
    public class DAOListaCredorSiafi
    {
        public String GetHeaderListaCredorSiafi(String mesFolha)
        {
            using (var db = new dbbolsaspraeEntities())
            {
                var headerListaCredor = db.ListaCredorSiafi.Where(x => x.MesAnoReferencia.Equals(mesFolha)).FirstOrDefault().HeaderListaCredor;
                return headerListaCredor;

            }
        }

        public List<ListaCredorSiafi> GetDetalheListaCredorSiafi(String mesFolha)
        {
            using (var db = new dbbolsaspraeEntities())
            {
                var detalheListaCredor = db.ListaCredorSiafi.Where(x => x.MesAnoReferencia.Equals(mesFolha)).ToList();

                return detalheListaCredor;

            }
        }

        public String GetTraillerListaCredorSiafi(String mesFolha)
        {
            using (var db = new dbbolsaspraeEntities())
            {
                var traillerListaCredor = db.ListaCredorSiafi.Where(x => x.MesAnoReferencia.Equals(mesFolha)).FirstOrDefault().TraillerListaCredor;
                return traillerListaCredor;

            }
        }
    }
}
