function validate(){
	
	//�r�c �x�ɁE�ߑO�x�ߌ�x
	
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
   
	var value1 = document.getElementById('id_Kyuka_' + num);
    var options = document.getElementById('id_Kyuka_' + num).options;
    var value = options.item(value1.selectedIndex).value;
    var KihonStart =document.getElementById('id_kihonS_' + num).value;
    var KihonEnd =document.getElementById('id_kihonE_' + num).value;
    var JissekiStart = document.getElementById('id_jissekiS_' + num).value;
    var JissekiEnd = document.getElementById('id_jissekiE_' + num).value;
    
    
    //�ߑO�x
    if(value=="04"){
    	if(KihonStart !=""){
			if(KihonStart != '1300'){
				alert( "1���̊�{�Ζ����ԁE�o�Ђ�13������͂��Ă�������\n");
				document.form_roster.kihonS_1.focus();
				return false;
			}
		}
    	if(JissekiStart !=""){
			if(JissekiStart != '1300'){
				alert( "1���̎��ыΖ����ԁE�o�Ђ�13������͂��Ă�������\n");
				document.form_roster.jissekiS_1.focus();
				return false;
			}
		}
    }
    //�ߌ�x
    if(value=="05"){
    	if(KihonEnd !=""){
			if(KihonEnd !='1200'){
				alert( "1���̊�{�Ζ����ԁE�ގЂ�12������͂��Ă�������\n");
				document.form_roster.kihonE_1.focus();
				return false;
			}
		}
    	if(JissekiEnd !=""){
			if(JissekiEnd !='1200'){
				alert( "1���̎��ыΖ����ԁE�ގЂ�12������͂��Ă�������\n");
				document.form_roster.jissekiE_1.focus();
				return false;
			}
		}
    }
}