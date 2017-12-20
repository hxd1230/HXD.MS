using HXD.MS.BLL;
using HXD.MS.Common;
using HXD.MS.Entity;
using HXD.MS.Mvc.Models;
using HXD.MS.Mvc.Models.ViewModels;
using System.Web.Mvc;

namespace HXD.MS.Mvc.Controllers
{
    public class AccountController : Controller
    {
        private readonly static UserService userBll = new UserService();
        private SessionManager sessionManager = null;
        public AccountController()
        {
            sessionManager = new SessionManager();
        }
        // GET: Account
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            if (user != null)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        [HttpPost]
        // [ValidateAntiForgeryToken]
        public ContentResult Login(User model, string returnUrl)
        {
            string userName = model.UserName;
            string userPass = model.UserPass;
            //bool rememberMe = model.RememberMe;
            HXD.MS.Entity.User user = userBll.GetUserByUserName(userName);
            if (user != null)
            {
                //用户存在，比较密码
                if (user.UserPass.Equals(EncryptHelper.EncryptWithMD5(userPass)))
                {
                    if (!user.Enable)
                    {
                        //CookieHelper.Set("UserName", user.UserName);
                        //CookieHelper.Set("UserPass", user.UserPass);
                        return Content(AjaxMsgHelper.AjaxMsg(CodeType.UserLoginError, "账号已禁用"));
                    }
                    SessionHelper.Set("User", user);

                    //记录日志
                    LogHelper.Info(this.GetType(), string.Format("{0}登录成功", user.UserName));
                }
                else
                {
                    return Content(AjaxMsgHelper.AjaxMsg(CodeType.UserLoginError, "用户名或密码错误"));
                }
            }
            else
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.UserLoginError, "用户名或密码错误"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }
        public ContentResult LogOut()
        {
            SessionHelper.Remove("User");
            return Content(AjaxMsgHelper.AjaxMsg());
        }
    }
}