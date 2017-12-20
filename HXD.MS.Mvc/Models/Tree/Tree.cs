using HXD.MS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HXD.MS.Mvc.Models.Tree
{
    public class Tree
    {
        private List<Node> nodes = new List<Node>();
        private Node root = null;
        //public Tree(List<Menu> menus)
        //{
        //    foreach (Menu menu in menus)
        //    {
        //        Node node = new Node(menu.Id, menu.ParentId, menu.Name, "open", new NodeAttribute((string.IsNullOrEmpty(menu.Url) ? "" : menu.Url), menu.Id), (int)menu.Order);
        //        nodes.Add(node);
        //        Guid guid = new Guid("00000000-0000-0000-0000-000000000000");
        //        if (node.ParentId.Equals(guid))
        //        {
        //            root = node;
        //        }
        //    }
        //}
        public List<Node> Build()
        {
            BuildTree(root);
            List<Node> result = new List<Node>();
            result.Add(root);
            return result;
        }
        private void BuildTree(Node parent)
        {
            Node node = null;
            foreach (var item in nodes)
            {
                node = item;
                if (node.ParentId.Equals(parent.Id))
                {
                    parent.children.Add(node);
                }
            }
        }
    }
}