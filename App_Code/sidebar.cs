using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

/// <summary>
/// sidebar 的摘要描述
/// </summary>
public static class sidebar
{
    private static string _ConnString = "";
    public static string ConnString{

        get
        {
            if (Environment.MachineName.ToString() == "DSIC-ROCHEN")
            {
                _ConnString = WebConfigurationManager.AppSettings["ConnectionString"].ToString().Trim();
            }
            else
            {
                _ConnString = WebConfigurationManager.AppSettings["ConnectionStringOnLine"].ToString().Trim();
            }
            return _ConnString;
        }
    }

    public static void GetTreeView(TreeView tv)
    {
        tv.Nodes.Clear();

        //建立根節點
        TreeNode Root = new TreeNode();
        Root.Text = "Land Project";
        tv.Nodes.Add(Root);//建立根节点

        using (SqlConnection cn = new SqlConnection(ConnString))
        {
            if (cn.State != ConnectionState.Open) cn.Open();
            using (SqlCommand cm = new SqlCommand(" Select Distinct Pid,Convert(Nvarchar(10),CreateTime) CreateTime From LandProject Order By CreateTime DESC", cn))
            {
                using (SqlDataReader dr = cm.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        TreeNode Node = new TreeNode();

                        Node.Text = dr["CreateTime"].ToString().Trim();
                        //Node.Target = "mainbottom";
                        //string Path = drNode["menu_addr"].ToString();
                        //int menusn = Convert.ToInt32(drNode["sn"].ToString());
                        Node.NavigateUrl = "LandProjectView.aspx" + "?Pid=" + dr["Pid"].ToString().Trim();
                        Root.ChildNodes.Add(Node);//建立子节点
                    }
                }
            }
        }
        tv.ExpandAll();
    }
}