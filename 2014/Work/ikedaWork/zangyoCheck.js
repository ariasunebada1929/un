function zangyou_Change(){
		obj = document.getElementById("Zangyo_chousei");
		index= obj.selectedIndex;
		 // ID���L�[�ɂ��ăe�L�X�g�{�b�N�X�G�������g�̎Q�Ƃ��擾����
        var targetElement = document.getElementById('id_zangyou');
		if(index != 0){
        // �e�L�X�g�{�b�N�X����͕s�ɂ��܂�
        targetElement.readOnly = false;
		targetElement.style.backgroundColor='#FFFFFF';
        alert("���͉ɂȂ�܂����B");
		}
		else{
        // �e�L�X�g�{�b�N�X����͉ɂ��܂�
        targetElement.readOnly = true;
		targetElement.style.backgroundColor='#808080';
        alert("���͕s�ɂȂ�܂����B");
        }
}