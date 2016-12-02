using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["MOBI_CLIENTID"] != null)
            //{
            //    customerid = Session["MOBI_CLIENTID"].ToString();
            //}
             if (Session["MOBI_EMAIL"] != null)
            {
                email.Value = Session["MOBI_EMAIL"].ToString();
            }
            //if (Session["MOBI_NAME"] != null)
            //{
            //    firstname = Session["MOBI_NAME"].ToString();
            //}
            if (Session["MOBI_AMOUNT"] != null)
            {
                amt.Value = Session["MOBI_AMOUNT"].ToString();
            }
            if (Session["MOBI_PHONE"] != null)
            {
                cell.Value = Session["MOBI_PHONE"].ToString();
            }
            if (Session["MOBI_MARTRANSACTIONID"] != null)
            {
                orderid.Value = Session["MOBI_MARTRANSACTIONID"].ToString();
            }
        }
    }
