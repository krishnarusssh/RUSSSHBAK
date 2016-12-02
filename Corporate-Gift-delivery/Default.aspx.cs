using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Collections.Specialized;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Configuration;

public partial class Corporate_Gift_delivery_Default : System.Web.UI.Page
{
    CrmClass crmObj = new CrmClass();
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataReader dr;
    DataSet ds;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session != null)
            {
                if (Session["CLIENT_NAME"] != null && Session["CLIENT_NAME"] != "")
                {
                    string innerlink = "https://www.russsh.com/for-business/default.aspx?Serviceid=";

                    booktasklink1.InnerHtml = "<a class='book-offer' href='https://www.russsh.com/for-business/'>Enquire Now</a>";
                    mobilebooknowbutton.InnerHtml = "<a class='book-offer' href='https://www.russsh.com/for-business/'>Enquire Now</a>";

                    cake_delivery_link.InnerHtml = "<a href='" + innerlink + "1'>Enquire Now</a>";
                    Clothes_delivery_link.InnerHtml = "<a href='" + innerlink + "9'>Enquire Now</a>";
                    Grocery_delivery_link.InnerHtml = "<a href='" + innerlink + "10'>Enquire Now</a>";
                    food_delivery_link.InnerHtml = "<a href='" + innerlink + "3'>Enquire Now</a>";
                    gift_delivery_link.InnerHtml = "<a href='" + innerlink + "7'>Enquire Now</a>";
                    flower_delivery_link.InnerHtml = "<a href='" + innerlink + "2'>Enquire Now</a>";
                    electronic_delivery_link.InnerHtml = "<a href='" + innerlink + "11'>Enquire Now</a>";

                    bakery_delivery_link.InnerHtml = "<a href='" + innerlink + "13'>Enquire Now</a>";
                    chocolate_delivery_link.InnerHtml = "<a href='" + innerlink + "14'>Enquire Now</a>";
                    cash_delivery_link.InnerHtml = "<a href='" + innerlink + "19'>Enquire Now</a>";
                    document_delivery_link.InnerHtml = "<a href='" + innerlink + "16'>Enquire Now</a>";
                    Bulk_delivery_link.InnerHtml = "<a href='" + innerlink + "4'>Enquire Now</a>";
                    Parcel_delivery_link.InnerHtml = "<a href='" + innerlink + "17'>Enquire Now</a>";

                }
                else
                {

                    // booklink1.InnerHtml = "<a class='book-now' href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    // booklink2.InnerHtml = "<a class='book-now' href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    booktasklink1.InnerHtml = "<a class='book-offer' href='../for-business/'>Enquire Now</a>";
                    mobilebooknowbutton.InnerHtml = "<a class='book-offer' href='../for-business/'>Enquire Now</a>";
                    cake_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    Clothes_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    Grocery_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    food_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    gift_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    flower_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    electronic_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    bakery_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    chocolate_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    cash_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    document_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    Bulk_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                    Parcel_delivery_link.InnerHtml = "<a href='../for-business/'>Enquire Now</a>";
                }
                DataSet dss = new DataSet();
                dss = crmObj.TaskDescriptionCount();
                if (dss.Tables.Count >= 1)
                {
                    if (dss.Tables[0].Rows.Count > 0)
                    {
                        cake_delivery_count.InnerHtml = dss.Tables[0].Rows[0].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        Clothes_delivery_count.InnerHtml = dss.Tables[0].Rows[8].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        Grocery_delivery_count.InnerHtml = dss.Tables[0].Rows[9].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        food_delivery_count.InnerHtml = dss.Tables[0].Rows[2].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        gift_delivery_count.InnerHtml = dss.Tables[0].Rows[6].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        flower_delivery_count.InnerHtml = dss.Tables[0].Rows[1].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        electronic_delivery_count.InnerHtml = dss.Tables[0].Rows[10].ItemArray[2].ToString() + " <small>DELIVERED</small>";

                        bakery_delivery_count.InnerHtml = dss.Tables[0].Rows[12].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        chocolate_delivery_count.InnerHtml = dss.Tables[0].Rows[13].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        cash_delivery_count.InnerHtml = dss.Tables[0].Rows[18].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        document_delivery_count.InnerHtml = dss.Tables[0].Rows[15].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        Bulk_delivery_count.InnerHtml = dss.Tables[0].Rows[3].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                        Parcel_delivery_count.InnerHtml = dss.Tables[0].Rows[16].ItemArray[2].ToString() + " <small>DELIVERED</small>";
                    }
                }
            }
        }
    }
    public void open_conenction()
    {
        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["TESTQUEUEConnectionString"].ToString();
        try
        {
            con.Open();
        }
        catch (Exception e)
        { }
    }
}