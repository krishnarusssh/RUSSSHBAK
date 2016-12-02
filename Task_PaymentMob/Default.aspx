<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Task_Payment_Default" %>


<%
   
    
    //Need to replace the last part of URL("your-vanityUrlPart") with your Testing/Live URL
    //string formPostUrl = "https://sandbox.citruspay.com/sslperf/russsh";
    string formPostUrl = "https://www.citruspay.com/russshpay";
    //Need to change with your Secret Key
    string secret_key = "2d2ed82733071d05c98378f5b989e423a218554a";

    //Need to change with your Vanity URL Key from the citrus panel
    string vanityUrl = "russshpay";
    //Should be unique for every transaction
    string merchantTxnId="";
    if (Request.QueryString["NEWBOOKINGID"] != "" && Request.QueryString["NEWBOOKINGID"] != null)
    {
        merchantTxnId = Request.QueryString["NEWBOOKINGID"].ToString();
    }
    else
    {
        merchantTxnId = Session["NEWBOOKINGID"].ToString();
    }
   

    //Need to change with your Order Amount
    string orderAmount = "0";
    if (Request.QueryString["AMOUNTPAYABLE"] != "" && Request.QueryString["AMOUNTPAYABLE"] != null)
    {
        orderAmount = Request.QueryString["AMOUNTPAYABLE"].ToString();
    }
    else
    {
        orderAmount = Session["AMOUNTPAYABLE"].ToString();
    }
    
 
  
    string currency = "INR";
    string data = vanityUrl + orderAmount + merchantTxnId + currency;

    string ReferMode = "N";
    if (merchantTxnId.EndsWith("C"))
    {
        ReferMode = "C";
    }
    
    
    //Need to change with your Return URL
    string returnURL = "";
    if (ReferMode == "N")
    {
        returnURL = "https://www.russsh.com/Task_PaymentMob/PaymentSuccessfull.aspx";
    }
    else if (ReferMode == "C")
    {
        returnURL = "https://www.russsh.com/Task_PaymentMob/PaymentSuccessfull.aspx?ReferMode=C";
    }
    
   
    //Need to change with your Notify URL
    string notifyUrl = "https://www.russsh.com/Task_PaymentMob/TransactionResponse.aspx";

    string Client_Name = "";

    if (Request.QueryString["CLIENTNAME"] != "" && Request.QueryString["CLIENTNAME"] != null)
    {
        Client_Name = Request.QueryString["CLIENTNAME"].ToString();
    }
    else
    {
        Client_Name = Session["Client_Name"].ToString(); 
    }
   
    string Client_Email = "";
    if (Request.QueryString["CLIENTEMAIL"] != "" && Request.QueryString["CLIENTEMAIL"] != null)
    {
        Client_Email = Request.QueryString["CLIENTEMAIL"].ToString();
    }
    else
    {
        Client_Email = Session["Client_Email"].ToString();
    }
    
   
    string Client_Phone = "";
    if (Request.QueryString["CLIENTPHONE"] != "" && Request.QueryString["CLIENTPHONE"] != null)
    {
        Client_Phone = Request.QueryString["CLIENTPHONE"].ToString();
    }
    else
    {
        Client_Phone = Session["Client_Phone"].ToString();
    }
  
    
    System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
    System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
    string securitySignature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();
        
%>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />      
</head>
<body>
      <div style="text-align:center; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; font-weight: bold; font-size: medium; color: #990000;">
          Redirecting to Payment Gateway<br />
          Please wait...<br />
          <img src="loading_spinner.gif" />

      </div>
    <form align="center" id="form1" name="form1" method="post" action="<%=formPostUrl%>" >
        <div class="about" style="margin-top: 100px;">
            <div class="container">
                <h3 class="besoti" id="ErrorHeading" runat="server" style="text-align:center;display:none;"><span style="color:#299b20;">Congratulation!</span><br />Your Task has been booked Successfully.<br />Make Payment
		        ONLINE</h3>
                <div class="about-top heding" style="text-align: center;display:none;">
                    <hr class="dotted">

                    <input type="hidden" id="merchantTxnId" name="merchantTxnId" value="<%=merchantTxnId%>" />
                    <input type="hidden" id="orderAmount" name="orderAmount" value="<%=orderAmount%>" />
                    <input type="hidden" id="currency" name="currency" value="<%=currency%>" />
                    <input type="hidden" name="returnUrl" value="<%=returnURL%>" />
                    <input type="hidden" id="notifyUrl" name="notifyUrl" value="<%=notifyUrl%>" />
                    <input type='hidden' name='firstName' value="<%=Client_Name%>" />
                    <input type='hidden' name='lastName' value="<%=Client_Name%>" />
                    <input type='hidden' name='email' value="<%=Client_Email%>" />
                    <input type='hidden' name='addressStreet1' value='' />
                    <input type='hidden' name='addressStreet2' value='' />
                    <input type='hidden' name='addressCity' value='Mumbai' />
                    <input type='hidden' name='addressState' value='Maharashtra' />
                    <input type='hidden' id='citrusCountry' value='India' />
                    <input type='hidden' name='addressZip' value='' />
                    <input type='hidden' name='phoneNumber' value="<%=Client_Phone%>" />

                    <input type="hidden" id="secSignature" name="secSignature" value="<%=securitySignature%>" />


                    <input type="Submit" value="Proceed for Payment" style="height: 44px; width: 193px" />

                    <script> document.getElementById('form1').submit(); </script>


                    <hr class="dotted">
                </div>
            </div>
        </div>
    </form>
 
   
</body>
</html>
