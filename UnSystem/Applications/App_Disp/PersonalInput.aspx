<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PersonalInput.aspx.vb" Inherits="App_Disp.PersonalInput" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>技術者情報入力画面</title>
	<meta http-equiv="Content-Style-Type" content="text/css" />
    <link rel="stylesheet" type="text/css" href="../Styles/form_common.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/form_Input.css" />
</head>
<!-- ヘッダー -->
<body>
    <form id="form2" runat="server">
	<div>
	<ol class="header">
        <li class="title">技術者入力画面</li>
        <li class="logout">
            <a href="http://localhost/UNPJ/login_HTML.php">ログアウト</a>
        </li> 
        <li class="login1">さん</li>
        <li class="login2"><asp:Label ID="lblUserName" runat="server"></asp:Label></li>
        <li class="login3">ログイン者</li>
    </ol>
    <ol id="main">
        <li id="id_Company">会社名</li><asp:Label ID="Label1" runat="server"></asp:Label>
        <li id="id_Name">氏名</li><asp:Label ID="Label2" runat="server"></asp:Label>
    </ol>

    <ol id="id_Inputform">
        <li id="id_1l_1">姓</li>
        <li class="cl_text"><asp:TextBox ID="id_firstname" name="na_firstname" runat="server" MaxLength="10" Height="17px"></asp:TextBox></li>
        <li id="id_1l_2">名</li>
        <li class="cl_text"><asp:TextBox ID="id_LastName" name="na_firstname" runat="server" MaxLength="10" Height="17px"></asp:TextBox></li>
        <li id="id_2l_1">生年月日</li>
        <li class="cl_text2"><asp:TextBox ID="id_birthday" name="na_Birth" runat="server" MaxLength="10" Height="17px"></asp:TextBox></li>
        <li id="id_2l_2">性別</li>
        <li class="cl_text2"><asp:DropDownList ID="lstSex" name="na_Sex" runat="server" Height="22px"/></li>
        <li id="id_3l_1">単価</li>
        <li class="cl_text2"><asp:TextBox ID="id_Cost" name="na_Price" runat="server" MaxLength="10" Height="17px"></asp:TextBox></li>
        <li id="id_4l_1">就業状況</li>
        <li class="cl_text2">
        <asp:DropDownList id="lstWork" name="na_Work" runat="server" Height="22px" /></li>
        <li id="id_4l_2">就業期間</li>
        <li class="cl_text2">
        <asp:DropDownList id="lstFromYear" name="na_Year" runat="server" Height="22px" OnChange="lstFrom_OnChange()" />
        </li>
        <li class="cl_text2">年</li>
        <li class="cl_text2">
				<asp:DropDownList id="lstFromMonth" name="na_Month" runat="server" Height="22px" OnChange="lstFrom_OnChange()" />
		</li>
		<li class="cl_text2">月</li>
        <li class="cl_text2">
				<asp:DropDownList id="lstFromDay" name="na_Day" runat="server" Height="22px" />
		</li>
		<li class="cl_text2">日 ～</li>
        <li class="cl_text2">
				<asp:DropDownList id="lstToYear" name="na_Year" runat="server" Height="22px"  OnChange="lstTo_OnChange()" />
		</li>
		<li class="cl_text2">年</li>
        <li class="cl_text2">
				<asp:DropDownList id="lstToMonth" name="na_Month" runat="server" Height="22px" OnChange="lstTo_OnChange()" />
		</li>
		<li class="cl_text2">月</li>
        <li class="cl_text2">
				<asp:DropDownList id="lstToDay" name="na_Day" runat="server" Height="22px" />
		</li>
		<li class="cl_text2">日</li>
    </ol>
    <ol id="id_InputLevel">
        <li id="id_LangTitle">得意言語</li>
    </ol>
    <ol id="id_button">
			<asp:Button ID="id_Register" runat="server" Text="登録"/>
            <asp:Button ID="id_Close" runat="server" Text="戻る"/>
    </ol>


    </div>
    <!-- フッター  -->
    <div id="footer">
        <p>パートナー情報共有システム Version 0.0.0 20130822 Copyright (C) 2013 UN ROOM</p>
    </div>
    
	</form>
    
</body>
</html>
