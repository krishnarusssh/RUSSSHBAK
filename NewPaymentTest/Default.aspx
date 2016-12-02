<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="NewPaymentTest_Default" %>


<%
    //Need to replace the last part of URL("your-vanityUrlPart") with your Testing/Live URL
    //string formPostUrl = "https://sandbox.citruspay.com/sslperf/russsh";
    string formPostUrl = "https://sandbox.citruspay.com/russshpay"; 
    //Need to change with your Secret Key
    string secret_key = "1298ceb059176ccaa75a6409e18f60719661f9d4";	
             
    //Need to change with your Vanity URL Key from the citrus panel
    string vanityUrl = "russshpay";
    //Should be unique for every transaction
    string merchantTxnId = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");
 
    //Need to change with your Order Amount
      string orderAmount = "11";

    string currency = "INR";
    string data=vanityUrl+orderAmount+merchantTxnId+currency;
             
    //Need to change with your Return URL
    string returnURL = "http://www.russsh.com/Wallet/WalletTransactionCompleted.aspx";
    //Need to change with your Notify URL
    string notifyUrl = "http://www.russsh.com/Wallet/WalletTransactionNotified.aspx";

    string Client_First_Name = "KRISHNAKANT";
    string Client_Last_Name = "VERMA";
    string Client_Email = "chandsitare7@gmail.com";
    string Client_Phone = "9699209141";
    
    
    
    
    System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
    System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
    string securitySignature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script src="citrus.js"> </script>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"> </script>
    <script src="https://icp.citruspay.com/js/citrus.js"> </script>
    <script src="https://icp.citruspay.com/js/jquery.payment.min.js"> </script>

    <script type="text/javascript">
        CitrusPay.Merchant.Config = {
            // Merchant details
            Merchant: {
                accessKey: '33V4FTJQHNFOLMPAPQBG', //Replace with your access key
                vanityUrl: 'russshpay'  //Replace with your vanity URL
            }
        };
    </script>

    <script type="text/javascript">

        fetchPaymentOptions();

        function handleCitrusPaymentOptions(citrusPaymentOptions) {
            if (citrusPaymentOptions.netBanking != null)
                for (i = 0; i < citrusPaymentOptions.netBanking.length; i++) {
                    var obj = document.getElementById("citrusAvailableOptions");
                    var option = document.createElement("option");
                    option.text = citrusPaymentOptions.netBanking[i].bankName;
                    option.value = citrusPaymentOptions.netBanking[i].issuerCode;
                    obj.add(option);
                }
        }
    </script>
    <script type="text/javascript">
        //Net Banking
        $('#citrusNetbankingButton').on("click", function () { makePayment("netbanking") });
        //Card Payment
        $("#citrusCardPayButton").on("click", function () { makePayment("card") });
    </script>
    <script type="text/javascript">

        function citrusServerErrorMsg(errorResponse) {
            alert(errorResponse);
            console.log(errorResponse);
        }
        function citrusClientErrMsg(errorResponse) {
            alert(errorResponse);
            console.log(errorResponse);
        }
    </script>
</head>
<body>
    <form align="center" method="post" action="<%=formPostUrl%>">
    <input type="text" id="citrusFirstName" value="<%= Client_First_Name %>" placeholder="First Name" /><br />
    <input type="text" id="citrusLastName" value="<%= Client_Last_Name %>" placeholder="Last Name" /><br />
    <input type="text" id="citrusEmail" value="<%= Client_Email %>" /><br />
    <input type="text" id="citrusStreet1" value="502,Kamal Visranti" /><br />
    <input type="text" id="citrusStreet2" value="Bandra West" /><br />
    <input type="text" id="citrusCity" value="Mumbai" /><br />
    <input type="text" id="citrusState" value="Maharashtra" /><br />
    <input type="text" id="citrusCountry" value="India" /><br />
    <input type="text" id="citrusZip" value="400050" /><br />
    <input type="text" id="citrusMobile" value="<%= Client_Phone %>" /><br />
   <input type="text" readonly id="citrusAmount" value="<%= orderAmount %>" /><br />
    <input type="text" readonly id="citrusMerchantTxnId" value="<%= merchantTxnId %>" /><br />
    <input type="text" readonly id="citrusSignature" value="<%= securitySignature %>" /><br />
    <input type="text" readonly id="citrusReturnUrl" value="<%= returnURL %>" /><br />
    <input type="text" readonly id="citrusNotifyUrl" value="<%= notifyUrl %>" /><br />

        <select id="citrusCardType">
        <option selected="selected" value="credit">Credit</option>
        <option value="debit">Debit</option>
    </select><br />
    <select id="citrusScheme">
        <option selected="selected" value="VISA">VISA</option>
        <option value="mastercard">MASTER</option>
    </select><br />
    <input type="text" id="citrusNumber" value=""/><br />
    <input type="text" id="citrusCardHolder" value=""/><br />
    <input type="text" id="citrusExpiry" value=""/><br />
    <input type="text" id="citrusCvv" value=""/><br />
    <input type="submit" value="Pay Now" id="citrusCardPayButton"/><br />
    </form>
</body>
</html>
