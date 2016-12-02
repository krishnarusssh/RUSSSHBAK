using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Wallet_TransactionCompleted : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack == true)
        {
            try
            {
                string state = Request.Form["TxStatus"].ToString();
                string pgtxnid = Request.Form["pgTxnNo"].ToString();
                string amount = Request.Form["amount"].ToString();
                string marchant_txt_id = Request.Form["TxId"].ToString();
		string ClientID = "0";
		 if (Session["CLIENT_ID"] != "" && Session["CLIENT_ID"] != null)
                            {
                                ClientID = Session["CLIENT_ID"].ToString();
				marchant_txt_id =marchant_txt_id+":"+ClientID;
                            }
         	CrmClass objcrm = new CrmClass();
                          
         	string a=objcrm.InsertCitrusTransactionResult(state.Trim(),pgtxnid.Trim(),amount.Trim(), marchant_txt_id.Trim() );
		//Response.Write(a);
		//Response.Write(marchant_txt_id  );
                if (state == "SUCCESS")
                {
                            



                }

            }
            catch (Exception em)
            {
            }
           




        }
       
    }
    protected void btn500_Click(object sender, EventArgs e)
    {

    }
}