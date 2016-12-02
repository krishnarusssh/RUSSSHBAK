<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prepare.aspx.cs" Inherits="prepare" %>
<%
        Session["Amount"] = Request.Form["amt"].ToString();
        Session["OrderId"] = Request.Form["orderid"].ToString();
        
        //Please enter your secret key here  
        String secretKey = "Tn3WtxXYIgXibEMHKn4gyVuup4ig";
        String checksumString = null;
      
        checksumString = Checksum.ChecksumCalculator.getChecksumString(Request).Trim();
        String checksum = Checksum.ChecksumCalculator.calculateChecksum(secretKey, checksumString);
    
        String actionUrl = "";
    
        if(Request.Form["live"] != null)
        {
            Session["url"]="https://walletapi.mobikwik.com/checkstatus";
			actionUrl="https://walletapi.mobikwik.com/wallet";
        }
    	else
		{
            Session["url"] = "https://test.mobikwik.com/checkstatus";
            actionUrl = "https://test.mobikwik.com/wallet";
		}
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>	
	<form name="myform" id="demo_form" action="<%=actionUrl%>" method="POST">
			<input class="required email" size="50" name="email" type="hidden" value="<%=Request.Form["email"]%>" />
			<input class="required number" size="50" name="amount" type="hidden" value="<%=Request.Form["amt"]%>" />
			<input class="required number" size="50" maxlength="10" minlength="10" name="cell" type="hidden" value="<%=Request.Form["cell"]%>" />
			<input size="30" name="orderid" type="hidden" value="<%=Request.Form["orderid"]%>" />
			<input size="30" name="merchantname" type="hidden"  value="<%=Request.Form["merchantname"]%>" />
			<input size="30" name="mid" type="hidden" id="mid" value="<%=Request.Form["mid"]%>" />
			<input type="hidden" name="redirecturl" value="<%=Request.Form["redirecturl"]%>" />
			<input type="hidden" name="checksum" value="<%=checksum %>" />
	</form>
    <script type="text/javascript">
        document.myform.submit();
</script>
	</body>
	</html>
