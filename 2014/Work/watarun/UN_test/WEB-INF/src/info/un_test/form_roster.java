package info.un_test;

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

public class form_roster extends HttpServlet {

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
	
    try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		// TODO �����������ꂽ catch �u���b�N
		e.printStackTrace();
	}
    
    Connection conn = null;
    String serverName = "unserver2014";
    String url = "jdbc:mysql://localhost/" + serverName;
    String user = "root";
    String password = "";
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
        
        int Maxday = cal.getActualMaximum(cal.DATE);
    
        Statement stmt = conn.createStatement();
    
        /*����o�^�L���̔���*/
        String strInitsql = "SELECT COUNT(*) cnt FROM " + serverName +".WORK_TRN " + 
        		"WHERE STAFF_ID = " + strUserid + 
        		" AND YEAR = " + strYear + 
        		" AND MONTH = "  + strMonth;
    
        ResultSet rs = stmt.executeQuery(strInitsql);
    
        //���R�[�h���̎擾
        rs.next();
        int cnt = rs.getInt("cnt");
        String strPerSQL = "";
        rs.close();
        
        if (cnt == 0){
        	/*����o�^�̏ꍇ*/
        	/*�l�ݒ�g�����̌ďo��*/   	
        	strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST adjust FROM " + serverName +".PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
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
    	    strPerSQL = "SELECT YEAR year, MONTH month, DAY day, SUBMIT_REQUEST_1_CD req_1, " + 
                        "       SUBMIT_REQUEST_2_CD req_2, SUBMIT_REQUEST_3_CD req_3, " +
                        "       SUBMIT_REQUEST_4_CD req_4, DETAIL detail, " +
                        "       BASIC_WORK_START work_start, BASIC_WORK_END work_end, " +
                        "       ACTUAL_WORK_START act_start, ACTUAL_WORK_END act_end, " +
                        "       RESTHOURS rest_hours, ZANGYO_ADJUST zan_adj " +
                        "       FROM unserver2014.WORK_TRN WHERE STAFF_ID = " + strUserid;    
    	    rs = stmt.executeQuery(strPerSQL);
        	/*�ΑӃf�[�^���g��ǉ�*/
        	while(rs.next()){
            	int iyear = rs.getInt("year");
            	int imonth = rs.getInt("month");
            	int iday = rs.getInt("day");
        		String strreq_1 = rs.getString("req_1");
        		String strreq_2 = rs.getString("req_2");
        		String strreq_3 = rs.getString("req_3");
        		String strreq_4 = rs.getString("req_4");
        		int iwork_start = rs.getInt("work_start");
        		int work_end = rs.getInt("work_end");
        		int act_start = rs.getInt("act_start");
        		int act_end = rs.getInt("act_end");
        		int rest_hours = rs.getInt("rest_hours");
        		int zan_adj = rs.getInt("zan_adj");
        		
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
	
	//
	
}

public static void main(String[] args) throws InstantiationException, IllegalAccessException {
    String msg = "";
    try {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      msg = "�h���C�o�̃��[�h�ɐ������܂���";
    } catch (ClassNotFoundException e){
      msg = "�h���C�o�̃��[�h�Ɏ��s���܂���";
    }
    System.out.println(msg);
}

}

