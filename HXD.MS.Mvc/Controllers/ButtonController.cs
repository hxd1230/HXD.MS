using HXD.MS.BLL;
using HXD.MS.Common;
using HXD.MS.Entity;
using HXD.MS.Mvc.Models;
using HXD.MS.Mvc.Models.ViewModels;
using System.Data;
using System.Web.Mvc;

namespace HXD.MS.Mvc.Controllers
{
    public class ButtonController : Controller
    {
        private ButtonService buttonService = null;
        private SessionManager sessionManager = null;
        public ButtonController()
        {
            buttonService = new ButtonService();
            sessionManager = new SessionManager();
        }
        // GET: Button
        public ActionResult Index()
        {
            return View();
        }
        public ContentResult GetAllButton(int pageIndex = 1)
        {
            int pageSize = 15;
            int rowbegin = (pageIndex - 1) * pageSize + 1;
            int rowend = pageIndex * pageSize;
            int totalCount = buttonService.GetRecordCount("");
            DataSet menus = buttonService.GetListByPage("", "", startIndex: rowbegin, endIndex: rowend);
            string json = SerializerHelper.ToJson(menus.Tables[0]);
            return Content(json);
        }

        public ContentResult GetMenuButton(string menuCode)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            return Content(buttonService.GetButtonByUserId(user.Id, menuCode));
        }

        public ContentResult GetAllButtonTree()
        {
            string jsonStr = buttonService.GetAllButtonTree("");
            return Content(jsonStr);
        }

        [HttpGet]
        public ActionResult ButtonAdd()
        {
            return View();
        }
        [HttpPost]
        public ContentResult ButtonAdd(Button model)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            if (!(buttonService.Add(model) > 0))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "新增失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        [HttpGet]
        public ActionResult ButtonEdit()
        {
            return View();
        }

        [HttpPost]
        public ContentResult ButtonEdit(Button model)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            if (!buttonService.Update(model))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "更新失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }
        [HttpPost]
        public ContentResult ButtonDelete(int id)
        {
            //Result<object> result = new Result<object>();
            //todo:有一个先决条件：如果删除的是一级菜单，那么它下面必须没有子节点才可以删除
            if (!buttonService.Delete(id))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "删除失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }
    }
}