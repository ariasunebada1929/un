package db_action;

public class Check_time {
	//時間のチェック
	public Set_db check(String time){
		Set_db set = new Set_db();
		String str = time;
		String zero = "0";

		//桁を求める
		int len = str.length();

		//三桁の場合は頭0を付ける
		if(len == 3){
			time = zero + time;
			//メッセージ
			set.str_message = "";
		} else{
			
		}
		return null;	
	}
}