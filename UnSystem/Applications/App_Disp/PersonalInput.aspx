<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PersonalInput.aspx.vb" Inherits="App_Disp.PersonalInput" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>技術者情報入力画面</title>
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<link rel="stylesheet" type="text/css" href="../Styles/form_Input.css" />
</head>
<body style="background-color:#90EE90;">
<form id="form1" runat="server">
<!-- ヘッダー -->
	<ol>
		<li style="float:left;margin-left:5%;">
			<asp:Label ID="lblTitle" runat="server" Text="技術者情報入力画面"></asp:Label>
		</li>
		<li style="float:left;margin-left:60%;">
			<asp:Label ID="lblLoginUserTitle" runat="server" Text="ログイン者"></asp:Label>
		</li>
		<li style="float:left;margin-left:17%;">
			<asp:Label ID="lblLoginUser" runat="server"></asp:Label>
		</li>
		<li style="padding-left:50px;">
			<asp:Label ID="ログアウト" runat="server" Text="ログアウト"></asp:Label>
		</li>
	</ol>
	<ol>
		<li style="float:left;margin-left:5%;">
			<asp:Label ID="lblCompanyTitle" runat="server" Text="会社名"></asp:Label>
		</li>
		<li style="float:left";>
			<asp:Label ID="lblCompany" runat="server" Text="KBF"></asp:Label>
		</li>
		<li style="float:left";>
			<asp:Label ID="lblNameTitle" runat="server" Text="氏名"></asp:Label>
		</li>
		<li>
			<asp:Label ID="lblName" runat="server"></asp:Label>
		</li>
	</ol>
	<ol style="clear:both;margin-left:20%;">
		<li style="padding-top:3px;float:left;">
			<asp:Label ID="lblFirstName" runat="server" Text="姓"></asp:Label>
		</li>
		<li style="padding-left:40px;float:left;">
			<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
		</li>
		<li style="margin-left:60px;padding-top:3px;float:left;">
			<asp:Label ID="lblUnderName" runat="server" Text="名"></asp:Label>
		</li>
		<li style="margin-left:80px;">
			<asp:TextBox ID="txtUnderName" runat="server"></asp:TextBox>
		</li>
	</ol>
	</form>
</body>
</html>
