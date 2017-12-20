using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HXD.MS.Mvc.Models.Tree
{
    public class Node
    {
        [JsonProperty(PropertyName = "id")]
        public int Id { get; set; }
        [JsonProperty(PropertyName = "praentId")]
        public int ParentId { get; set; }
        [JsonProperty(PropertyName = "text")]
        public string Text { get; set; }

        [JsonProperty(PropertyName = "state")]
        public string State { get; set; }
        [JsonProperty(PropertyName = "attributes")]
        public NodeAttribute Attributes { get; set; }
        public List<Node> children = new List<Node>();
        [JsonProperty(PropertyName = "order")]
        public int Order { get; set; }

        public Node(int id, int parentId, string text, string state, NodeAttribute attributes, int order)
        {
            this.Id = id;
            this.ParentId = parentId;
            this.Text = text;
            this.State = state;
            this.Attributes = attributes;
            this.Order = order;
        }
    }
}