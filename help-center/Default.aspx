<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="pricing_Default" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/FooterWithoutCalc.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ OutputCache Duration=5 VaryByParam="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FAQ-New</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="title" content="faq" />
    <meta name="description" content="faq" />
	<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  
  <link href="css/style.css" rel="stylesheet" />
     <script src="../js1/jquery.min.js"> </script>
    <link rel="stylesheet" href="../fonts/css/font-awesome.min.css" />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>


    <link href="../css-web/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../css-web/style.css" rel="stylesheet" type="text/css" />
<link href="../css-web/media-style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css-web/hover.css" />
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css"/>
<link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css"/>
<link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css"/>
<link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css"/>
<link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css"/>
<link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css"/>
   





 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
   <script src="../js-web/modernizr.js"></script><!-- Modernizr -->
<script type="javascript">
function bringtofront()
{
$(".cd-dropdown-content").show();
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
    <script type="text/javascript">

        function fnshow()
        {
          
            $('#outputbox').css('display', 'block');
        }
         
       
    </script>

    <style type="text/css">
        .faq-bg {
            background: url(../images1/faq-new.jpg);
            background-size: cover;
            -webkit-background-size: cover;
            -o-background-size: cover;
            -moz-background-size: cover;
            -ms-background-size: cover;
            min-height: 550px;
        }

    .help-center {
    top: 10em;
}
.help-center h1 {
    font-size: 48px;
    color: #FFF;
    font-family: "century_schoolbookregular";
}
.help-center p {
    font-size: 20px;
    color: #FFF;
    line-height: 45px;
}

.help-search
{
width: 600px;
  height: 40px;
  padding: 0 10px 0 10px;
background-color: #fff;
 
 border: 1px solid #c8c8c8;
  border-radius: 3px;
  color: #aeaeae;
  font-weight:normal;
  font-size: 1.1em;
 
 -webkit-transition: all 0.2s linear;
  -moz-transition: all 0.2s linear;
  transition: all 0.2s linear;
}
@media only screen and (max-width: 768px)
{
.help-search
{
width:250px;

}
}
.searchfield { display: block; width: 100%; text-align: center; margin-bottom: 35px; }


.searchfield form {
  display: inline-block;
  background: #eeefed;
  padding: 0;
  margin: 0;
 
 padding: 2px;
  border-radius: 3px;
  margin: 5px 0 0 0;
}

.searchfield.biginput {
  width: 600px;
  height: 40px;
  padding: 0 10px 0 10px;
  background-color: #fff;
 
 border: 1px solid #c8c8c8;
  border-radius: 3px;
  color: #aeaeae;
  font-weight:normal;
  font-size: 1.1em;
 
 -webkit-transition: all 0.2s linear;
  -moz-transition: all 0.2s linear;
  transition: all 0.2s linear;
}

.searchfield form .biginput:focus {
  color: #858585;
}
    .searchfield label {
        padding-right:17px;
    }
   
  .searchfield label i {
        margin-left:17px;
    }



.flatbtn {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  outline: 0;
  border: 0;
  color: #f3faef;
  text-decoration: none;
  background-color: #6bb642;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  font-size: 1.2em;
  font-weight: bold;
  padding: 12px 22px 12px 22px;
  line-height: normal;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  text-transform: uppercase;
  text-shadow: 0 1px 0 rgba(0,0,0,0.3);
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  -moz-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
}
.flatbtn:hover {
  color: #fff;
  background-color: #73c437;
}
.flatbtn:active {
  -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
  -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
  box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
}



.autocomplete-suggestions { border: 1px solid #999; background: #fff; cursor: default; overflow: auto; }
.autocomplete-suggestion { padding: 10px 5px; font-size: 1.2em; white-space: nowrap; overflow: hidden; }
.autocomplete-selected { background: #f0f0f0; }
.autocomplete-suggestions strong { font-weight: normal; color: #3399ff; }

    </style>
	<script type='text/javascript'>
var $zoho= $zoho || {salesiq:{values:{},ready:function(){$zoho.salesiq.floatbutton.visible('hide');}}}; var d=document; s=d.createElement('script'); s.type='text/javascript'; s.defer=true; s.src='https://salesiq.zoho.com/russsh/float.ls?embedname=russsh'; t=d.getElementsByTagName('script')[0]; t.parentNode.insertBefore(s,t);
</script>

</head>
<body>
<form name="frmMain" runat="server">
    <div id="home" class="faq-bg">
        <div class="top-header">
            <div class="container">
                <uc:Header ID="Header" runat="server" MinValue="1" MaxValue="10" />
            </div>
        </div>
        <div id="responsive_menu"></div>
        <div class="banner">
            <div class="col-md-12 col-sm-12 help-center">
                <h1 style="color: white; font-size: 35px; text-align: center; margin-top: 100px; font-family:courgette;">Help Center</h1>
                
                <br />
                <div class="clearfix"></div>

            </div>
            <div class="col-md-offset-1 col-md-10 col-md-offset-1 col-sm-12 help-center">
               <p style="color: white; line-height:30px; font-size: 22px; text-align: center;">Below are answers to some common questions about our service. Should you need more information you can contact us by <span style="color:orange;"> +91-8080808315</span>
</p>
             </div>
            <div class="clearfix"></div>


        </div>
    </div>
    <div class="container padding-tb30">
        <div class="row">
            <div class="col-md-12 padding-tb15 text-center">
                <div class="searchfield">
                    <form>
                    <input class="help-search" type="text" placeholder="Get Help !" name="currency" id="autocomplete">
                        <label style="background-color:#CCC; padding-top:11px; padding-bottom:9px;"><i style="padding-top:-2px;" class="fa fa-search"></i></label>


                    </form>
                </div>

            </div>
             <div class="col-md-offset-1 col-md-10 col-md-offset-1"  >
            <div id="outputbox" style="display:none">
                <p id="outputcontent"></p>
            </div>
            </div>

        </div>
       
            <div class="col-md-offset-1 col-md-10 col-md-offset-1">
                <div class="accordion-wrapper">
                    <div class="ac-pane active">
                        <a href="#" class="ac-title">
                            <span>What are the operational hours?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Russsh operates from 8am to 10pm from Mon-Sat and from 9am-6pm on Sundays. Russsh operates 365 days a year. 
                        </div>
                    </div>
                    <div class="ac-pane" id="div1">
                        <a href="#" class="ac-title">
                            <span>Can I place an order after operational hours? What if I place an order?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            If you place an order after operational hours you will not receive a confirmation in 20 minutes. Instead a confirmation will be sent the following day after 8am.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>Where can Russsh deliver my parcel?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Russsh delivers in Mumbai, Thane and Navi Mumbai. There may be additional delivery charges if you want to send a parcel or pickup one from places like Virar, Kalyan and Panvel. Please call our customer service dept on +91-8080808315 or live chat on our website <a href="http://www.russsh.com/">www.russsh.com</a>.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>How much time does a single pick up and delivery take?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            On average a single pickup and drop may take 2-4 hours from the time a pickup has been done. If you want a pick and delivery to be done under 2 hours you can choose our EXPRESS delivery service.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What are the delivery charges?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Please visit our pricing page for charges.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>How do I place an order?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            To place an order online, visit <a href="http://www.russsh.com/signin/"></a>& follow instructions. 
                                   <br />
                            To place an order on the phone, call +91-8080808315
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>How do I know if Russsh has received my order?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            When we receive your order we will send a confirmation by email and sms on your registered email address and mobile number in 20 minutes from the time we receive your order.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What if my parcel is lost or damaged during delivery by Russsh?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            “We take complete responsibility for all the products handled by our team” hence any loss or damaged while doing a delivery will be covered by us.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>How does cash delivery work?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Russsh will charge a flat 2% cash handling fees for any kind of cash delivery. 
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>Does russsh do midnight deliveries?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Yes, we do midnight deliveries. Please call our customer service for information on midnight deliveries +91-8080808315.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>Do you deliver outside Mumbai? What are the charges</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Yes. These are the places we deliver to outside Mumbai (Bhayander to Virar, Thane to Kalyan and Belapur to Panvel) For charges visit pricing page. 
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What if I cannot find the item I want to deliver in the list?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            If the item you want to send is not there in the list please choose ‘Other’, we’ll add this item to the list in the future.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>Why should I add an instruction. What should I write here?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            If you add an instruction here it will help us understand your request and act on it more efficiently. Here’s an example of an instruction

Michelle wants to send a Bow-tie to a friend as a gift. So she chooses gift as the item to be delivered. In the instructions she mentions that the delivery shouldn’t be later than 10pm as the receiver wouldn’t be available. She also wants to ensure we do not mention to the receiver that it was her who sent the gift.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>Why should I mention the value of the item?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Mentioning an approximate value of the item helps us ensure your item is safe at all times during a delivery. It also helps us identify the safest mode of transport.In case if your parcel is lost or damaged during transit we will only be liable to refund the value mentioned at the time of booking a task.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What if I don’t know the value of my item that I want to deliver?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Please choose the closest approximate value in case you are not sure above the correct value.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>Why should I choose the weight of the item?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            All items up to 5kg can be delivered within the service cost. If your item exceeds 5kg there will be an extra charge of Rs.100 for every additional 5kgs. For e.g. if your item weighs 7kg, you will have to pay an extra Rs.100 and if your item weighs 12 kg you will have to pay Rs.200 extra.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What if I do not know the weight of the item?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Our delivery executive always carries a weighing scale, on pick up your item will be weighed and this will be informed to you.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>When should I choose a one way delivery</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            You should choose a one way delivery when you want Russsh to pickup an item from point a and deliver it to point b.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>When should I choose a return delivery?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            You should choose a return delivery when you want Russsh to pickup an item from point a and deliver it to point b, then you want another item or cash to be picked from point b and delivered back to point a.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>When should I choose single pickup and multiple delivery?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            You should choose single pickup and multiple delivery when you want Russsh to pickup lots of items from point a and deliver it to point b, c,d,e,f and more.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>When should I choose an express delivery?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            You should an express delivery when you want us to pickup and deliver an item within 2 hours. 
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What if I haven’t received a confirmation from Russsh about my delivery?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Please call our customer care on +91-8080808315 or live chat on our site <a href="http://www.russsh.com/"></a>
                            You can also inbox us on our facebook page <a href="https://www.facebook.com/Getmypeon">(https://www.facebook.com/Getmypeon)</a> or direct message us on Twitter <a href="https://www.twitter.com/russsh_in">(https://www.twitter.com/russsh_in).</a>
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What if I want to cancel my order?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            You can cancel your order anytime, but a cancellation fee will be charged if the order is cancelled 2 hours prior your pickup time. 
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What is the cancellation charge?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            If a task is not cancelled 2 hours prior the pickup time, cancellation fees of Rs 100/- will be applicable.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What if Russsh is late for pickup or delivery?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            Please call our customer service on +91-8080808315 to check with our team. It almost never happens that our delivery executives are late and we have not informed you.
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What if I keep the delivery executive waiting at the pickup or delivery point?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            If you keep our delivery executive waiting at either pickup and/or delivery point you will have to pay an additional waiting charge of Rs.100 for every 30 minutes. Please note our delivery executive will wait for 15 minutes at the pickup or delivery point for which you will not be charged. 
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>What should I do if my item is lost or damaged during transit?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            If your item gets damaged or is lost during transit we will reimburse you for the damage. 
                        </div>
                    </div>
                    <div class="ac-pane">
                        <a href="#" class="ac-title">
                            <span>How do I make a payment?</span>
                            <i class="fa"></i>
                        </a>
                        <div class="ac-content">
                            You can pay in these ways:
                                    <ol>
                                        <li>Cash at the pickup or delivery point</li>
                                        <li>Using credit/debit card</li>
                                        <li>Pay using an e-wallet. For more information on e-wallet download this <strong>manual</strong> for information</li>
                                    </ol>
                        </div>
                    </div>

                </div>

            </div>
        </div>

   





     <div id="includedContent1"> <fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" /></div>
 

    
    <script src="js/paccordion.js"></script>

    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>
    <script type="text/javascript" src="js/currency-autocomplete.js"></script>

</form>
</body>
</html>
