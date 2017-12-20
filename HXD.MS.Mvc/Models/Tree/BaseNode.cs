using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HXD.MS.Mvc.Models.Tree
{
    public class BaseNode
    {
        [JsonProperty(PropertyName = "id")]
        public int Id { get; set; }
        [JsonProperty(PropertyName = "text")]
        public string Text { get; set; }
        [JsonProperty(PropertyName = "iconCls")]
        public string IconCls { get; set; }
        [JsonProperty(PropertyName = "state")]
        public string State { get; set; }
    }
}