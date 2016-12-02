<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaymentSuccessfull.aspx.cs" Inherits="TaskPayment1_PaymentSuccessfull" %>
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
    <link href="../css1/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="../css1/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />
    <script src="../js1/jquery.min.js"> </script>
    <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
    <link href="../css1/custom.css" rel="stylesheet type='text/css'">
    <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">

    <script type="text/javascript" src="../js1/move-top.js"></script>
    <script type="text/javascript" src="../js1/easing.js"></script>
    
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
 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');

</script>
    <!--//webfonts-->
</head>
<body>
    <form id="Form1"  method="post" runat="server">


        <!--start-header-->
        <div id="home" class="innerbackground">
           
            <!-- script-for-menu -->
            <div class="banner">
                <div class="container">
                    <!--  logon-->
                    <div class="col-md-9 yourordersbox">
                           <h3 id="divmsg" runat="server">Congratulation!<br /> Task Booked Successfully.</h3>   <br>
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
                 if (txnStatus != "SUCCESS")
                 {
                     txnId = "";
                 }
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
        Your Unique Transaction/Order Id :<%=txnId%><br/>

        Transaction Status : <%=txnStatus%><br/>
    <% } else {
           if (txnStatus != "SUCCESS")
           {
               txnId = "";
           }
           if (txnStatus != "SUCCESS")
           {
               divmsg.InnerHtml = "Sorry! Task has not been Booked.";
           }    
                  %>
        <label width="125px;">Citrus Response Signature and Our (Merchant) Signature Mis-Mactch</label>
    <% } %>
<br /><br />
                             <a href="../Default.aspx" style=" font-size:24px;"><u>Back to Home</u></a>
                        </p>
                    </div>



                </div>
                <!--end  logonbox-->


            </div>
        </div>
        </div>
        <!--//end-slider-->




        <!--footer-->
       
    </form>
</body>
</html>
