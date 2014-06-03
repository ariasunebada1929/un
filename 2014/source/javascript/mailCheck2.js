function mailCheck2(){
	//池田 休出/振代休リストボックス
	
	//idから日付を取得
    var select =document.activeElement.id;
    if(select.length == 20){
    	var num = select.slice(-1);
    }else{
    	var num = select.slice(-2);
    }
    var options = document.getElementsByName('id_KyusyutuFuridai_' + num).options;
    var value = options.item(document.activeElement.selectedIndex).value;
    
    if(value=="00" || value=="01" || value=="02"){
    	document.getElementById('id_furikae_'+ num).readOnly = true;
    	document.getElementById('id_furikae_'+ num).style.backgroundColor='#808080';
    }
    if(value=="03" || value=="04"){
    	document.getElementById('id_furikae_' + num).readOnly = false;
    	document.getElementById('id_furikae_' + num).style.backgroundColor='#FFFFFF';
    	alert(num + "日の振替日を入力してください");
    	jAlert(num + "日の振替日を入力してください", '確認');
    }
}