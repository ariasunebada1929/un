<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Roster.aspx.cs" Inherits="WebApplication2.View.Roster" MasterPageFile="~/View/Menu.master" Title ="メイン画面"%>
<asp:Content ID ="Content1" ContentPlaceHolderID="cph2" runat ="server">
    <div id ="calender">
    <asp:Calendar ID="Calendar1" runat="server" Height="251px" Width="388px" 
        BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" 
        DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
        ForeColor="#663399" ShowGridLines="True" 
    onselectionchanged="Calendar1_SelectionChanged">
        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
        <OtherMonthDayStyle ForeColor="#CC9966" />
        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
        <SelectorStyle BackColor="#FFCC66" />
        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
            ForeColor="#FFFFCC" />
        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
    </asp:Calendar>
    <!--
    <script language="javascript" type ="text/javascript" >
    function Calendar1_SelectionChanged(){
        window.alert("<%=Calendar1.SelectedDate %>");
        var strdate = Calendar1.SelectedDate
        window.alert(strdate);
        
    }
    </script>
    -->
    </div>
    <div id="detail">
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
    <asp:Button ID="Button2" runat="server" Text="キャンセル" />
    <br />
    </div>
    <%--</form>--%>
</asp:Content>
