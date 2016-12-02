<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="contactus_confirmation_Default" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE html>

<html>

<head>
<title>Russsh</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="" />
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
  <link href='//fonts.googleapis.com/css?family=PT+Mono|Abril+Fatface' rel='stylesheet' type='text/css'>
          
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
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');

</script>
</head>
<body>
<form name="frmMain" runat="server">
	<!--start-header-->
			<div id="home" >
					 <div class="top-header">
    <div class="container">
            <uc:Header id="Header" 
        runat="server" 
        MinValue="1" 
        MaxValue="10" />
     
       </div>
    </div>
  
  
  
<!-- /navbar --> 

                
				  <div class="banner">
					<div class="container">
                    
                    
					</div>
				
				   </div>
			</div>
		<!--//end-slider-->
		<!--start-about-->
	<!--start-about-->
	<div class="about" style="margin-top:100px;">
		<div class="container">
		 <h3 class="besoti" id="ErrorHeading" runat="server">
		        Error Heading Here
		  </h3>
         
         
   <div class="about-top heding">
  
    <hr class="dotted">
    <div class="Testimonials_text" id="ErrorDescription" runat="server">Error Description here
    </div>
    <hr class="dotted">
  </div>
    
</div>	 
</div>
<br><br><br>
		<!--footer-->
		  <div id="includedContent1"> <fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>




<!--<script type="text/javascript">
    $('button').on('click', function(){
        alert('preserve attached java script data!');
    });
    $('#myTab').tabCollapse();
</script>-->
</form>
</body>


</html>
