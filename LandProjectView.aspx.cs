using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class LandProjectView : BasePage
{
    private string ConnString = WebConfigurationManager.AppSettings["ConnectionString"].ToString().Trim();
    private string Pid = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["Pid"] != null)
        {
            Pid = Request["Pid"].ToString().Trim();
            this.DataBind(Pid);
        }

        sidebar.GetTreeView(TreeView1);
    }


    void DataBind(string Pid)
    {
        string sqlstr = " Select * From LandProject Where Pid = '" + Pid + "' ";
        using (SqlConnection cn = new SqlConnection(sidebar.ConnString))
        {
            if (cn.State != ConnectionState.Open) cn.Open();
            using (SqlCommand cm = new SqlCommand(sqlstr, cn))
            {
                using (SqlDataReader dr = cm.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        this.labOverall.Text = dr["Overall"].ToString().Trim(); //總坪數
                        this.labPlanning.Text = dr["Planning"].ToString().Trim();//規畫戶數
                        this.labBoth.Text = dr["Both"].ToString().Trim(); //均坪
                        this.labSingle_floor_price.Text = dr["Single_floor_price"].ToString().Trim(); //單坪均價
                        this.labland_profits.Text = dr["land_profits"].ToString().Trim();//土地成本
                        this.labSingle_floor.Text = dr["Single_floor"].ToString().Trim(); //土地利潤%
                        this.labLand_costs.Text = dr["Land_costs"].ToString().Trim();   //土地利潤金額
                        this.labFloor_space.Text = dr["Floor_space"].ToString().Trim();  //建坪
                        this.labSinglefloor.Text = dr["Singlefloor"].ToString().Trim();//建築單坪成本
                        this.labManagement.Text = dr["Management"].ToString().Trim(); //管銷%
                        this.labBuilding_costs.Text = dr["Building_costs"].ToString().Trim();//建物成本
                        this.labSingle_family_costs.Text = dr["Single_family_costs"].ToString().Trim();//單戶成本
                        this.labSingle_family_costs2.Text = dr["Single_family_costs2"].ToString().Trim();//單戶成本(含管銷)
                        this.labMaori_groups_Chu.Text = dr["Maori_groups_Chu"].ToString().Trim();//基楚毛利
                        this.Hidlat.Value = dr["lat"].ToString().Trim();
                        this.Hidlng.Value = dr["lng"].ToString().Trim();
                        this.HidAddress.Value = dr["Address"].ToString().Trim();
                        this.labAddress.Text = dr["Address"].ToString().Trim();
                    }
                }
            }
        }
    }
}