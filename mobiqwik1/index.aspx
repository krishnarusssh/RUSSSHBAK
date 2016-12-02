<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<img src="wallet.png"align="left" alt="Your logo" /><br style="clear:both">
	<h1>Pay with Mobikwik wallet</h1>
<form name="myform" id="demo_form" action="prepare.aspx" method="POST">
	<div style="display: none">
        <div  id="datafields">
            <div id="mkdiv1">
                <span>Email: </span>
                <input class="required email" size="50" name="email" runat="server" type="text" id="email" />
            </div>
        </div>
        <div id="mkdiv2">
            <br />
            <span>Amount: </span>
            <input class="required number" size="50" name="amount" runat="server" type="text" id="amt" />
        </div>
        <div id="mkdiv3">
            <br />
            <span>Cell no: </span>
            <input class="required number" size="50" maxlength="10" runat="server" minlength="10" name="cell" type="text" id="cell" />
        </div>
        <div id="mkdiv4">
            <span>Order ID: </span>
            <input size="30" name="orderid" type="text" runat="server" id="orderid" />
        </div>
        <div id="mkdiv5">
            <br />
            <span>Merchant name: </span>
            <input size="30" name="merchantname" type="text" id="merchantname" value="mobikwik" />
        </div>
        <div id="mkdiv6">
            <br />
            <span>Merchant Id: </span>
            <input size="30" name="mid" type="text" id="mid" value="MBK9002" />
            (Use this merchant id for testing, change for live)
		
        </div>
        <div>
            <br />
            <span>Return URL : </span><span>
                <input style="width: 300px"
                    type="text" name="redirecturl"
                    value="https://www.russsh.com/mobiqwik/return_process.aspx" /></span><span style="font-size: 12px;"> ( Enter redirect url where user will be sent back . For this testing kit the redirect url is {path to this folder}/return_process.aspx )</span>
        </div>
        <div id="mkdiv8">
            <br />
            LIVE<input type="radio" name="live" value="live" /><br>
        </div>
        <div id="mkdiv9" style="padding-top: 30px;">
            <input type="submit" value="Pay" />
        </div>
		</div>
    </form>
	<script type="text/javascript">
         document.myform.submit();
    </script>
</body>
</html>
