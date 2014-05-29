function mailCheck(){
	var select =document.getElementById('id_Kyuka1');
    var options = document.getElementById('id_Kyuka1').options;
    var value = options.item(select.selectedIndex).value;
    
    if(value=="00"){
    	document.getElementById('id_jissekiS1').readOnly = false;
    	document.getElementById('id_jissekiE1').readOnly = false;
    	document.getElementById('id_jissekiR1').readOnly = false;
    	return false;
    }
    if(value=="01"){
    	document.getElementById('id_jissekiS1').readOnly = true;
    	document.getElementById('id_jissekiE1').readOnly = true;
    	document.getElementById('id_jissekiR1').readOnly = true;
    	return true;
    }
}