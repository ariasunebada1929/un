function btnRegist_Click(){

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
				alert(n +"���̊�{�Ζ����ԁE�o�Ђɐ�������������͂��Ă�������");
				return false;
			}
		}
		if(KihonEnd !=""){
			if (!KihonEnd.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				alert(n +"���̊�{�Ζ����ԁE�ގЂɐ�������������͂��Ă�������");
				return false;
			}
		}
		if(JissekiStart !=""){
			if (!JissekiStart.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				alert(n +"���̎��ыΖ����ԁE�o�Ђɐ�������������͂��Ă�������");
				return false;
			}
		}
		if(JissekiEnd !=""){
			if (!JissekiEnd.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				alert(n +"���̎��ыΖ����ԁE�ގЂɐ�������������͂��Ă�������");
				return false;
			}
		}
		if(JissekiRest !=""){
			if (!JissekiRest.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				alert(n +"���̎��ыΖ����ԁE�x�e�ɐ�������������͂��Ă�������");
				return false;
			}
		}
		if(Zangyo !=""){
			if (!Zangyo.match(/^[0-9][0-5][0-9]+$|[1][0-9][0-5][0-9]+$|[2][0-4][0-5][0-9]+$/)) {
				alert(n +"���̎c�ƒ����ɐ��������Ԃ���͂��Ă�������");
				return false;
			}
		}
	}
	
	return true;
}