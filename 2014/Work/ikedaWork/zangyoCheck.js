function zangyou_Change(){
	
	//���̍ŏI���p�ϐ�
	var maxdate;
	
	//html�̍ŏI���`�F�b�N
	if(document.getElementById("id_zangyou31") != null){
		maxdate = 31;
	}else if(document.getElementById("id_zangyou30") != null){
		maxdate = 30;
	}else{
		maxdate = 28;
	}
	
	//�ŏI���܂Ŏc�ƒ����e�L�X�g�{�b�N�X��ύX
	for(n = 1; n <=maxdate; n++){
		obj = document.getElementById("Zangyo_chousei");
		index= obj.selectedIndex;
		 // ID���L�[�ɂ��ăe�L�X�g�{�b�N�X�G�������g�̎Q�Ƃ��擾����
        var targetElement = document.getElementById('id_zangyou' + n);
		if(index != 0){
        // �e�L�X�g�{�b�N�X���͕s��
        targetElement.readOnly = false;
		targetElement.style.backgroundColor='#FFFFFF';
		}
		else{
        // �e�L�X�g�{�b�N�X���͉�
        targetElement.readOnly = true;
		targetElement.style.backgroundColor='#808080';
        }
     }
}