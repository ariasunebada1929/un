function btnLogin_Click() {

    //IDString = document.LoginForm.txtID.value;
    IDString = document.getElementById("txtID");
    Password = document.getElementById("txtPassword");

    if (IDString == "") {
        alert("IDを入力してください。")
        return false;
    }
}