<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResponseHandling.aspx.cs" Inherits="ResponseHandling" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
       <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
   
    <link href="../css-web/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../css-web/style.css" rel="stylesheet" type="text/css" />
<link href="../css-web/media-style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css-web/hover.css" />
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css" />
<link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css" />
<link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css" />
<link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css" />
<link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css" />
<link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css" />
<script src="../js-web/modernizr.js" type="text/javascript"></script><!-- Modernizr -->
</head>
<body>
    <form id="form1" runat="server">
          <div class="top-header">
            <div class="container">
                <uc:Header ID="Header" runat="server" MinValue="1" MaxValue="10" />
            </div>
        </div>
    <div style="height:350px;">
    
    </div>
          <div id="includedContent1"> <fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>
    </form>
</body>
</html>
