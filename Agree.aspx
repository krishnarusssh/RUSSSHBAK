<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Agree.aspx.cs" Inherits="Agree" %>

<html>

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="normalize.css">
	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
	<!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<title>Task Rescheduled</title>
	<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
	<style type="text/css">
		body {
			margin:0 auto;
			font-family: "ubuntu";
			background: #FFF;
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
			margin-bottom: 15px;
		}
		.__invite_body .highlight {
			border-bottom: 1px solid #CCC;
			padding-bottom: 5px;
			font-size: 30px;
			line-height: 70px;
			color: #fc845e;
			font-weight: 800;
		}
		.ybtn {
			border-radius: 50%;
			background: #fc845e;
			color: #FFF;
			text-align: center;
			border: none;
			width: 45px;
			height: 45px;
			font-size: 12px;
			float: right;
			margin-right: 5px;
		}
		.nbtn {
			border-radius: 50%;
			background: #CCC;
			color: #FFF;
			text-align: center;
			border: none;
			width: 45px;
			height: 45px;
			font-size: 12px;
			margin-left: 5px;
		}
.obtn {
			border-radius: 50%;
			background: #fc845e;
			color: #FFF;
			text-align: center;
			border: none;
			width: 45px;
			height: 45px;
			font-size: 12px;
			margin-right: 5px;
                        float:left;
                        margin-left:120px;
		       
		}
	</style>


    <style type="text/css">
       
        </style>
</head>
<body class="body">
    <form id="form1" runat="server">


        <header class="header"><img src="https://www.russsh.com/russsh-xs.png" alt="" title="" /></header>
		<div id="top1" runat="server" class="__invite_body">
			<div style="display:none;">
        <asp:Label ID="lblTaskID" runat="server" Text="0"></asp:Label>
        <asp:Label ID="lblTimeID" runat="server" Text="0"></asp:Label>
         <asp:Label ID="lblClientID" runat="server" Text="0"></asp:Label>
        <asp:Label ID="lblAreaName" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblPickUpTime" runat="server" Text=""></asp:Label>
				 <asp:Label ID="lblNewDate" runat="server" Text=""></asp:Label>
    </div>
            <img class="img" src="https://www.russsh.com/Icon-Res.png" width="120" height="120" alt="" />
			<h3 id="spn_customername" runat="server">Hi _______!</h3>
			<p>Since the time slot you chose is not available, we have re-scheduled your pick up time to<br />
			<span class="highlight" id="spn_time" runat="server">3:30Pm - 6:30Pm</span>
			</p>
			<p style="margin-bottom: 30px;">Do you wish to continue with the task?</p>
			<div style="width:50%;float: left;"> <asp:Button ID="btnYes" runat="server" Text="YES" OnClick="btnYes_Click" cssclass="ybtn" /> <%-- <button class="">YES</button>--%></div>
			<div style="width:50%;float: left;"> <asp:Button ID="btnNo" runat="server" Text="NO" OnClick="btnNo_Click"  CssClass="nbtn" /> <%--<button class="nbtn">NO</button>--%></div>
		</div>



    <div >
         
    </div>
    <div id="expireddiv" runat="server" style="text-align:center;">
             This link has been expired!
             </div><br />
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
     <br /><br><br>
        <asp:Button ID="btnOK" runat="server" Text="OK" cssclass="obtn" OnClick="btnOK_Click" />
    </form>
</body>
</html>
