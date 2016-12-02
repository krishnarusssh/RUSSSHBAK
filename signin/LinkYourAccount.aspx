<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinkYourAccount.aspx.cs" Inherits="LinkYourAccount" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE html>
<html>
<head>
<title>Russsh</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="" />
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

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
 
 


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
	<form id="form1" runat="server">
	<!--start-header-->
			<div id="home" >
					 <div class="top-header">
    <div class="container">
 <!--  <!-- <div class="menu_icon">= Menu </div>-->
   
         <!--nav-->
        <uc:header id="Header" runat="server" MinValue="1" MaxValue="10" />
      
 
      
      
      
       </div>
    </div>
  
  
  
<!-- /navbar --> 

  <div id="responsive_menu"></div>
                
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
		 <h3 style="font-family:ubuntu; text-transform:none;">
		   <span style="color:#f16f6f;"> Almost there! </span>Pls update your Mobile No.
		  </h3>
         
         
   <div class="about-top heding">
  
    <hr class="dotted">
    <div class="Testimonials_text" id="ErrorDescription" runat="server">

         <div style="text-align:center;">

   <div style="width:350px;border:1px solid #e0dcdc;padding:35px;text-align:center; margin-left:auto; margin-right:auto; display:block;">
        <table style="width:100%">
            <tr>
                <td>
                    <asp:Label ID="lblPlatForm" runat="server" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtAppID" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="100%"></td>
            </tr>
            <tr>
                <td style="padding:5px;">
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" ReadOnly="True" placeholder="Full Name"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="padding:5px;">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name required!" ForeColor="#FF3300" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
            </tr>
       
            <tr>
                <td style="padding:5px;">
                    <asp:TextBox ID="txtEmailID" CssClass="form-control" placeholder="Email Id" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="padding:5px">
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ErrorMessage="Email required!" ForeColor="#FF3300" ValidationGroup="a"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ErrorMessage="Invalid Email ID!" ForeColor="#FF4646" Font-Size="10pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a"></asp:RegularExpressionValidator>
                </td>
            </tr>
       
            <tr>
                <td style="padding:5px;">
                    <asp:TextBox ID="txtMobileNo" CssClass="form-control" placeholder="Mobile No" runat="server" MaxLength="10" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="padding:5px">
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Mobile No required!" ForeColor="#FF3300" ValidationGroup="a"></asp:RequiredFieldValidator>
  <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Enter mobile no. in numeric!" ForeColor="#FF3300" ValidationExpression="^[0-9]+$" ValidationGroup="a"></asp:RegularExpressionValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="Invalid Mobile No." ForeColor="#FF3300" ValidationExpression="[0-9]{10}" ValidationGroup="a" Display="Dynamic"></asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td style="padding:5px;">
                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" runat="server" MaxLength="10" TextMode="Password" ></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td style="padding:5px">
 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Enter Password!" ForeColor="#FF3300" ValidationGroup="a"></asp:RequiredFieldValidator>
 

                </td>
            </tr>
            
            <tr>
                <td style="padding:5px;">
                      <div class="sub-button">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" ValidationGroup="a" Text="CONTINUE" Style="background-color: #f16f6f; border:none; height:45px; padding:10px; color: #FFFFFF; border-radius:5px;"  />
                          </div>
                </td>
            </tr>
        </table>
       </div>
     </div>
    </div>
    <hr class="dotted">
  </div>
    
</div>	 
</div>
		<div runat="server" id="strq"></div>

		<!--footer-->
			   <div id="includedContent1"><fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>

<!-- LIB -->


<!-- Bootstrap TabCollapse-->
<!--<script type="text/javascript" src="../bootstrap-tabcollapse.js"></script>-->


<!--<script type="text/javascript">
    $('button').on('click', function(){
        alert('preserve attached java script data!');
    });
    $('#myTab').tabCollapse();
</script>-->

    </form>

</body>


</html>
