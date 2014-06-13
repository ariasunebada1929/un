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
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Set_db extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String str_message;
	public String true_time;

	//���C������(�߂�l�F���ʃ��b�Z�[�W�@���l�F�o�^����t���O)
	public ArrayList<String> main_action(HttpServletRequest req , String flg) throws SQLException{

		//���b�Z�[�W�i�[�z��
		ArrayList<String> message = new ArrayList<String>();

		//DB�ڑ��p�ϐ���`
		Connection conn = null;
		boolean auto = false;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String serverName = "unserver2014";

		//DB�ڑ�����ݒ肷��
		String path = "jdbc:mysql://localhost/unserver2014?useUnicode=true&characterEncoding=SJIS";  //�ڑ��p�X

	    Properties props = new Properties(); 
	    props.put("user",       "root");                 // �C�� 
	    props.put("password",   "");                     // �C�� 
	    props.put("useUnicode", "true");                 // ���ꂪ�K�v 
	    props.put("characterEncoding", "SJIS");          // ���ꂪ�K�v 

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
		String sql_up = "SELECT * FROM " + serverName + ".`parsonal_auth_trn`";

		try{
			//JDBC�h���C�o�����[�h����
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("�ڑ�����");
			//DB�ւ̃R�l�N�V�������쐬����
			conn = DriverManager.getConnection(path, props);
			Statement stmt = conn.createStatement();
			//conn.setAutoCommit(false);//�I�[�g�R�~�b�g�I�t
			
			auto = conn.getAutoCommit(); 
			conn.setAutoCommit(false);

			//����
			//if (flg.equals("1")){
			//�������̓����擾����
			Calendar cal = Calendar.getInstance();
			int year  = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			//�����擾
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month );                
			int lastDayOfMonth = cal.getActualMaximum(Calendar.DATE);
			String strUserid = String.valueOf(req.getParameter("hdn_strid"));
				
			//�폜��
			String sql_del = "DELETE FROM " + serverName + ".`work_trn` WHERE STAFF_ID = " + strUserid 
                        + " AND YEAR   = '2014'"
                        + "AND MONTH   = '06'";
	
			int n = stmt.executeUpdate(sql_del);
				
			//HTML����f�[�^�擾
			//for(int i=1; i<=lastDayOfMonth; i++){
			String sql_in = "";
				
			sql_in =  "INSERT INTO " + serverName + ".WORK_TRN "  
						+ "(STAFF_ID,YEAR,MONTH,DAY,"
			            + "SUBMIT_REQUEST_1_CD,SUBMIT_REQUEST_2_CD,"
			            + "SUBMIT_REQUEST_3_CD,SUBMIT_REQUEST_4_CD,"
			            + "COMP_HOLIDAY,DETAIL,BASIC_WORK_START,BASIC_WORK_END,"
			            + "ACTUAL_WORK_START,ACTUAL_WORK_END,RESTHOURS,ZANGYO_ADJUST) VALUES ";
				
			for(int i=1; i<=lastDayOfMonth - 1; i++){
					
				String GetItem = new String (req.getParameter("nm_syousai_" + i).getBytes("ISO-8859-1"));
					
				sql_in = sql_in + "('" 
				            + strUserid + "','"
				            + year + "','" 
				            + String.format("%1$02d", month) + "','" 
				            + String.format("%1$02d", i) + "','"
				            + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_Kyuka_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_KyusyutuFuridai_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_Shift_" + i))) + "','"
			                + String.format("%1$02d",Integer.valueOf(req.getParameter("nm_Hendou_" + i))) + "','"			                
			                + String.valueOf(req.getParameter("nm_furikae_" + i)) + "','"
			                + String.valueOf(GetItem) + "',"
			                + check(req.getParameter("nm_kihonS_" + i),"3") + ","
			                + check(req.getParameter("nm_kihonE_" + i),"3") + ","
			                + check(req.getParameter("nm_jissekiS_" + i),"3") + ","
			                + check(req.getParameter("nm_jissekiE_" + i),"3") + ","
			                + check(req.getParameter("nm_jiseekiR_" + i),"3") + ","
			                + check(req.getParameter("nm_zangyou_" + i),"3") + "),";	
			}
				
			sql_in = sql_in.substring(0, sql_in.length()-1);
			n = stmt.executeUpdate(sql_in);
				 
			stmt.close(); //�R�~�b�g�������̓��[���o�b�N�����s���� 
			commit(conn, auto, true);

			//�o�^����ID���Z�b�V�����Ɋi�[
			HttpSession prsonalSession = req.getSession();
			prsonalSession.setAttribute("Pesonal_ID", strUserid);	

		}catch(Exception ex){
			//��O�������̏���
			conn.rollback();//���[���o�b�N
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
	public static String check(String check_time , String Keta){
		String str = check_time;

		//��l�̏ꍇ�͓�0��t����
		if(str != ""){
			str = "'" + String.format("%1$0" + Keta +"d",Integer.valueOf(str)) + "'";
		}else{
			str = "''";
		}
		return str;
	}
	
	public static void commit(Connection con, boolean auto, boolean ret){
		try {   
				if (auto) {    
					if(ret == true){
						con.commit();
					}else{
						con.rollback();
					    con.setAutoCommit(auto);   
					} 
				}
			} catch (SQLException e) {
				e.printStackTrace();
		}
	}	
}