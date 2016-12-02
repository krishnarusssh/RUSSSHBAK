<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/FooterWithoutCalc.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
  <title>Russsh</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="" />
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
  <script type="text/javascript" >
       function fnclick()
	  {
	    alert('Load');
	  }
    </script>
     
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
    
 


</head>
<body >
  <form id="form1" runat="server" method="post">
    
         <div class="top-header">
            <div class="container">
                <uc:Header ID="Header" runat="server" MinValue="1" MaxValue="10" />
            </div>
        </div>

   
   
    
   <input type="hidden" runat="server" id="key" name="key" />
      <input type="hidden" runat="server" id="hash" name="hash"  />
            <input type="hidden" runat="server" id="txnid" name="txnid" />
             <input type="hidden" runat="server" id="enforce_paymethod" name="enforce_paymethod" /><br /><br /><br /><br />
       <div style="display:none;">
      <table>
        <tr>
          <td><b>Mandatory Parameters</b></td>
        </tr>
        <tr>
          <td>Amount: </td>
          <td>
          <asp:TextBox ID="amount" runat="server"   /></td>
          <td>First Name: </td>
          <td>
           <asp:TextBox ID="firstname" runat="server" /></td>
        </tr>
        <tr>
          <td>Email: </td>
          <td>
           <asp:TextBox ID="email" runat="server"  /></td>
          <td>Phone: </td>
          <td>
          <asp:TextBox ID="phone" runat="server"  /></td>
        </tr>
        <tr>
          <td>Product Info: </td>
          <td colspan="3">
          <asp:TextBox ID="productinfo" runat="server"  /></td>
        </tr>
        <tr>
          <td>Success URI: </td>
          <td colspan="3">
          <asp:TextBox ID="surl" runat="server" Text="https://www.russsh.com/payumoney/ResponseHandling.aspx" /></td>
        </tr>
        <tr>
          <td>Failure URI: </td>
          <td colspan="3">
          <asp:TextBox ID="furl" runat="server" Text="https://www.russsh.com/payumoney/ResponseHandling.aspx"  /></td>
        </tr>


        <tr>
          <td><b>Optional Parameters</b></td>
        </tr>
        <tr>
          <td>Last Name: </td>
          <td>
          <asp:TextBox ID="lastname" runat="server" /></td>
          <td>Cancel URI: </td>
          <td>
           <asp:TextBox ID="curl" runat="server" /></td>
         
        </tr>
        <tr>
          <td>Address1: </td>
          <td>
            <asp:TextBox ID="address1" runat="server" /></td>
          <td>Address2: </td>
          <td>
          <asp:TextBox ID="address2" runat="server" /></td>
        </tr>
        <tr>
          <td>City: </td>
          <td>
          <asp:TextBox ID="city" runat="server" /></td>
          <td>State: </td>
          <td>
          <asp:TextBox ID="state" runat="server" /></td>
        </tr>
        <tr>
          <td>Country: </td>
          <td>
          <asp:TextBox ID="country" runat="server" /></td>
          <td>Zipcode: </td>
          <td>
            <asp:TextBox ID="zipcode" runat="server" /></td>
        </tr>
        <tr>
          <td>UDF1: </td>
          <td>
           <asp:TextBox ID="udf1" runat="server" /></td>
          <td>UDF2: </td>
          <td>
           <asp:TextBox ID="udf2" runat="server" /></td>
        </tr>
        <tr>
          <td>UDF3: </td>
          <td>
           <asp:TextBox ID="udf3" runat="server" /></td>
          <td>UDF4: </td>
          <td>
           <asp:TextBox ID="udf4" runat="server" /></td>
        </tr>
        <tr>
          <td>UDF5: </td>
          <td>
           <asp:TextBox ID="udf5" runat="server" /></td>
          <td>PG: </td>
          <td>
           <asp:TextBox ID="pg" runat="server" /></td>
        </tr>
		<tr>
		<td>Service Provider: </td>
          <td>
           <asp:TextBox ID="service_provider" runat="server" Text="payu_paisa"/></td>
		</tr>
        <tr>
        
            <td colspan="4"></td>
            
        </tr>
      </table>
            </div>
             <br />
            <br />
            <br />
          <br /><br /><br /> <div id ="frmError" runat="server">
      <center><span style="color:red;text-align:center;">There is some error in processing payment.</span></center>
      <br/>
      <br/>
      </div>
     <center> <asp:Button ID="submit" Text="Proceed for Payment" Width="170px" Height="50px"  runat="server" OnClick="Button1_Click"  /></center>
        <br /><br /><br />
            <div id="includedContent1">  <fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>
    </form>
	 
</body>
</html>
