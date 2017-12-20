using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace HXD.MS.Common
{
    public static class CookieHelper
    {
        private static HttpContext context = HttpContext.Current;
        /// <summary>
        /// 设置一个cookie
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        public static void Set(string key, string value)
        {
            Set(key, value, DateTime.Now.AddDays(1.0));
        }
        /// <summary>
        /// 设置一个cookie
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="expries">默认1天</param>
        public static void Set(string key, string value, DateTime expries)
        {
            HttpCookie cookie = new HttpCookie(key)
            {
                Value = value,
                Expires = expries
            };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        /// <summary>
        /// 获取指定cookie值
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static string Get(string key)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[key];
            string str = string.Empty;
            if (cookie != null)
            {
                str = HttpUtility.UrlDecode(cookie.Value);
            }
            return str;
        }
        /// <summary>
        /// 删除cookie
        /// </summary>
        /// <param name="key"></param>
        public static void Remove(string key)
        {
            HttpCookie cookie = context.Request.Cookies[key];
            if (cookie != null)
            {
                cookie.Expires = DateTime.Now.AddDays(-1);
                context.Response.Cookies.Add(cookie);
            }
        }
    }
}
