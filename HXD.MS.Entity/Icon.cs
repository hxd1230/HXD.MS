/**  版本信息模板在安装目录下，可自行修改。
* Icon.cs
*
* 功 能： N/A
* 类 名： Icon
*
* Ver    变更日期             负责人  变更内容
* ───────────────────────────────────
* V0.01  2017/11/2 11:01:16   N/A    初版
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
	/// 按钮表
	/// </summary>
	[Serializable]
	public partial class Icon
	{
		public Icon()
		{}
		#region Model
		private int _id;
		private string _name;
		private DateTime? _createtime= DateTime.Now;
		private string _creater;
		/// <summary>
		/// 
		/// </summary>
		public int Id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 图标名称
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// 创建时间
		/// </summary>
		public DateTime? CreateTime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		/// <summary>
		/// 创建人
		/// </summary>
		public string Creater
		{
			set{ _creater=value;}
			get{return _creater;}
		}
		#endregion Model

	}
}

