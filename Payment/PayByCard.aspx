<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PayByCard.aspx.cs" Inherits="Payment_PayByCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <script src="https://code.jquery.com/jquery-1.11.1.min.js"> </script>
    <script src="https://www.citruspay.com/resources/pg/js/webjs/citrus.min.js"> </script>
    <script src="https://www.citruspay.com/resources/pg/js/webjs/citrus.js"> </script> 
    <script src="https://www.citruspay.com/resources/pg/js/webjs/jquery.payment.js">

    </script>
    <%-- <%
         string access_key = "DQPW4Y3F1ZP9BHKRU2J2";
         string bankid = Request.QueryString["bid"].ToString();
         string secret_key = "2d2ed82733071d05c98378f5b989e423a218554a";
            
         string return_url = "http://www.russsh.com/Payment/SampleResponse.aspx";

         string vanityUrl = "russshpay";
        
        Int32 unixTimestamp = (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
        string txn_id = HttpContext.Current.Session["CIT_MARTRANSACTIONID"].ToString();// System.DateTime.Now.ToString("yyyyMMddHHmmssffff");
        string amount = HttpContext.Current.Session["CIT_AMOUNT"].ToString();
        string data_string = "merchantAccessKey=" + access_key + "&transactionId=" + txn_id + "&amount=" + amount;

        byte[] key = Encoding.ASCII.GetBytes(secret_key);
        System.Security.Cryptography.HMACSHA1 hmac = new System.Security.Cryptography.HMACSHA1(key);
        System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data_string));
        string signature = BitConverter.ToString(hmac.ComputeHash(stream)).Replace("-", "").ToLower();


        citrusMerchantTxnId.Value = txn_id;
        citrusAmount.Value = amount;
        citrusSignature.Value = signature;
       // bankid.Value = bankid;
        citrusAvailableOptions.Value = bankid;
        citrusFirstName.Value = HttpContext.Current.Session["CIT_NAME"].ToString();
        citrusLastName.Value = HttpContext.Current.Session["CIT_NAME"].ToString();
        citrusEmail.Value = HttpContext.Current.Session["CIT_EMAIL"].ToString();
        citrusMobile.Value = HttpContext.Current.Session["CIT_PHONE"].ToString();
        citrusAmount.Value = HttpContext.Current.Session["CIT_AMOUNT"].ToString();
        citrusMerchantTxnId.Value = HttpContext.Current.Session["CIT_MARTRANSACTIONID"].ToString();
    %>--%>
</head>
<body>
     <div style="height:1px;overflow:hidden;">
    <form id="form1" runat="server">
   
         <%--User Details--%>
            First Name:
            <input type="text" readonly runat="server" id="citrusFirstName"  value="fname"  /><br />
            Last Name:<input type="text" runat="server" readonly id="citrusLastName" value="lname" /><br />
            Email:
            <input type="text" id="citrusEmail" runat="server" value="email" /><br />
            Password:
            <input type="password" id="citrusPassword" value="" /><br />
            Street1:
            <input type="text" readonly id="citrusStreet1" runat="server" value="street1" /><br />
            Street2:
            <input type="text" readonly id="citrusStreet2" value="street2" runat="server" /><br />
            City:
            <input type="text" readonly id="citrusCity" value="Mumbai" runat="server" /><br />
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
            <input type="hidden" readonly id='citrusMerchant' value="DQPW4Y3F1ZP9BHKRU2J2" runat="server" /><br />
            <input type="hidden" readonly id="citrusReturnUrl" runat="server" value="http://www.russsh.com/Payment/SampleResponse.aspx" /><br />

            Payment Option:
            <select id="citrusScheme"  runat="server" > 
                <option value="VISA" >VISA</option>
                <option value="MASTERCARD">MASTER</option>
            </select><br />
            <input type="text" id="citrusCardType" runat="server" value="credit" /><br />
            Card Number:
            <input type="text" id="citrusNumber"  runat="server"  value="4111111111111111" /><br />
            Name as on Card:
            <input type="text" id="citrusCardHolder"  runat="server"  value="test" /><br />
            Card Expiry Month/Year:
            <input type="text" id="citrusExpiry"  runat="server"  value="02/2020" /><br />
            Card CVV:
            <input type="text" id="citrusCvv"  runat="server"  value="123" /><br />
            <br />


            <input id="citrusPrepaidCardHolder" type="text" placeholder="Email Id"/>
            <br/>
            Netbanking:
           <select id="citrusAvailableOptions" runat="server">
			   <option value="0" >Select Another Bank</option>
<option value="CID005">SBI Bank</option>
<option value="CID010">HDFC Bank</option>
<option value="CID001">ICICI Bank</option>
<option value="CID002">AXIS Bank</option>
<option value="CID027">Indian Overseas Bank</option>
<option value="CID012">State Bank of Hyderabad</option>
<option value="CID011">IDBI Bank</option>
<option value="CID016">Andhra Bank</option>
<option value="CID019">Bank of India</option>
<option value="CID021">Bank of Maharashtra</option>
<option value="CID051">Canara Bank</option>
<option value="CID045">Catholic Syrian Bank</option>
<option value="CID023">Central Bank of India</option>
<option value="CID024">City Union Bank</option>
<option value="CID025">Corporation Bank</option>
<option value="CID053">Cosmos Bank</option>
<option value="CID026">DCB Bank Personal</option>
<option value="CID006">Deutsche Bank</option>
<option value="CID009">Federal Bank</option>
<option value="CID008">Indian Bank</option>
<option value="CID028">IndusInd Bank</option>
<option value="CID031">Karnataka Bank</option>
<option value="CID032">Karur Vysya Bank</option>
<option value="CID036">PNB Corporate</option>
<option value="CID044">PNB Retail</option>
<option value="CID037">South Indian Bank</option>
<option value="CID013">State Bank of Bikaner and Jaipur</option>
<option value="CID014">State Bank of Mysore</option>
<option value="CID043">State Bank of Patiala</option>
<option value="CID015">State Bank of Travancore</option>
<option value="CID070">UCO Bank</option>
<option value="CID041">United Bank of India</option>
<option value="CID042">Vijaya Bank</option>
<option value="CID004">YES Bank</option>
           </select>
            <br />

            <input type="button" value="Pay by Netbanking" id="citrusPaymentButton" /><br />
            <input type="button" value="Pay by Card" id="citrusCardPayButton" /><br />
            Citrus Cash:
            <input type="button" id="citrusCashPayButton" value="Pay Now"/><br />
        <input type="text" id="bankid" value="123" runat="server" /><br />
            <script>

                CitrusPay.Merchant.Config = {
                    // Merchant details
                    Merchant: {
                        accessKey: 'DQPW4Y3F1ZP9BHKRU2J2',
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


                jQuery(function () {
                    $("#citrusCardPayButton").click();
                });


            </script>
   
    </form>
          </div>

    <center>
        <h2>Redirecting to Payment Gateway! Pls wait a moment...</h2><br /><br />
         <img src="progressbar.gif" />
     </center>


</body>
</html>
