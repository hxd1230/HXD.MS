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
    public class IconController : Controller
    {
        private IconService iconService = null;
        private SessionManager sessionManager = null;
        public IconController()
        {
            iconService = new IconService();
            sessionManager = new SessionManager();
        }
        // GET: Icon
        public ActionResult Index()
        {
            return View();
        }
        public ContentResult GetAllIcon(int pageIndex = 1)
        {
            int pageSize = 15;
            int rowbegin = (pageIndex - 1) * pageSize + 1;
            int rowend = pageIndex * pageSize;
            int totalCount = iconService.GetRecordCount("");
            DataSet menus = iconService.GetListByPage("", "", startIndex: rowbegin, endIndex: rowend);
            string json = SerializerHelper.ToJson(menus.Tables[0]);
            return Content(json);
        }
        [HttpGet]
        public ActionResult IconAdd()
        {
            return View();
        }
        [HttpPost]
        public ContentResult IconAdd(Icon model)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            if (!(iconService.Add(model) > 0))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "新增失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        [HttpGet]
        public ActionResult IconEdit()
        {
            return View();
        }

        [HttpPost]
        public ContentResult IconEdit(Icon model)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            if (!iconService.Update(model))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "更新失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }
        [HttpPost]
        public ContentResult IconDelete(int id)
        {
            //Result<object> result = new Result<object>();
            //todo:有一个先决条件：如果删除的是一级菜单，那么它下面必须没有子节点才可以删除
            if (!iconService.Delete(id))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "删除失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        public ActionResult GetAllIconTree()
        {
            return Content(iconService.GetAllIconTree(""));
        }
    }
}