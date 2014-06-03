function mailCheck1(){
	
	//池田 休暇リストボックス
	
    var select =document.activeElement.id;
    if(select.length == 10){
    	var num = select.slice(-1);
    }else{
    	var num = select.slice(-2);
    }
    
    var options = document.getElementById('id_Kyuka_' + num).options;
    var value = options.item(document.activeElement.selectedIndex).value;
    var breadOnly = false
    
    if(value != "0" && value != "00" && value != "04" && value != "05"){
    	breadOnly = true;
    	document.getElementById('id_jissekiS_' + num).value = "";
    	document.getElementById('id_jissekiE_' + num).value = "";
    	document.getElementById('id_jissekiR_' + num).value = "";
    }
    
    document.getElementById('id_jissekiS_' + num).readOnly = breadOnly;
    document.getElementById('id_jissekiE_' + num).readOnly = breadOnly;
    document.getElementById('id_jissekiR_' + num).readOnly = breadOnly;
    return breadOnly;
}