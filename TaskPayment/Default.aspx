<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="TaskPayment_Default" %>


<%
    //Need to replace the last part of URL("your-vanityUrlPart") with your Testing/Live URL
    //string formPostUrl = "https://sandbox.citruspay.com/sslperf/russsh";
    string formPostUrl = "https://sandbox.citruspay.com/russsh"; 
    //Need to change with your Secret Key
    string secret_key = "6deb506c1867bb69ac5b8a84baf1f10fe6a7b6f2";	
             
    //Need to change with your Vanity URL Key from the citrus panel
    string vanityUrl = "russsh";
    //Should be unique for every transaction
    string merchantTxnId = Session["NEWBOOKINGID"].ToString();
 
    //Need to change with your Order Amount
    string orderAmount = Session["AMOUNTPAYABLE"].ToString();
    string currency = "INR";
    string data=vanityUrl+orderAmount+merchantTxnId+currency;
             
    //Need to change with your Return URL
    string returnURL = "http://www.russsh.com/TaskPayment/PaymentSuccessfull.aspx";
    //Need to change with your Notify URL
    string notifyUrl = "http://www.russsh.com/TaskPayment/TransactionResponse.aspx";

   string Client_Name = Session["Client_Name"].ToString();
    string Client_Email = Session["Client_Email"].ToString();
    string Client_Phone = Session["Client_Phone"].ToString();
    
    
    
    
    System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
    System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
    string securitySignature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();
%>

<!DOCTYPE html>
<html>
<head runat="server">
<title>Russsh</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="" />
<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />	
    <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
<link href="../css1/custom.css" rel="stylesheet type='text/css'">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  <script>
      $(function () {
          $("#includeHeaderContent").load("../header_inner.html");
          $("#responsive_menu").load("../responsive_menu_inner.html");
          $("#serviceicons").load("serviceicons.html");
          $("#includedContent").load("../footer.html");
      });
    </script> 
<link href="../css1/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="../css1/style.css" rel='stylesheet' type='text/css' />	
<link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />
<script src="../js1/jquery.min.js"> </script>
<link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
<script language="javascript">
    function checkform() {
        if (document.getElementById("email").value == "") {
            alert("Enter Email ID to subscribe!");
            document.getElementById("email").focus();
            return false;
        }
        else {
            var email = document.getElementById("email").value;
            var regex = /^([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)@([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)[\\.]([a-zA-Z]{2,9})$/;
            if (!regex.test(email)) {
                alert("Enter a valid email");
                return false;
            }
        }
    }
	</script>	
    	<script>

    	    (function (i, s, o, g, r, a, m) {
    	        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {

    	            (i[r].q = i[r].q || []).push(arguments)
    	        }, i[r].l = 1 * new Date(); a = s.createElement(o),

                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)

    	    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');



    	    ga('create', 'UA-65976441-1', 'auto');

    	    ga('send', 'pageview');



</script>
</head>
<body>
			<div id="home" >
						 <div class="top-header">
    <div class="container">
        <div id="includeHeaderContent"></div>
       </div>
    </div>
  <div id="responsive_menu"></div>
				  <div class="banner">
					<div class="container">
					</div>
				   </div>
			</div>
   <form align="center" method="post" action="<%=formPostUrl%>">
	<div class="about" style="margin-top:100px;">
		<div class="container">
		 <h3 class="besoti" id="ErrorHeading" runat="server">
		        Make Payment
		        ONLINE</h3>
   <div class="about-top heding" style="text-align:center">
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


                       <input type="Submit" value="Proceed for Payment"/>
                        

  
    
    <hr class="dotted">
  </div>
</div>	 
</div>
</form>
<div id="includedContent"></div>
<script type="text/javascript" src="../lib1/js/jquery-1.10.1.min.js"> </script>
<script type="text/javascript" src="../lib1/js/bootstrap/bootstrap.js"></script>
</body>
</html>
