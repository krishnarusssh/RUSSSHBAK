<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="book_a_task_book" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Russsh</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="keywords" content="" />
	<meta name="google-site-verification" content="PCnwPC6sXKg7hAGCOZR4Ctvxj_EFT7bYmtpD7C_OGwE" />	
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="../css1/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
    <link href="../css1/custom.css" rel="stylesheet type='text/css'">
    <link href="../css1/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />
    <script src="../js1/jquery.min.js"> </script>
    <link rel="stylesheet" href="../fonts/css/font-awesome.min.css">
    <script type="text/javascript" src="../js1/move-top.js"></script>
    <script type="text/javascript" src="../js1/easing.js"></script>
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
    <script>
        $(function () {
            $("#includeHeaderContent").load("../header_inner.html");
            $("#responsive_menu").load("../responsive_menu_inner.html");
            $("#serviceicons").load("serviceicons.html");
            $("#includedContent").load("../footer.html");
        });
    </script>
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
    <style type="text/css">
        .ddl
        {
            padding: 9px;
            width: 49%;
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

        .accordionContent
        {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            width: 98%;
           
        }

        .accordionHeaderSelected
        {
            background-color: #fcaf17;
            border: 1px solid #fcaf17;
            color: white;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
            margin-top: 5px;
            padding: 10px;
            width: 98%;
        }

            .accordionHeaderSelected a:link
            {
                color: white;
                text-decoration: none;
            }

        .accordionHeader
        {
            background-color: #F5F5DC;
            border: 1px solid #fcaf17;
            color: black;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
            margin-top: 5px;
            padding: 10px;
            width: 98%;
            text-decoration: none;
        }

            .accordionHeader:hover {
                background-color: #fcaf17;
                border: 1px solid #fcaf17;
                color: white;
            }

        .t
        {
            padding: 5px;
        }

        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }

        .modalPopup
        {
            background-color: #FFFFFF;
            width: 300px;
            border: 3px solid #0DA9D0;
            border-radius: 12px;
            padding: 0;
        }

            .modalPopup .header
            {
                background-color: #2FBDF1;
                height: 30px;
                color: White;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
                border-top-left-radius: 6px;
                border-top-right-radius: 6px;
            }

            .modalPopup .body
            {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .footer
            {
                padding: 6px;
            }

            .modalPopup .yes, .modalPopup .no
            {
                height: 23px;
                color: White;
                line-height: 23px;
                text-align: center;
                font-weight: bold;
                cursor: pointer;
                border-radius: 4px;
            }

            .modalPopup .yes
            {
                background-color: #2FBDF1;
                border: 1px solid #0DA9D0;
            }

            .modalPopup .no
            {
                background-color: #9F9F9F;
                border: 1px solid #5C5C5C;
            }

        .modaal
        {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .center
        {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 400px;
            background-color: white;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .center img
            {
                height: 128px;
                width: 128px;
            }


        .mo
        {
        }

            .mo ul
            {
                list-style: inside none;
                padding: 0;
                margin: 0;
            }

                .mo ul li
                {
                    list-style: inside none;
                    padding: 0;
                    margin: 0;
                    display: block;
                    position: relative;
                }

                    .mo ul li ul
                    {
                        display: none;
                        z-index: 999;
                        position: absolute;
                        top: 15px;
                        left: 2px;
                        background-color: #FFFFFF;
                    }


                    .mo ul li:hover ul
                    {
                        display: block;
                    }

.ajax__calendar_years {
    top: 0px;
    left: 180px !important;
    height: 139px !important;
    width: 200px;
    position: absolute;
    text-align: center;
   
}
		.ajax__calendar_day {
    height: 25px !important;
    width: 25px !important;
    text-align: right;
    padding: 5px !important;
    cursor: pointer;
     font-size: 13px !important;
}
				.ajax__calendar_container {
    padding: 4px !important;
    cursor: default;
    width: 200px !important;
    height:190px !important;
    font-size: 15px !important;
    text-align: center;
    font-family: tahoma,verdana,helvetica;
    background-color:white !important;
    border: 1px solid #999999;
			
}

.ajax__calendar_container TD {
   padding:0 !important; margin:0 !important;
   
}
    </style>
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
    <div id="home" class="bookaervice_banner">
        <div class="top-header">
            <div class="container">
                <div id="includeHeaderContent"></div>
            </div>
        </div>
        <div id="responsive_menu"></div>
        <div class="banner">
            <div class="container">
            </div>
        </div>
    </div>
    <div class="about">
        <div class="container">
            <h3 class="besoti">Please place your order&nbsp;&nbsp;&nbsp;&nbsp;</h3>
          


            <asp:Label ID="lblToken" runat="server" Visible="False"></asp:Label>
            <form id="Form1" name="form1" runat="server">
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                 

                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White">.</asp:LinkButton>
                <asp:ModalPopupExtender ID="LinkButton1_ModalPopupExtender" runat="server" DynamicServicePath="" Enabled="True" PopupControlID="model_popup" TargetControlID="LinkButton1" BackgroundCssClass="modalBackground" CancelControlID="btnOk">
                </asp:ModalPopupExtender>
                <hr class="dotted">
                <div class="about-top">
                    <asp:Accordion ID="UserAccordion" runat="server" HeaderCssClass="accordionHeader"
                        HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent" FadeTransitions="true" SuppressHeaderPostbacks="true" TransitionDuration="250" FramesPerSecond="40" RequireOpenedPane="false" AutoSize="None">
                        <Panes>
                            <asp:AccordionPane ID="AccordionPane1" runat="server">
                                <Header><a href="#" class="href">Step 1/3- Task Details</a></Header>
                                <Content>
                                    <asp:Panel ID="UserReg" runat="server">
                                        <div class="contact-form">
                                            <asp:DropDownList ID="ddlTaskDetail" class="text" Style="width: 100%;" runat="server" CssClass="ddl">
                                                <asp:ListItem Value="0">Pick any one item for delivery.</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="ddlTaskDetail" Display="Dynamic" ErrorMessage="Select Task" ForeColor="#FF3300" InitialValue="0" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTaskDetail" Display="Dynamic" ErrorMessage="Select Task" ForeColor="#FF3300" InitialValue="0" ValidationGroup="f"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtTask" runat="server" class="text" Style="width: 100%;" Placeholder="Add Instructions"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTask" Display="Dynamic" ErrorMessage="Details of the task required!" ForeColor="#FF3300" ValidationGroup="v1"></asp:RequiredFieldValidator>

                                            <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtTask" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{5,250}$" ForeColor="Red" runat="server" ErrorMessage="Please fill a descriptive line for your task." ValidationGroup="v1"></asp:RegularExpressionValidator>

                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtTask" Display="Dynamic" ErrorMessage="Details of the task required!" ForeColor="#FF3300" ValidationGroup="v3"></asp:RequiredFieldValidator>

                                            <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtTask" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{5,250}$" ForeColor="Red" runat="server" ErrorMessage="Please fill a descriptive line for your task." ValidationGroup="v3"></asp:RegularExpressionValidator>

                                               <asp:TextBox ID="txtTaskValue" runat="server" class="text" Style="width: 100%;" Placeholder="How much is the parcel worth?"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtTaskValue" Display="Dynamic" ErrorMessage="How much is the parcel worth?" ForeColor="#FF3300" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" Display="Dynamic" ControlToValidate="txtTaskValue" ErrorMessage="Enter Value in numeric" ValidationExpression="^[0-9]+$" ValidationGroup="v1" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                                              <asp:TextBox ID="txtDate" runat="server"  MaxLength="10" Style="width: 100%;" Placeholder="Choose Delivery Date (DD/MM/YYYY)" AutoPostBack="True" OnTextChanged="txtDate_TextChanged" class="text" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="Task Date required!" ForeColor="#FF3300" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="Task Date required!" ForeColor="#FF3300" ValidationGroup="v3"></asp:RequiredFieldValidator>
                                       <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtDate" CssClass="black">
                                            </asp:CalendarExtender>
                                            <asp:Label ID="lblSundayMessage" runat="server" ForeColor="#006600" Text="Note: Rs. 200/- will be charged extra on booking for sunday for non-availiablity of public transport." Visible="False"></asp:Label>
                                            <asp:Label ID="lblExtraAmountFlg" runat="server" Text="0" Visible="false"></asp:Label>
                                            <asp:TextBox ID="txtBookedBy" runat="server" class="text" Style="width: 100%;" Placeholder="Please enter your full name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtBookedBy" Display="Dynamic" ErrorMessage="Your full name!" ForeColor="#FF3300" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtBookedBy" Display="Dynamic" ErrorMessage="Your full name!" ForeColor="#FF3300" ValidationGroup="v3"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtContactNo" runat="server" class="text" Style="width: 100%;" MaxLength="10" Placeholder="Your Contact No."></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtContactNo" Display="Dynamic" ErrorMessage="Contact No. required!" ForeColor="#FF3300" ValidationGroup="v1"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                                ControlToValidate="txtContactNo" ErrorMessage="Invalid Mobile No." ValidationExpression="[0-9]{10}" ValidationGroup="v1" ForeColor="#FF3300"></asp:RegularExpressionValidator>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtContactNo" Display="Dynamic" ErrorMessage="Contact No. required!" ForeColor="#FF3300" ValidationGroup="v3"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                ControlToValidate="txtContactNo" ErrorMessage="Invalid Mobile No." ValidationExpression="[0-9]{10}" ValidationGroup="v3" ForeColor="#FF3300"></asp:RegularExpressionValidator>

                                            <asp:TextBox ID="txtEmail" runat="server" class="text" Style="width: 100%;" Placeholder="Your email id"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email ID required!" ForeColor="#FF3300" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid Email ID!" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="v1"></asp:RegularExpressionValidator>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email ID required!" ForeColor="#FF3300" ValidationGroup="v3"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid Email ID!" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="v3"></asp:RegularExpressionValidator>
                                            <div class="Type_list">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <h2>Type of Delivery:</h2>
                                                        
                                                            
                                                      


                            <asp:RadioButton ID="rdoAdvanced" runat="server" Text="&nbsp;&nbsp;Advance Delivery" GroupName="m" ToolTip="Advance Delivery - Book a task for the next day between 7 AM to 8 PM" /><br />
                                                                   
     
                                                           <asp:RadioButton ID="rdoSameDay" runat="server" Text="&nbsp;&nbsp;Same Day Delivery" GroupName="m" ToolTip="Same Day - For same day tasks and tasks booked post 8 PM" /><br />
                                                            <asp:RadioButton ID="rdoExpress" runat="server" Text="&nbsp;&nbsp;Express Delivery" GroupName="m"  ToolTip="Express Task - For tasks that get completed under 90 minutes after Pickup. Task to be booked 2 hours prior to pickup" />
                                                                  

                                                  
                                                        <br />
                                                        <div>
                                                             <br />
                                            <asp:RadioButton ID="rdoOneway" runat="server" Text="&nbsp;&nbsp;Single" GroupName="m1" AutoPostBack="true" OnCheckedChanged="rdoOneway_CheckedChanged"  ToolTip="Single - i.e. Pickup from Churchgate and Drop to Andheri. *Excess baggage/waiting may apply" /><br />
                                                           
                                                              
                                                                
                                                                    <asp:RadioButton ID="rdoReturn" runat="server" Text="&nbsp;&nbsp;Return" GroupName="m1" AutoPostBack="true" OnCheckedChanged="rdoReturn_CheckedChanged" ToolTip="Return - i.e. Pickup from Churchgate, Drop to Andheri and back to Churchgate or another location. *Excess baggage/waiting may apply" /><br />
                                                         
                                                                 
                                                                     <asp:RadioButton ID="rdoMulti" runat="server" Text="&nbsp;&nbsp;Multiple delivery" GroupName="m1" AutoPostBack="true" OnCheckedChanged="rdoMulti_CheckedChanged" ToolTip="Single Pick-up Multiple Delivery - i.e. Pick-up from one location and delivery to multiple locations." /><br />
                                                         
                                                            
                                                          
                                                            <asp:RadioButton ID="rdoCod" runat="server" Text="&nbsp;&nbsp;COD" GroupName="m1" AutoPostBack="true" OnCheckedChanged="rdoCod_CheckedChanged" ToolTip="COD - i.e. Pickup from Churchgate, drop to Andheri from where cash will be collected and dropped back to Churchgate. *(Max Rs. 25000/-)" />
                                                  
                                                                     <br />
                                                            <div>
                                                                <asp:TextBox ID="txtAmount" runat="server" MaxLength="12" placeholder="COD Amount" Visible="False" Width="150px" TabIndex="13"></asp:TextBox>
                                                                <br />
                                                                <asp:Label ID="lblMessage" runat="server" Font-Size="X-Small" ForeColor="#336600" Text="Amount exceeding Rs. 9999 will be taken by cab/auto." Visible="False"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="sub-button">
                                                <asp:Button ID="btnStepOne" runat="server" Text="CONTINUE" Style="background-color: #959595; color: #FFFFFF;" ValidationGroup="v1" OnClick="btnStepOne_Click" />
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </Content>
                            </asp:AccordionPane>
                            <asp:AccordionPane ID="AccordionPane2" runat="server">
                                <Header><a href="#" class="href">Step 2/3- Pick Up Details</a></Header>
                                <Content>
                                    <asp:Panel ID="Panel1" runat="server">
                                        <div class="contact-form">
                                            <asp:TextBox ID="txtPickupName" runat="server" class="text" Style="width: 100%;" Placeholder="Name of the person at the pick-up point"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPickupName" Display="Dynamic" ErrorMessage="Pick-up person's name required!" ForeColor="#FF3300" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtPickupName" Display="Dynamic" ErrorMessage="Pick-up person's name required!" ForeColor="#FF3300" ValidationGroup="v3"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtPickupAddress" runat="server" class="text" Style="width: 100%;" Placeholder="Address"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPickupAddress" Display="Dynamic" ErrorMessage="Pick-up address in detail required!" ForeColor="#FF3300" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtPickupAddress" Display="Dynamic" ErrorMessage="Pick-up address in detail required!" ForeColor="#FF3300" ValidationGroup="v3"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtPickUpArea" runat="server" class="text" Style="width: 100%;" Placeholder="Area"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPickUpArea" Display="Dynamic" ErrorMessage="Pick-up area name required!" ForeColor="#FF3300" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtPickUpArea" Display="Dynamic" ErrorMessage="Pick-up area name required!" ForeColor="#FF3300" ValidationGroup="v3"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtPickUpCity" runat="server" class="text" Style="width: 100%;" Placeholder="City"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtPickUpCity" Display="Dynamic" ErrorMessage="Pick-up city name required!" ForeColor="#FF3300" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtPickUpCity" Display="Dynamic" ErrorMessage="Pick-up city name required!" ForeColor="#FF3300" ValidationGroup="v3"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtPickUpPinCode" runat="server" class="text" Style="width: 100%;" MaxLength="6" Placeholder="Postal Code"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtPickUpPinCode" Display="Dynamic" ErrorMessage="Enter pincode in numeric." ForeColor="#FF3300" ValidationExpression="^[0-9]+$" ValidationGroup="v2"></asp:RegularExpressionValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txtPickUpPinCode" Display="Dynamic" ErrorMessage="Enter pincode in numeric." ForeColor="#FF3300" ValidationExpression="^[0-9]+$" ValidationGroup="v3"></asp:RegularExpressionValidator>
                                            <br>
                                            <asp:TextBox ID="txtPickupMobileNo" runat="server" class="text" Style="width: 100%;" MaxLength="10" Placeholder="Phone No."></asp:TextBox>
                                            <asp:DropDownList ID="ddlPickUpTime" runat="server" CssClass="ddl" Width="200px" TabIndex="21">
                                                <asp:ListItem Value="0">Select Pick-up Time</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlPickUpTime" Display="Dynamic" ErrorMessage="Pick-up time required!" ForeColor="#FF3300" ValidationGroup="v2" InitialValue="0"></asp:RequiredFieldValidator>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtPickupMobileNo" ErrorMessage="Enter mobile no. in numeric!" ForeColor="#FF3300" ValidationExpression="^[0-9]+$" ValidationGroup="v2" Display="Dynamic"></asp:RegularExpressionValidator>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txtPickupMobileNo" ErrorMessage="Invalid Mobile No." ForeColor="#FF3300" ValidationExpression="[0-9]{10}" ValidationGroup="v2"></asp:RegularExpressionValidator>
                                            <div class="clearfix"></div>
                                            <div class="sub-button">
                                                <asp:Button ID="Button2" runat="server" Text="CONTINUE" Style="background-color: #959595; color: #FFFFFF;" ValidationGroup="v2" OnClick="btnStepTwo_Click" />
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </Content>
                            </asp:AccordionPane>
                            <asp:AccordionPane ID="AccordionPane3" runat="server">
                                <Header><a href="#" class="href">Step 3/3- Drop-off Details</a> </Header>
                                <Content>
                                    <asp:Panel ID="Panel2" runat="server">
                                        <div class="contact-form">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                                <ProgressTemplate>
                                                    <div class="modaal">
                                                        <div class="center">
                                                            <i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Processing the task. Please wait. </i>
                                                            <center><img alt="" src="loader.gif" /></center>
                                                        </div>
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <asp:Label ID="lblDropOff_Address" runat="server" Style="font-weight: 700"></asp:Label></h4>
        <asp:Label ID="lblID" runat="server" Visible="False">0</asp:Label>
                                                    <asp:Label ID="lblGuid" runat="server" Visible="false"></asp:Label>
                                                    <asp:TextBox ID="txtDropoffName" runat="server" class="text" Style="width: 100%;" Placeholder="Name of the person at the delivery point."></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtDropoffName" Display="Dynamic" ErrorMessage="Drop-off person's name required!" ForeColor="#FF3300" ValidationGroup="f"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtDropoffName" Display="Dynamic" ErrorMessage="Drop-off person's name required!" ForeColor="#FF3300" ValidationGroup="t"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="txtDropOffAddress" runat="server" class="text" Style="width: 100%;" Placeholder="Address"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtDropOffAddress" Display="Dynamic" ErrorMessage="Drop-off address in detail required!" ForeColor="#FF3300" ValidationGroup="f"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtDropOffAddress" Display="Dynamic" ErrorMessage="Drop-off address in detail required!" ForeColor="#FF3300" ValidationGroup="t"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="txtDropArea" runat="server" class="text" Style="width: 100%;" Placeholder="Area"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtDropArea" Display="Dynamic" ErrorMessage="Drop-off address in detail required!" ForeColor="#FF3300" ValidationGroup="f"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtDropArea" Display="Dynamic" ErrorMessage="Drop-off address in detail required!" ForeColor="#FF3300" ValidationGroup="t"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="txtDropCity" runat="server" class="text" Style="width: 100%;" Placeholder="City"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtDropCity" Display="Dynamic" ErrorMessage="Drop-off city name required!" ForeColor="#FF3300" ValidationGroup="f"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtDropCity" Display="Dynamic" ErrorMessage="Drop-off city name required!" ForeColor="#FF3300" ValidationGroup="t"></asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="txtDropOffPinCode" runat="server" class="text" Style="width: 100%;" MaxLength="6" Placeholder="Postal Code"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtDropOffPinCode" Display="Dynamic" ErrorMessage="Enter pincode in numeric!" ForeColor="#FF3300" ValidationExpression="^[0-9]+$" ValidationGroup="f"></asp:RegularExpressionValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="txtDropOffPinCode" Display="Dynamic" ErrorMessage="Enter pincode in numeric!" ForeColor="#FF3300" ValidationExpression="^[0-9]+$" ValidationGroup="t"></asp:RegularExpressionValidator>
                                                    <asp:TextBox ID="txtDropOffMobileNo" runat="server" class="text" Style="width: 100%;" MaxLength="10" Placeholder="Phone No."></asp:TextBox>
                                                    <asp:DropDownList ID="ddlDropOffTime" runat="server" TabIndex="29" Width="200px" CssClass="ddl">
                                                        <asp:ListItem Value="0">Select Drop-up Time</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlDropOffTime" Display="Dynamic" ErrorMessage="Pick-up time required!" ForeColor="#FF3300" ValidationGroup="f" InitialValue="0"></asp:RequiredFieldValidator>
                                                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" TabIndex="30" Text="[+] Add" ValidationGroup="t" Visible="False" CssClass="myButton" Width="120px" />
                                                    &nbsp;<asp:Label ID="lblMultiadd" runat="server" Text="[Click Add to add the address]" Visible="false"></asp:Label>
                                                    <asp:Label ID="lblAddressCount" runat="server" Text="1" Visible="False"></asp:Label>
                                                    <div id="multipleaddress" runat="server">
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnRowCommand="GridView1_RowCommand" Width="100%">
                                                            <AlternatingRowStyle BackColor="#F9F9F9" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Addresses">
                                                                    <ItemTemplate>
                                                                        <table style="width: 100%;">
                                                                            <tr>
                                                                                <td style="padding: 5px; width: 75px;">Name</td>
                                                                                <td style="padding: 5px;">
                                                                                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 5px; width: 75px;">Address</td>
                                                                                <td style="padding: 5px;">
                                                                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'>&gt;</asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 5px; width: 75px;">Area</td>
                                                                                <td>
                                                                                    <asp:Label ID="lblArea" runat="server" Text='<%# Bind("Area") %>'>&gt;</asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 5px; width: 75px;">City</td>
                                                                                <td style="padding: 5px;">
                                                                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'>&gt;</asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 5px; width: 75px;">Pincode</td>
                                                                                <td style="padding: 5px;">
                                                                                    <asp:Label ID="lblPincode" runat="server" Text='<%# Bind("Pincode") %>'>&gt;</asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 5px; width: 75px;">Phone</td>
                                                                                <td style="padding: 5px;">
                                                                                    <asp:Label ID="lblMobile" runat="server" Text='<%# Bind("Mobile") %>'>&gt;</asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 5px; width: 75px;">Time</td>
                                                                                <td style="padding: 5px;">
                                                                                    <asp:Label ID="lblDropoffTime" runat="server" Text='<%# Bind("TimeSlot") %>'></asp:Label>
                                                                                    <asp:Label ID="lblTimeSlotID" runat="server" Text='<%# Bind("TimeSlotID") %>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lblAddressID" runat="server" Text='<%# Bind("ID") %>' Visible="false"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle BackColor="#3F3F3F" CssClass="t" ForeColor="White" />
                                                                </asp:TemplateField>
                                                                <asp:ButtonField CommandName="btnDelete" Text="Remove">
                                                                    <HeaderStyle BackColor="#3F3F3F" CssClass="t" ForeColor="White" />
                                                                </asp:ButtonField>
                                                                <asp:ButtonField CommandName="btnEdit" Text="Edit">
                                                                    <HeaderStyle BackColor="#3F3F3F" CssClass="t" ForeColor="White" />
                                                                </asp:ButtonField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TESTQUEUEConnectionString %>" SelectCommand="SELECT * FROM [Additional_Address] WHERE ([GUID] = @GUID) ORDER BY [ID]">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lblGuid" Name="GUID" PropertyName="Text" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                    <div class="Paymentbox">
                                                        Payment to be collected from     <span>
                                                            <asp:RadioButton ID="rdoPickup" runat="server" Checked="True" GroupName="p" />
                                                            Pick up point </span><span>
                                                                <asp:RadioButton ID="rdoDelivery" runat="server" GroupName="p" />
                                                                Drop-off point</span>
                                                    </div>
                                                    <div class="Termsbox">
                                                        <ul>
                                                            <li><span>Terms & Conditions</span></li>
                                                            <li>- If you cancel a task when our executive reaches the pick up location a cancellation fee of Rs.100 will be applicable.</li>
                                                            <li>- Please note that our executive is allowed to wait 15 minutes on arrival at the pick-up or the drop location and after 15 minutes, waiting charges &nbsp;&nbsp;&nbsp;will be applicable of Rs.100/- per   30 minutes.</li>
                                                            <li>- If the parcel exceeds 5kgs an excess baggage fee of Rs.100 will be charged.</li>
                                                            <li>- We charge Rs.100 for cash On Delivery Return (COD Return)</li>
                                                        </ul>
                                                    </div>
                                                    <p>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                        I Agree with the Terms & Conditions.
                                                    </p>
                                                    <br>
                                                    <div id="imgplace" runat="server" class="codeimg" style="margin-left: 5px;">
                                                        <img src="GenerateCaptcha.ashx" />
                                                    </div>
                                                    <br>
                                                    <asp:Label ID="lblStatus" runat="server" Font-Bold="true"></asp:Label>
                                                    <div class="incode" style="width: 100%">
                                                        <div class="Entercode" style="width: 100%">
                                                            Enter the text displayed<br>
                                                            in the image above.
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <div class="incode_box">
                                                            <asp:TextBox ID="txtCaptchaText" runat="server" class="text" Style="width: 100%;"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <br />
                                                    <div>
                                                        <asp:Button ID="Button3" runat="server" Text="PLACE AN ORDER" Style="background-color: #959595; color: #FFFFFF;" ValidationGroup="f" OnClick="Button3_Click" Width="200" Height="60" />
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </asp:Panel>
                                </Content>
                            </asp:AccordionPane>
                        </Panes>
                    </asp:Accordion>
                    <div id="model_popup" style="border: 3px solid #0A1B2A; text-align: center; width: 400px; height: 220px; background-color: white; font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: 10pt; display: non; padding: 20px;">
                        <img alt="" src="error.png" width="75px" /><br />
                        <br />
                        <asp:Label ID="lblError" runat="server" ForeColor="#FF3300" Font-Size="Medium" Font-Bold="True"></asp:Label>
                        <br />
                        <br />

                        <asp:Button ID="btnOk" runat="server" Text="Ok" Width="100" Height="40px" Font-Bold="True" Font-Size="Large" />
                        <br />
                    </div>

                     

                </div>
            </form>
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
