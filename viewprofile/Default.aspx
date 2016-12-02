<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="viewprofile_Default" %>
<%@ Register TagPrefix="uc" TagName="Header"     Src="~/InnerHeader.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
    <!-- Custom Theme files -->
    <link href="../css1/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css1/flexslider.css" type="text/css" media="screen" />
    <script src="../js1/jquery.min.js"> </script>
    <link href="../css1/menutopdwop.css" rel="stylesheet type='text/css'">
    <link href="../css1/custom.css" rel="stylesheet type='text/css'">
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
    <!--webfonts-->
    <link href='/../fonts.googleapis.com/css?family=PT+Mono|Abril+Fatface' rel='stylesheet' type='text/css'>
    <!--//webfonts-->
    <script>
        $(function () {
          
            $("#responsive_menu").load("../responsive_menu_inner.html");
            $("#includedContent").load("../footer.html");
        });
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
        .txt {
            padding: 9px;
            font-size: 13px;
            margin: 5px 0px;
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
        }
       
        .auto-style1 {
            height: 24px;
        }
       
    </style>





</head>
<body>
    <form name="form1" runat="server">
        <!--start-header-->

        <div id="home" class="innerbackground">
            <div class="top-header">
                <div class="container">
                  <uc:Header id="Header" 
        runat="server" 
        MinValue="1" 
        MaxValue="10" />
                </div>
            </div>
            <div id="responsive_menu"></div>

            <div class="banner">

                <div class="container">


                    <div class="col-md-6 editprofile_trabox" id="messagebox" runat="server">
                        <h3>Thank you for registering. </h3><br>
                        <asp:Label ID="lblClientID" runat="server" Text="0" Visible="false"></asp:Label>
                       Registered Customers can  <br>  
                                 <ul>
                                     <li>Add multiple pick up and delivery address.</li>
                                     <li>View your past orders. </li>
                                     <li>Add money to your wallet and check balance.</li>
                                     
                                 </ul>
                        <br />
                      If you find it hard or annoying to get around our system call +91-8080808315 or email support@russsh.com.
                        <br /><br />
                      <br />
                           <br />
                        <br />
                        <p style="text-align: center;">
                            <asp:Button ID="btnUpdateProfile" runat="server" Text="Complete Profile" CssClass="white_btn" Width="200" OnClick="btnUpdateProfile_Click" />&nbsp;
                            <asp:Button ID="btnContinue" runat="server" Text="Book a Task" Width="150" CssClass="white_btn" OnClick="btnContinue_Click" />
                        </p>
                    </div>


                    <!--  logon-->
                    <div class="col-md-6 editprofile_trabox" id="profilebox" runat="server">
                        <h3>My Profile</h3>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="clearfix"></div>
                                <div id="divedit" runat="server">
                                    <p>Name:<br />
                                        <asp:TextBox runat="server" CssClass="txt" ID="txtname" placeholder="Full Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="signup" ID="rfvtxtConfirmPassword" ControlToValidate="txtname" ErrorMessage="Enter Full Name" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        Address:<br /><asp:TextBox ID="txtaddress" CssClass="txt" runat="server" placeholder="Address"></asp:TextBox>
                                        <asp:RequiredFieldValidator Width="18%" ValidationGroup="signup" ID="RequiredFieldValidator1" ControlToValidate="txtaddress" ErrorMessage="Enter Address" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                       
                                     
                                       

                                    </p>
                                    <p>
                                        Street line 1:<br /> <asp:TextBox ID="txtarea" CssClass="txt" runat="server" placeholder="Area"></asp:TextBox>
                                        <asp:RequiredFieldValidator Width="18%" ValidationGroup="signup" ID="RequiredFieldValidator2" ControlToValidate="txtarea" ErrorMessage="Enter Area " ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        Street line 2: <br /><asp:TextBox ID="txtstreet" CssClass="txt" runat="server" placeholder="Street"></asp:TextBox>
                                        <asp:RequiredFieldValidator Width="18%" ValidationGroup="signup" ID="RequiredFieldValidator3" ControlToValidate="txtstreet" ErrorMessage="Enter Street " ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        City:<br /><asp:TextBox ID="txtcity" CssClass="txt" runat="server" placeholder="City"></asp:TextBox>
                                        <asp:RequiredFieldValidator Width="18%" ValidationGroup="signup" ID="RequiredFieldValidator4" ControlToValidate="txtcity" ErrorMessage="Enter City" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        Date of Birth:<br />
                                        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                        </cc1:ToolkitScriptManager>
                                        <asp:TextBox ID="txtbdate" runat="server" CssClass="txt" placeholder="BirthDate(DD/MM/YYYY)"></asp:TextBox>

                                  </p> 
                                    <p>

                                          <asp:Label ID="sp" Width="24%" runat="server"></asp:Label>

                                    </p>
                                    <p>
                                        Mobile No.:<br />
                                        <asp:TextBox ID="txtmobile" CssClass="txt" runat="server" MaxLength="10" placeholder="Mobile"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="signup" ID="RequiredFieldValidator5" ControlToValidate="txtmobile" ErrorMessage="Enter Mobile" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmobile" ErrorMessage="Only numeric allowed." ForeColor="Red"
                                            ValidationExpression="^[0-9]*$" ValidationGroup="signup">Only numeric allowed
                                        </asp:RegularExpressionValidator>
                                        <asp:Label ID="lblPreviousMobileNo" runat="server" Visible="false"></asp:Label>
                                    </p>
                                </div>
                                <div class="contact-form editprofile">
                                    <div class="white_colourbox" id="divdisplay" runat="server" style="margin-bottom:10px;">
                                        <p>
                                           
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td width="80px" style="padding:1px;" class="auto-style1">Name</td>
                                                    <td width="5px" style="padding:1px;" class="auto-style1">:</td>
                                                    <td style="padding:1px;" class="auto-style1"> <label id="lblfullname" runat="server"></label></td>
                                                </tr>
                                                <tr>
                                                    <td width="80px" style="padding:1px;">Address</td>
                                                    <td width="5px" style="padding:1px;">:</td>
                                                    <td style="padding:1px;">  <label id="lbladdress" runat="server"></label>
                                            &nbsp&nbsp<label id="lblarea" runat="server"></label>&nbsp&nbsp<label id="lblstreet" runat="server"></label></td>
                                                </tr>
                                                <tr>
                                                    <td width="80px" style="padding:1px;">City</td>
                                                    <td width="5px" style="padding:1px;">:</td>
                                                    <td style="padding:1px;"> <label id="lblcity" runat="server"></label></td>
                                                </tr>
                                                 <tr>
                                                    <td width="80px" style="padding:1px;">Mobile No.</td>
                                                    <td width="5px" style="padding:1px;">:</td>
                                                    <td style="padding:1px;"><label id="lblmobile" runat="server"></label></td>
                                                </tr>
                                                 <tr>
                                                    <td width="100px" style="padding:1px;">Date of Birth</td>
                                                    <td width="5px" style="padding:1px;">:</td>
                                                    <td style="padding:1px;"><label id="lblDob" runat="server"></label></td>
                                                </tr>
                                            </table>
                                            
                                       
                                    </div>
                                    <br /><br />

                                    <%--<input name="EDIT" value="EDIT" class="white_btn">--%>
                                    <asp:Button ID="btnedit" runat="server" Text="EDIT" CssClass="white_btn" OnClick="btnedit_Click" Visible="false" />
                                    <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="white_btn" OnClick="btnsave_Click" ValidationGroup="signup" />

                                    <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="white_btn" OnClick="btncancel_Click" />
                                    <asp:Button ID="btnWallet" runat="server" Text="Add Wallet" CssClass="white_btn" OnClick="btnWallet_Click"  />&nbsp;
                                    <asp:Button ID="btnBookTask" runat="server" Text="Book a Task" CssClass="white_btn" OnClick="btnBookTask_Click" />&nbsp;
                                     
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                        <div class="clearfix"></div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div style="height: 250px; overflow: auto; display: none;">
                                    <div id="divAAdd" runat="server">
                                        <p>
                                            <asp:Label runat="server" CssClass="txt" ID="lblSelectedID" Visible="false"></asp:Label>
                                            <asp:TextBox runat="server" CssClass="txt" ID="txtaname" placeholder="Full Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="v2" ID="RequiredFieldValidator8" ControlToValidate="txtaname" ErrorMessage="Enter Name" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <asp:TextBox ID="txtadd" CssClass="txt" runat="server" placeholder="Address"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="v2" ID="RequiredFieldValidator9" ControlToValidate="txtadd" ErrorMessage="Enter Address" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtarea1" CssClass="txt" runat="server" placeholder="Area"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="v2" ID="RequiredFieldValidator10" ControlToValidate="txtarea1" ErrorMessage="Enter Area" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtlandmark" CssClass="txt" runat="server" placeholder="Landmark"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="v2" ID="RequiredFieldValidator11" ControlToValidate="txtlandmark" ErrorMessage="Enter Landmark" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <asp:TextBox ID="txtcity1" CssClass="txt" runat="server" placeholder="City"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="v2" ID="RequiredFieldValidator12" ControlToValidate="txtcity1" ErrorMessage="Enter city" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                        </p>
                                        <p>

                                            <asp:TextBox ID="txtpin" CssClass="txt" runat="server" MaxLength="6" placeholder="Pin Code / Zip Code"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="v2" ID="RequiredFieldValidator7" ControlToValidate="txtpin" ErrorMessage="Enter Mobile" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtpin" ErrorMessage="Only numeric allowed." ForeColor="Red"
                                                ValidationExpression="^[0-9]*$" ValidationGroup="v2">Only numeric allowed
                                            </asp:RegularExpressionValidator>
                                            <asp:TextBox ID="txtmobile1" CssClass="txt" runat="server" MaxLength="10" placeholder="Mobile No."></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="v2" ID="RequiredFieldValidator6" ControlToValidate="txtmobile1" ErrorMessage="Enter Mobile" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtmobile1" ErrorMessage="Only numeric allowed." ForeColor="Red"
                                                ValidationExpression="^[0-9]*$" ValidationGroup="v2">Only numeric allowed
                                            </asp:RegularExpressionValidator>
                                        </p>
                                        <p>
                                            <asp:Button ID="btnASave" runat="server" Text="Save" CssClass="white_btn" OnClick="btnASave_Click" ValidationGroup="v2" />

                                            <asp:Button ID="btnACancel" runat="server" Text="Cancel" CssClass="white_btn" OnClick="btnACancel_Click" />
                                        </p>
                                    </div>
                                    <h2>Additional Addresses:</h2>
                                    <p>
                                        Click to add a
                                                <asp:Button ID="btnnew" runat="server" Text="NEW ADDRESS" CssClass="newaddress_btn" OnClick="btnnew_Click" />
                                    </p>

                                    <%--   <div  ">

                                               <asp:Button ID="btnedit2" runat="server" Text="EDIT" CssClass="white_btn" />
                                            <asp:Button ID="btndel" runat="server" Text="DELETE" CssClass="white_btn" />
                                            <div >--%>
                                    <asp:ListView ID="lsteditsddress" runat="server" OnItemCommand="lsteditsddress_ItemCommand">
                                        <ItemTemplate>
                                            <div style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #999999;">
                                                <table style="width: 100%; padding: 10px;">
                                                    <tr>
                                                        <td style="display: none;">

                                                            <strong>
                                                                <asp:Label runat="server" ID="lblid" Text='<%#Eval("AddressId") %>'></asp:Label></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" ID="lblname" Text='<%#Eval("AddressName") %>' Font-Bold="True" ForeColor="#003366"></asp:Label>
                                                            <br />
                                                            <asp:Label runat="server" ID="lbladd" Text='<%#Eval("Address") %>'></asp:Label><br />
                                                            <asp:Label runat="server" ID="lblarea" Text='<%#Eval("Area") %>'></asp:Label><br />
                                                            <asp:Label runat="server" ID="lbllandmark" Text='<%#Eval("landmark") %>'></asp:Label><br />
                                                            <asp:Label runat="server" ID="lblcity" Text='<%#Eval("city") %>'></asp:Label>-
                                                            <asp:Label runat="server" ID="lblpin" Text='<%#Eval("pincode") %>'></asp:Label><br />
                                                            <asp:Label runat="server" ID="lblmobile" Text='<%#Eval("MobileNo") %>'></asp:Label>

                                                        </td>
                                                    </tr>



                                                    <tr>
                                                        <td>
                                                            <%--<asp:LinkButton ID="lnkEdit" runat="server" CssClass="white_btn" CommandName="Edit">Edit</asp:LinkButton>--%>
                                                            <asp:Button ID="btnedit2" runat="server" Text="EDIT" Width="100px" CommandName="btnedit" CssClass="white_btn" />
                                                            <asp:Button ID="btnRemove" runat="server" Text="REMOVE" Width="100px" CommandName="btnRemove" CssClass="white_btn" />
                                                        </td>

                                                        <br />

                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>

                                    </asp:ListView>

                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>





                </div>

                <!--end  logonbox-->


            </div>
        </div>
        </div>
        <!--//end-slider-->




        <!--footer-->
        <div id="includedContent"></div>
        <script type="text/javascript" src="../lib1/js/jquery-1.10.1.min.js"> </script>
        <script type="text/javascript" src="../lib1/js/bootstrap/bootstrap.js"></script>
        <script type="text/javascript">
            $('button').on('click', function () {
                alert('preserve attached java script data!');
            });
            $('#myTab').tabCollapse();
        </script>
    </form>
</body>
</html>
