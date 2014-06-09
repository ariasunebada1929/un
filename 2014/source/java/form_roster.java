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
	String strUserid = "00002";	
	int iRecordCount = 0;
	//HttpSessionインタフェースのオブジェクトを取得
    HttpSession session = request.getSession();
    //idをsessionスコープで保存
    session.setAttribute("userid", strUserid);
	
    try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		// TODO 自動生成された catch ブロック
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

        // データベースに対する処理
    	msg = "データベース接続に成功しました";
    
	    /*当月分の日時取得処理*/
        Calendar cal = Calendar.getInstance();        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
        sdf.applyPattern("yyyy");
        String strYear = sdf.format(cal.getTime());
        sdf.applyPattern("MM");
        String strMonth = sdf.format(cal.getTime());
        
        int Maxday = cal.getActualMaximum(cal.DATE);
    
        Statement stmt = conn.createStatement();

        /*初回登録有無の判定*/
        String strInitsql = "SELECT COUNT(*) cnt FROM " + serverName +".WORK_TRN " + 
        		"WHERE STAFF_ID = " + strUserid + 
        		" AND YEAR = " + strYear + 
        		" AND MONTH = "  + strMonth;
    
        ResultSet rs = stmt.executeQuery(strInitsql);
    
        //レコード数の取得
        rs.next();
        int cnt = rs.getInt("cnt");
        String strPerSQL = "";
        rs.close();
        
     	int iMaxday = cal.getActualMaximum(cal.DATE);
	    
    	/*勤怠データより枠を追加*/
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
        	/*初回登録の場合*/
        	/*個人設定トランの呼出し*/   	
        	strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST zan_adj FROM " + serverName +".PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
        	ResultSet Ors = stmt.executeQuery(strPerSQL);
        	/*個人設定トラン情報より枠を追加*/
    		int i = 0;
    		Ors.next();
    		strdetail[i] = Ors.getString("detail");
    		iwork_start[i] = Ors.getString("work_start");
    		iwork_end[i] = Ors.getString("work_end");
    		izan_adj[i] = Ors.getString("zan_adj");
    		i = 1;	
        } else {
    	    /*勤怠トランのデータ呼び出し*/
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
        
	/*イベントの作成*/
	
	/*登録イベントの作成*/
	/*ゆっこさん*/
    
	/*Excel出力の作成*/
	
	/*勤怠入力フォームのロード処理*/
	response.setContentType("text/html; charset=Shift_JIS");
    this.getServletContext().getRequestDispatcher
                 ("/form_roster.jsp").include(request, response);
    
    }catch (SQLException e){
    	msg = "ドライバのロードに失敗しました";
    	//例外処理
    }finally{
    	try{
    		if (conn != null){
    	      conn.close();
    	    }
    	    }catch (SQLException e){
    	    // 例外処理
    	    }
    	System.out.println(msg);
    }
    
}

public void doPost(HttpServletRequest req, HttpServletResponse response)
throws ServletException, IOException 
{
	response.setContentType("text/html; charset=Shift_JIS");
	String MyAction = req.getParameter("MySubmit"); 

	 // 処理の実行 
	if (MyAction.equals("Toroku")){
		req.setCharacterEncoding("Shift_JIS");
		//登録処理
		Set_db myObj = new Set_db();

		try {
			myObj.main_action(req , String.valueOf(req.getParameter("hdn_worktrn")));
		    this.getServletContext().getRequestDispatcher
            ("/form_roster.jsp").include(req, response);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

	}else if(MyAction.equals("Eturan")){
		//勤務表閲覧
		
	}else if(MyAction.equals("ExcelOut")){
		Excel_Edit myObj = new Excel_Edit();	
		//Excel出力
		try {
			myObj.Excel_Edit();
		} catch (InvalidFormatException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}		
	}
}

public void Click(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException 
{
	//画面の入力項目取ってきて登録用のデータにする。
	
	//DBをIDとパスワード呼び出す
	
	//登録用のデータをSQLに入れ込む処理を作成する登録する
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
      msg = "ドライバのロードに成功しました";
    } catch (ClassNotFoundException e){
      msg = "ドライバのロードに失敗しました";
    }
    System.out.println(msg);
}

}

