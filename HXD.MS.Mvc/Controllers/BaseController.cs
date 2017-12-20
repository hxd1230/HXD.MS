using HXD.MS.BLL;
using HXD.MS.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HXD.MS.Mvc.Controllers
{
    public class BaseController : Controller
    {
        private UserService userBll = new UserService();
        public bool CheckUser(string userName, string userPass)
        {
            HXD.MS.Entity.User user = userBll.GetUserByUserName(userName);
            if (user != null)
            {
                //用户存在，比较密码
                if (user.UserPass.Equals((userPass)))
                {
                    return true;
                }
                return false;
            }
            else
            {
                return false;
            }
        }
    }
}