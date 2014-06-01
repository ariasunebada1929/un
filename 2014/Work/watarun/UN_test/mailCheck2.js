function mailCheck2(){
    var select =document.activeElement.id;
    if(select.length ==19){
    	var num = select.slice(-1);
    }else{
    	var num = select.slice(-2);
    }
    var options = document.getElementById('id_KyusyutuFuridai' + num).options;
    var value = options.item(document.activeElement.selectedIndex).value;
    
    if(value=="00" || value=="01" || value=="02"){
    	document.getElementById('id_furikae'+ num).readOnly = true;
    	document.getElementById('id_furikae'+ num).style.backgroundColor='#808080';
    }
    if(value=="03" || value=="04"){
    	document.getElementById('id_furikae' + num).readOnly = false;
    	document.getElementById('id_furikae' + num).style.backgroundColor='#FFFFFF';
    }
}