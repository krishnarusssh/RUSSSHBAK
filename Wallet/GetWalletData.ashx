<%@ WebHandler Language="C#" Class="GetWalletData" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
public class GetWalletData : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    SqlConnection LocalConn = new SqlConnection();
    CrmClass crmObj = new CrmClass();

    string strwalletproc;
    string strWalletFilterData;
    string TableDatatoBeLoaded;
    public void ProcessRequest(HttpContext context)
    {

        context.Response.ContentType = "application/text; charset=utf-8";
        string WalletDate = "0";
        // string Result = "N";
        if (context.Request.QueryString["WalletDate"] != "" && context.Request.QueryString["WalletDate"] != null)
        {
            WalletDate = context.Request.QueryString["WalletDate"].ToString();

            string startDate = WalletDate.Substring(0, 10);
            string EndDate = WalletDate.Substring(13, 10);

            DateTime WalletstartDate = new DateTime(Convert.ToInt32(startDate.Substring(6, 4)), Convert.ToInt32(startDate.Substring(0, 2)), Convert.ToInt32(startDate.Substring(3, 2)));
            DateTime WalletEndDate = new DateTime(Convert.ToInt32(EndDate.Substring(6, 4)), Convert.ToInt32(EndDate.Substring(0, 2)), Convert.ToInt32(EndDate.Substring(3, 2)));

            string clientid = context.Session["CLIENT_ID"].ToString();

            TableDatatoBeLoaded = @"<table class='table __transaction__table'>";
            TableDatatoBeLoaded = TableDatatoBeLoaded + "<thead>";
            TableDatatoBeLoaded = TableDatatoBeLoaded + "<th>Date</th>";
            TableDatatoBeLoaded = TableDatatoBeLoaded + "<th>Transaction details</th>";
            TableDatatoBeLoaded = TableDatatoBeLoaded + " <th class='text-right' align='right'>Amount</th>";
            TableDatatoBeLoaded = TableDatatoBeLoaded + "</tr>";
            TableDatatoBeLoaded = TableDatatoBeLoaded + "</thead>";
            TableDatatoBeLoaded = TableDatatoBeLoaded + "</tbody>";
            
            if (clientid != "0")
            {
                strWalletFilterData = SetWalletTableData(Convert.ToInt32(clientid), WalletstartDate, WalletEndDate);
            }

            TableDatatoBeLoaded = TableDatatoBeLoaded + strWalletFilterData;
            TableDatatoBeLoaded = TableDatatoBeLoaded + "</tbody>";
            TableDatatoBeLoaded = TableDatatoBeLoaded + "</table>";


        }
        context.Response.Write(TableDatatoBeLoaded);
    }

    public string SetWalletTableData(int ClientID, DateTime StartDate, DateTime EndDate)
    {
        DataSet WalletDs = new DataSet();
        WalletDs = crmObj.GetWalletDataByDate(ClientID, "CREDIT", StartDate, EndDate);

        int i = 0;
        if (WalletDs.Tables.Count > 0)
        {
            if (WalletDs.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in WalletDs.Tables[0].Rows)
                {

                    string Amount = WalletDs.Tables[0].Rows[i].ItemArray[1].ToString().Sanatize();
                    string ReferenceID = WalletDs.Tables[0].Rows[i].ItemArray[3].ToString().Sanatize();
                    string Date = WalletDs.Tables[0].Rows[i].ItemArray[5].ToString().Sanatize();
                    string TransactionType = WalletDs.Tables[0].Rows[i].ItemArray[4].ToString().Sanatize();
                    DateTime WalletsDate = Convert.ToDateTime(Date);

                    strWalletFilterData = strWalletFilterData + @"<tr> ";
                    strWalletFilterData = strWalletFilterData + "<td>" + WalletsDate.ToString("MMM") + " " + WalletsDate.Day + " " + WalletsDate.Year + "</br>" + WalletsDate.ToString("h:mm:ss tt", System.Globalization.CultureInfo.InvariantCulture) + "</td>";
                   
                    if (TransactionType.Equals("CREDIT"))
                    {
strWalletFilterData = strWalletFilterData + "<td> Money added to wallet.</br> Transaction ID:" + ReferenceID + "</td>";
                        strWalletFilterData = strWalletFilterData + "<td> <span class='green'> <i class='fa fa-rupee'></i>" + Amount + "</span></td>";
                    }
                    else
                    {
strWalletFilterData = strWalletFilterData + "<td> Money deducted to wallet.</br> Transaction ID:" + ReferenceID + "</td>";
                        strWalletFilterData = strWalletFilterData + "<td><i class='fa fa-rupee'></i>" + Amount + "</td>";
                    }
                    strWalletFilterData = strWalletFilterData + "</tr>";
                    i = i + 1;
                }
            }
        }

        return strWalletFilterData;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}