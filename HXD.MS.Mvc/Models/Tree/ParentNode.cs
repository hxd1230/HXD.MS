using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HXD.MS.Mvc.Models.Tree
{
    public class ParentNode : BaseNode
    {

        //[JsonProperty(PropertyName = "praentId")]
        //public int ParentId { get; set; }



        //[JsonProperty(PropertyName = "state")]
        //public string State { get; set; }
        //[JsonProperty(PropertyName = "attributes")]
        //public NodeAttribute Attributes { get; set; }
        public List<SubNode> children = new List<SubNode>();
        //[JsonProperty(PropertyName = "order")]
        //public int Order { get; set; }

        public ParentNode(int id, string text, string iconCls)
        {
            this.Id = id;
            this.Text = text;
            this.IconCls = iconCls;
        }
    }
}