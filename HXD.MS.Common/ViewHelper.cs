using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HXD.MS.Common
{
   public static class ViewHelper
    {
       public static string GetToolBar(DataTable dataTable,string pageName)
       {
           StringBuilder sb = new StringBuilder();
           sb.Append("{\"toolbar\":[");
           for (int i = 0; i < dataTable.Rows.Count; i++)
           {
               switch (dataTable.Rows[i]["Code"].ToString())
               {
                   case "add":
                       sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"add" + pageName + "();\"},");
                       break;
                   case "edit":
                       sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"edit" + pageName + "();\"},");
                       break;
                   case "delete":
                       sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"del" + pageName + "();\"},");
                       break;
                   case "setRole":
                       sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"setRole();\"},");
                       break;
                   case "allot":
                       sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"allot();\"},");
                       break;
                   case "authorize":
                       sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"authorize();\"},");
                       break;
                   case "export":
                       sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"" + pageName + "Export();\"},");
                       break;
                   case "import":
                       sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"" + pageName + "Import();\"},");
                       break;
                   case "set":
                       sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"set();\"},");
                       break;
                   //case "expandall":
                   //    sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"" + pageName + "Expandall();\"},");
                   //    break;
                   //case "collapseall":
                   //    sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"" + pageName + "Collapseall();\"},");
                   //    break;
                   //case "seltabdata":
                   //    sb.Append("{\"text\": \"" + dataTable.Rows[i]["Name"] + "\",\"iconCls\":\"" + dataTable.Rows[i]["Icon"] + "\",\"handler\":\"SelTabData();\"},");
                   //    break;
                   default:
                       //browser不是按钮
                       break;
               }
           }

           bool flag = true;   //是否有浏览权限
           DataRow[] row = dataTable.Select("code = 'search'");
           if (row.Length == 0)  //没有浏览权限
           {
               flag = false;
               if (dataTable.Rows.Count > 0)
                   sb.Remove(sb.Length - 1, 1);
           }
           else
           {
               if (dataTable.Rows.Count > 1)
                   sb.Remove(sb.Length - 1, 1);
           }
           sb.Append("],\"success\":true,");
           if (flag)
               sb.Append("\"search\":true}");
           else
               sb.Append("\"search\":false}");

           return sb.ToString();
       }
    }
}
