function btnRegist_Click(){

	//���̍ŏI���p�ϐ�
	var maxdate;
	//�G���[���b�Z�[�W�i�[�z��
	var strMessage = "";
	
	//html�̍ŏI���`�F�b�N
	if(document.getElementById("id_zangyou31") != null){
		maxdate = 31;
	}else if(document.getElementById("id_zangyou30") != null){
		maxdate = 30;
	}else{
		maxdate = 28;
	}
	
	//�ŏI���܂œ��͂��`�F�b�N
	for(n = 1; n <=maxdate; n++){
		KihonStart= document.getElementById("id_kihonS" + n).value;
		KihonEnd= document.getElementById("id_kihonE" + n).value;
		JissekiStart= document.getElementById("id_jissekiS" + n).value;
		JissekiEnd= document.getElementById("id_jissekiE"+ n).value;
		JissekiRest= document.getElementById("id_jissekiR" + n).value;
		Zangyo= document.getElementById("id_zangyou" + n).value;
	
		if(KihonStart !=""){
			if (!KihonStart.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"���̊�{�Ζ����ԁE�o�Ђɐ�������������͂��Ă�������\n";
			}
		}
		if(KihonEnd !=""){
			if (!KihonEnd.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"���̊�{�Ζ����ԁE�ގЂɐ�������������͂��Ă�������\n";
			}
		}
		if(JissekiStart !=""){
			if (!JissekiStart.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"���̎��ыΖ����ԁE�o�Ђɐ�������������͂��Ă�������\n";
			}
		}
		if(JissekiEnd !=""){
			if (!JissekiEnd.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"���̎��ыΖ����ԁE�ގЂɐ�������������͂��Ă�������\n";
			}
		}
		if(JissekiRest !=""){
			if (!JissekiRest.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"���̎��ыΖ����ԁE�x�e�ɐ�������������͂��Ă�������\n";
			}
		}
		if(Zangyo !=""){
			if (!Zangyo.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				strMessage += n +"���̎c�ƒ����ɐ��������Ԃ���͂��Ă�������\n";
			}
		}
	}
	
	//�G���[���b�Z�[�W��\��
	if(strMessage ==""){
		return true;
	}else{
		alert(strMessage);
		return false;
	}
	
}