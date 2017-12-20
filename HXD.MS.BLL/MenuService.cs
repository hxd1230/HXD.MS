/**  版本信息模板在安装目录下，可自行修改。
* Menu.cs
*
* 功 能： N/A
* 类 名： Menu
*
* Ver    变更日期             负责人  变更内容
* ───────────────────────────────────
* V0.01  2017/11/2 11:01:17   N/A    初版
*
* Copyright (c) 2012 Maticsoft Corporation. All rights reserved.
*┌──────────────────────────────────┐
*│　此技术信息为本公司机密信息，未经本公司书面同意禁止向第三方披露．　│
*│　版权所有：动软卓越（北京）科技有限公司　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/
using System;
using System.Data;
using System.Collections.Generic;

using HXD.MS.Entity;
using HXD.MS.Entity.DAL;
using System.Text;
namespace HXD.MS.BLL
{
	/// <summary>
	/// 菜单表
	/// </summary>
	public partial class MenuService
	{
        private readonly MenuDAL dal = new MenuDAL();
        public MenuService()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
			return dal.GetMaxId();
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int Id)
		{
			return dal.Exists(Id);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int  Add(HXD.MS.Entity.Menu model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(HXD.MS.Entity.Menu model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int Id)
		{
			
			return dal.Delete(Id);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string Idlist )
		{
			return dal.DeleteList(Idlist );
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HXD.MS.Entity.Menu GetModel(int Id)
		{
			
			return dal.GetModel(Id);
		}



		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<HXD.MS.Entity.Menu> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<HXD.MS.Entity.Menu> DataTableToList(DataTable dt)
		{
			List<HXD.MS.Entity.Menu> modelList = new List<HXD.MS.Entity.Menu>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				HXD.MS.Entity.Menu model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = dal.DataRowToModel(dt.Rows[n]);
					if (model != null)
					{
						modelList.Add(model);
					}
				}
			}
			return modelList;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			return dal.GetRecordCount(strWhere);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			return dal.GetListByPage( strWhere,  orderby,  startIndex,  endIndex);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  BasicMethod
		#region  ExtensionMethod
        public DataTable GetUserMenuData(int userId, int parentId)
        {
            DataSet ds = dal.GetUserMenuData(userId, parentId);
            return ds.Tables[0];
        }
        public string GetAllMenu()
        {
            DataTable dataTable = dal.GetAllMenu();
            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            DataRow[] rows = dataTable.Select("ParentId=0");
            if (rows.Length > 0)
            {
                for (int i = 0; i < rows.Length; i++)
                {
                    sb.Append("{\"id\":\"" + rows[i]["id"].ToString() + "\",\"text\":\"" + rows[i]["name"].ToString() + "\",\"iconCls\":\"" + rows[i]["icon"].ToString() + "\",\"children\":[");
                    sb.Append(GetChildMenu(dataTable, rows[i]["id"].ToString()));
                }
                sb.Remove(sb.Length - 1, 1);
                sb.Append("]");
            }
            else
            {
                sb.Append("]");
            }
            return sb.ToString();
        }
        public string GetChildMenu(DataTable dt, string id)
        {
            StringBuilder sb = new StringBuilder();
            DataRow[] r_list = dt.Select(string.Format("parentid={0}", id));
            if (r_list.Length > 0)
            {
                for (int j = 0; j < r_list.Length; j++)
                {
                    DataRow[] child_list = dt.Select(string.Format("parentid={0}", r_list[j]["id"].ToString()));
                    if (child_list.Length > 0)
                    {
                        sb.Append("{\"id\":\"" + r_list[j]["id"].ToString() + "\",\"text\":\"" + r_list[j]["name"].ToString() + "\",\"iconCls\":\"" + r_list[j]["icon"].ToString() + "\",\"children\":[");
                        sb.Append(GetChildMenu(dt, r_list[j]["id"].ToString()));
                    }
                    else
                    {
                        sb.Append("{\"id\":\"" + r_list[j]["id"].ToString() + "\",\"text\":\"" + r_list[j]["name"].ToString() + "\",\"iconCls\":\"" + r_list[j]["icon"].ToString() + "\",\"attributes\":{\"url\":\"" + r_list[j]["link"].ToString() + "\"}},");
                    }
                }
                sb.Remove(sb.Length - 1, 1);
                sb.Append("]},");
            }
            else  //根节点下没有子节点
            {
                sb.Append("]},");  //跟上面if条件之外的字符串拼上
            }
            return sb.ToString();
        }
		#endregion  ExtensionMethod
	}
}

