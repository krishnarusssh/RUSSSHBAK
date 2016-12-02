<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Fund.aspx.cs" Inherits="MobileWallet_Add_Fund" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%
    //Need to replace the last part of URL("your-vanityUrlPart") with your Testing/Live URL
    //string formPostUrl = "https://sandbox.citruspay.com/sslperf/russsh";
    string formPostUrl = "https://www.citruspay.com/russshpay"; 
    //Need to change with your Secret Key
    string secret_key = "2d2ed82733071d05c98378f5b989e423a218554a";	
             
    //Need to change with your Vanity URL Key from the citrus panel
    string vanityUrl = "russshpay";
    //Should be unique for every transaction
    string merchantTxnId = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");
 
    //Need to change with your Order Amount
    string orderAmount="0";
    if (Request.QueryString["AMOUNTPAYABLE"] != null && Request.QueryString["AMOUNTPAYABLE"] != "")
    {
        orderAmount = Request.QueryString["AMOUNTPAYABLE"].ToString();
    }
   
    string CLIENTID1="0";
   if (Request.QueryString["CLIENTID"] != "" && Request.QueryString["CLIENTID"] != null)
    {
        CLIENTID1= Request.QueryString["CLIENTID"].ToString();
    }

    string currency = "INR";
    string data=vanityUrl+orderAmount+merchantTxnId+currency;
             
    //Need to change with your Return URL
    string returnURL = "https://www.russsh.com/MobileWallet/WalletTransactionCompleted.aspx?CLIENTID="+CLIENTID1;
    //Need to change with your Notify URL
    string notifyUrl = "https://www.russsh.com/MobileWallet/WalletTransactionNotified.aspx";
   
    string Client_Name = "";

    if (Request.QueryString["CLIENTNAME"] != "" && Request.QueryString["CLIENTNAME"] != null)
    {
        Client_Name = Request.QueryString["CLIENTNAME"].ToString();
    }
   

    string Client_Email = "";
    if (Request.QueryString["CLIENTEMAIL"] != "" && Request.QueryString["CLIENTEMAIL"] != null)
    {
        Client_Email = Request.QueryString["CLIENTEMAIL"].ToString();
    }
   


    string Client_Phone = "";
    if (Request.QueryString["CLIENTPHONE"] != "" && Request.QueryString["CLIENTPHONE"] != null)
    {
        Client_Phone = Request.QueryString["CLIENTPHONE"].ToString();
    }
   
  
    
    
    
    
    System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
    System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
    string securitySignature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();
%>


<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
   
</head>
<body>
    <form align="center" id="form1" name="form1"  method="post" action="<%=formPostUrl%>">

        <div style="text-align:center; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; font-weight: bold; font-size: medium; color: #990000;">
          Redirecting to Payment Gateway<br />
          Please wait...<br />
          <img src="loading_spinner.gif" />

      </div>
        <div id="home" >
           
         

         

            <!-- script-for-menu -->
            <div>
                <div class="container">
                 
                    <!--  logon-->
                   
                   

                      
                    <div class="col-md-9 yourordersbox" style="display:none;">
                      
                        <h3>Add Fund to Your Wallet Rs.<%=orderAmount%></h3>
                        
                         
                       
                       
                         <p>
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
                               </p>
                        
                              <input type="Submit" value="Pay Now" style="background-color: #FFAC59; color: #FFFFFF;height:60px;width:130px;"/>
                           <script> document.getElementById('form1').submit(); </script>


                    
                        
                    </div>
                     


                </div>
                <!--end  logonbox-->


            </div>
        </div>
     
      
        
    </form>
</body>
</html>
