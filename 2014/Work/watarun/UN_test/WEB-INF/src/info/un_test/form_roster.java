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
import java.awt.*;
import java.awt.event.*;

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
	String strUserid = "1234";	
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
    String url = "jdbc:mysql://localhost/unserver";
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
    
    Statement stmt = conn.createStatement();
    
    /*初回登録有無の判定*/
    String strInitsql = "SELECT COUNT(*) FROM unserver.WORK_TRN " + 
                    	"WHERE STAFF_ID = " + strUserid + 
    		            " AND YEAR = " + strYear + 
    		            " AND MONTH = "  + strMonth;
    
    ResultSet rs = stmt.executeQuery(strInitsql);
    
    /*個人設定トランの呼出し*/
    String strPerSQL = "SELECT UNIT_CD, DETAIL, ZANGYO_ADJUST FROM PARSONAL_TRN " + 
                    	"WHERE STAFF_ID = " + strUserid;
    
    /*勤怠トランのデータ呼び出し*/
    String strWorkSQL = "SELECT * FROM WORK_TRN　" + 
                    	"WHERE STAFF_ID = " + strUserid + 
    		            " AND YEAR = " + strYear + 
    		            " AND MONTH = "  + strMonth;
    
	/*勤怠フォームの枠を追加*/
    for (int i = 0; i <= iRecordCount; i++) {

	}
	
	/*イベントの作成*/
	
	/*登録イベントの作成*/
	/*ゆっこさん*/
    
	/*Excel出力の作成*/
	
	/*勤怠入力フォームのロード処理*/
	response.setContentType("text/html; charset=utf-8");
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

