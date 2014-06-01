function validate(){
	var select =document.getElementById('id_Kyuka1');
    var options = document.getElementById('id_Kyuka1').options;
    var value = options.item(select.selectedIndex).value;
    var message;
    var KihonStart =document.getElementById('id_kihonS1').value;
    var KihonEnd =document.getElementById('id_kihonE1').value;
    var JissekiStart = document.getElementById('id_jissekiS1').value;
    var JissekiEnd = document.getElementById('id_jissekiE1').value;
    
    if(value=="04"){
    	if(KihonStart !=""){
			if(KihonStart != '1300'){
				alert( "1日の基本勤務時間・出社に13時を入力してください\n");
				return false;
			}
		}
    	if(JissekiStart !=""){
			if(JissekiStart != '1300'){
				alert( "1日の実績勤務時間・出社に13時を入力してください\n");
				return false;
			}
		}
    }
    if(value=="05"){
    	if(KihonEnd !=""){
			if(KihonEnd !='1200'){
				alert( "1日の基本勤務時間・退社に12時を入力してください\n");
				return false;
			}
		}
    	if(JissekiEnd !=""){
			if(JissekiEnd !='1200'){
				alert( "1日の実績勤務時間・退社に12時を入力してください\n");
				return false;
			}
		}
    }
}