<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultTest.aspx.cs" Inherits="DefaultTest" %>

<%@ Register TagPrefix="uc" TagName="Header"  Src="~/InnerHeader.ascx" %>
<!DOCTYPE HTML>
<html>
<head>
<title>#1 Same Day Delivery Service in Mumbai & Thane - Russsh</title>

<link rel="stylesheet" type="text/css" href="css-splash/bootstrap.css">
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">--%>

<link rel="stylesheet" type="text/css" href="css-splash/style.css">
<link rel="stylesheet" type="text/css" href="css-splash/splash.css">


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="msvalidate.01" content="4BAA90E230AFEB3453DDCF0BC928B3A6" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="title" content="#1 Same Day Delivery Service in Mumbai & Thane - Russsh" />
		<meta name="description" content="Pick up & Delivery company offering delivery service like cake delivery, food delivery, document delivery, gift delivery & parcel delivery in Mumbai." />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>



  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
  
  <link href="css1/menutopdwop.css" rel="stylesheet type='text/css'">
<link href="css1/custom.css" rel="stylesheet type='text/css'">
<link href="css1/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css1/style.css" rel='stylesheet' type='text/css' />
<script src="js1/jquery.min.js"> </script>
<link rel="stylesheet" href="fonts/css/font-awesome.min.css">
  <link href='//fonts.googleapis.com/css?family=PT+Mono|Abril+Fatface' rel='stylesheet' type='text/css'>
   <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script>
        $(function () {
            $("#includeHeaderContent").load("header.html");
            $("#responsive_menu").load("responsive_menu.html");
            $("#serviceicons").load("serviceicons.html");
            $("#includedContent").load("footer.html");
        });

        function setCookie(cname, cvalue) {
            alert(cvalue);
            document.cookie = cname + "=" + cvalue;
        }

    </script> 
<script language="javascript">
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

    </style>
	
</head>
<body onload="ShowIndividualServices()">


	<div class="side-button"><a href="http://www.russsh.com/pricing">
        <img src="images1/pricing-new.png" class="hidden-xs hidden-sm" /> <img src="images1/pricing-new-sm.png" class="hidden-lg hidden-md" /></a></div>
	<header class="site-header" id="sticky-nav">
        <div class="top-header">
            <div class="container">
                <uc:header id="Header" runat="server" MinValue="1" MaxValue="10" />
            </div>
        </div>
        <div id="responsive_menu"></div>
        </header>


    <section class="splash fade-in" style="background:#f9b100;  border-radius:5px; margin:10px 10px 10px 10px; ">
<div class="paddingtb-25">
<img src="images-splash/russsh.png" class="center-block"  title=""  alt=""/>
<a href="#" class="splash-arrow pull-right fade-in">Close <i class="fa  fa-times-circle"></i></a>
</div>
<div class="container">
<div class="row para">
<div  class="col-md-6">
<h2>Hello!</h2>
<p>Download our android app to schedule a delivery at your convenience in Mumbai, Thane and Navi Mumbai.  </p>
<div class="download-btn paddingtb-20 fade-in"><a href="#"><img  src="images-splash/google_play.png"  alt=""/></a></div>
<div class="row paddingtb-20">
<div  class="col-md-8">
<div class="mt-20 "><input type="tel" class="form-control" placeholder="Enter Your Mobile..." /></div>
<hr />
</div>
<div  class="col-md-4">
<div style="margin-top:25px; padding-bottom:10px;"><a href="#" class="app-link">GET APP LINK</a></div>
</div>
</div>
</div>
<div  class="col-md-3 ">
<img src="images-splash/splash-1.png" class="img-responsive"  alt=""/>
</div>
<div  class="col-md-3 ">
<img src="images-splash/1.png" class="img-responsive"  alt=""/>
</div>
</div>
</div>
</section>


          <div id="home" class="header">
                  <div class="banner">
					<div class="container">                    
                    <div class="col-md-7 col-sm-12 hibox">
                <h1>Hi!</h1>
                <p style="color:white">
Want to deliver a package?<br>
Rush a cake to someone?<br>
Relax, we will deliver it the<br>same day for you.

<a href="book-a-task"><h2>Book Now  </h2></a>
 <div class="clearfix"></div>
 </div>
                                     

                     <div class="menu_icons hoverbox"  >
   <ul>
        <li class="services_text">Some other Services<br>
            we can help you with</li>
        <li>
            <a href="http://www.russsh.com/services/cake-delivery/">
                <img src="images1/icons/icon_1.png" title="Cake" class="imgeffect" alt="Cake">
            </a>
        </li>
        <li><a href="http://www.russsh.com/services/clothes-delivery-service/">
            <img src="images1/icons/icon_2.png" title="Cloth Delivery" class="imgeffect" alt="Fashion">
        </a>
        </li>

        <li>
            <a href="http://www.russsh.com/services/grocery-shopping-and-delivery/">
                <img src="images1/icons/icon_3.png" title="Grocery" class="imgeffect" alt="Grocery">
            </a>
        </li>

        <li>
            <a href="http://www.russsh.com/services/food-delivery/">
                <img src="images1/icons/icon_4.png" title="Food" class="imgeffect" alt="Food">
            </a>
        </li>

        <li>
            <a href="http://www.russsh.com/services/flower-delivery/">
                <img src="images1/icons/icon_5.png" title="Flowers" class="imgeffect">
            </a>
        </li>
        <li>
            <a href="http://www.russsh.com/services/Laptop-computer-hard-drive-usb-delivery/">
                <img src="images1/icons/icon_19.png" title="Laptop computer hard drive usbdelivery" class="imgeffect">
            </a>
        </li>
        <li>
            <a href="http://www.russsh.com/services/Crockery-utensils-jar-delivery/">
                <img src="images1/icons/icon_18.png" title="Crockery Utensils Jar Delivery" class="imgeffect">
            </a>
        </li>





        <li>
            <a href="http://www.russsh.com/services/gift-and-flower-delivery/">
                <img src="images1/icons/icon_6.png" title="Gifts" class="imgeffect">
            </a>
        </li>


        <li>
            <a href="http://www.russsh.com/services/bakery-delivery/">
                <img src="images1/icons/icon_9.png" title="Bakery" class="imgeffect" alt="Bakery">
            </a>
        </li>

        <li>
            <a href="#chocolate_delivery">
                <img src="images1/icons/icon_10.png" title="Chocolate" class="imgeffect">
            </a>
        </li>


        <li>
            <a href="http://www.russsh.com/services/cash-cheque-delivery/">
                <img src="images1/icons/icon_20.png" title="Cash Cheque Delivery" class="imgeffect" alt="Cash Cheque Delivery">
            </a>
        </li>

        <li><a href="http://www.russsh.com/services/bulk-delivery/">
            <img src="images1/icons/icon_17.png" title="Bulk Delivery" class="imgeffect" alt="Bulk Delivery" onclick="ShowCorporateServices()"></a></li>
        
           <li><a href="http://www.russsh.com/services/same-day-document-delivery/">
               <img src="images1/icons/icon_13.png" title="Same Day Document Delivery" class="imgeffect" alt="Same Day Document Delivery" onclick="ShowCorporateServices()"></a></li>
        <li><a href="http://www.russsh.com/services/parcel-delivery/">
            <img src="images1/icons/icon_14.png" title="Parcel Delivery" class="imgeffect" alt="Parcel Delivery" onclick="ShowCorporateServices()"></a></li>
      
    </ul>
    <div class="clearfix"></div>
                       
</div>




		 <div class="clearfix"></div>	

                        <div class="clearfix"></div>
                      

					</div>				
				   </div>
                
                  
			</div>
	<div class="about">
		<div class="container">
              <a name="home_business"></a>
		 <h3 class="tittle wel mr10">How can we help you?</h3>
                <a name="cake_delivery"></a> 
              
        <div id="individualservicesection" class="tpmargin">         
				<div class="about-top">                
                <hr class="hrline">             
                <div class="col-md-2 about-top-left">
					<img src="images1/icons/big_1.png">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">CAKE DELIVERY</h4>                        
                        <hr class="dotted">                        
						<p>Online cake delivery in Mumbai can be a daunting task, especially with the ever bustling streets of Mumbai. No one wants to be greeted with a damaged cake, especially if it is made for a special occasion like a special anniversary or a milestone birthday.

We can help you deliver fresh cakes up to 1.5 kgs so if you need to deliver a cake i.e. 1.5kgs with or without icing we recommend you to book an <a href="https://www.uber.com/">uber</a> or an<a href="https://www.olacabs.com/"> ola </a>(your choice) and we’ll escort your cake to ensure it stays safe.

Check our<a href="https://www.facebook.com/Getmypeon/" target="_blank">&nbsp;Facebook  </a> page for testimonials if you’re still unsure if we can deliver your cake</p>                       
                        <a name="cloth_delivery"></a>
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
            <a name="grocery_delivery"></a>
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="images1/icons/big_2.png">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;"> clothes delivery service</h4>
                         <hr class="dotted">
                        <p>We pick up and deliver men’s and women’s clothes anywhere in Mumbai, Thane and Vashi between 7am -10pm. Also provide delivery for dress material & fabric.  Our delivery service is very convenient and reasonably priced especially if you’re looking at sending stuff over long distances. </p> 
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
					<img src="images1/icons/big_3.png">
					</div>
                      <a name="food_delivery"></a>
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
					<img src="images1/icons/big_4.png">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">Food Delivery</h4>
                         <hr class="dotted">
                        <p>Craving a piping hot, fresh meal? Thanks to our quick food delivery service, you can now tuck into a home prepared meal or a dish from your favourite restaurant within the comforts of your home or office.</p>                        
                        <a name="flower"></a>
                       <div class="clearfix"></div>
                        <a name="flower_delivery"></a>       
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
					<img src="images1/icons/big_6.png">
					</div>
                    <div class="col-md-10 about-top-right">
				   <a name="gift_delivery"></a>
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
					<img src="images1/icons/big_5.png">
					</div>
                    <div class="col-md-10 about-top-right">
				   <h4 style="text-transform:uppercase;">Gift Delivery</h4>
                       <a name="bakery_delivery"></a>
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
                <a name="bakery_delivery"></a>
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="images1/icons/big_9.png">
					</div>
                    <div class="col-md-10 about-top-right">
				   <h4 style="text-transform:uppercase;">BAKERY DELIVERY</h4>
                     <hr class="dotted">
                       <p>Has a sudden whiff of freshly baked goods got you craving for a bite of a fresh cream roll? While your local bakery produces a delectable array of mouth-watering delights, the long distance to the store and parking woes makes you think twice. Our delivery executives will ensure that you get only get freshest bakery goods, fast.</p> 
                    <a name="chocolate_delivery"></a>       
   <div class="clearfix"></div>
                        <br>
                          <!--<div class="col-md-8">
                          <div class="Choc_text">Russsh recommends: 
                          <select name="d" size="1">
                          <option>Mumbai</option>
                          </select></div>                          
                          <div class="Choc_text">Choc Affaires  <span>|</span>  Fantasie Fine Chocolates  <span>|</span>  Chocoalacarte</div>
                          </div>-->                        
                   <div class="col-md-4">
                   <a href="book-a-task"> <h2 class="yellowbox">Book Now  </h2></a>
                    </div>           
</div>
                
<div class="clearfix"></div>
<hr class="hrline_bottom">
</div> 
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="images1/icons/big_10.png">
					</div>
                    <div class="col-md-10 about-top-right">
				   <h4 style="text-transform:uppercase;">CHOCOLATE DELIVERY</h4>
                     <hr class="dotted">
                        <p>When you are stressed, you eat chocolates and other forms of desserts.Why? Because Stressed spelt backwards is Desserts! Chocolates are very sensitive to temperature and humidity and we ensure delivery in a flash. Schedule a chocolate delivery within a few minutes, receive confirmation and start hogging!</p>                         
   <div class="clearfix"></div>
                        <br> 
                          <!--<div class="col-md-8">
                          <div class="Choc_text">Russsh recommends: 
                          <select name="d" size="1">
                          <option>Mumbai</option>
                          </select></div>                          
                          <div class="Choc_text">Choc Affaires  <span>|</span>  Fantasie Fine Chocolates  <span>|</span>  Chocoalacarte</div>
                          </div>-->       <a name="parcel_delivery"></a>                         
                   <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">Book Now  </h2></a>
                    </div>            
</div>  
                    <a name="senior"></a>
<div class="clearfix"></div>
<hr class="hrline_bottom">
</div>   
      <div id="corporateservicesection">
          	
               <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="images1/icons/big_2.png">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">PARCEL DELIVERY</h4>
                         <hr class="dotted">
                        <p>Need to send a parcel? You can trust us to deliver your parcels taking the same care that you would yourself. As our delivery executives use public transport i.e BEST & Local Trains to commute we do not handle parcels over 5kg. We have 3 types of parcel
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
                  <div class="col-md-4">  <a name="bulk_delivery"></a>
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>
<a name="grocery"></a>
                     </div>  
<div class="clearfix"></div>
<hr class="hrline_bottom">
</div>  
               <!--<div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="images1/icons/big_3.png">
					</div> <a name="card"></a>
                    <div class="col-md-10 about-top-right">
						<h4>COURIER SERVICES</h4>
                         <hr class="dotted">
                        <p>Do you need to send a bunch of invoices to your clients or even a bonsai plant to your grandmother? Would you want to return that
                            forgotten USB stick to your colleague as soon as possible? With our one of a kind courier service,you can do that with ease. And the 
                            best part,you can even track your parcel via twitter with a single tweet! Now isn't that convenient enough for you?
                        </p> 
                  <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div> 
                     </div>  
<div class="clearfix"></div>
                   <a name="food_delivery"></a>
<hr class="hrline_bottom">
</div>--> 
          <!--<div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="images1/icons/big_16.png">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4>CARD DELIVERY</h4>
                         <hr class="dotted">
                        <p><b>Bulk Invitation Delivery</b><br />A special moment or event begets a special gift in return. And what is better than a well meaningful and thoughtful card? Be a special anniversary, invitation, birthday or any other special event, nothing is more delightful than opening your door and receiving a card with your name on it. Imagine how your special or loved one would feel if they were on the receiving end? Our errand executives will be perfect choice to deliver your heartfelt wishes or regards whenever the occasion arises. 
                        </p> 
                  <div class="col-md-4">
                    <a href="book-a-task"><h2 class="yellowbox">
                    Book Now  
                    </h2></a></div>
                     </div>  
<div class="clearfix"></div>
                   <a name="food_delivery"></a>

</div>-->
        
          <div class="about-top">
               <div class="col-md-2 about-top-left">
					<img src="images1/icons/big_17.png">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">Bulk Delivery</h4> 
                         <a name="laptop_delivery"></a>
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
					<img src="images1/icons/big_19.png">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4 style="text-transform:uppercase;">laptop delivery in mumbai</h4>
                         <hr class="dotted">
                        <p>Electronic items such as computers, laptops, hard drive, usb stick & gaming consoles have delicate internal components and require special care during deliveries.<br />
  <a name="crockery_delivery"></a>
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
					<img src="images1/icons/big_18.png">
					</div>
               <a name="cash_delivery"></a>    
                <div class="col-md-10 about-top-right">
						<h4>Crockery Delivery</h4>
                         <hr class="dotted">
                        <p>Whether you need a kalash, puja thali or marigold flowers, we can deliver these to your door-step in a matter of hours. As you get busier each day in the office and spend extra minutes commuting to and fro work it’s getting all the more difficult to find time to go out and purchase crockery, dining set and other kitchen items that are needed in your day to day life or during festivals. The need of hour is a reliable, dependable delivery partner who gets your errands run (pick up & delivery) in as little instructions as possible. This is exactly what Russsh stands for, quick deliveries in the least instructions which makes it a convenient service for you to use and makes you productive. </p> 
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
					<img src="images1/icons/big_20.png">
					</div>
               <a name="food_delivery"></a>    
                <div class="col-md-10 about-top-right">
						<h4>Cash Delivery Service</h4>
                         <hr class="dotted">
                        <p>If you are a small or home business delivering invoices and collecting cash can be a serious problem. Obviously you cannot afford not collecting cash/cheque in return for your service. It’s not only convenient but also makes complete sense to have someone run around the city collecting your payment or deliver invoices.</p> 
                 <a name="same_day_document_delivery"></a>
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
					<img src="images1/icons/big_13.png">
					</div>
                    <div class="col-md-10 about-top-right">
						<h4>Same Day Document Delivery</h4>
                         <hr class="dotted">
                          <a name="food_delivery"></a>
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
	 <div id="includedContent"></div>
<script src="js1/jquery-ui.js"></script>
        <script src="js-splash/main.js"></script>
        </body>
</html>