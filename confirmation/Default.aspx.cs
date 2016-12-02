using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Facebook;
using Twitterizer;
using System.IO;

public partial class confirmationNew_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string BookingID = "";
        if (Session["NEWBOOKINGID"] != null && Session["NEWBOOKINGID"]!="")
        {
            BookingID = Session["NEWBOOKINGID"].ToString();
        }
        if (BookingID != "")
        {
            taskid.InnerHtml = Session["NEWBOOKINGID"].ToString();
             int Taskid = Convert.ToInt32(Session["NEWBOOKINGID"].ToString());
            CrmClass ObjCrm = new CrmClass();
            DataSet dsTracking = ObjCrm.GetTaskArea(Taskid);
            if (dsTracking.Tables.Count > 0)
            {
                if (dsTracking.Tables[0].Rows.Count > 0)
                {
                    string[] DA = dsTracking.Tables[0].Rows[0]["DArea"].ToString().Split(' ');
                    string[] PA = dsTracking.Tables[0].Rows[0]["PArea"].ToString().Split(' ');
                    txtSource.Value = PA[0].ToString();
                    txtDestination.Value = DA[0].ToString();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "myJsFn", "SearchRoute()", true);
                }
            }
        }
        else
        {
           // Response.Redirect("../");
        }
        //CheckAuthorization();


    }
    
   
   protected void btnTwitter_Click(object sender, ImageClickEventArgs e)
    {
         Response.Redirect("https://twitter.com/intent/tweet?hashtags=russsh&original_referer=https%3A%2F%2Fwww.russsh.com%2Fweb%2Ftweet-button&ref_src=twsrc%5Etfw&related=twitterapi%2Ctwitter&text=I%20just%20hired%20@russsh_in%20to%20finish%20my%20task.");
        //string url = "https://twitter.com/intent/tweet?hashtags=russsh&original_referer=https%3A%2F%2Fwww.russsh.com%2Fweb%2Ftweet-button&ref_src=twsrc%5Etfw&related=twitterapi%2Ctwitter&text=I%20just%20hired%20@russsh_in%20to%20finish%20my%20task.";
        // Response.Redirect(url, "_blank", "menubar=0,scrollbars=1,width=750,height=650,top=10 ,left=300");
    }
}
//public static class ResponseHelper
//{
//    public static void Redirect(this HttpResponse response, string url, string target, string windowFeatures)
//    {

//        if ((String.IsNullOrEmpty(target) || target.Equals("_self", StringComparison.OrdinalIgnoreCase)) && String.IsNullOrEmpty(windowFeatures))
//        {
//            response.Redirect(url);
//        }
//        else
//        {
//            Page page = (Page)HttpContext.Current.Handler;

//            if (page == null)
//            {
//                throw new InvalidOperationException("Cannot redirect to new window outside Page context.");
//            }
//            url = page.ResolveClientUrl(url);

//            string script;
//            if (!String.IsNullOrEmpty(windowFeatures))
//            {
//                script = @"window.open(""{0}"", ""{1}"", ""{2}"");";
//            }
//            else
//            {
//                script = @"window.open(""{0}"", ""{1}"");";
//            }
//            script = String.Format(script, url, target, windowFeatures);
//            ScriptManager.RegisterStartupScript(page, typeof(Page), "Redirect", script, true);
//        }
//    }
//}