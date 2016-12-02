<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="about_us_Default" %>

<%@ Register TagPrefix="uc" TagName="Header"  Src="~/InnerHeader.ascx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html>

<head>
    <title>Russsh – About this hyperlocal delivery service</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="title" content="Russsh – About this hyperlocal delivery service" />
    <meta name="description" content="Russsh is a b2c and b2b hyperlocal delivery company offering pick up & drop services in Mumbai, Thane and Vashi. Started in 2012 by Bharat Ahirwar, this startup has helped over 25000 customers in Mumbai already." />
	<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />

  
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="../css1/menutopdwop.css" rel="stylesheet" type="text/css">
    <link href="../css1/custom.css" rel="stylesheet" type="text/css">
    <link href="../css1/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../css1/style.css" rel='stylesheet' type='text/css' />
    <script src="../js1/jquery.min.js"> </script>
    <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script>
        $(function () {
            $("#includeHeaderContent").load("../header_inner.html");
            $("#responsive_menu").load("../responsive_menu_inner.html");
            $("#serviceicons").load("serviceicons.html");
            $("#includedContent").load("../footer.html");
        });
    </script>
    <script type="text/javascript">
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
    <div id="home" class="aboutbanner">
        <div class="top-header">
            <div class="container">
                <uc:header id="Header" runat="server" MinValue="1" MaxValue="10" />
            </div>
        </div>
        <div id="responsive_menu"></div>
        <div class="banner">
            <div class="col-md-7 col-sm-12 hibox">
                <h1 style="color:white;">  Want to know more about us?</h1><br />



                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>



        </div>
    </div>
    <div class="about">
        <div class="container">
            <h3 class="besoti">Be so good they can’t ignore you</h3>
            <div class="russsh_about">
                <h2>– Steve Martin</h2>
                <p>
                    Russsh is transforming the way people are taking care of chores and errands. We do this by
                    providing an easy and convenient alternative for people to outsource mundane tasks and focus
                    on the more important aspects of life. Since the launch of our services in  2012,
                    we’ve opened avenues for simplifying things with services that can help you any time.
                </p>
            </div>
            <hr class="dotted">
            <div class="about-top">
                <div class="tabcoll">
                    <ul id="myTab" class="nav-tabs tabmenu_about">
                        <li class="active left_tabcoll"><a href="#ourstory" data-toggle="tab">OUR STORY</a></li>
                        <li><a href="#ourteam" data-toggle="tab">OUR TEAM</a></li>
                        <li><a href="#media" data-toggle="tab">MEDIA</a></li>
                        <li><a href="#joinus" data-toggle="tab">JOIN US</a></li>
                    </ul>
                    <hr class="dotted">
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade in active" id="ourstory">
                            <div class="ourstory_text">
                                Not even a day has gone by that feels slow.
                                It’s an exciting place to be in, with so many tasks, so many stories.
                                It excites me to see Russsh grow right in front of my eyes.
                                <h2>– Bharat Ahirwar, Founder, Russsh</h2>
                            </div>
                            <div class="col-md-6 padd_1">
                                <img src="../images1/OURSTORY.jpg" class="img-responsive" alt="Russsh - our story">
                            </div>
                            <div class="col-md-6  ourstorybox">
                                <p>
                                    From 2012, we have revolutionized the way people run their daily chores in life by providing a professional, affordable and reliable service. Bharat Ahirwar, the founder of Russsh, once missed work and spent an entire day paying bills and running other important chores. That was when he realised that running errands is one of the biggest challenges in a city like Mumbai. Further, after a considerable amount of research, Bharat realised that there  wasn’t an easily accessible service available that can help with day-to-day tasks.
                                    <br>
                                    <br>
                                    Russsh is proud to be the sole errand-running and same-day delivery service. We completely understand and respect the urgency and confidentiality of our clients. Our customers praise us for poviding a professional, affordable and trustworthy experience.
                                </p>
                            </div>
                        </div>
                        <div class="tab-pane fade in" id="ourteam">
                            <div class="ourstory_text">
                                <h3>
                                    We realise that we are only as good as our team is. Our empowering approach has ensured that we have a motivated, happy and resourceful team geared to help our customers with a smile.
                                </h3>
                                A very friendly working culture at Russsh has enabled me to voice
                                my opinions and ideas without worrying about the hierarchy.
                                I have always enjoyed support from the management and my peers.
                                Russsh has given me endless opportunities during my tenure so far.
                                <h2>– Sofiyan Shaikh, Operations Manager</h2>
                            </div>
                            <div class="col-md-12 padd_1">
                                <img src="../images1/ourteam.jpg" class="img-responsive" alt="russsh our team">
                            </div>
                            <div class="col-md-12  ourstorybox">
                                <p style="text-align: center;">Team Russsh, 2015</p>
                            </div>
                        </div>
                        <div class="tab-pane fade in " id="media">
                            <div class="col-md-12 padd_1">
                                <img src="../images1/media.jpg" class="img-responsive" alt="media">
                            </div>
                            <div class="col-md-12 topmar">
                                <div class="col-md-2">
                                    <img src="../images1/mlogo1.jpg" class="img-responsive" alt="">
                                </div>
                                <div class="col-md-10 media_text">
                                    <h2>The Kejriwals of startups <span>13 February 2015</span></h2>
                                    <p>Russsh is transforming the way people are taking care of chores and errands. We do this by providing an easy and convenient alternative for people to outsource mundane tasks and focus on the more important aspects of life. Since the launch of our services in  2012,  we’ve opened avenues for simplifying things with a service that can help you out any time, at any place, with any errand.</p>
                                    <span><a href="#">Read more</a></span>
                                </div>
                                <div class="clearfix"></div>
                                <hr class="dotted">
                                <div class="col-md-2">
                                    <img src="../images1/mlogo2.jpg" class="img-responsive" alt="">
                                </div>
                                <div class="col-md-10 media_text">
                                    <h2>10 offbeat startups that are trying to make it big in India <span>25 January 2015</span></h2>
                                    <p>It's ingenious but, er, does it make money? Perhaps all the entrepreneurs who feature in this special package would have been asked this question at some point in their startup journey.</p>
                                    <span><a href="#">Read more</a></span>
                                </div>
                                <div class="clearfix"></div>
                                <hr class="dotted">
                                <div class="col-md-2">
                                    <img src="../images1/mlogo1.jpg" class="img-responsive" alt="">
                                </div>
                                <div class="col-md-10 media_text">
                                    <h2>Startups like 'Get My Peon' and 'Grofers' ready to run your errands now! <span>11 August 2014 </span></h2>
                                    <p>Get My Peon was started in 2012 by 29-year-old Bharat Ahirwar, who realised the trouble of setting time aside to run errands, especially during work days. The startup does all kinds of errands — from picking up forgotten items to delivering dry cleaning.</p>
                                    <span><a href="#">Read more</a></span>
                                </div>
                                <div class="clearfix"></div>
                                <hr class="dotted">
                                <div class="col-md-2">
                                    <img src="../images1/mlogo3.jpg" class="img-responsive" alt="">
                                </div>
                                <div class="col-md-10 media_text">
                                    <h2>Indians outsourcing daily tasks as employing in-house staff becomes costly<span>25 July 2014</span></h2>
                                    <p>Need someone to pay your bills and pick up your shopping, take an elderly relative to hospital or deliver 26 presents to your girlfriend on her 26th birthday?</p>
                                    <span><a href="#">Read more</a></span>
                                </div>
                                <div class="clearfix"></div>
                                <hr class="dotted">
                            </div>
                        </div>
                        <div class="tab-pane fade in " id="joinus">
                            <div class="col-md-12 padd_1">
                                <img src="../images1/joinus.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="col-md-12 joinusbox">
                                <h2>Join us</h2>
                                <hr class="dotted">
                                <p>Do you sometimes wake up feeling inspired to take charge of your life by doing something different and bringing about a change? That’s the opportunity that you have at Russsh.</p>
                                <p>We are looking for people who share our passion of getting things done and just making life simpler, for as many people as we can.</p>
                                <p>We have a culture that supports openness and where every individual’s freedom and views are  respected. Our dreams are big and we believe in working hard to get there. We also strongly believe in the power of good coffee/tea and that sharing is caring. Everyone is invited to our be a part of our open kitchen policy!</p>
                                <p>If you have the zeal and passion to make lives easier, send us your resume to hiring@russsh.com. The following positions are now open:</p>
                                <p>
                                    Errand Executives (Walker)<br>
                                    Errand Executives (Biker)<br>
                                    Search Engine Optimization Specialists<br>
                                    Social Media Specialists<br>
                                    Content Writer<br>
                                    Graphic Designer<br>
                                    Web Developer<br>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="includedContent"></div>
    <script type="text/javascript" src="../lib1/js/jquery-1.10.1.min.js"> </script>
    <script type="text/javascript" src="../lib1/js/bootstrap/bootstrap.js"></script>
    <script type="text/javascript">
        $('button').on('click', function () {
            alert('preserve attached java script data!');
        });
        $('#myTab').tabCollapse();
    </script>
</body>
</html>