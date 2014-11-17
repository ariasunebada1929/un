<%@ Page Title="" Language="C#" MasterPageFile="~/View/Menu.master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="WebApplication2.View.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph2" runat="server">
    <div >
    <asp:Label ID="lblYear" runat="server"></asp:Label>
    /<asp:Label ID="lblMonth" runat="server"></asp:Label>
    /<asp:Label ID="lblDay" runat="server"></asp:Label>
    <br />
    基本勤務時間<br />
    始業：<asp:TextBox ID="TextBox1" runat="server" Width="62px"></asp:TextBox>
    　終業：<asp:TextBox ID="TextBox2" runat="server" Width="56px"></asp:TextBox>
    <br />
    実績勤務時間<br />
    始業：<asp:TextBox ID="TextBox3" runat="server" Width="62px"></asp:TextBox>
    　終業：<asp:TextBox ID="TextBox4" runat="server" Width="56px"></asp:TextBox>
    　休憩：<asp:TextBox ID="TextBox5" runat="server" Width="56px"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="登録" />
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="戻る" />
</div>
</asp:Content>
