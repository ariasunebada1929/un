<%@ Page Title="ログイン" Language="VB" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="App_Disp.Login"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>
	ログイン-パートナー情報共有システム
	</title>
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<link rel="stylesheet" type="text/css" href="../Styles/form.css" />
	<!-- 入力チェック -->
	<script type="text/javascript" src="../Scripts/login.js"></script>
</head>

<body runat="server">

<form id="Login" runat="server" method="post" name="LoginForm">
<!-- メイン -->
<ol class="cl_box" >
	<li class="cl_title">パートナー情報共有システム</li>
	<li class="cl_index">個人ID</li>
	<li class="cl_index">個人パス</li>
	<li class="cl_textbox">
		<asp:TextBox id="txtid" runat="server" MaxLength="5" Height="23px" ></asp:TextBox>
	</li>
	<li class="cl_textbox">
		<asp:TextBox id="txtpw" runat="server" MaxLength="15" Height="23px" TextMode="Password"></asp:TextBox>
	</li>
	<li class="cl_button">
		<asp:Button ID="btnlogin" runat="server" Text="ログイン" OnClientClick="return btnlogin_Click()" OnClick="btnlogin_Click" />
	</li>
</ol>
</form>

<!-- フッター  -->
<div id="footer">
<p>パートナー情報共有システム Version 0.0.0 20130822 Copyright (C) 2013 UN ROOM</p>
</div>
	
</body>
</html>