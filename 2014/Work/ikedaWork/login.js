function btnlogin_Click() {

	LoginID = document.getElementById("txtid").value;
	LoginPW = document.getElementById("txtpw").value;

	if (LoginID == "") {
		alert("個人IDが入力されていません");
		return false;
	}

	if (!LoginID.match(/^[0-9]+$/)) {
		alert("個人IDには半角数字を入力してください");
		return false;
	}

	if (!LoginID.match(/^\d{5}$/)) {
		alert("個人IDは5文字になります");
		return false;
	}

	if (LoginPW == "") {
		alert("個人パスが入力されていません");
		return false;
	}

	if (!LoginPW.match(/^[a-zA-Z0-9_\-]+$/)) {
		alert("個人パスには半角英数字、ハイフン、アンダーバーを使用してください");
		return false;
	}

	if (!LoginPW.match(/^[a-zA-Z0-9_\-]{6,15}$/)) {
		alert("個人パスは6～15文字で入力してください");
		return false;
	}

	return true;
}