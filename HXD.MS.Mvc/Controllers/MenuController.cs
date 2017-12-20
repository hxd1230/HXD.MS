using HXD.MS.BLL;
using HXD.MS.Common;
using HXD.MS.Entity;
using HXD.MS.Mvc.Models;
using HXD.MS.Mvc.Models.ViewModels;
using System.Data;
using System.Web.Mvc;

namespace HXD.MS.Mvc.Controllers
{
    public class MenuController : Controller
    {
        private MenuService menuBll = null;
        private SessionManager sessionManager = null;
        private MenuButtonService menuButtonBll = null;
        public MenuController()
        {
            menuBll = new MenuService();
            sessionManager = new SessionManager();
            menuButtonBll = new MenuButtonService();
        }
        // GET: Menu
        public ActionResult Index()
        {
            return View();
        }
        public ContentResult GetAllMenu(int pageIndex = 1)
        {
            int pageSize = 15;
            int rowbegin = (pageIndex - 1) * pageSize + 1;
            int rowend = pageIndex * pageSize;
            int totalCount = menuBll.GetRecordCount("");
            DataSet menus = menuBll.GetListByPage("", "ParentId,T.Id", startIndex: rowbegin, endIndex: rowend);
            string json = SerializerHelper.ToJson(menus.Tables[0]);
            return Content(json);
        }


        [HttpGet]
        public ActionResult MenuAdd()
        {
            return View();
        }
        [HttpPost]
        public ContentResult MenuAdd(Menu model)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            if (!(menuBll.Add(model) > 0))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "新增失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        [HttpGet]
        public ActionResult MenuEdit()
        {
            return View();
        }

        [HttpPost]
        public ContentResult MenuEdit(Menu model)
        {
            HXD.MS.Entity.User user = sessionManager.SessionObject;
            model.Creater = user.UserName;
            if (!menuBll.Update(model))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "更新失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }
        public ContentResult GetAllMenuTree()
        {
            string menuJson = menuBll.GetAllMenu();
            return Content(menuJson);
        }

        [HttpPost]
        public ContentResult MenuDelete(int id)
        {
            //Result<object> result = new Result<object>();
            //todo:有一个先决条件：如果删除的是一级菜单，那么它下面必须没有子节点才可以删除
            if (!menuBll.Delete(id))
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "删除失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        #region 分配按钮
        [HttpGet]
        public ActionResult AllotMenuButton()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AllotMenuButton(string menuId, string buttonIds)
        {
            bool flag = menuButtonBll.SaveMenuButton(menuId, buttonIds);
            if (!flag)
            {
                return Content(AjaxMsgHelper.AjaxMsg(CodeType.Error, "分配按钮失败"));
            }
            return Content(AjaxMsgHelper.AjaxMsg());
        }

        /// <summary>
        /// 根据菜单编号获取菜单对应的按钮
        /// </summary>
        /// <param name="menuId"></param>
        /// <returns></returns>
        public ActionResult GetButtonsByMenuId(int menuId)
        {
            string jsonStr = menuButtonBll.GetButtonByMenuId(menuId);
            return Content(jsonStr);
        }
        #endregion
    }
}