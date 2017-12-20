using HXD.MS.Mvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HXD.MS.Mvc.Filters
{
    public class OnActionFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //base.OnActionExecuting(filterContext);
            HXD.MS.Entity.User user = new SessionManager().SessionObject;
            if (user == null)
            {
                filterContext.Result = new RedirectResult("/Account/Login");
            }
        }
    }
}