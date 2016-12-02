<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="pricing_Default" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/UCNEW/Header.ascx" %>
<%@ Register TagPrefix="fc" TagName="Footer" Src="~/UCNEW/FooterWithoutCalc.ascx" %>
<!DOCTYPE html>

<html>
<head>
    <title>Russsh- Pricing and Policies.</title>
	   <meta name="title" content="Russsh- Pricing and Policies." />
    <meta name="description" content="Everything you need to know about our delivery fee & delivery terms including policies for cancellation, waiting, extra weight, transport & private transport." />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="google-signin-client_id" content="91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com">
    <meta name="keywords" content="" />
	<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
   
    <link href="../css-web/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../css-web/style.css" rel="stylesheet" type="text/css">
<link href="../css-web/media-style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css-web/hover.css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="../plugin/owl-2016/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css" href="../plugin/flex-slider/flexslider.css">
<link rel="stylesheet" type="text/css" href="../mega-dropdown/css/style.css">
<link rel="stylesheet" type="text/css" href="../plugin/tabbed/css/style.css">
<link rel="stylesheet" type="text/css" href="../plugin/login-slider/content-slide.css">
<link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet" type="text/css">
<script src="../js-web/modernizr.js"></script><!-- Modernizr -->
<script type="javascript">
function bringtofront()
{
$(".cd-dropdown-content").show();
}
</script>
       <script src="../js1/jquery.min.js"></script>
    <link href="css/tabs.css" rel="stylesheet" />
    <script src="js/tabs.js"></script>
 
    <script type="text/javascript">
        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + "; " + expires;
        }
        document.getElementById("not_signed_inbppzyli8mpdy").innerHTML = "Google";
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
        .contact-form input[type="text"].paym_box, .contact-form input[type="password"].paym_box {
            width: 100%;
            border: solid 1px #000000;
            margin: 5px 0px;
        }

        .pass {
            padding: 9px;
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

        ._4z_b {
            width: 215px !important;
        }
    </style>
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
   

    <script src="https://apis.google.com/js/api:client.js"></script>
    <script>
        var googleUser = {};
        var startApp = function () {
            gapi.load('auth2', function () {
                // Retrieve the singleton for the GoogleAuth library and set up the client.
                auth2 = gapi.auth2.init({
                    client_id: '91098301541-s3bl45ll36gqgntna70h05buolath3jv.apps.googleusercontent.com',
                    cookiepolicy: 'single_host_origin',
                    // Request scopes in addition to 'profile' and 'email'
                    //scope: 'additional_scope'
                });
                attachSignin(document.getElementById('customBtn'));
            });
        };

        function attachSignin(element) {
            console.log(element.id);
            auth2.attachClickHandler(element, {},
                function (googleUser) {

                    window.location = "Forwarding.ashx?Email=" + googleUser.getBasicProfile().getEmail() + "&Name=" + googleUser.getBasicProfile().getName() + "&AppID=" + googleUser.getBasicProfile().getId();
                }, function (error) {
                    alert(JSON.stringify(error, undefined, 2));
                });
        }
    </script>
    <style type="text/css">
        #customBtn {
            display: inline-block;
            background: #4285f4;
            color: white;
            width: 201px;
            border-radius: 5px;
            white-space: nowrap;
        }

            #customBtn:hover {
                cursor: pointer;
            }

        span.label {
            font-weight: bold;
        }

        span.icon {
            background: url('https://google-developers.appspot.com/identity/sign-in/g-normal.png') transparent 5px 50% no-repeat;
            display: inline-block;
            vertical-align: middle;
            width: 42px;
            height: 42px;
            border: #2265d4 0px solid;
        }

        span.buttonText {
            display: inline-block;
            vertical-align: middle;
            padding-left: 42px;
            padding-right: 42px;
            font-size: 14px;
            font-weight: bold;
            /* Use the Roboto font that is loaded in the <head> */
            font-family: 'Roboto', sans-serif;
        }
    </style>
	<script type='text/javascript'>
var $zoho= $zoho || {salesiq:{values:{},ready:function(){$zoho.salesiq.floatbutton.visible('hide');}}}; var d=document; s=d.createElement('script'); s.type='text/javascript'; s.defer=true; s.src='https://salesiq.zoho.com/russsh/float.ls?embedname=russsh'; t=d.getElementsByTagName('script')[0]; t.parentNode.insertBefore(s,t);
</script>

</head>
<body>
  <form name="frmMain" runat="server">
    <div id="home" class="pricing-bg">
        <div class="top-header">
            <div class="container">
                <uc:Header ID="Header" runat="server" MinValue="1" MaxValue="10" />
            </div>
        </div>
        <div id="responsive_menu"></div>
        <div class="banner" style="margin-top:150px;">
            <div class="col-md-12 col-sm-12 hibox">
                <h1 style="color: white; font-size: 35px; text-align: center; margin-top: 50px;font-family:courgette;">Choose a plan that's right for you</h1>
                <br />
                <div class="clearfix"></div>

            </div>
            <div class="clearfix"></div>
            <div class="col-md-12 col-sm-12 hibox">
                <ul class="tabs-menu">
                    <li class="current"><a href="#tab-1">WITHIN MUMBAI</a></li>
                    <li><a href="#tab-2">OUTSIDE MUMBAI</a></li>
                </ul>
            </div>


        </div>
    </div>
    <div class="container">
		  <div class="row">
            <div class="col-md-12">
				   <br />
              
                
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
<div class="tab">
                   <div id="tab-1" class="tab-content">

                        <div class="table-responsive col-md-offset-2 col-md-8  col-md-offset-2">
                            <table class="table table-bordered table-hover">
                                <thead class="table-head">
                                    <tr>
                                        <th rowspan="2" style="vertical-align: middle;">Product Value</th>
                                        <th colspan="3">Service Fee</th>
                                        
                                    </tr>
                                    <tr>
                                        <td class="table-head">Advance</td>
                                        <td class="table-head">Same Day</td>
										    <td class="table-head">Express</td>
                                    </tr>
                                </thead>
                             <tbody>

                                    <tr>
                                        <td>Upto Rs. 50,000</td>
                                        <td>200</td>
                                        <td>250</td>
                                        <td>350</td>
                                       
                                    </tr>

                                    <tr> 
                                        <td>&nbsp;50,000 - 1,00,000</td>
                                        <td>250</td>
                                        <td>300</td>
                                        <td>400</td>
                                        
                                    </tr>

                                    <tr>
                                        <td>&nbsp;1,00,000 - 1,50,000</td>
                                         <td>300</td>
                                        <td>400</td>
                                        <td>500</td>
                                        
                                    </tr>

                                    <tr>
                                        <td>1,50,000 - 2,00,000</td>
                                       <td>400</td>
                                        <td>500</td>
                                        <td>600</td>
                                       
                                    </tr>

                                    <tr>
                                        <td>2,00,000 - 5,00,000</td>
                                        <td>500</td>
                                        <td>600</td>
                                        <td>700</td>
                                       
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-12" style="height:40px"><h3 class="besoti">Cash Delivery Charges</h3></div>
                        <div style="height:30px"></div>
                        <div class="table-responsive col-md-offset-2 col-md-8  col-md-offset-2">
                            <table class="table table-bordered table-hover">
                                <thead class="table-head">
                                    <tr>
                                        <th rowspan="2" style="vertical-align: middle;">Product Value</th>                                       
                                        <th rowspan="2" style="vertical-align: middle;">Cash Delivery</th>
                                   </tr>                                   
                                </thead>
                             <tbody>
                                    <tr>
                                        <td>Upto Rs. 7,500</td>                                       
                                        <td> 150</td>
                                    </tr>
                                    <tr> 
                                        <td>&nbsp;7,500 - 50,000</td>                                        
                                        <td> 2% </td>
                                    </tr>
                                    <tr> 
                                        <td>&nbsp;50,000 - 1,00,000</td>                                        
                                        <td> 2% </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;1,00,000 - 1,50,000</td>
                                        <td>2% </td>
                                    </tr>
                                    <tr>
                                        <td>1,50,000 - 2,00,000</td>                                      
                                        <td> 2% </td>
                                    </tr>
                                    <tr>
                                        <td>2,00,000 - 5,00,000</td>                                        
                                        <td> 5% </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-content">
           
                        <div class="table-responsive padding-tb15  col-md-offset-2 col-md-8  col-md-offset-2">
                            <table class="table table-bordered">
                                <thead class="table-head">
                                    <tr>
                                        <th>Product Value</th>
                                        <th>Service Fee</th>
                                    </tr>
                                </thead>
                              
<tbody>

                                    <tr>
                                        <td>Rs: 1 - Rs: 50000</td>
                                        <td>550</td>
                                    </tr>

                                    <tr>
                                        <td>Rs: 50001 - Rs: 100000</td>
                                        <td>600</td>
                                    </tr>

                                    <tr>
                                        <td>Rs: 100001 - Rs: 150000</td>
                                        <td>700</td>
                                    </tr>

                                    <tr>
                                        <td>Rs: 150001- Rs: 200000</td>
                                        <td>800</td>

                                    </tr>

                                    <tr>
                                        <td>Rs: 200001- Rs: 500000</td>
                                        <td>900</td>

                                    </tr>

                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row padding-tb15">
            <div class="col-md-12"><h3 class="besoti">Service Terms & Conditions</h3></div>
            <div>
                <div class="col-md-10 col-md-offset-2">
                  
                    <ul class="terms">
                        <li>General</li>
                        <li>We take complete responsibility for all the products handled by our team.</li>
                        <li>Our Pricing includes Service Tax, Local Transport and Insurance.</li>
 <li>Our pricing is subject to change on Sundays, public holidays and festivals.</li>
                    </ul>
					  <ul class="terms">
                        <li>Areas covered :</li>
                        <li>Within Mumbai - (Churchgate - Bhayander) (CST - Thane) (CST- Belapur) </li>
                        <li>Outside Mumbai -(Naigaon - Virar) (Kalwa - Kalyan) (Kharghar - Panvel)</li>
                    </ul>
 <ul class="terms">
                        <li>Transport Policy</li>
                      <li>Additional Transport will be charged at certain locations which are beyond mumbai. <br />Example : Thane, Mira Road, Bhayander, Madh Island Etc.</li>
<li>Additional Transport may vary from Rs. 50 to Rs. 100 depending on the locations.</li>
                        <li>Rickshaw, Taxi, Metro, Monorail are considered as private transport.</li>
                    </ul>
					<ul class="terms">
                        <li>Octroi : </li>
                        <li>We are not responsible any goods heldup for any octroi Taxes/Payments.</li>
                    </ul>
                    <ul class="terms">
                        <li>Cancellation Policy : </li>
                        <li>If a task is not cancelled 2 hours prior the pickup time, cancellation fees of Rs 100/-  will be applicable.</li>
                    </ul>
                    <ul class="terms">
                        <li>Waiting Policy</li>
                        <li>An executive can only wait for 15 minutes at any location (Pickup/Dropoff)</li>
                        <li>Waiting fee of Rs 100/- will be charged for every 30 minutes.</li>
                    </ul>
                    <ul class="terms">
                        <li> Baggage Policy </li>
                        <li>Rs.100/- for parcels weighing between 5kg to 10kg.</li>
                        <li>Rs.200/- for parcels weighing between 10kg to 15kg.</li>
                        <li>Rs.300/- for parcels weighing between 15kg to 20kg.</li>
                        <li>Rs 400/- for parcels weighing between 20kg to 25kg.</li>
                    </ul>
                   <ul class="terms">
                        <li> Delivery Policy for Cakes </li>
                        <li>Cakes weighing 1.5 kgs and above will be taken in private transport at any given time.</li>
                        <li>Cakes weighing 1.5 kgs and less cannot be carried in local transport during peak hours.</li>
                        
                    </ul>
                     <ul class="terms">
                        <li>Private transport will be considered in the following conditions :</li>
                        <li>Non-availability of transport at a particular pickup or drop off destination.</li>
                        <li>Carrying heavy bags (items weighing more than 5 kg)</li>
                         <li>Cakes above 1.5kg to be carried during peak hours.</li>
                         <li>Handling Expensive/Fragile items.</li>
                    </ul>
                   

                </div>
            </div>
        </div>
    </div>
  <script type="text/javascript" src="js/tabs.js"></script>
<fc:Footer ID="Footer1"
                        runat="server"
                        MinValue="1"
                        MaxValue="10" />




     
  
  
   
</form>
</body>
</html>
