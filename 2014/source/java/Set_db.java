package info.un_test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class Set_db extends HttpServlet{
	public String str_message;
	public String true_time;

	//メイン処理(戻り値：結果メッセージ　受取値：登録初回フラグ)
	public ArrayList<String> main_action(HttpServletRequest req , String flg) throws SQLException{

		//メッセージ格納配列
		ArrayList<String> message = new ArrayList<String>();

		//DB接続用変数定義
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		//DB接続情報を設定する
		String path = "jdbc:mysql://localhost/unserver2014";  //接続パス
		String id = "root";    //ログインID
		String pw = "";  //ログインパスワード

		//SQL実行命令
		//初回インサート命令
		/*		String sql_in = "INSERT INTO unserver_01.WORK_TRN 	(STAFF_ID,YEAR,MONTH,DAY,"
				+ "SUBMIT_REQUEST_1_CD,SUBMIT_REQUEST_2_CD,"
				+ "SUBMIT_REQUEST_3_CD,SUBMIT_REQUEST_4_CD,"
				+ "COMP_HOLIDAY,DETAIL,BASIC_WORK_START,BASIC_WORK_END,"
				+ "ACTUAL_WORK_START,ACTUAL_WORK_END,RESTHOURS,ZANGYO_ADJUST) "
				+ "VALUES ('00001','2014','05','06',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ')";
		 */
		//編集アップロード命令
		String sql_up = "SELECT * FROM unserver2014.`parsonal_auth_trn`";

		try{
			//JDBCドライバをロードする
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("接続成功");
			//DBへのコネクションを作成する
			conn = DriverManager.getConnection(path, id, pw);
			Statement stmt = conn.createStatement();
			//conn.setAutoCommit(false);//オートコミットオフ

			//処理
			if (flg.equals("1")){
				//当月分の日時取得処理
				Calendar cal = Calendar.getInstance();
				int year  = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				//月末取得
				cal.set(Calendar.YEAR, year);
				cal.set(Calendar.MONTH, month );                
				int lastDayOfMonth = cal.getActualMaximum(Calendar.DATE);

				//HTMLからデータ取得
				//for(int i=1; i<=lastDayOfMonth; i++){
				String sql_in = "";
				
				for(int i=1; i<=lastDayOfMonth - 1; i++){
					sql_in = sql_in 
							+ " INTO unserver2014.WORK_TRN "  
							+ "(STAFF_ID,YEAR,MONTH,DAY,"
				            + "SUBMIT_REQUEST_1_CD,SUBMIT_REQUEST_2_CD,"
				            + "SUBMIT_REQUEST_3_CD,SUBMIT_REQUEST_4_CD,"
				            + "COMP_HOLIDAY,DETAIL,BASIC_WORK_START,BASIC_WORK_END,"
				            + "ACTUAL_WORK_START,ACTUAL_WORK_END,RESTHOURS,ZANGYO_ADJUST) VALUES ( " 
				            + "'0002','"
				            + year + "','" 
				            + String.format("%1$02d", month) + "','" 
				            + String.format("%1$02d", i) + "','"
				            + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_Kyuka_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_KyusyutuFuridai_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_Shift_" + i))) + "',"
			                + String.valueOf(req.getParameter("nm_furikae_" + i)) + "','"          
			                + String.valueOf(req.getParameter("nm_syousai_" + i)) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_kihonS_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_kihonE_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_jissekiS_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_jissekiE_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_jiseekiR_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_zangyou_" + i))) + "');";
			                
					//文字列チェック
					System.out.println(i);

				}
				
				sql_in = new String(sql_in.getBytes("Shift_JIS"),"Shift_JIS");
				
				stmt.execute(sql_in);
				
			} else if(flg == "2"){
				//アップロード

			}
			
			//conn.commit();//コミット

		}catch(Exception ex){
			//例外発生時の処理
			//conn.rollback();//ロールバック
			ex.printStackTrace();  //エラー内容をコンソールに出力する
		}finally{
			//クローズ処理
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}
		//引数：結果メッセージ
		return message;	
	}

	//入力時間チェック
	public static String check(String check_time){
		String str = check_time;
		String zero = "0";
		String time = null;

		//桁を求める
		int len = str.length();

		//三桁の場合は頭0を付ける
		if(len == 3){
			time = zero + check_time;
		}
		return time;
	}
}