<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultOld.aspx.cs" Inherits="DefaultOld" %>
<%@ Register TagPrefix="uc" TagName="Header"  Src="~/InnerHeader.ascx" %>
<!DOCTYPE HTML>
<html>
<head>
<title>#1 Same Day Delivery Service in Mumbai &amp; Thane - Russsh</title>
<meta name="google-site-verification" content="lpCFm8WvTXxBZ8jhvworjvnFsK7zR1cX4DdWPmpK0es" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="msvalidate.01" content="4BAA90E230AFEB3453DDCF0BC928B3A6" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="title" content="#1 Same Day Delivery Service in Mumbai &amp; Thane - Russsh" />
<meta name="description" content="Pick up &amp; Delivery company offering delivery service like cake delivery, food delivery, document delivery, gift delivery &amp; parcel delivery in Mumbai." />
<link rel="icon" type="image/png" href="https://www.russsh.com/images1/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="https://www.russsh.com/images1/favicon-16x16.png" sizes="16x16" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
<link href="https://www.russsh.com/css1/menutopdwop.css" rel="stylesheet" type="text/css">
<link href="https://www.russsh.com/css1/custom.css" rel="stylesheet" type="text/css">
<link href="css1/style-calculator.css" rel="stylesheet" />
<link href="css1/tabs.css" rel="stylesheet" />
<link href="https://www.russsh.com/css1/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="https://www.russsh.com/css1/style.css" rel="stylesheet" type="text/css" />
<script src="https://www.russsh.com/js1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.russsh.com/fonts/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
$(function () {
            $("#includeHeaderContent").load("header.html");
            $("#responsive_menu").load("responsive_menu.html");
            $("#serviceicons").load("serviceicons.html");
            $("#includedContent").load("footer.html"); $(".datepicker").datepicker();
            $(".datepicker").datepicker({
                dateFormat: "dd-mm-yy"
            });

            var dateFormat = $(".datepicker").datepicker("option", "dateFormat");
            $(".datepicker").datepicker("option", "dateFormat", "dd/mm/yy");


            $.ajax({
                type: "GET",
                url: "BookTask/Weight.xml",
                dataType: "xml",
                success: function (xml) {
                    var select = document.getElementById("weight1");


                    var i = 0;

                    $(xml).find('Weight').each(function () {

                        var sValue = $(this).find('WeightID').text();
                        var sText = $(this).find('WeightText').text();
                        i = i + 1;
                        var option1 = document.createElement('option');
                        option1.text = sText;
                        option1.value = sValue;
                        select.add(option1, i);
                    });
                    var select1 = document.getElementById("weight2");
                    var j = 0;

                    $(xml).find('Weight').each(function () {

                        var sValue1 = $(this).find('WeightID').text();
                        var sText1 = $(this).find('WeightText').text();
                        j = j + 1;
                        var option2 = document.createElement('option');
                        option2.text = sText1;
                        option2.value = sValue1;
                        select1.add(option2, j);
                    });
                },
                error: function () {
                    alert("An error occurred while processing XML file.");
                }
            });

            $.ajax({
                type: "GET",
                url: "BookTask/Areas.xml",
                dataType: "xml",
                success: function (xml) {
                    var select3 = document.getElementById("sparea");
                    var k = 0;
                    $(xml).find('AREAS').each(function () {
                        var sValue3 = $(this).find('Area_ID').text();
                        var sText3 = $(this).find('Area_Name').text();
                        k = k + 1;
                        var option3 = document.createElement('option');
                        option3.text = sText3;
                        option3.value = sValue3;
                        select3.add(option3, k);
                        //$("<li></li>").html(sTitle + ", " + sPublisher).appendTo("#dvContent ul");
                    });

                    var select4 = document.getElementById("sdarea");
                    var l = 0;
                    $(xml).find('AREAS').each(function () {
                        var sValue4 = $(this).find('Area_ID').text();
                        var sText4 = $(this).find('Area_Name').text();
                        l = l + 1;
                        var option4 = document.createElement('option');
                        option4.text = sText4;
                        option4.value = sValue4;
                        select4.add(option4, l);
                    });

                    var select5 = document.getElementById("rparea");
                    var m = 0;
                    $(xml).find('AREAS').each(function () {
                        var sValue5 = $(this).find('Area_ID').text();
                        var sText5 = $(this).find('Area_Name').text();
                        m = m + 1;
                        var option5 = document.createElement('option');
                        option5.text = sText5;
                        option5.value = sValue5;
                        select5.add(option5, m);
                    });

                    var select6 = document.getElementById("rdarea");
                    var n = 0;
                    $(xml).find('AREAS').each(function () {
                        var sValue6 = $(this).find('Area_ID').text();
                        var sText6 = $(this).find('Area_Name').text();
                        n = n + 1;
                        var option6 = document.createElement('option');
                        option6.text = sText6;
                        option6.value = sValue6;
                        select6.add(option6, m);
                    });

                },
                error: function () {
                    alert("An error occurred while processing XML file.");
                }
            });

        });

        function setCookie(cname, cvalue) {
            //alert(cvalue);
            document.cookie = cname + "=" + cvalue;
        }

</script> 
<script type="text/javascript">
    function checkform() {
        if (document.getElementById("email").value == "") {
            document.getElementById("email").style.color = 'red';
            document.getElementById("email").focus();
            return false;
        }
        else {
            var email = document.getElementById("email").value;
            var regex = /^([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)@([0-9a-zA-Z]([-_\\.]*[0-9a-zA-Z]+)*)[\\.]([a-zA-Z]{2,9})$/;

            if (!regex.test(email)) {

                document.getElementById("email").style.color = 'red';
                return false;
            }
            else {
                document.getElementById("email").style.color = 'black';
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
	<style>
        .side-button
{
 
  position: absolute;
  right:0;
  top: 280px;
 
  height: 257px;
  z-index: 42;
}
 .splash-banner {
    background-color:orange;
    background-size: cover;
        -webkit-background-size: cover;
        -o-background-size: cover;
        -moz-background-size: cover;
        -ms-background-size: cover;
        min-height:580px;
}
    </style>
	<script type='text/javascript'>
var $zoho= $zoho || {salesiq:{values:{},ready:function(){$zoho.salesiq.floatbutton.visible('hide');}}}; var d=document; s=d.createElement('script'); s.type='text/javascript'; s.defer=true; s.src='https://salesiq.zoho.com/russsh/float.ls?embedname=russsh'; t=d.getElementsByTagName('script')[0]; t.parentNode.insertBefore(s,t);
</script>
 <script>
        function fncalcreturn() {
           // alert('Return Charges ');
        }
        function fnsingle() {
            //alert('Single Charges ');
            var ServiceCategory = 1;
            var ProductValue = document.getElementById("spval").value;
            var ProductWeight = document.getElementById("weight1").value;
            var ReturnServiceCategory = 0;
            var ReturnProductValue = 0;
            var ReturnProductWeight = 0;
            var PickupAreaID = document.getElementById("sparea").value;
            var PickUpCityID = 1;
            var DropAreaID = document.getElementById("sdarea").value;
            var DropCityID = 1;
            var PaymentMode = "0";
            var PromoCode = "N";
            var TaskDate = document.getElementById("taskdate").value;
            var ApplyInsurance = "N";
            var TaskMode = "SINGLE";
            var IsExpress = document.getElementById("ttype").value;
            CallRequestQuote(ServiceCategory, ProductValue, ProductWeight, ReturnServiceCategory, ReturnProductValue,
                ReturnProductWeight, PickupAreaID, PickUpCityID, DropAreaID, DropCityID, PaymentMode,
                ApplyInsurance, PromoCode, TaskDate, IsExpress, TaskMode);
        }
        function fnreturn()
        {
           // alert('Return Charges ');
            var ServiceCategory = 1;
            var ProductValue = document.getElementById("rpval").value;
            var ProductWeight = document.getElementById("weight1").value;
            var ReturnServiceCategory = document.getElementById("weight2").value;;
            var ReturnProductValue = document.getElementById("rpval1").value;;
            var ReturnProductWeight = 0;
            var PickupAreaID = document.getElementById("rparea").value;
            var PickUpCityID = 1;
            var DropAreaID = document.getElementById("rdarea").value;
            var DropCityID = 1;
            var PaymentMode = "0";
            var PromoCode = "N";
            var TaskDate = document.getElementById("taskdater").value;
            var ApplyInsurance = "N";
            var TaskMode = "RETURN";
            var IsExpress = document.getElementById("ttype").value;
            CallRequestQuote1(ServiceCategory, ProductValue, ProductWeight, ReturnServiceCategory, ReturnProductValue,
                ReturnProductWeight, PickupAreaID, PickUpCityID, DropAreaID, DropCityID, PaymentMode,
                ApplyInsurance, PromoCode, TaskDate, IsExpress, TaskMode);
        
        }
        function fnsnor()
        {
           // alert('single normal;');
            document.getElementById('ttype').value = "N";
        }
        function fnsexp()
        {
            /// alert('single express;')
            document.getElementById('ttype').value = "Y";
        }

        function CallRequestQuote(ServiceCategory, ProductValue, ProductWeight, ReturnServiceCategory, ReturnProductValue, ReturnProductWeight, PickupAreaID, PickUpCityID, DropAreaID, DropCityID, PaymentMode, ApplyInsurance, PromoCode, TaskDate, IsExpress, TaskMode) {

            $.ajax({
                url: "BookTask/Test.ashx",
                contentType: "application/text; charset=utf-8",
                data: {
                    'SERVICECATEGORY': ServiceCategory,
                    'PRODUCTVALUE': ProductValue,
                    'PRODUCTWEIGHT': ProductWeight,
                    'RETURNSERVICECATEGORY': ReturnServiceCategory,
                    'RETURNPRODUCTVALUE': ReturnProductValue,
                    'RETURNPRODUCTWEIGHT': ReturnProductWeight,
                    'PICKUPAREAID': PickupAreaID,
                    'PICKUPCITYID': PickUpCityID,
                    'DROPOFFAREAID': DropAreaID,
                    'DROPOFFCITYID': DropCityID,
                    'PAYMENTMODE': PaymentMode,
                    'APPLYINSURANCE': ApplyInsurance,
                    'PROMOCODE': PromoCode,
                    'TASKDATE': TaskDate,
                    'ISEXPRESS': IsExpress,
                    'TASKMODE': TaskMode

                },
                success: OnComplete,
                error: OnFail
            });
            return false;
        }

        function OnComplete(result)
        {
            var values = result.split(',');
            var taskfee = values[0];
            var excessbaggage = values[1];
            var insurancef = values[2];
            var promoc = values[3];
            var total = values[4];
            document.getElementById('total').innerHTML = total;
         }
         
         function OnFail(result) {
             alert('Request Failed');
         }
         function CallRequestQuote1(ServiceCategory, ProductValue, ProductWeight, ReturnServiceCategory, ReturnProductValue, ReturnProductWeight, PickupAreaID, PickUpCityID, DropAreaID, DropCityID, PaymentMode, ApplyInsurance, PromoCode, TaskDate, IsExpress, TaskMode) {

             $.ajax({
                 url: "BookTask/Test.ashx",
                 contentType: "application/text; charset=utf-8",
                 data: {
                     'SERVICECATEGORY': ServiceCategory,
                     'PRODUCTVALUE': ProductValue,
                     'PRODUCTWEIGHT': ProductWeight,
                     'RETURNSERVICECATEGORY': ReturnServiceCategory,
                     'RETURNPRODUCTVALUE': ReturnProductValue,
                     'RETURNPRODUCTWEIGHT': ReturnProductWeight,
                     'PICKUPAREAID': PickupAreaID,
                     'PICKUPCITYID': PickUpCityID,
                     'DROPOFFAREAID': DropAreaID,
                     'DROPOFFCITYID': DropCityID,
                     'PAYMENTMODE': PaymentMode,
                     'APPLYINSURANCE': ApplyInsurance,
                     'PROMOCODE': PromoCode,
                     'TASKDATE': TaskDate,
                     'ISEXPRESS': IsExpress,
                     'TASKMODE': TaskMode

                 },
                 success: OnComplete1,
                 error: OnFail1
             });
             return false;
         }

         function OnComplete1(result) {
             var values = result.split(',');
             var taskfee = values[0];
             var excessbaggage = values[1];
             var insurancef = values[2];
             var promoc = values[3];
             var total = values[4];
             document.getElementById('rtotal').innerHTML = total;
         }

         function OnFail1(result) {
             alert('Request Failed');
         }
       
    </script>
</head>
<body onload="ShowIndividualServices()">
	 <form runat="server" action="https://www.russsh.com">
	<div class="side-button"><a href="https://www.russsh.com/pricing">
        <img src="https://www.russsh.com/images1/pricing-new.png" alt="pricing" class="hidden-xs hidden-sm" /> <img src="https://www.russsh.com/images1/pricing-new-sm.png" class="hidden-lg hidden-md" alt="pricing" /></a></div>
	<header class="site-header" id="sticky-nav">
        <div class="top-header">
            <div class="container">
                <uc:header id="Header" runat="server" MinValue="1" MaxValue="10" />
            </div>
        </div>
        <div id="responsive_menu"></div>
        </header>

        <div id="home" class="splash-banner">
 
      <div class="container">
          <div class="row">                    
       <div class="col-md-6 hibox">
        <h1>The #1 Delivery App!</h1>
                <p style="color:white; font-size:21px; padding-bottom:15px;">
Easiest way to deliver things around the City.</p>
           <div class="row paddingtb-20">
<div  class="col-md-12">
        <a href="https://play.google.com/store/apps/details?id=com.russsh.admin.russsh&hl=en" target="_blank"><img src="https://www.russsh.com/images1/google_play.png" alt="" /></a> <a href="https://itunes.apple.com/in/app/russsh/id1103218041?mt=8" target="_blank"><img src="https://www.russsh.com/images1/app-store.png" alt="app store" /></a>
<hr />
</div>
               </div>
           </div>
              <div class="col-md-6">
                  <div style="margin-top:50px;">
                  <img src="https://www.russsh.com/images1/app-images.png" alt="" class="img-responsive" />
                   
               </div>
 </div>
              </div>
                                                           

                    </div>                
                  
                
                  
            </div>
	<div class="about">
		<div class="container">
           
		 <h3 class="tittle wel mr10">How can we help you?</h3>
       
              
        <div id="individualservicesection" class="tpmargin">         
				<div class="about-top">                
                <hr class="hrline">             
                <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_1.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">CAKE DELIVERY</h4>                        
                        <hr class="dotted">                        
						<p>Online cake delivery in Mumbai can be a daunting task, especially with the ever bustling streets of Mumbai. No one wants to be greeted with a damaged cake, especially if it is made for a special occasion like a special anniversary or a milestone birthday.

We can help you deliver fresh cakes up to 1.5 kgs so if you need to deliver a cake i.e. 1.5kgs with or without icing we recommend you to book an <a href="https://www.uber.com/">uber</a> or an<a href="https://www.olacabs.com/"> ola </a>(your choice) and we’ll escort your cake to ensure it stays safe.

Check our<a href="https://www.facebook.com/Getmypeon/" target="_blank">&nbsp;Facebook  </a> page for testimonials if you’re still unsure if we can deliver your cake</p>                       
                       
                       <div class="clearfix"></div>                       
                                                <div class="clearfix"></div>                        
                   <div class="col-md-4">
                    <a href="book-a-task" onclick="setCookie('SERVICETYPE','1')"><h2 class="yellowbox">Book Now  </h2></a>
                    </div>                  
					</div>                    
					<div class="clearfix"></div>
                     <hr class="hrline_bottom">
                 </div>                
               	<div class="clearfix"></div> 
         
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_2.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;"> clothes delivery service</h4>
                         <hr class="dotted">
                        <p>We pick up and deliver men’s and women’s clothes anywhere in Mumbai, Thane and Vashi between 7am -10pm. Also provide delivery for dress material &amp; fabric.  Our delivery service is very convenient and reasonably priced especially if you’re looking at sending stuff over long distances. </p> 
                  <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>

                     </div>  
<div class="clearfix"></div>
<hr class="hrline_bottom">
</div>  
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_3.png" alt="">
					</div>
                 
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">Grocery Delivery</h4>
                         <hr class="dotted">
                        <p>Our grocery delivery service is designed for busy professionals, working couples, people who are new to the city and students living as a paying guest. All you have to do is share a list of grocery items (under Rs.1000) and tell us where it has to be picked up from and we’ll take care of the rest. </p> 
                  <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>
                     </div>  
<div class="clearfix"></div>
                
<hr class="hrline_bottom">
</div> 
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_4.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">Food Delivery</h4>
                         <hr class="dotted">
                        <p>Craving a piping hot, fresh meal? Thanks to our quick food delivery service, you can now tuck into a home prepared meal or a dish from your favourite restaurant within the comforts of your home or office.</p>                        
                     
                       <div class="clearfix"></div>
                         
                          <hr class="dotted">
                        <div class="clearfix"></div>
                     <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div> 
                     </div>  
<div class="clearfix"></div> 
                             
<hr class="hrline_bottom">
</div>   
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_6.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
				  
                        <h4 style="text-transform:uppercase;">FLOWERS DELIVERY</h4>
                     <hr class="dotted">
                        <p>Fresh flowers are the perfect gift for those who have everything. Our delivery executives will step in  and help you say it with flowers.</p>                         
                  <div class="col-md-4">
                    <a href="#"><h2 class="yellowbox">
                    Book Now  
                    </h2></a>
                    </div>
 
                     </div>  
<div class="clearfix"></div>
<hr class="hrline_bottom">
</div>
               <div class="about-top">
               <div class="col-md-2 about-top-left">                   
					<img src="https://www.russsh.com/images1/icons/big_5.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
				   <h4 style="text-transform:uppercase;">Gift Delivery</h4>
                     
                         <hr class="dotted">
                        <p>If you have a gift in mind and need someone to pick it up and deliver it somewhere you may be looking out for a delivery service that is prompt. You may also want the delivery to be an experience in itself which means you want it to be hassle-free and very easy. Finally, nobody likes it when their handpicked gift is lost or damaged during transit. We’ve taken these things into consideration and have come up with one of the most convenient & safe delivery services. With 3 steps you can easily schedule a gift delivery anywhere in Mumbai, Thane and Vashi.  </p>                         
                  <div class="col-md-4">
                   <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a>
                    </div> 
                     
                     </div>  
<div class="clearfix"></div>
<hr class="hrline_bottom">
</div>  
               
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_9.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
				   <h4 style="text-transform:uppercase;">BAKERY DELIVERY</h4>
                     <hr class="dotted">
                       <p>Has a sudden whiff of freshly baked goods got you craving for a bite of a fresh cream roll? While your local bakery produces a delectable array of mouth-watering delights, the long distance to the store and parking woes makes you think twice. Our delivery executives will ensure that you get only get freshest bakery goods, fast.</p> 
                      
   <div class="clearfix"></div>
                        <br>
                                            
                   <div class="col-md-4">
                   <a href="book-a-task"> <h2 class="yellowbox">Book Now  </h2></a>
                    </div>           
</div>
                
<div class="clearfix"></div>
<hr class="hrline_bottom">
</div> 
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_10.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
				   <h4 style="text-transform:uppercase;">CHOCOLATE DELIVERY</h4>
                     <hr class="dotted">
                        <p>When you are stressed, you eat chocolates and other forms of desserts.Why? Because Stressed spelt backwards is Desserts! Chocolates are very sensitive to temperature and humidity and we ensure delivery in a flash. Schedule a chocolate delivery within a few minutes, receive confirmation and start hogging!</p>                         
   <div class="clearfix"></div>
                        <br> 
                                           
                   <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">Book Now  </h2></a>
                    </div>            
</div>  
<div class="clearfix"></div>
<hr class="hrline_bottom">
</div>   
      <div id="corporateservicesection">
          	
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_2.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">PARCEL DELIVERY</h4>
                         <hr class="dotted">
                        <p>Need to send a parcel? You can trust us to deliver your parcels taking the same care that you would yourself. As our delivery executives use public transport i.e BEST &amp; Local Trains to commute we do not handle parcels over 5kg. We have 3 types of parcel
                            delivery option for you to choose from i.e. Pre-booked,Same Day and Express Delivery
                        </p> 
                        
                       <div class="clearfix"></div>                       
                        <hr class="dotted"> 
                        <div class="col-md-12 threebox">
                           
                    <h2>What are the kinds of Parcels we do not handle?</h2>
<p class="Howtext">Jewellery<br>
Cash above Rs.25000<br>
Arms/Ammunition<br>
Recreational Drugs
</p>

                       </div>
                  <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>
                     </div>  
<div class="clearfix"></div>
<hr class="hrline_bottom">
</div>  
               
        
          <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_17.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">Bulk Delivery</h4> 
                       
                         <hr class="dotted">
                        <p style="font-weight:normal;">Have things that need to go some place? At the point when most small businesses consider transportation to a client, they're liable to be centred around two things: the products quality and the client's enjoyment after getting it. However, shouldn't something be said about everything that happens in the middle?</p> 
                  <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>
                     </div>  
<div class="clearfix"></div>
                 
</div>
<hr class="hrline_bottom">
          <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_19.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">laptop delivery in mumbai</h4>
                         <hr class="dotted">
                        <p>Electronic items such as computers, laptops, hard drive, usb stick & gaming consoles have delicate internal components and require special care during deliveries.<br />
Our trained delivery executives know how to select the most appropriate mode of transport and route for delivering your electronic devices, no matter how fragile, heavy or awkward. We have the expertise to see a job through from start to finish, safely, securely and reliably. Just call us and we’ll send a delivery executive for help.</p> 
                  <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>
                     </div>  
<div class="clearfix"></div>
                 
<hr class="hrline_bottom">
</div>

          <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_18.png" alt="">
					</div>  
                <div class="col-md-10 about-top-right">
						<h4>Crockery Delivery</h4>
                         <hr class="dotted">
                        <p>Whether you need a kalash, puja thali or marigold flowers, we can deliver these to your door-step in a matter of hours. As you get busier each day in the office and spend extra minutes commuting to and fro work it’s getting all the more difficult to find time to go out and purchase crockery, dining set and other kitchen items that are needed in your day to day life or during festivals. The need of hour is a reliable, dependable delivery partner who gets your errands run (pick up &amp; delivery) in as little instructions as possible. This is exactly what Russsh stands for, quick deliveries in the least instructions which makes it a convenient service for you to use and makes you productive. </p> 
                  <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>
                     </div>  
<div class="clearfix"></div>
                  
<hr class="hrline_bottom">
</div>

          <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_20.png" alt="">
					</div>
                 
                <div class="col-md-10 about-top-right">
						<h4>Cash Delivery Service</h4>
                         <hr class="dotted">
                        <p>If you are a small or home business delivering invoices and collecting cash can be a serious problem. Obviously you cannot afford not collecting cash/cheque in return for your service. It’s not only convenient but also makes complete sense to have someone run around the city collecting your payment or deliver invoices.</p> 
               
                      <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>
                     </div>  
<div class="clearfix"></div>
                  
<hr class="hrline_bottom">
</div>
          
          
          <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="https://www.russsh.com/images1/icons/big_13.png" alt="">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4>Same Day Document Delivery</h4>
                         <hr class="dotted">
                         
                         <p>Have frantic travelling and hectic schedules left you exhausted for small errands? Are impending document deliveries piling up on
                                 your desk,await delivery? At such times,such paperwork cannot wait for you to regain your energy. But our services are designed
                                 to help you with just this. Unlike other traditional services,we pick up and drop your documents safely in a matter of time. For a
                                 one kind of a secure and reliable document delivery,you can think of us.</p> 
                  <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>
                     </div>  
<div class="clearfix"></div>
                
<hr class="hrline_bottom">
</div>


</div>
</div>	 
</div>
	</div>
<div id="includedContent"></div>
		  <div id="fixed" style="display:none;"  >
                <div class="fixedHeader">
                    GET A QUOTE <span class="pull-right">
                        <img src="https://www.russsh.com/minus.png" alt="" /></span>
                </div>
                <div class="fixedContent">
                    <div class="tabs-menu">
                        <ul>
                            <li class="current"><a href="#tab-1">Single Delivery</a></li>
                            <li><a href="#tab-2">Return Delivery </a></li>
                        </ul>
                    </div>
                    <div class="tab-price">
                        <div id="tab-1" class="tab-content">
                            <div class="row bd-btm">
                                <div class="selectParent col-md-6">
                                    <input type="text" class="form-control"  placeholder="Product Value" id="spval" style="width: 100%;" />
                                </div>
                                <div class="selectParent col-md-6">
                                    <input type="text" class="datepicker form-control" placeholder="DD/MM/YYYY" id="taskdate" style="width: 100%;" />
                                </div>
                            </div>
                        <div class="row radio bd-btm">
                            <div class="col-md-6">
                                <input id="normal" type="radio" name="service" value="normal" onclick="fnsnor()">
                                <label for="normal1">
                                    Normal Delivery
                                    <br />
                                    <span class="sm">Delivery Within 2-4 Hour</span></label>
                            </div>
                            <div class="col-md-6">
                                <input id="express1" type="radio" name="service" value="express" onclick="fnsexp()">
                                <label for="express">
                                    Express Delivery
                                    <br />
                                    <span class="sm">Delivery Within 90 min.</span></label>
                            </div>
                        </div>
                        <div class="row bd-btm">

                            <div class="selectParent col-md-12">
                                <select class="form-control" id="weight1" name="weight1" style="padding-left: 113px;">
                                </select>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <img src="location-arrow.png" style="margin-top: 25px;" height="70" alt="" />
                            </div>
                            <div class="selectParent col-md-10">
                                <div class="row bd-btm">
                                    <select class="form-control" id="sparea" name="sparea">
                                        <option value="0">Select Area</option>
                                    </select>
                                </div>
                                <div class="row bd-btm">
                                    <select class="form-control" id="sdarea" name="sdarea">
                                        <option value="0">Select Area</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row bd-btm">
                            <div class="selectParent col-md-12" style="text-align: center;">
                                <input type="button" class="button button1" style="width: 50%;" onclick="fnsingle()" value="Calculate" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 price">
                                <h3>
                                    <img src="https://www.russsh.com/rupee.png" alt="" title="" />
                                    <span id="total" runat="server"></span></h3>
                                <p>Prices will Differ as per the weight</p>
                            </div>
                        </div>

                    </div>
                    <div id="tab-2" class="tab-content">
                        <div class="row bd-btm">
                            <div class="selectParent col-md-6">
                                <input type="text" class="form-control"   placeholder="Product Value" id="rpval" style="width: 100%;" />
                            </div>
                            <div class="selectParent col-md-6">
                                <input type="text" class="datepicker form-control" placeholder="DD/MM/YYYY" id="taskdater" style="width: 100%;" />
                            </div>
                        </div>
                        <div class="row radio bd-btm">
                            <div class="col-md-6">
                                <input id="Radio1" type="radio" name="service" value="normal" onclick="fnsnor()">
                                <label for="normal">
                                    Normal Delivery
                                    <br />
                                    <span class="sm">Delivery Within 2-4 Hour</span></label>
                            </div>
                            <div class="col-md-6">
                                <input id="Radio2" type="radio" name="service" value="express" onclick="fnsexp()">
                                <label for="express">
                                    Express Delivery
                                    <br />
                                    <span class="sm">Delivery Within 90 min</span></label>
                            </div>
                        </div>
                        <div class="row bd-btm">
                            <div class="selectParent1 col-md-6">
                                <select class="form-control" id="weight2" name="weight2" style="padding-left: 42px;">
                                </select>
                            </div>
                            <div class="selectParent col-md-6">
                                <input type="text" class="form-control"  placeholder="Return Value" id="rpval1" style="width: 100%;" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <img src="https://www.russsh.com/location-arrow.png" style="margin-top: 25px;" height="80" alt="" />
                            </div>
                            <div class="selectParent col-md-10">
                                <div class="row bd-btm">
                                    <select class="form-control" id="rparea" name="rparea">
                                        <option value="0">Select Area</option>
                                    </select>
                                </div>
                                <div class="row bd-btm">
                                    <select class="form-control" id="rdarea" name="rdarea">
                                        <option value="0">Select Area</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row bd-btm">
                            <div class="selectParent col-md-12" style="text-align: center;">
                                <input type="button" class="button button1" style="width: 50%;" onclick="fnreturn();" value="Calculate" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 price">
                                <h3>
                                    <img src="https://www.russsh.com/rupee.png" alt="" title="" />
                                    <span id="rtotal" runat="server"></span></h3>
                                <p>Prices will Differ as per the weight</p>
                            </div>
                        </div>

                    </div>
                </div>



            </div>
        </div>
            <div style="width:1px;height:1px;"><input id="ttype" type="hidden"  runat="server" value="N" /></div>
<script src="https://www.russsh.com/js1/jquery-ui.js"></script>
    <script src="https://www.russsh.com/js1/tabs.js"></script>
    <script src="https://www.russsh.com/js1/chat.js"></script>
	</form>
    
</body>
</html>