using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HXD.MS.Mvc.Models.Tree
{
    public class SubNode : BaseNode
    {
        [JsonProperty(PropertyName = "url")]
        public string Url { get; set; }
        public SubNode(int id, string text, string url, string iconCls)
        {
            this.Id = id;
            this.Text = text;
            this.Url = url;
            this.IconCls = iconCls;
        }
    }
}