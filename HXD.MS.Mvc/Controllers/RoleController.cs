using HXD.MS.BLL;
using HXD.MS.Common;
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
    public class RoleController : Controller
    {
        private SessionManager sessionManager = null;
        private RoleService roleService = null;
        public RoleController()
        {
            sessionManager = new SessionManager();
            roleService = new RoleService();
        }
        // GET: Role
        public ActionResult Index()
        {
            return View();
        }
        public ContentResult GetAllRole(int pageIndex = 1)
        {
            int pageSize = 15;
            int rowbegin = (pageIndex - 1) * pageSize + 1;
            int rowend = pageIndex * pageSize;
            int totalCount = roleService.GetRecordCount("");
            DataSet menus = roleService.GetListByPage("", "", startIndex: rowbegin, endIndex: rowend);
            string json = SerializerHelper.ToJson(menus.Tables[0]);
            return Content(json);
        }

        [HttpGet]
        public ActionResult RoleAdd()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RoleAdd(Role model)
        {
            User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            int r = roleService.AddRole(model);
            if (r < 0)
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "角色已经存在"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        [HttpGet]
        public ActionResult RoleEdit()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RoleEdit(Role model)
        {
            User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            int r = roleService.EditRole(model);
            if (r < 0)
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "角色已经存在"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }
    }
}