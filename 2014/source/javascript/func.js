 function func(MyCommand){ 
    document.form_roster.MySubmit.value=MyCommand;
    if (MyCommand == "Toroku"){
        return btnRegist_Click();
    }else if(MyCommand == "ExcelOut"){
		alert("Excel���o�͂��܂��B\n�o�͂�����O�Ƀf�[�^�̓o�^���s���ĉ������B");
		return true;
    }else if(MyCommand == "Personal"){
        var staff_id = document.getElementById("txtPersonal_id").value;
 		if (!staff_id.match(/[0-9][0-9][0-9][0-9][0-9]+$/)) {
				alert("���l5����ID����͂��Ă��������B");
				return false;
		}
		return true;
    }
 } 