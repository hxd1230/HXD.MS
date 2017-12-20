using HXD.MS.Common;
using HXD.MS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HXD.MS.Mvc.Models
{
    public class SessionManager
    {
        public User SessionObject
        {
            get
            {
                return (User)SessionHelper.Get("User");
            }
        }
    }
}