function zangyou_Change(){
	
	//月の最終日用変数
	var maxdate;
	
	//htmlの最終日チェック
	if(document.getElementById("id_zangyou31") != null){
		maxdate = 31;
	}else if(document.getElementById("id_zangyou30") != null){
		maxdate = 30;
	}else{
		maxdate = 28;
	}
	
	var obj = document.getElementById("Zangyo_chousei");
	var index= obj.selectedIndex;
	//最終日まで残業調整テキストボックスを変更
	for(n = 1; n <=maxdate; n++){
		 // IDをキーにしてテキストボックスエレメントの参照を取得する
        var targetElement = document.getElementById('id_zangyou' + n);
		if(index != 0){
        // テキストボックス入力可
        targetElement.readOnly = false;
		targetElement.style.backgroundColor='#FFFFFF';
		}
		else{
        // テキストボックス入力不可
        targetElement.readOnly = true;
		targetElement.style.backgroundColor='#808080';
        }
     }
}