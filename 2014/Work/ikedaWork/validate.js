function validate(){
	var select =document.getElementById('id_Kyuka1');
    var options = document.getElementById('id_Kyuka1').options;
    var value = options.item(select.selectedIndex).value;
    var message;
    var JissekiStart=document.getElementById('id_jissekiS1').value;
    if(value=="04"){
    	if(JissekiStart !=""){
			if (JissekiStart.match(/^[0-9][0-5][0-9]+$/)) {
				alert( "1日の実績勤務時間・出社に13時以降を入力してください\n");
				return false;
			}
		}
    }
}