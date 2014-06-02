function mailCheck1(){
	
	//池田 休暇リストボックス
	
    var select =document.activeElement.id;
    if(select.length ==9){
    	var num = select.slice(-1);
    }else{
    	var num = select.slice(-2);
    }
    
    var options = document.getElementById('id_Kyuka' + num).options;
    var value = options.item(document.activeElement.selectedIndex).value;
    
    if(value=="00"){
    	document.getElementById('id_jissekiS' + num).readOnly = false;
    	document.getElementById('id_jissekiE' + num).readOnly = false;
    	document.getElementById('id_jissekiR' + num).readOnly = false;
    	return false;
    }
    if(value=="01"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="02"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="03"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="04"){
    	document.getElementById('id_jissekiS' + num).readOnly = false;
    	document.getElementById('id_jissekiE' + num).readOnly = false;
    	document.getElementById('id_jissekiR' + num).readOnly = false;
    	return true;
    }
    if(value=="05"){
    	document.getElementById('id_jissekiS' + num).readOnly = false;
    	document.getElementById('id_jissekiE' + num).readOnly = false;
    	document.getElementById('id_jissekiR' + num).readOnly = false;
    	return true;
    }
    if(value=="06"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="07"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="08"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="09"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="10"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="11"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="12"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="13"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="14"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
    if(value=="15"){
    	document.getElementById('id_jissekiS' + num).readOnly = true;
    	document.getElementById('id_jissekiE' + num).readOnly = true;
    	document.getElementById('id_jissekiR' + num).readOnly = true;
    	return true;
    }
}