using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class LandProject : System.Web.UI.Page
{
    private string ConnString = WebConfigurationManager.AppSettings["ConnectionString"].ToString().Trim();
    protected void Page_Load(object sender, EventArgs e)
    {
        sidebar.GetTreeView(TreeView1);


    }

    

    //Save 
    protected void btnSave_Click(object sender, EventArgs e)
    {
        this.Save();
    }

    private void Add(Dictionary<string, string> Sitem, string key, string val)
    {
        if (Sitem.ContainsKey(key.Trim()))
            Sitem[key.Trim()] = val.Trim();
        else Sitem.Add(key.Trim(), val.Trim());
    }


    private void Clean()
    {
        this.txtOverall.Text = "";
        this.txtPlanning.Text = "";
        this.HidBoth.Value = "";
        this.txtSingle_floor_price.Text = "";
        this.Hidland_profits.Value = "";
        this.txtSingle_floor.Text = "";
        this.HidLand_costs.Value = "";
        this.txtFloor_space.Text = "";
        this.txtSinglefloor.Text = "";
        this.txtManagement.Text = "";
        this.HidBuilding_costs.Value = "";
        this.HidSingle_family_costs2.Value = "";
        this.HidMaori_groups_Chu.Value = "";
        this.HidAddress.Value = "";
        this.Hidlat.Value = "";
        this.Hidlng.Value = "";
    }

    private bool Save()
    {

        Dictionary<string, string> dic = new Dictionary<string, string>();
        Add(dic, "Overall", this.txtOverall.Text.Trim());        //總坪數
        Add(dic, "Planning", this.txtPlanning.Text.Trim());      //規畫戶數
        Add(dic, "Both", this.HidBoth.Value.Trim());              //均坪
        Add(dic, "Single_floor_price", this.txtSingle_floor_price.Text.Trim());    //單坪均價
        Add(dic, "land_profits", this.Hidland_profits.Value.Trim());    //土地成本
        Add(dic, "Single_floor", this.txtSingle_floor.Text.Trim());    //土地利潤
        Add(dic, "Land_costs", this.HidLand_costs.Value.Trim());          //土地利潤金額
        Add(dic, "Floor_space", this.txtFloor_space.Text.Trim());        //建坪
        Add(dic, "Singlefloor", this.txtSinglefloor.Text.Trim());        //建築單坪成本
        Add(dic, "Management", this.txtManagement.Text.Trim());          //管銷
        Add(dic, "Building_costs", this.HidBuilding_costs.Value.Trim());  //建物成本
        Add(dic, "Single_family_costs", this.HidSingle_family_costs.Value.Trim());    //單戶成本
        Add(dic, "Single_family_costs2", this.HidSingle_family_costs2.Value.Trim());    //單戶成本(含管銷)
        Add(dic, "Maori_groups_Chu", this.HidMaori_groups_Chu.Value.Trim());    //基楚毛利
        Add(dic, "Address", this.HidAddress.Value.Trim());    //地址
        Add(dic, "lat", this.Hidlat.Value.Trim());    //Lat
        Add(dic, "lng", this.Hidlng.Value.Trim());    //Lng
        Add(dic, "CreateTime", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));
        try
        {
            string sqlstrTitle = ""; //";
            string sqlstrValue = "Values( ";
            foreach (var sItem in dic)
            {
                string Flag = ",";
                if (sqlstrTitle.Trim() == "") Flag = "";

                sqlstrTitle += Flag + sItem.Key.Trim();
                if (sItem.Key.Trim() == "Address") sqlstrValue += Flag + "N'" + sItem.Value + "'";
                else sqlstrValue += Flag + "'" + sItem.Value + "'";

            }
            sqlstrTitle = "Insert Into LandProject(" + sqlstrTitle + ") ";
            sqlstrValue += ")";

            //Response.Write(sqlstrTitle + "<BR>");
            //Response.Write(sqlstrValue + "<BR>");

            using (SqlConnection cn = new SqlConnection(sidebar.ConnString))
            {
                if (cn.State != ConnectionState.Open) cn.Open();
                using (SqlCommand cm = new SqlCommand(sqlstrTitle + sqlstrValue, cn))
                {
                    cm.ExecuteNonQuery();
                }
            }
            this.Clean();

            Response.Write("<Script>alert('新增成功!!');</Script>");
        }
        catch (Exception err)
        {
            Response.Write(err.Message + err.StackTrace);
        }

        return true;
    }


}

