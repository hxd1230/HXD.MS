using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HXD.MS.Mvc.Models.Tree
{
    public class NodeAttribute
    {
        [JsonProperty(PropertyName = "id")]
        public int Id { get; set; }
        [JsonProperty(PropertyName = "url")]
        public string Url { get; set; }
        public NodeAttribute(string url, int id)
        {
            this.Url = url;
            this.Id = id;
        }
    }
}