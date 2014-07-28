using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using Newtonsoft.Json;
using System.Web.Script.Services;

/// <summary>
/// GMapService 的摘要描述
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
[System.Web.Script.Services.ScriptService]
public class GMapService : System.Web.Services.WebService
{


    public GMapService()
    {

        //如果使用設計的元件，請取消註解下列一行
        //InitializeComponent(); 
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string GetJsonBySend(string sCity, string sArea)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        DataSet ds = new DataSet();
        string sqlstr = string.Format(@"  
            Select 
                pid,pNam,plit [lat],plng [lng],p成交價,
                Case 
		            When p型態 In (N'電梯大樓',N'無電梯公寓',N'辦公商業大樓',N'套房') Then N'寓' 
		            When p型態 In (N'廠辦',N'別墅',N'透天',N'其他',N'店面') Then N'透'
		            else N'土' 
                End p型態
            From SellList Where PCity = N'{0}' And PArea = N'{1}' And Plit <> '0'  ", sCity, sArea);
        using (SqlConnection cn = new SqlConnection(sidebar.ConnString))
        {
            if (cn.State != ConnectionState.Open) cn.Open();
            using (SqlCommand cm = new SqlCommand(sqlstr, cn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cm))
                {
                    da.Fill(ds);
                }
            }
        }
        return JsonConvert.SerializeObject(ds.Tables[0], Formatting.Indented);
    }
    class MapJson
    {
        private string _地址 = "";
        private string _lat = "";
        private string _lng = "";
        private string _成交價 = "";

        private string _類別 = "";
        public string 地址 { get { return _地址; } set { _地址 = value; } }
        public string lat { get { return _lat; } set { _lat = value; } }
        public string lng { get { return _lng; } set { _lng = value; } }
        public string 成交價 { get { return _成交價; } set { _成交價 = value; } }
        public string 類別 { get { return _類別; } set { _類別 = value; } }
    }
}
