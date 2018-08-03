using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ufmt.br.bolsa.auxilio.siafi.Models;

namespace GerenciamentoBolsasAuxiliosSiafi.Models.DAO
{
    public class DAOCadastroCredorSiafi
    {
        public String GetHeaderCredorSiafi(String idEdital)
        {
            using (var db = new dbbolsaspraeEntities())
            {
                var headerCredor = db.CadastroCredorSiafi.Where(x => x.Edital.Equals(idEdital)).FirstOrDefault().HeaderCadastroCredor;
                return headerCredor;

            }
        }

        public List<CadastroCredorSiafi> GetDetalheCredorSiafi(String idEdital)
        {
            using (var db = new dbbolsaspraeEntities())
            {
                var listaDetalheCredor = db.CadastroCredorSiafi.Where(x => x.Edital.Equals(idEdital)).ToList();

                return listaDetalheCredor;

            }
        }

        public String GetTraillerCredorSiafi(String idEdital)
        {
            using (var db = new dbbolsaspraeEntities())
            {
                var traillerCredor = db.CadastroCredorSiafi.Where(x => x.Edital.Equals('1')).FirstOrDefault().TraillerCadastroCredor;
                return traillerCredor;

            }
        }
    }
}
