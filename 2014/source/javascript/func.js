 function func(MyCommand){ 
    document.form_roster.MySubmit.value=MyCommand;
    if (MyCommand == "Toroku"){
        return btnRegist_Click();
    }else if(MyCommand == "ExcelOut"){
		alert("Excelを出力します。\n出力をする前にデータの登録を行って下さい。");
		return true;
    }else if(MyCommand == "Personal"){
        var staff_id = document.getElementById("txtPersonal_id").value;
 		if (!staff_id.match(/[0-9][0-9][0-9][0-9][0-9]+$/)) {
				alert("数値5桁のIDを入力してください。");
				return false;
		}
		return true;
    }
 } 