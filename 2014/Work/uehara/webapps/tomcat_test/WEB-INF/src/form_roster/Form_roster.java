package form_roster;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Form_roster extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException
			{
		String strUserid = "00001";	
		int iRecordCount = 0;
		//HttpSession�C���^�t�F�[�X�̃I�u�W�F�N�g���擾
		HttpSession session = request.getSession();
		//id��session�X�R�[�v�ŕۑ�
		session.setAttribute("userid", strUserid);

		/*		try {
			//Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO �����������ꂽ catch �u���b�N
			e.printStackTrace();
		}
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e1) {
			// TODO �����������ꂽ catch �u���b�N
			e1.printStackTrace();
		}

		Connection conn = null;
		//String serverName = "unserver_01";
		String url = "jdbc:mysql://localhost/UnServer?useUnicode=true&characterEncoding=Shift_JIS";
		String user = "root";
		String password = "root";
		String msg = "";

		try{

			conn = DriverManager.getConnection(url, user, password);

			// �f�[�^�x�[�X�ɑ΂��鏈��
			msg = "�f�[�^�x�[�X�ڑ��ɐ������܂���";

			/*�������̓����擾����*/
			Calendar cal = Calendar.getInstance();        
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			sdf.applyPattern("yyyy");
			String strYear = sdf.format(cal.getTime());
			sdf.applyPattern("MM");
			String strMonth = sdf.format(cal.getTime());

			Statement stmt = conn.createStatement();

			/*����o�^�L���̔���*/
			String strInitsql = "SELECT COUNT(*) cnt FROM unserver_01.WORK_TRN " + 
					"WHERE STAFF_ID = " + strUserid + 
					" AND YEAR = " + strYear + 
					" AND MONTH = "  + strMonth;

			ResultSet rs = stmt.executeQuery(strInitsql);

			//���R�[�h���̎擾
			rs.next();
			int cnt = rs.getInt("cnt");
			String strPerSQL = "";       
			cnt = 0;

			if (cnt == 0){
				/*����o�^�̏ꍇ*/
				/*�l�ݒ�g�����̌ďo��*/   	
				strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST adjust FROM unserver_01.PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
				rs = stmt.executeQuery(strPerSQL);
				/*�l�ݒ�g���������g��ǉ�*/
				while(rs.next()){
					int work_start = rs.getInt("work_start");
					int work_end = rs.getInt("work_end");
					String detail = rs.getString("detail");
					int zangyo = rs.getInt("adjust");
				}
			} else {
				/*�ΑӃg�����̃f�[�^�Ăяo��*/
				strPerSQL = "SELECT * FROM unserver_01.WORK_TRN�@" + 
						"WHERE STAFF_ID = " + strUserid + 
						" AND YEAR = " + strYear + 
						" AND MONTH = "  + strMonth;
				ResultSet perrs = stmt.executeQuery(strPerSQL);   	
				/*�ΑӃf�[�^���g��ǉ�*/
				while(perrs.next()){

				}
			}

			/*�C�x���g�̍쐬*/

			/*�o�^�C�x���g�̍쐬*/
			/*���������*/

			/*Excel�o�͂̍쐬*/

			/*�Αӓ��̓t�H�[���̃��[�h����*/
			response.setContentType("text/html; charset=utf-8");
			this.getServletContext().getRequestDispatcher
			("/form_roster.jsp").include(request, response);

		}catch (SQLException e){
			msg = "�h���C�o�̃��[�h�Ɏ��s���܂���";
			//��O����
		}finally{   	
			try{
				if (conn != null){
					conn.close();
				}
			}catch (SQLException e){
				// ��O����
			}
			System.out.println(msg);
		}

			}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Hello World!</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello World!</h1>");
		out.println("</body>");
		out.println("</html>");
			}

	public void Click(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		//��ʂ̓��͍��ڎ���Ă��ēo�^�p�̃f�[�^�ɂ���B

		//DB��ID�ƃp�X���[�h�Ăяo��

		//�o�^�p�̃f�[�^��SQL�ɓ��ꍞ�ޏ������쐬����o�^����
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Hello World!</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello World!</h1>");
		out.println("</body>");
		out.println("</html>");
			}

	public static void main(String[] args) throws InstantiationException, IllegalAccessException {
		String msg = "";
		/*			try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			msg = "�h���C�o�̃��[�h�ɐ������܂���";
		} catch (ClassNotFoundException e){
			msg = "�h���C�o�̃��[�h�Ɏ��s���܂���";
		}
		System.out.println(msg);
		 	}
		 */
	}
}//http://localhost:8080/tomcat_test/servlet/form_roster