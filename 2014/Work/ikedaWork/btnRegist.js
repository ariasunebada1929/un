function btnRegist_Click(){
	 Kihon1= document.getElementById("id_kihon1").value;
	 Kihon2= document.getElementById("id_kihon2").value;
	 Jisseki1= document.getElementById("id_jisseki1").value;
	 Jisseki2= document.getElementById("id_jisseki2").value;
	 Jisseki3= document.getElementById("id_jisseki3").value;
	 Zangyo= document.getElementById("id_zangyou").value;
	 
	if(Kihon1 !=""){
		if (!Kihon1.match(/^[0-9]:[0-5][0-9]+$|[1][0-9]:[0-5][0-9]+$|[2][0-4]:[0-5][0-9]+$/)) {
			alert("基本勤務時間・出社に正しい時刻を入力してください");
			return false;
		}
	}
	if(!(Kihon2 =="")){
		if (!Kihon2.match(/^[0-9]:[0-5][0-9]+$|[1][0-9]:[0-5][0-9]+$|[2][0-4]:[0-5][0-9]+$/)) {
			alert("基本勤務時間・退社に正しい時刻を入力してください");
			return false;
		}
	}
	if(!(Jisseki1 =="")){
		if (!Jisseki1.match(/^[0-9]:[0-5][0-9]+$|[1][0-9]:[0-5][0-9]+$|[2][0-4]:[0-5][0-9]+$/)) {
			alert("実績勤務時間・出社に正しい時刻を入力してください");
			return false;
		}
	}
	if(!(Jisseki2 =="")){
		if (!Jisseki2.match(/^[0-9]:[0-5][0-9]+$|[1][0-9]:[0-5][0-9]+$|[2][0-4]:[0-5][0-9]+$/)) {
			alert("実績勤務時間・退社に正しい時刻を入力してください");
			return false;
		}
	}
	if(!(Jisseki3 =="")){
		if (!Jisseki3.match(/^[0-9]:[0-5][0-9]+$|[1][0-9]:[0-5][0-9]+$|[2][0-4]:[0-5][0-9]+$/)) {
			alert("実績勤務時間・休憩に正しい時刻を入力してください");
			return false;
		}
	}
	if(!(Zangyo =="")){
		if (!Zangyo.match(/^[0-9]:[0-5][0-9]+$|[1][0-9]:[0-5][0-9]+$|[2][0-4]:[0-5][0-9]+$//)) {
			alert("残業調整に正しい時刻を入力してください");
			return false;
		}
	}
	return true;
}