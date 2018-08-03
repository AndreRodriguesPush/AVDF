using System.Web;
using System.Web.Mvc;

namespace ufmt.br.bolsa.auxilio.siafi
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
