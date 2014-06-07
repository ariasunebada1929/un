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

	//���C������(�߂�l�F���ʃ��b�Z�[�W�@���l�F�o�^����t���O)
	public ArrayList<String> main_action(HttpServletRequest req , String flg) throws SQLException{

		//���b�Z�[�W�i�[�z��
		ArrayList<String> message = new ArrayList<String>();

		//DB�ڑ��p�ϐ���`
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		//DB�ڑ�����ݒ肷��
		String path = "jdbc:mysql://localhost/unserver2014";  //�ڑ��p�X
		String id = "root";    //���O�C��ID
		String pw = "";  //���O�C���p�X���[�h

		//SQL���s����
		//����C���T�[�g����
		/*		String sql_in = "INSERT INTO unserver_01.WORK_TRN 	(STAFF_ID,YEAR,MONTH,DAY,"
				+ "SUBMIT_REQUEST_1_CD,SUBMIT_REQUEST_2_CD,"
				+ "SUBMIT_REQUEST_3_CD,SUBMIT_REQUEST_4_CD,"
				+ "COMP_HOLIDAY,DETAIL,BASIC_WORK_START,BASIC_WORK_END,"
				+ "ACTUAL_WORK_START,ACTUAL_WORK_END,RESTHOURS,ZANGYO_ADJUST) "
				+ "VALUES ('00001','2014','05','06',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ')";
		 */
		//�ҏW�A�b�v���[�h����
		String sql_up = "SELECT * FROM unserver2014.`parsonal_auth_trn`";

		try{
			//JDBC�h���C�o�����[�h����
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("�ڑ�����");
			//DB�ւ̃R�l�N�V�������쐬����
			conn = DriverManager.getConnection(path, id, pw);
			Statement stmt = conn.createStatement();
			//conn.setAutoCommit(false);//�I�[�g�R�~�b�g�I�t

			//����
			if (flg.equals("1")){
				//�������̓����擾����
				Calendar cal = Calendar.getInstance();
				int year  = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				//�����擾
				cal.set(Calendar.YEAR, year);
				cal.set(Calendar.MONTH, month );                
				int lastDayOfMonth = cal.getActualMaximum(Calendar.DATE);

				//HTML����f�[�^�擾
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
			                
					//������`�F�b�N
					System.out.println(i);

				}
				
				sql_in = new String(sql_in.getBytes("Shift_JIS"),"Shift_JIS");
				
				stmt.execute(sql_in);
				
			} else if(flg == "2"){
				//�A�b�v���[�h

			}
			
			//conn.commit();//�R�~�b�g

		}catch(Exception ex){
			//��O�������̏���
			//conn.rollback();//���[���o�b�N
			ex.printStackTrace();  //�G���[���e���R���\�[���ɏo�͂���
		}finally{
			//�N���[�Y����
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}
		//�����F���ʃ��b�Z�[�W
		return message;	
	}

	//���͎��ԃ`�F�b�N
	public static String check(String check_time){
		String str = check_time;
		String zero = "0";
		String time = null;

		//�������߂�
		int len = str.length();

		//�O���̏ꍇ�͓�0��t����
		if(len == 3){
			time = zero + check_time;
		}
		return time;
	}
}