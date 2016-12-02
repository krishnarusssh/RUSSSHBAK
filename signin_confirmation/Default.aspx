<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="singin_confirmation_Default" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Russsh</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="" />
<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../css1/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="../css1/style.css" rel='stylesheet' type='text/css' />	
<link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />
    <link href="../css1/custom.css" rel="stylesheet type='text/css'">
<script src="../js1/jquery.min.js"> </script>
<link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
     <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  <script>
      $(function () {
          $("#includeHeaderContent").load("../header_inner.html");
          $("#responsive_menu").load("../responsive_menu_inner.html");
          $("#serviceicons").load("serviceicons.html");
          $("#includedContent").load("../footer.html");
      });
    </script> 
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
		<div id="includedContent"></div>
<script type="text/javascript" src="../lib1/js/jquery-1.10.1.min.js"> </script>
<script type="text/javascript" src="../lib1/js/bootstrap/bootstrap.js"></script>
</body>
</html>