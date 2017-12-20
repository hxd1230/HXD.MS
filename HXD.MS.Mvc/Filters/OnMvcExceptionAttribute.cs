using HXD.MS.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HXD.MS.Mvc.Filters
{
    public class OnMvcExceptionAttribute : HandleErrorAttribute
    {
        public override void OnException(ExceptionContext filterContext)
        {
            Exception exception = filterContext.Exception;
            LogHelper.Exception(this.GetType(), exception.ToString(), exception);
            base.OnException(filterContext);
        }
    }
}