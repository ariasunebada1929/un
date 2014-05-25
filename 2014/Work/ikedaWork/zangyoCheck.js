function zangyou_Change(){
		obj = document.getElementById("Zangyo_chousei");
		index= obj.selectedIndex;
		 // IDをキーにしてテキストボックスエレメントの参照を取得する
        var targetElement = document.getElementById('id_zangyou');
		if(index != 0){
        // テキストボックスを入力不可にします
        targetElement.readOnly = false;
		targetElement.style.backgroundColor='#FFFFFF';
        alert("入力可になりました。");
		}
		else{
        // テキストボックスを入力可にします
        targetElement.readOnly = true;
		targetElement.style.backgroundColor='#808080';
        alert("入力不可になりました。");
        }
}