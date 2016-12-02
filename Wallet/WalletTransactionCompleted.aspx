<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WalletTransactionCompleted.aspx.cs" Inherits="Wallet_TransactionCompleted" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%
   
%>


<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>Russsh</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
     
 <link href="../css1/bootstrap.css" rel="stylesheet" type="text/css">
   
   


    <!--From Zubair-->
 <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link href="css/button-switcher.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">
   <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
  
   
    <script src="../js1/jquery.min.js"> </script>

     
<link href="../css-web/style.css" rel="stylesheet" type="text/css">
<link href="../css-web/media-style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css-web/hover.css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css">
<link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css">
<link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css">
<link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css">
<link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css">

<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="css/ie8.css" media="screen"/><![endif]-->
<script src="../js-web/modernizr.js"></script><!-- Modernizr -->
<script type="javascript">
function bringtofront()
{
$(".cd-dropdown-content").show();
}
</script>

    <style type="text/css">
        .ajax__calendar_years {
            top: 0px;
            left: 180px !important;
            height: 139px !important;
            width: 200px;
            position: absolute;
            text-align: center;
        }

        .ajax__calendar_day {
            height: 25px !important;
            width: 25px !important;
            text-align: right;
            padding: 5px !important;
            cursor: pointer;
            font-size: 13px !important;
        }

        .ajax__calendar_container {
            padding: 4px !important;
            cursor: default;
            width: 200px !important;
            height: 190px !important;
            font-size: 15px !important;
            text-align: center;
            font-family: tahoma,verdana,helvetica;
            background-color: white !important;
            border: 1px solid #999999;
        }

            .ajax__calendar_container TD {
                padding: 0 !important;
                margin: 0 !important;
            }
    </style>
    <script>
        function toggleChevron(e) {
            $(e.target)
                .prev('.panel-heading')
                .find("i.indicator")
                .toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
        }
        $('#accordion').on('hidden.bs.collapse', toggleChevron);
        $('#accordion').on('shown.bs.collapse', toggleChevron);
    </script>
    <!--webfonts-->
    <!--webfonts-->
    <link href='/../fonts.googleapis.com/css?family=PT+Mono|Abril+Fatface' rel='stylesheet' type='text/css'>
    <script>
       

        function CreateOrderCookie(s) {
            window.location = '../OrderDetails/Default.aspx?ORDERNUM=' + s;
            /*
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = "ORDERNUM=" + s + "; " + expires;
            alert(s);
           */
        }
    </script>

    <!--//webfonts-->
</head>
<body>
    <form  method="post" runat="server">


        <!--start-header-->
        <div id="home" class="innerbackground">
           
            <div class="top-header">
                <div class="container">
                     <uc:Header id="Header" 
        runat="server" 
        MinValue="1" 
        MaxValue="10" />
                </div>
            </div>

            <div id="responsive_menu"></div>

            <!-- script-for-menu -->
            <div class="banner">
                <div class="container">
                    <!--  logon-->
                    <div class="col-md-9 yourordersbox" style="margin-top:150px;">
                        <h3>Transaction Completed &nbsp;&nbsp;&nbsp;   <a href="https://www.russsh.com/wallet/"><< Back</a>
                            
                        </h3>
                        <p>
                          
                     <%
                         //Replace this with your secret key from the citrus panel6deb506c1867bb69ac5b8a84baf1f10fe6a7b6f2
                         string secret_key = "2d2ed82733071d05c98378f5b989e423a218554a";
             string data="";
             string txnId=Request["TxId"];
             string txnStatus=Request["TxStatus"]; 
             string amount=Request["amount"]; 
             string pgTxnId=Request["pgTxnNo"];
             string issuerRefNo=Request["issuerRefNo"]; 
             string authIdCode=Request["authIdCode"];
             string firstName=Request["firstName"];
             string lastName=Request["lastName"];
             string pgRespCode=Request["pgRespCode"];
             string zipCode=Request["addressZip"];
             string resSignature=Request["signature"];
             bool flag = true;
             if (txnId != null) {
                 data += txnId;
             }
             if (txnStatus != null) {
                 data += txnStatus;
             }
             if (amount != null) {
                 data += amount;
             }
             if (pgTxnId != null) {
                 data += pgTxnId;
             }
             if (issuerRefNo != null) {
                 data += issuerRefNo;
             }
             if (authIdCode != null) {
                 data += authIdCode;
             }
             if (firstName != null) {
                 data += firstName;
             }
            if (lastName != null) {
                 data += lastName;
             }
             if (pgRespCode != null) {
                 data += pgRespCode;
             }
             if (zipCode != null) {
                 data += zipCode;
             }
             System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
             System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
             string signature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();
             
             if(resSignature !=null && !signature.Equals(resSignature)) {
                 flag = false;
             }
             if (flag) {
    %>
        Your Unique Transaction/Order Id : <%=txnId%><br/>
        Transaction Status : <%=txnStatus%><br/>
    <% } else { %>
        <label width="125px;">Citrus Response Signature and Our (Merchant) Signature Mis-Mactch</label>
    <% } %>

                        </p>
                    </div>



                </div>
                <!--end  logonbox-->


            </div>
        </div>
        </div>
        <!--//end-slider-->




        <!--footer-->
        <div id="includedContent1"><fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>
    </form>
</body>
</html>
