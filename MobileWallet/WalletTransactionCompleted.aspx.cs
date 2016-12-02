using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class MobileWallet_TransactionCompleted : System.Web.UI.Page
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
		 string clntid="0";
		if (Request.QueryString["CLIENTID"] != "" && Request.QueryString["CLIENTID"]!= null)
                            {
                                clntid= Request.QueryString["CLIENTID"];
				marchant_txt_id =marchant_txt_id+":"+clntid;
                            }
         	CrmClass objcrm = new CrmClass();
                          
         	string a=objcrm.InsertCitrusTransactionResult(state.Trim(),pgtxnid.Trim(),amount.Trim(), marchant_txt_id.Trim() );
           

            }
            catch (Exception em)
            {
            }
           




        }
       
    }
  
}