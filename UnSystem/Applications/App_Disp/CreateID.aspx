<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CreateID.aspx.vb" Inherits="App_Disp.CreateID" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ID発行-パートナー情報共有システム</title>
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link rel="stylesheet" type="text/css" href="../Styles/form_common.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/form_ID.css" />
    <script type="text/javascript" src="../Scripts/RadioButton.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <ol class="header">
        <li class="title">企業ID/個人ID発行画面</li>
        <li class="login1">ログイン者</li>
        <li class="login2">さん</li>
        <li class="logout">
            <a href="http://localhost/UNPJ/login_HTML.php">ログアウト</a>
        </li> 
    </ol>
    <div id="main">
        <asp:RadioButton ID="id_SelectCompany" runat="server" Text="企業" GroupName="CreateIDGroup" name="na_Radio" OnClick="return ClickRadio()" checked="true"/>
        <asp:RadioButton ID="id_SelectPersonal" runat="server" Text="個人名" GroupName="CreateIDGroup" name="na_Radio" OnClick="return ClickRadio()"/>
            <ol id="id_CompanyForm">
                <li id="id_index_Company1">企業名</li>
		        <li class="cl_text"><asp:TextBox ID="id_company" name="na_company" runat="server" MaxLength="10" Height="17px" ></asp:TextBox>
                </li>
            </ol>
            <ol id="id_PersonalForm">
                <li id="id_index_Company2">企業名</li><li class="cl_text"><asp:TextBox ID="TextBox1" name="na_company" runat="server" MaxLength="10" Height="17px" ></asp:TextBox>
                </li>
                <li id="id_index_Family">姓</li>
		        <li class="cl_text"><asp:TextBox ID="TextBox2" name="na_company" runat="server" MaxLength="10" Height="17px" ></asp:TextBox>
                </li>
                <li id="id_index_First">名</li>
		        <li class="cl_text"><asp:TextBox ID="TextBox3" name="na_company" runat="server" MaxLength="10" Height="17px" ></asp:TextBox>
                </li>
                <li id="id_JobButton">
                <asp:RadioButton ID="id_RadioButton1" runat="server" Text="一般" GroupName="CreateJobGroup" />
                <asp:RadioButton ID="id_RadioButton2" runat="server" Text="営業" GroupName="CreateJobGroup" />
                </li>
            </ol>
                
        <ol id="id_Button">
        <asp:Button ID="id_CreateID" class="button" runat="server" Text="ID発行" OnClientClick="return SearchButton()"/>
        </ol>
 
    </div>

    <!-- フッター  -->
    <div id="footer">
        <p>パートナー情報共有システム Version 0.0.0 20130822 Copyright (C) 2013 UN ROOM</p>
    </div>
    
    </div>
    </form>
</body>
</html>
