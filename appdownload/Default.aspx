<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="appdownload_index" %>

<!DOCTYPE html>
<html>
<head>
	<title>Invitation</title>
    <SCRIPT language=Javascript>
       <!--
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode != 46 && charCode > 31
          && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    //-->
    </SCRIPT>
	<style type="text/css">
		body {
			margin:0 auto;
			font-family: "ubuntu";
			background: #f2f2f2;
		}
		.header {
			background: #002241;height: 45px;
		}
		.header img {
			margin-left: auto;margin-right: auto;display: block;height: 33px;padding: 6px 0;
		}
		.__invite_body {
			margin: 20px 20px;
		}
		.__invite_body .img {
			margin: 30px auto;
			display: block;
		}
		.__invite_body h3 {
			color: #ed846a;
			font-size:18px; 
			font-family: "ubuntu";
			text-align: center;
			font-weight: lighter;
			line-height: 30px;
		}
		.__invite_body p {
			text-align: center;
			color: #636363;
			font-size: 14px;
			margin: 10px auto;
			line-height: 26px;

		}
		.input_field input {
			width: 80%;
			height: 35px;
			color: #999;
			border: 1px solid #CCC;
			padding-left: 10px;
			margin: 7px -5px 20px;
		}
		.input_field span {
		    width: 14%;
		    float: left;
		    background: #eeefed;
		    line-height: 50px;
		    height: 37px;
		    line-height: 36px;
		    margin-top: 7px;
		    padding-left: 9px;
		    border: 1px solid #CCC;
		    color: #4d4f4c;
		}
		.input_field label {
			margin: 0;
			padding: 0;
			color: #999;
			font-size: 13px;
		}
		.download {
			height: 40px;
			color: #FFF;
			background: #ed846a;
			border: none;
			box-shadow: none;
			width: 100%;
			font-family: ubuntu;
			position: fixed;
			bottom: 0;
			left: 0;
			cursor: pointer;
		}	</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->


</head>
<body>
    <form name="from1" runat="server">
<header class="header"><img src="https://www.russsh.com/appdownload/russsh-xs.png" alt="" title="" /></header>
		<div class="__invite_body">
			<img class="img" src="https://www.russsh.com/appdownload/icon-env.png" width="120" height="120" alt="" />
			<h3 id="nametext" runat="server">YOU GOT THREE FREE DELIVERY FROM NOBODY</h3>
			<p>Enter your phone number and install the Russsh app and you'll get <img src="https://www.russsh.com/appdownload/rupee.png" height="10" alt="" />50 Off first 3 Delivery<br /> <asp:Label ID="lblError" runat="server" ForeColor="#CC0000"></asp:Label></p>
			 
            <div class="input_field" style="padding-top:15px;">
				<span>+91</span>
				 <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox>
			</div>
			             <asp:Button ID="Button1" runat="server" Text="Download"  class="download" OnClick="Button1_Click" />
		 <div style="display:none;">
               <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>        </div>


        
        </form>
</body>
</html>