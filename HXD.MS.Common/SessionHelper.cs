using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace HXD.MS.Common
{
    public static class SessionHelper
    {
        /// <summary>
        /// 设置session
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        public static void Set(string key, object value)
        {
            HttpContext.Current.Session.Remove(key);
            HttpContext.Current.Session.Add(key, value);
        }
        /// <summary>
        /// 根据指定key删除session
        /// </summary>
        /// <param name="key"></param>
        public static void Remove(string key)
        {
            HttpContext.Current.Session.Remove(key);
        }
        /// <summary>
        /// 移除所有session
        /// </summary>
        public static void RemoveAll()
        {
            HttpContext.Current.Session.RemoveAll();
        }
        /// <summary>
        /// 获取session
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        public static object Get(string key)
        {
            return HttpContext.Current.Session["User"];
        }
    }
}
