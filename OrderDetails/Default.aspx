<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Orders_Details" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/FooterWithoutCalc.ascx" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Russsh</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="" />
<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />	
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!--From Zubair-->
   
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
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');

</script>

</head>
<body>
    <form id="Form1" name="form1" runat="server">
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
    <div class="col-md-9 col-md-offset-1 yourordersbox" style="height:auto;margin-top:100px;">
    <h3>Order Details: #<span><asp:Label ID="lblTaskID" runat="server" style="font-weight: 700"></asp:Label></span></h3>
    
     <%--<input name="ORDERS" value="ORDERS" class="ORDERS_btn avt">--%>
        <asp:Button ID="btnorders" runat="server" Text="<< Back" CssClass="ORDERS_btn avt" OnClick="btnorders_Click" />
   &nbsp;<asp:Button ID="btnReorder" runat="server" Text="Re-Order" CssClass="ORDERS_btn avt" OnClick="btnReorder_Click"  />
        <div class="table-responsive" id="tbldetailview" runat="server" style="margin-top:30px;" > 
         
             <table style="width:100%;" id="Table1" runat="server">
                            <tr>
                                <td style="color: #333333; font-family: Cambria, Cochin, Georgia, Times, &quot;Times New Roman&quot;, serif; font-size: 12pt; padding: 5px; background-color: #E8E8E8;">Task Details</td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; font-family: Cambria, Cochin, Georgia, Times, &quot;Times New Roman&quot;, serif; font-size: 11pt">
                                    <table style="width:100%;">
                                        <tr>
                                            <td style="width:100px;">Task Category</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblTaskCategory" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Description</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblTaskDescription" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Task Date</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblTaskDate" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Package</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblTaskPackage" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Task Mode</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblTaskMode" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">COD Amount</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblCODAmount" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Collect Cash </td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblPaymentCollect" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: #333333; font-family: Cambria, Cochin, Georgia, Times, &quot;Times New Roman&quot;, serif; font-size: 12pt; padding: 5px; background-color: #E8E8E8;">Pick up Details</td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; font-family: Cambria, Cochin, Georgia, Times, &quot;Times New Roman&quot;, serif; font-size: 11pt">
                                    <table style="width:100%;">
                                        <tr>
                                            <td style="width:100px;">Pick up Name</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblPickupName" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Address</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblPickupAddress" runat="server"></asp:Label>
                                                ,</td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">&nbsp;</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblPickupArea" runat="server"></asp:Label>
                                                ,<asp:Label ID="lblPickupCity" runat="server"></asp:Label>
                                                -<asp:Label ID="lblPickupPinCode" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Mobile</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblPickupMobile" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Drop off Time</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblPickupTime" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: #333333; font-family: Cambria, Cochin, Georgia, Times, &quot;Times New Roman&quot;, serif; font-size: 12pt; padding: 5px; background-color: #E8E8E8;">Drop-off Details</td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; font-family: Cambria, Cochin, Georgia, Times, &quot;Times New Roman&quot;, serif; font-size: 11pt">
                                    <table style="width:100%;">
                                        <tr>
                                            <td style="width:100px;">Drop off Name</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblDropoffName" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Address</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblDropoffAddress" runat="server"></asp:Label>
                                                ,</td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">&nbsp;</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblDropoffArea" runat="server"></asp:Label>
                                                ,<asp:Label ID="lblDropoffCity" runat="server"></asp:Label>
                                                -<asp:Label ID="lblDropoffPincode" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Mobile</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblDropoffMobile" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td style="width:100px;">Drop off Time</td>
                                            <td style="width:5px;">:</td>
                                            <td>
                                                <asp:Label ID="lblDropoffTime" runat="server"></asp:Label>
                                            </td>
                                           
                                        </tr>
                                        </table>
                                </td>
                            </tr>
                            
                        </table>

         </div>


</div>
    
    
    
</div>
     <!--end  logonbox-->
    
    
    </div>
  </div>
</div>
<!--//end-slider--> 




<!--footer-->
    <div id="includedContent1"> <fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" />
</div>
        </form>
</body>
</html>