using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserAccount"] != null)
        {
            if (Session["UserAccount"].ToString().Trim() != "")
            {
                Response.Redirect("LandProject.aspx");
            }
        }

    }
    protected void imgLog_Click(object sender, ImageClickEventArgs e)
    {
        if (this.UserAccount.Text.Trim() == "" || this.UserPwd.Text.Trim() == "")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "customerapp", "請輸入帳號密碼", true);
            return;
        }
        else
        {
            using (System.Data.SqlClient.SqlConnection cn = new System.Data.SqlClient.SqlConnection(sidebar.ConnString))
            {
                if (cn.State != System.Data.ConnectionState.Open) cn.Open();
                using (System.Data.SqlClient.SqlCommand cm = new System.Data.SqlClient.SqlCommand())
                {
                    string sqlstr = " Select * From UserAccount Where UserAccount = @UserAccount And UserPwd = @UserPwd ";
                    cm.CommandText = sqlstr;
                    cm.Connection = cn;
                    cm.Parameters.Add("@UserAccount", SqlDbType.NVarChar);
                    cm.Parameters["@UserAccount"].Value = this.UserAccount.Text.Trim();
                    cm.Parameters.Add("@UserPwd", SqlDbType.NVarChar);
                    cm.Parameters["@UserPwd"].Value = this.UserPwd.Text.Trim();

                    using (SqlDataReader dr = cm.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Session["UserAccount"] = dr["UserAccount"].ToString();
                            Session["UserEMail"] = dr["UserEMail"].ToString();
                        }
                    }
                }
            }

            if (Session["UserAccount"] == null)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "customerapp", "帳密有誤，登入失敗", true);
                return;
            }
            else
            {
                Response.Redirect("LandProject.aspx");
            }
        }
    }
}