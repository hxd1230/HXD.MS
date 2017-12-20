/**  版本信息模板在安装目录下，可自行修改。
* RoleMenu.cs
*
* 功 能： N/A
* 类 名： RoleMenu
*
* Ver    变更日期             负责人  变更内容
* ───────────────────────────────────
* V0.01  2017/11/2 11:01:18   N/A    初版
*
* Copyright (c) 2012 Maticsoft Corporation. All rights reserved.
*┌──────────────────────────────────┐
*│　此技术信息为本公司机密信息，未经本公司书面同意禁止向第三方披露．　│
*│　版权所有：动软卓越（北京）科技有限公司　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/
using System;
namespace HXD.MS.Entity
{
	/// <summary>
	/// 角色菜单表
	/// </summary>
	[Serializable]
	public partial class RoleMenu
	{
		public RoleMenu()
		{}
		#region Model
		private int _id;
		private int? _roleid;
		private int? _menuid;
		/// <summary>
		/// 
		/// </summary>
		public int Id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 角色编号
		/// </summary>
		public int? RoleId
		{
			set{ _roleid=value;}
			get{return _roleid;}
		}
		/// <summary>
		/// 菜单编号
		/// </summary>
		public int? MenuId
		{
			set{ _menuid=value;}
			get{return _menuid;}
		}
		#endregion Model

	}
}

