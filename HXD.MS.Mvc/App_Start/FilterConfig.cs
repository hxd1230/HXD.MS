using HXD.MS.Mvc.Filters;
using System.Web;
using System.Web.Mvc;

namespace HXD.MS.Mvc
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new OnMvcExceptionAttribute());
            //filters.Add(new HandleErrorAttribute());
            //filters.Add(new OnMvcExceptionAttribute());
           // filters.Add(new OnActionFilterAttribute());
        }
    }
}
