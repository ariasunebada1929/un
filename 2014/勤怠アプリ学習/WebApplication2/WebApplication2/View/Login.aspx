<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.View.Login" MasterPageFile="~/View/RakuKin.Master" Title ="ログイン"%>
<asp:Content ID ="Content1" ContentPlaceHolderID="cph1" runat ="server">
    <p>
        <asp:Literal ID="ltrErr" runat="server"></asp:Literal>
    </p>
    
    <asp:Panel ID="Panel1" runat="server" BackColor="Aqua" Height="113px" 
        Width="273px">
        <br />
        <form id="LoginForm" runat="server" method="post">
        ユーザーID　：<asp:TextBox ID="txtID" runat="server" MaxLength="5" value=""></asp:TextBox>
        <br />
        パスワード&nbsp;&nbsp; ：<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="ログイン" onclick="btnLogin_Click" OnClientClick="return btnLogin_Click()"/>
        <asp:Button ID="btnCancel" runat="server" Text="キャンセル" />
        </form>
    </asp:Panel>
    
</asp:Content>