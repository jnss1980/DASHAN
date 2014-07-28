using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Base 的摘要描述
/// </summary>
public class BasePage : System.Web.UI.Page
{
    protected override void OnLoad(EventArgs e)
    {
        //想要在每頁做檢查的可以在此作業 
        //UdfSet.Language_recource(Page, Session["lang"].ToString());

        if (Session["UserAccount"] == null) Response.Redirect("Default.aspx");
        

        //這行一定要，它才會override
        base.OnLoad(e);
    }    
}