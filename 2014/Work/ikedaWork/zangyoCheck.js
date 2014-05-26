function zangyou_Change(){
	for(n = 1; n <=31; n++){
		obj = document.getElementById("Zangyo_chousei");
		index= obj.selectedIndex;
		 // IDをキーにしてテキストボックスエレメントの参照を取得する
        var targetElement = document.getElementById('id_zangyou' + n);
		if(index != 0){
        // テキストボックスを入力不可にします
        targetElement.readOnly = false;
		targetElement.style.backgroundColor='#FFFFFF';
        // alert("入力可になりました。");
		}
		else{
        // テキストボックスを入力可にします
        targetElement.readOnly = true;
		targetElement.style.backgroundColor='#808080';
        //alert("入力不可になりました。");
        }
     }
}