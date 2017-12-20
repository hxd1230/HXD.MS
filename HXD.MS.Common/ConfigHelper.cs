using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HXD.MS.Common
{
    public static class ConfigHelper
    {
        public static string DefaultConnectionString
        {
            get
            {
                return GetConnectionName("HXDMSConnection");
            }
        }
        public static string GetConnectionName(string key)
        {
            return ConfigurationManager.ConnectionStrings[key].ConnectionString;
        }
        /// <summary>
        /// 获取连接字符串
        /// </summary>
        /// <param name="name">名称</param>
        /// <returns>返回链接字符串</returns>
        public static string GetConnectionString(string name)
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
    }
}
