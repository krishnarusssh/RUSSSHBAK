<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="faq_Default" %>
<%@ Register TagPrefix="uc" TagName="Header"  Src="~/InnerHeader.ascx" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Russsh – Help & Frequent Questions</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="title" content="Russsh – Help & Frequent Questions" />
    <meta name="description" content="Find help with answers to the most common questions asked by other customers. Full information on prices, charges and terms & conditions." />
    <meta name="keywords" content="" />
	<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

    <link href="../css1/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->

    <link href="../css1/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
<link href="../css1/custom.css" rel="stylesheet type='text/css'">
    <link href="../css1/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />

    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script>
        $(function () {
            $("#includeHeaderContent").load("../header_inner.html");
            $("#responsive_menu").load("../responsive_menu_inner.html");
            $("#serviceicons").load("serviceicons.html");
            $("#includedContent").load("../footer.html");
        });
    </script>
    <script src="../js1/jquery.min.js"> </script>
    <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
    <script type="text/javascript" src="../js1/move-top.js"></script>
    <script type="text/javascript" src="../js1/easing.js"></script>
    <script language="javascript">

        function checkform() {

            if (document.getElementById("email").value == "") {
                alert("Enter Email ID to subscribe!");
                document.getElementById("email").focus();
                return false;
            }
            else {
                var email = document.getElementById("email").value;
                var regex = /^([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)@([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)[\\.]([a-zA-Z]{2,9})$/;

                if (!regex.test(email)) {
                    alert("Enter a valid email");
                    return false;
                }
            }

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
</head>
<body>
    <!--start-header-->
    <div id="home" class="faqbanner">
        <div class="top-header">
            <div class="container">
                <!--  <!-- <div class="menu_icon">= Menu </div>-->
                <!--nav-->
                <uc:header id="Header" runat="server" MinValue="1" MaxValue="10" />
            </div>
        </div>
        <div id="responsive_menu"></div>

        <div class="banner">
            <div class="container">
            </div>

        </div>
    </div>
    <!--//end-slider-->
    <!--start-about-->
    <!--start-about-->
    <div class="about">
        <div class="container">

            <h3 class="Wantto_text">Want to know more?</h3>

            <hr class="dotted">

            <div class="about-top">
                <div class="tabcoll">
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active left_tabcoll"><a href="#COSTS" data-toggle="tab">COSTS</a></li>
                        <li><a href="#HOWDOES" data-toggle="tab">HOW DOES IT WORK?</a></li>
                        <li><a href="#DOYOU" data-toggle="tab">DO YOU HAVE QUERY?</a></li>


                    </ul>

                    <hr class="dotted">

                    <div id="myTabContent" class="tab-content">
                        <!--COSTS-->
                        <div class="tab-pane fade in active" id="COSTS">

                            <div class="col-md-4 grybox">
                                <h2>ADVANCE DELIVERY</h2>
                                <h3>150 Per Delivery</h3>
                                <p class="lineheig" style="text-align:center">One day advance notice<p>
                                <p class="lineheig" style="text-align: center">You should place your order between 7am-8pm on the previous day</p>
                                <p class="lineheig" style="text-align: center">Orders placed post 8pm for the next day will be treated as a same day delivery and charged accordingly</p>
                                <p class="lineheig" style="text-align: center">Ideal for bakers, home businesses & small businesses</p>
                                <p><a href="../book-a-task">
                                    <h2 class="yellowbox grybox_btn">Please place your Order <span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="color: #FFFFFF;"></span></h2>
                                </a></p>
                            </div>


                            <div class="col-md-4 grybox">
                                <h2>SAME DAY DELIVERY</h2>
                                <h3>200 Per Delivery</h3>
                                <p class="lineheig">Same day execution</p>
                                <p class="lineheig">Atleast 2 hr notice to ensure we don't leave you waiting</p>
                                <p class="lineheig">Ideal for busy professionals, event organizers</p>
                                &nbsp;<br>
                                &nbsp;<br>
                                &nbsp; <a name="insurance"></a>
                                <p><a href="../book-a-task">
                                    <h2 class="yellowbox grybox_btn">Please place your Order <span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="color: #FFFFFF;"></span></h2>
                                </a></p>
                            </div>


                            <div class="col-md-4 grybox" style="margin-right: 0em;">
                                <h2>EXPRESS DELIVERY</h2>
                                <h3>300 Per Delivery</h3>
                                <p class="lineheig">
                                    Execution under 90 mins<br>
                                    (not from booking time)<p>
                                <p class="lineheig">Ideal for all urgent deliverys like<br>
                                    medicine delivery, important<br>
                                    documents</p>
                                <p>
                                    <br>
                                    <br>
                                    <br>
                                </p>
                                <p><a href="../book-a-task">
                                    <h2 class="yellowbox grybox_btn">Please place your Order <span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="color: #FFFFFF;"></span></h2>
                                </a></p>
                            </div>
                            <div class="clearfix"></div>

                            <p class="Includes_text">Includes public transport  <span style="color: #fcaf17;">&diams;</span> Cancellation Fee Rs.100  <span style="color: #fcaf17;">&diams;</span> Waiting Fee Rs.100 after 15 mins  <span style="color: #fcaf17;">&diams;</span> Excess baggage fee Rs.100 for items more than 5kgs  Jewellery & Cash above Rs.25000 will not be handled <span style="color: #fcaf17;">&diams;</span> Extra charges for cake above 1.5kgs</p>

                            <div class="clearfix"></div>
 
                            <div class="col-md-6">
                                <div class="How_bootombox">
                                    <ul>

                                        <li>
                                            <h2>What is the cost of a same day delivery ? </h2>
                                            <p>Rs 200/- per delivery including local transport within Mumbai limits.</p>
                                           
                                        </li>

                                        <li>
                                            <h2>What is cost of an advance delivery ? </h2>
                                            <p>Rs 150/- per delivery including local transport within Mumbai limits.</p>
                                        </li>

                                        <li>
                                            <h2>What is the cost of an express delivery ? </h2>
                                            <p>Rs 300/- per delivery including local transport within Mumbai limits. </p>
                                        </li>

                                        <li>
                                            <h2>What is the delivery time frame in a single task ? </h2>
                                            <p>The delivery will be done within 3 hours.</p>
                                        </li>
                                         <li>
                                            <h2>What is a Return delivery ? </h2>
                                            <p>Pickup from point A and deliver to point B then, <br />Pickup from point B and deliver back to point A. </p>
                                        </li>

                                        <li>
                                            <h2>What is Multiple delivery ? </h2>
                                            <p>Pickup from point A and delivery to multiple points B,C,D … </p>
                                        </li>

                                        <li>
                                            <h2>What are the working days ? </h2>
                                            <p>We work 7 days in a  week, Sunday to Saturday.</p>
                                        </li>

                                        <li>
                                            <h2>What are the business hours ? </h2>
                                            <p>It's from 7am till 10.00pm </p>
                                            
                                        </li>

                                        <li>
                                            <h2>Do you offer midnight deliveries ? </h2>
                                            <p>Yes we do delivery for midnight surprises. </p>
                                        </li>

                                        <li>
                                            <h2>What is a waiting fee ? </h2>
                                            <p>Waiting fee is charged when an executive is made to wait at a particular location before or after the handover of the delivery. </p>
                                        </li>

                                        <li>
                                            <h2>What are the charges of the waiting fee ?  </h2>
                                            <p>First 15min of waiting time is free for a client <br />Later its Rs 100 for every 30 minutes. </p>
                                        </li>

                                        <li>
                                            <h2>What is the cancellation policy ? </h2>
                                            <p>When a delivery is cancelled last minute cancellation fee is applicable. </p>
                                        </li>
                                        <li>
                                            <h2>What is the cancellation fees ? </h2>
                                            <p>Its Rs 100/-  </p>
                                        </li>
                                         <li>
                                            <h2>What is an excess baggage ?  </h2>
                                            <p>Any parcel that is heavy and more than 5kg in weight is considered as an excess baggage.</p>
                                        </li>
                                        <li>
                                            <h2>What are the excess baggage charges ?  </h2>
                                            <p>
                                                <ul>
                                                    <li>0 - 5 kg Free </li>
                                                    <li>05 - 10 kg rs 100/- </li>
                                                    <li>10 - 15 kg rs 200/- </li>
                                                    <li>15 - 20 kg rs 300/- </li>
                                                    <li>20 - 25 kg rs 500/- </li>
                                                </ul>
                                            </p>
                                        </li>
                                        <li>
                                            <h2>What do we cover in Mumbai ?  </h2>
                                            <p>We cover Mumbai, Thane & Navi Mumbai </p>
                                        </li>
                                         <li>
                                            <h2>What is covered in Zone 1 ?  </h2>
                                            <p>
                                                <ul>
                                                    <li>Churchgate - Bhayander </li>
                                                      <li>C.S.T - Thane </li>
                                                     <li>C.S.T - Belapur </li>
                                                </ul>
                                             </p>
                                        </li>
                                         <li>
                                           <h2>What is covered in Zone 2 ?  </h2>
                                            <p>
                                                <ul>
                                                    <li>Bhayander - Virar  </li>
                                                      <li>Thane - Kalyan </li>
                                                     <li>Belapur - Panvel </li>
                                                </ul>
                                             </p>
                                        </li>
                                        <li>
                                            <h2>What are the delivery fees within the zone ? </h2>
                                            <p>The delivery fees within the zone is Rs 150, 200, 300/-  </p>
                                        </li>
                                          <li>
                                            <h2>What is the delivery fees across the zone ? </h2>
                                            <p>The delivery fees from zone 1 to zone 2 is Rs 400/- + additional transport. </p>
                                          </li>
                                         <li>
                                            <h2>Do you deliver outside Mumbai ? </h2>
                                            <p>Yes we do but the service fee varies as per the location <br />Please call our team on 8080808315 for more information  </p>
                                         </li>
                                         <li>
                                            <h2>Do you offer Bulk deliveries ?  </h2>
                                            <p>Yes we do a lot of bulk deliveries for Corporates, Festivals & personal events. <br />Please email us on support@russsh.com on the same <br />Call us on 8080808315 for more information  </p>
                                         </li>
                                         <li>
                                            <h2>Do you offer B2B packages ? </h2>
                                            <p>Yes we do offer business to business packages for Entrepreneurs, Startups, SME. MSME, Corporates etc. <br />Please email us on support@russsh.com on the same <br />Call us on 8080808315 for more information  </p>
                                         </li>
                                      <li>
                                            <h2>Do you delivery food products ? </h2>
                                            <p>Yes we do deliver food products from Restaurants, Home Bakers & Home Chefs</p>
                                         </li>
                                         <li>
                                            <h2>What is the mode of delivery for food products ? </h2>
                                            <p>The weight and size of the products defines the mode of transport <br />< 5 kg public transport <br />> 5 kg private transport  </p>
                                         </li>
                                         <li>
                                            <h2>How do you deliver cakes & cupcakes ? </h2>
                                            <p>The size of the cake defines the mode of transport  <br />0 - 1.5kg local transport ( non peak hours)  <br />1.5kg - 2.00kg private transport <br />2.0kg - 5.00kg private transport  </p>
                                         </li>
                                        
                                        
                                    </ul>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <div class="How_bootombox">
                                    <ul>
                                         <li>
                                            <h2>What are the product insurance fee ? </h2>
                                            <p>Insurance cost will be applied as per the product values as follows: <br />
                                                <ul>
                                                    <li>From Rs 1000/-   to  10,000/-  0.5 % cash handling fees.</li>
                                                    <li>From Rs 10,000/- to  20,000/-  1 % cash handling fees.</li>
                                                    <li>From Rs 20,000/- to  30,000/-  1 % cash handling fees.</li>
                                                    <li>From Rs 30,000/- to  50,000/-  1 % cash handling fees.</li>
                                                    <li>From Rs 50,000/- to 75,000/-   1.5 % cash handling fees</li>
                                                    <li>From Rs 75,000/- to 1,00,000/- 2 % cash handling fees</li>
                                                </ul>
                                            </p>
                                         </li>


<li>
                                            <h2>Do you handle Cash on Delivery ? </h2>
                                            <p>Yes we handle cash on delivery along with a cash handling fee. <br />
                                                <ul>
                                                    <li>From Rs 1000/-   to  10,000/-  0.5 % cash handling fees.</li>
                                                    <li>From Rs 10,000/- to  20,000/-  1 % cash handling fees.</li>
                                                    <li>From Rs 20,000/- to  30,000/-  1 % cash handling fees.</li>
                                                    <li>From Rs 30,000/- to  50,000/-  1 % cash handling fees.</li>
                                                    <li>From Rs 50,000/- to 75,000/-   1.5 % cash handling fees</li>
                                                    <li>From Rs 75,000/- to 1,00,000/- 2 % cash handling fees</li>
                                                </ul>
                                            </p>
                                         </li>
                                          <li>
                                            <h2>How do you delivery parcels ? </h2>
                                            <p>The delivery of any parcel depending on its Weight / Height / Size.  <br />< 5 kg public transport<br />> 5 kg public transport</p>
                                         </li>
                                          <li>
                                            <h2>Do you deliver cash ? </h2>
                                            <p>Yes, we help you in sending and receiving cash along with a cash handling fee.  <br />
                                                <ul>
                                                    <li>From Rs   1000/-  to   10,000/-      0.5 % cash handling fees. </li>
                                                    <li>From Rs 10,000/-  to   20,000/-      1 % cash handling fees.</li>
                                                    <li>From Rs 20,000/-  to   30,000/-      1 % cash handling fees.</li>
                                                    <li>From Rs 30,000/-  to   50,000/-      1 % cash handling fees.</li>
                                                    <li>From Rs 50,000/-  to   75,000/-      1.5 % cash handling fees</li>
                                                    <li>From Rs 75,000/-  to 1,00,000/-      2 % cash handling fees</li>
                                                </ul>
                                            </p>
                                         </li>
                                         <li>
                                            <h2>What if the product is of High Value ? </h2>
                                            <p>Any product which is of high value will be delivered via private transport. </p>
                                         </li>
                                         <li>
                                            <h2>What if the product is of Low value ?</h2>
                                            <p>Any product which is of low value will be delivered via public transport   </p>
                                         </li>
                                        <li>
                                            <h2>What is considered as a High Value product ? </h2>
                                            <p>Any products valued above Rs 15,000/- is known as high value product. </p>
                                         </li>
                                        <li>
                                            <h2>What is considered as a Low Value product ?</h2>
                                            <p>Any products valued below Rs 15,000/- is known as low value product.</p>
                                         </li>
                                        <li>
                                            <h2>What happens if my parcel is Lost  ? </h2>
                                            <p>If a parcel is lost by our executive during transit we will be liable under the following conditions: <br />
                                                <ul>
                                                    <li><b>Insured Delivery</b> : If a customer has insured the product with us and paid the insurance fee then we are completely liable as per the product value. </li>
                                                    <li><b>Un-insured delivery</b> : If a customer has not insured the product with us and not paid the insurance fee then we are liable as per the limited liability clause.   </li>
                                                </ul>
                                            </p>
                                         </li>
                                          <li>
                                            <h2>What happens if my parcel is Damaged ? </h2>
                                            <p>If a parcel is damaged by our executive during transit we will be liable under the following conditions: <br />
                                                <ul>
                                                    <li><b>Insured Delivery</b> : If a customer has insured the product with us and paid the insurance fee then we are completely liable for the damage cost and not the whole product cost. </li>
                                                    <li><b>Un-insured delivery</b> : If a customer has not insured the product with us and not paid the insurance fee then we are liable as per the limited liability clause.  </li>
                                                </ul>
                                            </p>
                                         </li>
                                         <li>
                                            <h2>Is buying product insurance mandatory ? </h2>
                                            <p>Its mandatory if you are looking to insure your product against any kind of loss / damage during transit. <br />If an insured product gets lost / damaged you are liable for a complete refund or complete damage refund.  </p>
                                         </li>
                                         <li>
                                            <h2>What happens when one does not take any insurance ? </h2>
                                            <p>If you choose to deliver a product without any insurance our liability becomes limited.  <br />
                                                <ul>
                                                    <li>0 - 25,000 liability becomes 5%</li>
                                                    <li>25,000 - 50,000 liability becomes 8%  </li>
                                                    <li>50,000 - 75,000 liability becomes 12%  </li>
                                                    <li>75,000 - 1,00,000 liability becomes 15% </li>
                                                   
                                                </ul>
                                            </p>
                                         </li>
                                          <li>
                                            <h2>When will i get the Refund ? </h2>
                                            <p>The refund will be given in 45 - 90 working days. <br />Once it's confirmed that the parcel is lost or damaged by our executive </p>
                                         </li>
                                        <li>
                                            <h2>What is the delivery time in an express task ? </h2>
                                            <p>
                                               The delivery will be done within 90 minutes

                                            </p>
                                        </li>

                                        <li>
                                            <h2>What is a Single delivery ? </h2>
                                            <p>
                                                Pickup from point A and deliver to point B. 
                                            </p>
                                        </li>

                                           <li>
                                            <h2>What is the mode of transport used in a delivery ? </h2>
                                            <p>
                                                Bus , Train, Motorbike, Rickshaw, Taxi, Metro, Uber, Tempo etc. 
                                            </p>
                                        </li>

                                        <li>
                                            <h2>What is inclusive in the service fee ? </h2>
                                            <p>The service fee is inclusive of local transport Bus and Train</p>
                                        </li>

                                        <li>
                                            <h2>Do i have to pay additional transport fees ? </h2>
                                            <p>Yes in certain cases you will have to pay an additional transport fee </p>
                                        </li>

                                        <li>
                                            <h2>What are the scenarios where additional transport is charged ? </h2>
                                            <p>Additional transport fee is charged in the following situations : 
                                                <ul>
                                                    <li>Non availability of public transport ( Bus & Train) </li>
                                                    <li>Locations beyond reach of public transport </li>
                                                    <li>To delivery heavy items that cannot be delivered  in a public transport </li>
                                                    <li>To delivery fragile items that cannot be delivered in public transport </li>
                                                    <li>If a Rickshaw, Taxi, Metro, Uber, Tempo is used for a delivery </li>
                                                    <li>Rush hour delivery </li>

                                                </ul>
                                            </p>
                                        </li>

                                        <li>
                                            <h2>How do i book a delivery ? </h2>
                                            <p>You can book a delivery on our website : <a href="http://www.russsh.com">www.russsh.com</a> <br />You can call us on 8080808315 </p>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--end COSTS-->
                        <!--HOWDOES-->
                        <div class="tab-pane fade in " id="HOWDOES">

                            <div class="clearfix"></div>

                            <div class="col-md-6">
                                <div class="How_bootombox">
                                    <ul>

                                       

                                     
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="How_bootombox">
                                    <ul>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--HOWDOES-->
                        <div class="tab-pane fade in " id="DOYOU">
                            <div class="col-md-12 padd_1">
                                <div class="contact-form">
                                    <h4>Please write to us and we will come back to you soon:</h4>
                                    <form>
                                        <input type="text" class="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
                                        <input type="text" class="text" value="Last Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Last Name';}">
                                        <input type="text" class="text" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}">
                                        <input type="text" class="text" value="Telephone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Telephone';}">

                                        <textarea value="Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Address';}" style="height: 70px; width: 98%;">Address</textarea>

                                        <textarea value=" Please type your query here" onfocus="this.value = '';" style="width: 98%;" onblur="if (this.value == '') {this.value = 'Please type your query here';}">Please type your query here</textarea>

                                        <div class="clearfix"></div>
                                        <div class="sub-button">
                                            <input name="submit" type="submit" value="SUBMIT">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!--footer-->
    <div id="includedContent"></div>
    <!-- LIB -->
    <!-- jQuery and friends -->
    <script type="text/javascript" src="../lib1/js/jquery-1.10.1.min.js"> </script>

    <!-- Bootstrap -->
    <script type="text/javascript" src="../lib1/js/bootstrap/bootstrap.js"></script>

    <!-- Bootstrap TabCollapse-->
    <!--<script type="text/javascript" src="../bootstrap-tabcollapse.js"></script>-->


    <script type="text/javascript">
        $('button').on('click', function () {
            alert('preserve attached java script data!');
        });
        $('#myTab').tabCollapse();
    </script>

</body>

<!-- Mirrored from anything-anytime.com/russsh/faq.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 17 Nov 2015 05:41:10 GMT -->
</html>

