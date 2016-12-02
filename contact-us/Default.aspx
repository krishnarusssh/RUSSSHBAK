<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="contact_us_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/FooterWithoutCalc.ascx" %>
<%@ OutputCache Duration=5 VaryByParam="None" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Contact Us - Russsh</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <meta name="title" content="Contact Us - Russsh" />
<meta name="description" content="For queries call +91-8080808315 or email us at support@russsh.com" />		
<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	

    <link href="../css-web/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../css-web/style.css" rel="stylesheet" type="text/css">
<link href="../css-web/media-style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css-web/hover.css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css">
<link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css">
<link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css">
<link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css">
<link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css">
<link href="../fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="../js1/jquery.min.js"> </script>
<script type="text/javascript" src="../js1/move-top.js"></script>
<script type="text/javascript" src="../js1/easing.js"></script>
<script src="../js-web/modernizr.js"></script><!-- Modernizr -->
<script type="javascript">
function bringtofront()
{
$(".cd-dropdown-content").show();
}
</script>
<script type="text/javascript">
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

    function checkcontactus() {

        var regex1 = /^([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)@([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)[\\.]([a-zA-Z]{2,9})$/;
        var email1 = document.getElementById("txtEmail").value;
        if (document.getElementById("txtName").value == "") {
            document.getElementById("messageplace").innerHTML = "Please Enter First name!";
            document.getElementById("messageplace").style.display = 'block';
            return false;
        }

        else if (!regex1.test(email1)) {

            document.getElementById("messageplace").innerHTML = "Please Enter a valid Email ID!";
            document.getElementById("messageplace").style.display = 'block';
            return false;
        }
        else if (document.getElementById("txtMassage").value == "") {
            document.getElementById("messageplace").innerHTML = "Please Enter your comment/query!";
            document.getElementById("messageplace").style.display = 'block';
            return false;
        }
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

	<script type='text/javascript'>
var $zoho= $zoho || {salesiq:{values:{},ready:function(){$zoho.salesiq.floatbutton.visible('hide');}}}; var d=document; s=d.createElement('script'); s.type='text/javascript'; s.defer=true; s.src='https://salesiq.zoho.com/russsh/float.ls?embedname=russsh'; t=d.getElementsByTagName('script')[0]; t.parentNode.insertBefore(s,t);
</script>

</head>
<body>

<div id="home" class="contactusbanner1">
 <div class="top-header">
    <div class="container">
        <uc:header id="Header" runat="server" MinValue="1" MaxValue="10" />
       </div>
    </div>


  <div id="responsive_menu"></div>
  
  <div class="banner">
    <div class="container-fluid" style="margin-top:51px;">
<div class="row"> 
     <iframe class="contactusframe" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3771.020277437049!2d72.83069731442437!3d19.062846057340632!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c946e51531fb%3A0xcf18778d6fc35aae!2sRusssh!5e0!3m2!1sen!2sin!4v1448456012495" height="260" style="border:0;width:100%;" allowfullscreen></iframe>
</div>
    </div>
  </div>
</div>

<div class="about">
  <div class="col-md-12 paddingtb-30">
    <div class="container">
      <div class="col-md-6 bookboxs">
        <h2>RUSSSH</h2>
        <p class="bboktext"> D-73/1, TTC Industrial Area, MIDC,<br>
          Turbhe, Opposite Amul Dairy, <br>
          Mumbai, Maharashtra 400705 <br><span class="rightfolt"> <a href="mailto:support@russsh.com">support@russsh.com</a><br>
          (+91) 8080808315 </span> </p>
      </div>
      <div class="col-md-6">
        <div class="contact-form">
          <form name="contactusform" method="post" action="https://www.russsh.com/contactus_confirmation/Default.aspx" >
               <div id="messageplace" style="color:red;display:none;"></div>
<div class="form-group">
            <input class="form-control" style="width:100%" id="txtName" name="Name"   placeholder="Name" type="text">
</div>
<div class="form-group">
            <input class="form-control"style="width:100%" id="txtEmail" name="Email"  placeholder="Email id" type="text">
</div>
<div class="form-group">
            <textarea cols="77" rows="6" class="form-control" style="width:100%" id="txtMassage" name="Massage" placeholder="Message"></textarea>
</div>
            <div class="clearfix"> </div>
            <div class="sub-button ol">
              <input name="submit" value="SEND" type="submit" onclick="return checkcontactus()" style="background-color:#959595; color:#FFFFFF; height:40px; padding:0 15px; border:none;">
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>
<form name="frmMain" runat="server">
<!--footer-->
   <div id="includedContent1"><fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>
<!-- LIB -->
<!-- jQuery and friends -->


</form>
</body>

</html>