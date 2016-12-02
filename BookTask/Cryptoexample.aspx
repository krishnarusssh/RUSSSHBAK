<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cryptoexample.aspx.cs" Inherits="BookTask_Cryptoexample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtstr" runat="server" ></asp:TextBox><br />
       <asp:Button ID="btnencrypt" runat="server" Text="Encrypt" OnClick="btnencrypt_Click" /><br />
        <asp:Label ID="estr" runat="server"></asp:Label><br />
       <asp:TextBox ID="txtdecrypt" runat="server" ></asp:TextBox><br />
       <asp:Button ID="btndrcrypt" runat="server" Text="decrypt" OnClick="btndrcrypt_Click" /><br />
        <asp:Label ID="dstr" runat="server"></asp:Label><br />
    </div>
    </form>
</body>
</html>
