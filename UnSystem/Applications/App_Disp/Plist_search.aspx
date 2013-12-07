<%@ Page Language="vb" AutoEventWireup="false" EnableEventValidation="false" CodeBehind="Plist_search.aspx.vb" Inherits="App_Disp.Plist_search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>技術者検索/一覧画面-パートナー情報共有システム</title>
	<link rel="stylesheet" type="text/css" href="../Styles/form_Main.css" />
	<link rel="stylesheet" type="text/css" href="../Styles/form_common.css" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<script type="text/javascript" src="../Scripts/Plist_search.js"></script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
	<ol class="header">
		<li class="title">技術者検索/一覧画面</li>
		<li class="logout">
			<asp:LinkButton ID="likLogout" runat="server">ログアウト</asp:LinkButton>
		</li>
		<li class="login1">さん</li>
		<li class="login2"><asp:Label ID="lblUserName" runat="server"></asp:Label></li>
		<li class="login3">ログイン者</li>
	</ol>
	<ul id ="main">
	<li class="kesnaku">
		<asp:Button ID="btnSearchInput" class="button" runat="server" Text="検索入力" OnClientClick="return SearchInputButton()"/>
		<ol id="na_Search">
		<li id ="id_Formhead">検索条件</li>
			<li id ="id_1l_1">姓</li>
			<li class="cl_text_1l_1"><asp:TextBox ID="txtfirstname" name="na_firstname" runat="server" MaxLength="10"></asp:TextBox>
			</li>
			<li id="id_1l_2">名</li>
			<li class="cl_text_1l_2"><asp:TextBox ID="txtlastname" name="na_lastname" runat="server" MaxLength="10" Height="17px" ></asp:TextBox>
			</li>
			<li id="id_2l_1">会社名</li>
			<li class="cl_text"><asp:TextBox ID="txtcompany" name="na_company" runat="server" MaxLength="10" Height="17px" ></asp:TextBox>
			</li>

			<li id="id_2l_2">就業状況</li>
			<li class="cl_text">
				<asp:DropDownList id="lstWork" runat="server" Height="22px" />
			</li>

			<li id="id_3l">就業期間</li>
			<li class="cl_text">
				<asp:DropDownList id="lstFromYear" runat="server" Height="22px" OnChange="lstFrom_OnChange()" />
			</li>
			<li class="cl_intend">年</li>

			<li class="cl_text">
				<asp:DropDownList id="lstFromMonth" runat="server" Height="22px" OnChange="lstFrom_OnChange()" />
			</li>
			<li class="cl_intend">月</li>

			<li class="cl_text">
				<asp:DropDownList id="lstFromDay" runat="server" Height="22px" />
			</li>
			<li class="cl_intend">日 ～</li>

			<li class="cl_text">
				<asp:DropDownList id="lstToYear" runat="server" Height="22px"  OnChange="lstTo_OnChange()" />
			</li>
			<li class="cl_intend">年</li>

			<li class="cl_text">
				<asp:DropDownList id="lstToMonth" runat="server" Height="22px" OnChange="lstTo_OnChange()" />
			</li>
			<li class="cl_intend">月</li>

			<li class="cl_text">
				<asp:DropDownList id="lstToDay" runat="server" Height="22px" />
			</li>
			<li class="cl_intend">日</li>
		
		<li id="id_4l_1">年齢</li>
		<li class="cl_text">
			<asp:DropDownList id="lstAge" runat="server" Height="22px" />
		</li>
		<li class="cl_intend">歳</li>

		<li class="cl_text">
			<asp:DropDownList id="lstThreshold" runat="server" />
		</li>

		<li id="id_4l_2">性別</li>
		<li  class="cl_text">
			<asp:DropDownList id="lstSex" runat="server" />
		</li>

		<li id="id_5l">言語</li>

		<li id ="id_button">
			<asp:Button ID="btnSearch" runat="server" Text="検索" OnClientClick="return SearchButton()" Height="22px"/>
			<asp:Button ID="btnClose" runat="server" Text="閉じる" OnClientClick="return CloseButton()" Height="22px"/>
		</li>
	</ol>
	</li>
	<li class="zenken"><asp:Button ID="id_Zenken" class="button" runat="server" Text="全件表示"/></li>
	<li class="sakujyo"><asp:Button ID="id_Sakujyo" class="button" runat="server" Text="削除"/></li>
	<li class="IDhakkou"><asp:Button ID="btnHakkou" class="button" runat="server" Text="ID発行"/></li>
	<li class="kaisyaitiran"><asp:Button ID="id_Itiran"  class="button" runat="server" Text="会社一覧"/></li>
	</ul>
	<ul id ="Ul1">
	<li >
		<asp:GridView ID="grdPesonal" runat="server" 
			 Height="128px" CellPadding="4" ForeColor="#333333" GridLines="None">
			<AlternatingRowStyle BackColor="White" />
			<Columns>
				<asp:CheckBoxField HeaderText="選択" />
				<asp:ButtonField Text="..." HeaderText="変更" />
			</Columns>
			<EditRowStyle BackColor="#7C6F57" />
			<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
			<RowStyle BackColor="#E3EAEB" />
			<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
			<SortedAscendingCellStyle BackColor="#F8FAFA" />
			<SortedAscendingHeaderStyle BackColor="#246B61" />
			<SortedDescendingCellStyle BackColor="#D4DFE1" />
			<SortedDescendingHeaderStyle BackColor="#15524A" />
		</asp:GridView>
	</li>
	</ul>
		<asp:HiddenField ID="hdnOpeLevel" runat="server" Value="0" />
		<asp:HiddenField ID="hdnPersonalID" runat="server" Value="0" />
	</div>
	</form>
<!-- フッター  -->
<div id="footer">
<p>パートナー情報共有システム Version 0.0.0 20130822 Copyright (C) 2013 UN ROOM</p>
</div>

</body>
</html>