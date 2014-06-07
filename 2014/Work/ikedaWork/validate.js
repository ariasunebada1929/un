function validate(){
	
	//池田 休暇・午前休午後休
	
	var select =document.activeElement.id;
	
	if(select.match("id_kihon")){
    	if(select.length ==10){
    		var num = select.slice(-1);
    	}else{
	    	var num = select.slice(-2);
    	}
    }else{
    	if(select.length ==12){
    		var num = select.slice(-1);
    	}else{
	    	var num = select.slice(-2);
    	}
    }
   
	var value1 = document.getElementById('id_Kyuka' + num);
    var options = document.getElementById('id_Kyuka' + num).options;
    var value = options.item(value1.selectedIndex).value;
    var KihonStart =document.getElementById('id_kihonS' + num).value;
    var KihonEnd =document.getElementById('id_kihonE' + num).value;
    var JissekiStart = document.getElementById('id_jissekiS' + num).value;
    var JissekiEnd = document.getElementById('id_jissekiE' + num).value;
    
    
    //午前休
    if(value=="04"){
    	if(KihonStart !=""){
			if(KihonStart != '1300'){
				alert( "1日の基本勤務時間・出社に13時を入力してください2\n");
				//document.form_roster.kihonS_1.focus();
				//return false;
			}
		}
    	if(JissekiStart !=""){
			if(JissekiStart != '1300'){
				alert( "1日の実績勤務時間・出社に13時を入力してください\n");
				document.form_roster.jissekiS_1.focus();
				return false;
			}
		}
		//document.form_roster.kihonS_1.focus();
		//return false;
    }
    
    //午後休
    if(value=="05"){
    	if(KihonEnd !=""){
			if(KihonEnd !='1200'){
				alert( "1日の基本勤務時間・退社に12時を入力してください\n");
				document.form_roster.kihonE_1.focus();
				return false;
			}
		}
    	if(JissekiEnd !=""){
			if(JissekiEnd !='1200'){
				alert( "1日の実績勤務時間・退社に12時を入力してください\n");
				document.form_roster.jissekiE_1.focus();
				return false;
			}
		}
    }
    
}