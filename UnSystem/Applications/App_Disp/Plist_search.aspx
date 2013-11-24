<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Plist_search.aspx.vb" Inherits="App_Disp.Plist_search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>技術者検索/一覧画面-パートナー情報共有システム</title>
	<link rel="stylesheet" type="text/css" href="../Styles/form_Main.css" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<script type="text/javascript" src="../Scripts/Plist_search.js"></script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
	<ol class="header">
		<li class="title">技術者検索/一覧画面</li>
		<li class="logout">
		<a href="http://localhost/UNPJ/login_HTML.php">ログアウト</a>
		</li>
		<li class="login1">さん</li>
		<li class="login2"><asp:Label ID="lblUserName" runat="server"></asp:Label></li>
		<li class="login3">ログイン者</li>
	</ol>
	<ul id ="main">
	<li class="kesnaku">
	<asp:Button ID="id_SearchForm" class="button" runat="server" Text="検索" OnClientClick="return SearchButton()"/>
		<ol id="na_Search">
		<li>検索条件</li>
			<li id ="id_1l_1">姓</li>
			<li class="cl_text_1l_1"><asp:TextBox ID="id_firstname" name="na_firstname" runat="server" MaxLength="10" Height="17px"></asp:TextBox>
			</li>
			<li id="id_1l_2">名</li>
			<li class="cl_text"><asp:TextBox ID="id_lastname" name="na_lastname" runat="server" MaxLength="10" Height="17px" ></asp:TextBox>
			</li>
			<li id="id_2l_1">会社名</li>
			<li class="cl_text"><asp:TextBox ID="id_company" name="na_company" runat="server" MaxLength="10" Height="17px" ></asp:TextBox>
			</li>

			<li id="id_2l_2">就業状況</li>
			<li class="cl_text">
				<asp:DropDownList id="lstWork" name="na_Work" runat="server" Height="22px" />
			</li>

			<li id="id_3l">就業期間</li>
			<li class="cl_text">
				<asp:DropDownList id="lstFromYear" name="na_Year" runat="server" Height="22px" OnChange="lstFrom_OnChange()" />
			</li>
			<li>年</li>

			<li class="cl_text">
				<asp:DropDownList id="lstFromMonth" name="na_Month" runat="server" Height="22px" OnChange="lstFrom_OnChange()" />
			</li>
			<li>月</li>

			<li class="cl_text">
				<asp:DropDownList id="lstFromDay" name="na_Day" runat="server" Height="22px" />
			</li>
			<li>日 ～</li>

			<li class="cl_text">
				<asp:DropDownList id="lstToYear"　name="na_Year" runat="server" Height="22px"  OnChange="lstTo_OnChange()" />
			</li>
			<li>年</li>

			<li class="cl_text">
				<asp:DropDownList id="lstToMonth" name="na_Month" runat="server" Height="22px" OnChange="lstTo_OnChange()" />
			</li>
			<li>月</li>

			<li class="cl_text">
				<asp:DropDownList id="lstToDay" name="na_Day" runat="server" Height="22px" />
			</li>
			<li>日</li>
		
		<li id="id_4l_1">年齢</li>
		<li class="cl_text">
			<asp:TextBox ID="id_Age" name="na_Age" runat="server" MaxLength="2" Height="18px" Width="20px"></asp:TextBox>
		</li>
		<li>歳</li>

		<li class="cl_dropdown">
		<asp:DropDownList id="id_OverUnder"　name="na_OverUnder"
					runat="server"
					Height="22px">
					<asp:ListItem Selected="True" Value="Over"> 以上 </asp:ListItem>
					<asp:ListItem Value="Under"> 以下 </asp:ListItem>
					<asp:ListItem Value="equal"> と等しい </asp:ListItem>
			</asp:DropDownList>
		</li>

		<li id="id_4l_2">性別</li>
			<li  class="cl_text">
			<asp:DropDownList id="SexList"　name="na_Sex"
					runat="server"
					Height="22px">
					<asp:ListItem Selected="True" Value="Man"> 男 </asp:ListItem>
					<asp:ListItem Value="Woman"> 女 </asp:ListItem>
			</asp:DropDownList>
			</li>

		<li id="id_5l">言語</li>

		<li id ="id_button">
			<asp:Button ID="id_Search" runat="server" Text="検索"/>
			<asp:Button ID="id_Close" runat="server" Text="閉じる" OnClientClick="return CloseButton()"/>
		</li>
	</ol>
	</li>

	<li class="zenken"><asp:Button ID="id_Zenken" class="button" runat="server" Text="全件表示"/></li>
	<li class="sakujyo"><asp:Button ID="id_Sakujyo" class="button" runat="server" Text="削除"/></li>
	<li class="IDhakkou"><asp:Button ID="id_Hakkou" class="button" runat="server" Text="ID発行"/></li>
	<li class="kaisyaitiran"><asp:Button ID="id_Itiran"  class="button" runat="server" Text="会社一覧"/></li>
</ul>
	
	</div>
	</form>
<!-- フッター  -->
<div id="footer">
<p>パートナー情報共有システム Version 0.0.0 20130822 Copyright (C) 2013 UN ROOM</p>
</div>

</body>
</html>