using System;
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
public partial class services_chocolate_delivery_Default : System.Web.UI.Page
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
                    string innerlink = "https://www.russsh.com/BookTask/default.aspx?Serviceid=";
                    string css = "book-btn";
                    lnkBook1.InnerHtml = "<a class='" + css + "' href='" + innerlink + "14'>Book Now</a>";
                    lnkBook2.InnerHtml = "<a class='" + css + "' href='" + innerlink + "14'>Book Now</a>";


                    cake_delivery_link.InnerHtml = "<h4>Cake Delivery </h4><a href='" + innerlink + "1'>Book Now</a>";
                    Clothes_delivery_link.InnerHtml = "<h4>Clothes Delivery</h4><a href='" + innerlink + "9'>Book Now</a>";
                    Grocery_delivery_link.InnerHtml = "<h4>Grocery Delivery</h4><a href='" + innerlink + "10'>Book Now</a>";
                    food_delivery_link.InnerHtml = "<h4>Food Delivery</h4><a href='" + innerlink + "3'>Book Now</a>";
                    gift_delivery_link.InnerHtml = "<h4>Gift Delivery</h4><a href='" + innerlink + "7'>Book Now</a>";
                    flower_delivery_link.InnerHtml = "<h4>Flower Delivery</h4><a href='" + innerlink + "2'>Book Now</a>";
                    electronic_delivery_link.InnerHtml = "<h4>Electronic Delivery</h4><a href='" + innerlink + "11'>Book Now</a>";

                    bakery_delivery_link.InnerHtml = "<h4>Bakery delivery</h4><a href='" + innerlink + "13'>Book Now</a>";
                    chocolate_delivery_link.InnerHtml = "<h4>Chocolate delivery</h4><a href='" + innerlink + "14'>Book Now</a>";
                    cash_delivery_link.InnerHtml = "<h4>Cash delivery</h4><a href='" + innerlink + "19'>Book Now</a>";
                    document_delivery_link.InnerHtml = "<h4>Document delivery</h4><a href='" + innerlink + "16'>Book Now</a>";
                    Bulk_delivery_link.InnerHtml = "<h4>Bulk delivery</h4><a href='" + innerlink + "4'>Book Now</a>";
                    Parcel_delivery_link.InnerHtml = "<h4>Parcel delivery</h4><a href='" + innerlink + "17'>Book Now</a>";
                }
                else
                {
                    lnkBook1.Style.Value = "class:book-btn;";
                    lnkBook1.InnerHtml = "<a  href='#' class='book-btn' data-toggle='modal'  data-target='#login'>Book Now</a>";
                    lnkBook2.InnerHtml = "<a  href='#' class='book-btn' data-toggle='modal'  data-target='#login'>Book Now</a>";


                    cake_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    Clothes_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    Grocery_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    food_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    gift_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    flower_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    electronic_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";

                    bakery_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    chocolate_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    cash_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    document_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    Bulk_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";
                    Parcel_delivery_link.InnerHtml = " <a href='#' data-toggle='modal' data-target='#login'>Book Now</a>";


                }
                //coding for Count
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


                        ntotal.InnerHtml = dss.Tables[0].Rows[13].ItemArray[2].ToString();

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