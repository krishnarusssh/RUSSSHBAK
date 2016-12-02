using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookTask_Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string clientid = "0";
        if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null && Session["CLIENT_ID"] != "0")
        {
            clientid = Session["CLIENT_ID"].ToString();
            //int Outstandingamount = CrmClass.GetClientOutstanding(Convert.ToInt32(clientid));
            //if (Outstandingamount > 0)
            //{
            //    diverror.InnerText = "Your Pending amount is Rs " + Outstandingamount.ToString() + " Will be added in Service fee/ Cash Handling charges";
            //    txtoutstanding.Text = Outstandingamount.ToString();
            //}
        }
        else
        {
            Response.Redirect("../Signin/");
        }
      }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        string pgtype = hndptype.Value.ToString();
    }
}