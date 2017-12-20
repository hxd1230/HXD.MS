using HXD.MS.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HXD.MS.Mvc.Models.ViewModels
{
    public class AjaxMsgHelper
    {
        public static string AjaxMsg(CodeType code = CodeType.Ok, string message = "ok", dynamic data = null)
        {
            dynamic model = new { code = code, message = message, data = data };
            return SerializerHelper.SerializeJson(model);
        }
    }
    public enum CodeType
    {
        Ok = 200,
        NoContent = 204,
        Error = 500,
        UserLoginError = 1000
    }
}