function btnRegist_Click(){

	//月の最終日用変数
	var maxdate;
	//エラーメッセージ格納配列
	var strMessage = "";
	
	//htmlの最終日チェック
	if(document.getElementById("id_zangyou31") != null){
		maxdate = 31;
	}else if(document.getElementById("id_zangyou30") != null){
		maxdate = 30;
	}else{
		maxdate = 28;
	}
	
	//最終日まで入力をチェック
	for(n = 1; n <=maxdate; n++){
		KihonStart= document.getElementById("id_kihonS" + n).value;
		KihonEnd= document.getElementById("id_kihonE" + n).value;
		JissekiStart= document.getElementById("id_jissekiS" + n).value;
		JissekiEnd= document.getElementById("id_jissekiE"+ n).value;
		JissekiRest= document.getElementById("id_jissekiR" + n).value;
		Zangyo= document.getElementById("id_zangyou" + n).value;
	
		if(KihonStart !=""){
			if (!KihonStart.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"日の基本勤務時間・出社に正しい時刻を入力してください\n";
			}
		}
		if(KihonEnd !=""){
			if (!KihonEnd.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"日の基本勤務時間・退社に正しい時刻を入力してください\n";
			}
		}
		if(JissekiStart !=""){
			if (!JissekiStart.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"日の実績勤務時間・出社に正しい時刻を入力してください\n";
			}
		}
		if(JissekiEnd !=""){
			if (!JissekiEnd.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"日の実績勤務時間・退社に正しい時刻を入力してください\n";
			}
		}
		if(JissekiRest !=""){
			if (!JissekiRest.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"日の実績勤務時間・休憩に正しい時刻を入力してください\n";
			}
		}
		if(Zangyo !=""){
			if (!Zangyo.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"日の残業調整に正しい時間を入力してください\n";
			}
		}
	}
	
	//エラーメッセージを表示
	if(strMessage ==""){
		return true;
	}else{
		alert(strMessage);
		return false;
	}
	
}