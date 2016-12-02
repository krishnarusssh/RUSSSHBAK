<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="VefifyMobileNo_Default" %>
<%@ Register TagPrefix="uc" TagName="Header"     Src="~/InnerHeader.ascx" %>
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
    <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
    <link href="../css1/custom.css" rel="stylesheet type='text/css'">
    <link href="../css1/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />
    <script src="../js1/jquery.min.js"> </script>
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
  <link href='//fonts.googleapis.com/css?family=PT+Mono|Abril+Fatface' rel='stylesheet' type='text/css'>
     <script>
         $(function () {
             $("#includeHeaderContent").load("../header_inner.html");
             $("#responsive_menu").load("../responsive_menu_inner.html");
             $("#includedContent").load("../footer.html");
         });
    </script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65976441-1', 'auto');
  ga('send', 'pageview');

</script>

      <style type="text/css">
 .contact-form input[type="text"].paym_box,.contact-form input[type="password"].paym_box
{
    width: 100%;
    border: solid 1px #000000;
    margin: 5px 0px;
}

         .pass {

             padding: 9px;
        width: 49%;
        font-size: 15px;
        margin: 10px 0px;
        border: 1px solid #bbbbbb;
        color: #555;
        background: none;
        background: #fff;
        -webkit-appearance: none;
        outline: none;
        font-weight: 400;
        -webkit-border-radius: 0.3em;
        -moz-border-radius: 0.3em;
        -o-border-radius: 0.3em;
        text-align: left;
        -webkit-transition: all 0.3s ease-out;
        -moz-transition: all 0.3s ease-out;
        -ms-transition: all 0.3s ease-out;
        -o-transition: all 0.3s ease-out;
        transition: all 0.3s ease-out;
         }
     </style>
<!--//webfonts-->
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
   <div class="banner" style="height:auto;">
    <div class="container" style="height:auto;"> 
  <!--  logon-->
    <div class="col-md-6 editaddress">
    <h3>Your Profile &gt; Verify Mobile No.</h3><br>
    <p>Enter your 10 digit Mobile No.:
        <asp:Label ID="lblMemberName" runat="server" Visible="false"></asp:Label><asp:Label ID="lblMemberID" runat="server" Text="0"  Visible="false"></asp:Label>
        
        </p>
        <div class="clearfix"> </div>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnVerifyMobile" />
                    </Triggers>
             <ContentTemplate>
                 <asp:Label ID="lblError" runat="server" ForeColor="#FF5050"></asp:Label>
                <asp:Label ID="lblClientIDD" runat="server" Text="Label" ForeColor="White" Visible="False"></asp:Label>
                  <div class="contact-form conbg" style="border-top:none;">
          
         
            <label class="labelbox" style="width:180px;">Mobile No.</label>
          <asp:TextBox id="txtMobileNo" runat="server" style="border:none; margin:5px 0px;" PlaceHolder="Mobile No." CssClass="pass" MaxLength="10"></asp:TextBox><br />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Enter Mobile No.!" ForeColor="#FF5050" ValidationGroup="a"></asp:RequiredFieldValidator><br />
           <div class="clearfix"> </div>
                        <asp:Button ID="btnSave" Width="250" runat="server" Text="Get Verification Code" CssClass="SIGN_btn" style="background-color:#959595; color:#FFFFFF;"  ValidationGroup="a" OnClick="btnSave_Click" />
            
            <div class="clearfix"> </div>
<label class="labelbox" style="width:180px;" id="verylabel" runat="server" >Enter the OTP just sent to your Mobile No.</label>
          <asp:TextBox id="txtMissedCallNo" runat="server" style="border:none; margin:5px 0px;" PlaceHolder="OTP" CssClass="pass" MaxLength="5" Width="100px"></asp:TextBox><br />
            <div class="sub-button">
                <asp:Button ID="btnVerifyMobile" runat="server" Text="Verify" CssClass="SIGN_btn" style="background-color:#959595; color:#FFFFFF;"  ValidationGroup="b" OnClick="btnVerifyMobile_Click" />
              
            </div>
         
             </ContentTemplate>
             </asp:UpdatePanel>


     
        </div>
        
   
   
   <div class="clearfix"> </div>
     
   
   
    
   
   
        </div>
     <!--end  logonbox-->
    
    
    </div>
  </div>
</div>
<!--//end-slider--> 

    <br /><br /><br /><br />

<!--Footer-->
        <div id="includedContent"></div>
         <script type="text/javascript" src="../lib1/js/jquery-1.10.1.min.js"> </script>
    <script type="text/javascript" src="../lib1/js/bootstrap/bootstrap.js"></script>
    <script type="text/javascript">
        $('button').on('click', function () {
            alert('preserve attached java script data!');
        });
        $('#myTab').tabCollapse();
    </script>
        </form>
</body>
</html>