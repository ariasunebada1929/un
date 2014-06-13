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
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JTextField;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

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
	response.setContentType("text/html; charset=Shift_JIS");
	String strUserid = "99999";	
	int iRecordCount = 0;
	
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
    	
    	HttpSession hs1 = request.getSession();
        if (hs1.isNew()) {
            strUserid = "99999";
        }else{
            strUserid = String.valueOf(hs1.getAttribute("Pesonal_ID"));
        }
    	
    	conn = DriverManager.getConnection(url, user, password);

        // �f�[�^�x�[�X�ɑ΂��鏈��
    	msg = "�f�[�^�x�[�X�ڑ��ɐ������܂���";

        // �f�[�^�x�[�X�ɐڑ�����Connection�I�u�W�F�N�g�̎擾
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost/" + serverName,
            "root", "");
        // �f�[�^�x�[�X������s�����߂�Statement�I�u�W�F�N�g�̎擾
        Statement stmt = conn.createStatement();

        /*�l�f�[�^�̎擾*/
        String strUserSQL = "SELECT par_trn.STAFF_ID, per_mst.FIRST_NAME fst_nm, per_mst.LAST_NAME lst_nm, sec_mst.SECTION_NAME sec_nm, uni_mst.UNIT_NAME uni_nm " + 
                     " FROM " + serverName + ".PARSONAL_TRN par_trn " + 
                     "LEFT JOIN " + serverName + ".PERSONAL_MST per_mst ON " +
                     "par_trn.STAFF_ID = per_mst.STAFF_ID " +
                     "LEFT JOIN " + serverName + ".SECTION_MST sec_mst ON " +
                     "par_trn.SECTION_CD = sec_mst.SECTION_CD " +
                     "LEFT JOIN " + serverName + ".UNIT_MST uni_mst ON " +
                     "par_trn.UNIT_CD = uni_mst.UNIT_CD " +
                     " WHERE par_trn.STAFF_ID = " + "\"" + strUserid + "\"" + ";";

        ResultSet Users = stmt.executeQuery(strUserSQL);
        
        String strUsername = "";
        String strSectionname  = "";
        //���R�[�h���̎擾
        while(Users.next()){
            strUsername = Users.getString("fst_nm") + Users.getString("lst_nm");
    	  	strSectionname = Users.getString("sec_nm");
        }
        
	    /*�������̓����擾����*/
        Calendar cal = Calendar.getInstance();        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
        sdf.applyPattern("yyyy");
        String strYear = sdf.format(cal.getTime());
        sdf.applyPattern("MM");
        String strMonth = sdf.format(cal.getTime());
        
        int Maxday = cal.getActualMaximum(cal.DATE);
    

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
    	String[] iwork_start = new String[iMaxday];
    	String[] iwork_end = new String[iMaxday];
    	String[] iact_start = new String[iMaxday];
    	String[] iact_end = new String[iMaxday];
    	String[] irest_hours = new String[iMaxday];
    	String[] izan_adj = new String[iMaxday];
        
        if (cnt == 0){
        	/*����o�^�̏ꍇ*/
        	/*�l�ݒ�g�����̌ďo��*/   	
        	strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST zan_adj FROM " + serverName +".PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
        	ResultSet Ors = stmt.executeQuery(strPerSQL);
        	/*�l�ݒ�g���������g��ǉ�*/
    		int i = 0;
    		Ors.next();
    		strdetail[i] = Ors.getString("detail");
    		iwork_start[i] = Ors.getString("work_start");
    		iwork_end[i] = Ors.getString("work_end");
    		izan_adj[i] = Ors.getString("zan_adj");
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
				if (Ors.getString("detail") != null){
					strdetail[i] = Ors.getString("detail");
				}
				if (Ors.getString("work_start") == null){
					iwork_start[i] = "";
				} else{
					iwork_start[i] = Ors.getString("work_start");						
				}
				if (Ors.getString("work_end") == null){
					iwork_end[i] = "";
				} else{
					iwork_end[i] = Ors.getString("work_end");						
				}
				if (Ors.getString("act_start") == null){
					iact_start[i] = "";
				} else{
					iact_start[i] = Ors.getString("act_start");						
				}
				if (Ors.getString("act_end") == null){
					iact_end[i] = "";
				} else{
					iact_end[i] = Ors.getString("act_end");						
				}
				if (Ors.getString("rest_hours") == null){
					irest_hours[i] = "";
				} else{
					irest_hours[i] = Ors.getString("rest_hours");						
				}
				if (Ors.getString("zan_adj") == null){
					izan_adj[i] = "";
				} else{
					izan_adj[i] = Ors.getString("zan_adj");						
				}
    			i = i + 1;
		    }
			
			String strSeq1 = "SELECT SUBMIT_REQUEST_1_CD req_value, SUBMIT_REQUEST_1_NAME req_name FROM unserver2014.SUBMIT_REQUEST_1_MST WHERE VALID_FLAG = \'1\'";
    	    rs = stmt.executeQuery(strSeq1);    
			while(rs.next()){
				rs.getString("req_value");
			}
        }
        
	/*�C�x���g�̍쐬*/
	
	/*�o�^�C�x���g�̍쐬*/
	/*���������*/
    
	/*Excel�o�͂̍쐬*/
	
	/*�Αӓ��̓t�H�[���̃��[�h����*/
	response.setContentType("text/html; charset=Shift_JIS");
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

public void doPost(HttpServletRequest req, HttpServletResponse response)
throws ServletException, IOException 
{
	response.setContentType("text/html; charset=Shift_JIS");
	String MyAction = req.getParameter("MySubmit"); 

	 // �����̎��s 
	if (MyAction.equals("Toroku")){
		req.setCharacterEncoding("Shift_JIS");
		//�o�^����
		Set_db myObj = new Set_db();

		try {
			myObj.main_action(req , String.valueOf(req.getParameter("hdn_worktrn")));
		    this.getServletContext().getRequestDispatcher
            ("/form_roster.jsp").include(req, response);
		} catch (SQLException e) {
			// TODO �����������ꂽ catch �u���b�N
			e.printStackTrace();
		}

	}else if(MyAction.equals("Eturan")){
		//�Ζ��\�{��
		
	}else if(MyAction.equals("ExcelOut")){
		Excel_Edit myObj = new Excel_Edit();	
		//Excel�o��
		try {
			myObj.Excel_Edit(req);
		    this.getServletContext().getRequestDispatcher
            ("/form_roster.jsp").include(req, response);
		} catch (InvalidFormatException e) {
			// TODO �����������ꂽ catch �u���b�N
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO �����������ꂽ catch �u���b�N
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO �����������ꂽ catch �u���b�N
			e.printStackTrace();
		}		
	}else if(MyAction.equals("Personal")){
		//�l�I��
		HttpSession prsonalSession = req.getSession();
		prsonalSession.setAttribute("Pesonal_ID", String.valueOf(req.getParameter("txtPersonal_nm")));	
	    this.getServletContext().getRequestDispatcher
        ("/form_roster.jsp").include(req, response);
	}
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

