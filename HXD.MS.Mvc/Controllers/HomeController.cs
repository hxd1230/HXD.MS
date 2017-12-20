using HXD.MS.BLL;
using HXD.MS.Common;
using HXD.MS.Mvc.Models;
using HXD.MS.Mvc.Models.Tree;
using HXD.MS.Mvc.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;

namespace HXD.MS.Mvc.Controllers
{
    public class HomeController : BaseController
    {
        private MenuService menuBll = new MenuService();
        // GET: Home
        public ActionResult Index()
        {
            HXD.MS.Entity.User user = (HXD.MS.Entity.User)SessionHelper.Get("User");
            if (user == null)
            {
                return RedirectToAction("/Login", "Account");
            }

            ViewBag.NickName = user.NickName;
            ViewBag.TimeView = DateTime.Now.ToLongDateString();
            ViewBag.DayDate = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetDayName(DateTime.Now.DayOfWeek);
            return View();
        }

        public ContentResult GetTree()
        {
            //Result<List<ParentNode>> returnResult = null;
            List<ParentNode> tree = new List<ParentNode>();
            ParentNode parentNode = null;
            SubNode subNode = null;
            HXD.MS.Entity.User user = (HXD.MS.Entity.User)SessionHelper.Get("User");
            if (user != null)
            {
                DataTable parents = menuBll.GetUserMenuData(user.Id, 0);
                foreach (DataRow dr in parents.Rows)
                {
                    int menuId = Convert.ToInt32(dr["Id"]);
                    int parentId = Convert.ToInt32(dr["ParentId"]);
                    parentNode = new ParentNode(menuId, dr["Name"].ToString(), dr["Icon"].ToString());
                    DataTable subNodes = menuBll.GetUserMenuData(user.Id, menuId);
                    if (subNodes.Rows.Count > 0)
                    {
                        parentNode.State = "closed";
                    }
                    else
                    {
                        parentNode.State = "open";
                    }
                    foreach (DataRow subMenu in subNodes.Rows)
                    {
                        menuId = Convert.ToInt32(subMenu["Id"]);
                        parentId = Convert.ToInt32(subMenu["ParentId"]);
                        subNode = new SubNode(menuId, subMenu["Name"].ToString(), subMenu["Link"].ToString(), subMenu["Icon"].ToString());
                        parentNode.children.Add(subNode);
                    }
                    tree.Add(parentNode);
                }
            }
            return Content(AjaxMsgHelper.AjaxMsg(CodeType.Ok, "ok", tree));
        }
    }
}