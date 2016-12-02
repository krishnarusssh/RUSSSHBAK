<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SampleCheckout.aspx.cs" Inherits="SampleCheckout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"> </script>
    <script src="https://icp.citruspay.com/js/citrus.js"> </script> 
    <script src="https://icp.citruspay.com/js/jquery.payment.min.js">

    </script>
         
     <%
         string access_key = "33V4FTJQHNFOLMPAPQBG";

         string secret_key = "1298ceb059176ccaa75a6409e18f60719661f9d4";
            
         string return_url = "http://www.russsh.com/Payment/SampleResponse.aspx";

         string vanityUrl = "russshpay";
        
        Int32 unixTimestamp = (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
        string txn_id = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");
        string amount = "5.00";
        string data_string = "merchantAccessKey=" + access_key + "&transactionId=" + txn_id + "&amount=" + amount;

        byte[] key = Encoding.ASCII.GetBytes(secret_key);
        System.Security.Cryptography.HMACSHA1 hmac = new System.Security.Cryptography.HMACSHA1(key);
        System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data_string));
        string signature = BitConverter.ToString(hmac.ComputeHash(stream)).Replace("-", "").ToLower();


        citrusMerchantTxnId.Value = txn_id;
        citrusAmount.Value = amount;
        citrusSignature.Value = signature;
       
    %>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <%--User Details--%>
            First Name:
            <input type="text" readonly runat="server" id="citrusFirstName" value="firstName" /><br />
            Last Name:<input type="text" runat="server" readonly id="citrusLastName" value="lastName" /><br />
            Email:
            <input type="text" id="citrusEmail" runat="server" value="abc@abc.com" /><br />
            Password:
            <input type="password" id="citrusPassword" value="" /><br />
            Street1:
            <input type="text" readonly id="citrusStreet1" runat="server" value="street1" /><br />
            Street2:
            <input type="text" readonly id="citrusStreet2" value="street2" runat="server" /><br />
            City:
            <input type="text" readonly id="citrusCity" value="city" runat="server" /><br />
            State:
            <input type="text" readonly id="citrusState" value="Maharashtra" runat="server" /><br />
            Country:
            <input type="text" readonly id="citrusCountry" value="India" runat="server" /><br />
            Zip Code:
            <input type="text" readonly id="citrusZip" value="100000" runat="server" /><br />
            Phone:
            <input type="text" readonly id="citrusMobile" value="9999999999" runat="server" /><br />
            Amount:
            <input type="text" readonly id="citrusAmount" value="5.00" runat="server" /><br />
            Merchant Transaction ID:
            <input type="text" id="citrusMerchantTxnId" runat="server" value="" placeholder="Merchant transaction id" /><br />
            Signature:
            <input type="text" readonly id='citrusSignature' runat="server" /><br />
            <input type="hidden" readonly id='citrusMerchant' value="33V4FTJQHNFOLMPAPQBG" runat="server" /><br />
            <input type="hidden" readonly id="citrusReturnUrl" runat="server" value="http://www.russsh.com/Payment/SampleResponse.aspx" /><br />

            Payment Option:
            <select id="citrusScheme">
                <option value="VISA" selected="selected">VISA</option>
                <option value="mastercard">MASTER</option>
            </select><br />
            <input type="text" id="citrusCardType" value="credit" /><br />
            Card Number:
            <input type="text" id="citrusNumber" value="4111111111111111" /><br />
            Name as on Card:
            <input type="text" id="citrusCardHolder" value="test" /><br />
            Card Expiry Month/Year:
            <input type="text" id="citrusExpiry" value="02/2020" /><br />
            Card CVV:
            <input type="text" id="citrusCvv" value="123" /><br />
            <br />


            <input id="citrusPrepaidCardHolder" type="text" placeholder="Email Id"/>
            <br/>
            Netbanking:
           <select id="citrusAvailableOptions">
           </select>
            <br />

            <input type="button" value="Pay by Netbanking" id="citrusPaymentButton" /><br />
            <input type="button" value="Pay by Card" id="citrusCardPayButton" /><br />
            Citrus Cash:
            <input type="button" id="citrusCashPayButton" value="Pay Now"/><br />

            <script>

                CitrusPay.Merchant.Config = {
                    // Merchant details
                    Merchant: {
                        accessKey: '33V4FTJQHNFOLMPAPQBG',
                        vanityUrl: 'russshpay'  //Choose by own
                    }
                };

                //fetch the payment options
                fetchPaymentOptions();

                //Below function helps you to render the payment options on your own UI 
                //Merchants have to customize this function implementation in order to generate the UI of citrus wallet

                //for loading banks
                function handleCitrusPaymentOptions(citrusPaymentOptions) {
                    //console.log(citrusPaymentOptions);
                    if (citrusPaymentOptions.netBanking != null)
                        for (i = 0; i < citrusPaymentOptions.netBanking.length; i++) {
                            var obj = document.getElementById("citrusAvailableOptions");
                            var option = document.createElement("option");
                            option.text = citrusPaymentOptions.netBanking[i].bankName;
                            option.value = citrusPaymentOptions.netBanking[i].issuerCode;
                            obj.add(option);
                        }
                }

                function citrusServerErrorMsg(errorResponse) {
                    console.log(errorResponse);
                }
                function citrusClientErrMsg(errorResponse) {
                    console.log(errorResponse);
                }


                //Net Banking
                $('#citrusPaymentButton').on("click", function () { makePayment("netbanking") });

                //Card Payment
                $("#citrusCardPayButton").on("click", function () { makePayment("card") });

                //Citrus Cash
                $("#citrusCashPayButton").on("click", function () { makePayment("citrusbanking") });


    jQuery(function(){
      $("#citrusPaymentButton").click();
    });


            </script>
    </div>
    </form>
</body>
</html>
