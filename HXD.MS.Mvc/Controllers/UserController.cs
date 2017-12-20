using HXD.MS.BLL;
using HXD.MS.Common;
using HXD.MS.Core;
using HXD.MS.Entity;
using HXD.MS.Mvc.Models;
using HXD.MS.Mvc.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HXD.MS.Mvc.Controllers
{
    public class UserController : Controller
    {
        private UserService userService = null;
        private SessionManager sessionManager = null;
        private UserRoleService userRoleService = null;
        public UserController()
        {
            userService = new UserService();
            sessionManager = new SessionManager();
            userRoleService = new UserRoleService();
        }
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ContentResult GetAllUser(int pageIndex = 1)
        {
            int pageSize = 15;
            int rowbegin = (pageIndex - 1) * pageSize + 1;
            int rowend = pageIndex * pageSize;
            int totalCount = userService.GetRecordCount("");
            DataSet menus = userService.GetListByPage("", "", startIndex: rowbegin, endIndex: rowend);
            string json = SerializerHelper.ToJson(menus.Tables[0]);
            return Content(json);
        }

        [HttpGet]
        public ActionResult UserAdd()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UserAdd(User model)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            model.UserPass = EncryptHelper.EncryptWithMD5(PubConstant.DefaultUserPass);
            int r = userService.Add(model);
            if (r < 0)
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "用户已经存在"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        [HttpGet]
        public ActionResult UserEdit()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UserEdit(User model)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            if (!userService.Update(model))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "更新失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }
        [HttpPost]
        public ContentResult UserDelete(int id)
        {
            if (!userService.DeleteUser(id))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "删除失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        [HttpGet]
        public ActionResult UserRole()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UserRole(int userId, string roleIds)
        {
            bool flag = userRoleService.SaveUserRole(userId, roleIds);
            if (!flag)
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "角色设置失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        public ActionResult GetRolesByUserId(int userId)
        {
            string jsonStr = userRoleService.GetRolesByUserId(userId);
            return Content(jsonStr);
        }
    }
}