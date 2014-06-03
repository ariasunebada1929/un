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
import javax.swing.JTextField;

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
        
     	int iMaxday = cal.getActualMaximum(cal.DATE);
	    
    	/*�ΑӃf�[�^���g��ǉ�*/
    	String[] strreq_1 = new String[iMaxday];
    	String[] strreq_2 = new String[iMaxday];
    	String[] strreq_3 = new String[iMaxday];
    	String[] strreq_4 = new String[iMaxday];
    	String[] strdetail = new String[iMaxday];
    	int[] iwork_start = new int[iMaxday];
    	int[] iwork_end = new int[iMaxday];
    	int[] iact_start = new int[iMaxday];
    	int[] iact_end = new int[iMaxday];
    	int[] irest_hours = new int[iMaxday];
    	int[] izan_adj = new int[iMaxday];
        
        if (cnt == 0){
        	/*����o�^�̏ꍇ*/
        	/*�l�ݒ�g�����̌ďo��*/   	
        	strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST adjust FROM " + serverName +".PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
        	ResultSet Ors = stmt.executeQuery(strPerSQL);
        	/*�l�ݒ�g���������g��ǉ�*/
    		int i = 0;
    		Ors.next();
    		strdetail[i] = Ors.getString("detail");
    		iwork_start[i] = Ors.getInt("work_start");
    		iwork_end[i] = Ors.getInt("work_end");
    		izan_adj[i] = Ors.getInt("zan_adj");
    		i = 1;	
        } else {
    	    /*�ΑӃg�����̃f�[�^�Ăяo��*/
    	    strPerSQL = "SELECT YEAR year, MONTH month, DAY day, SUBMIT_REQUEST_1_CD req_1, " + 
                        "       SUBMIT_REQUEST_2_CD req_2, SUBMIT_REQUEST_3_CD req_3, " +
                        "       SUBMIT_REQUEST_4_CD req_4, DETAIL detail, " +
                        "       BASIC_WORK_START work_start, BASIC_WORK_END work_end, " +
                        "       ACTUAL_WORK_START act_start, ACTUAL_WORK_END act_end, " +
                        "       RESTHOURS rest_hours, ZANGYO_ADJUST zan_adj, " +
        	            "       DETAIL detail " +
                        "       FROM unserver2014.WORK_TRN WHERE STAFF_ID = " + strUserid;    
    	    ResultSet Ors = stmt.executeQuery(strPerSQL);
        	
		    int i = 0;
			while(Ors.next()){
			    strreq_1[i] = Ors.getString("req_1");
			    strreq_2[i]  = Ors.getString("req_2");
			    strreq_3[i]  = Ors.getString("req_3");
			    strreq_4[i]  = Ors.getString("req_4");
			    strdetail[i] = Ors.getString("detail");
			    iwork_start[i] = Ors.getInt("work_start");
			    iwork_end[i] = Ors.getInt("work_end");
			    iact_start[i] = Ors.getInt("act_start");
			    iact_end[i] = Ors.getInt("act_end");
			    irest_hours[i] = Ors.getInt("rest_hours");
			    izan_adj[i] = Ors.getInt("zan_adj");
			    i = i + 1;
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

