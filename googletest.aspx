<%@ Page Language="C#" AutoEventWireup="true" CodeFile="googletest.aspx.cs" Inherits="googletest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
   
</head>
<body>
    <form id="form1" runat="server">

  <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="Login" />
<asp:Panel ID="pnlProfile" runat="server" Visible="false">
<hr />
<table>
    <tr>
        <td rowspan="6" valign="top">
            <asp:Image ID="ProfileImage" runat="server" Width="50" Height="50" />
        </td>
    </tr>
    <tr>
        <td>
            ID:
            <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Name:
            <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Email:
            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Gender:
            <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Type:
            <asp:Label ID="lblType" runat="server" Text=""></asp:Label>
        </td>
    </tr>
        <tr>
        <td>
            <asp:Button ID="Button1" Text="Clear" runat="server" OnClick = "Clear" />
        </td>
    </tr>
</table>
</asp:Panel>
    </form>
</body>
</html>
