package db_action;

public class Check_time {
	//���Ԃ̃`�F�b�N
	public Set_db check(String time){
		Set_db set = new Set_db();
		String str = time;
		String zero = "0";

		//�������߂�
		int len = str.length();

		//�O���̏ꍇ�͓�0��t����
		if(len == 3){
			time = zero + time;
			//���b�Z�[�W
			set.str_message = "";
		} else{
			
		}
		return null;	
	}
}