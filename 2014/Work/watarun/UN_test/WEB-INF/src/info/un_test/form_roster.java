package info.un_test;

import java.io.IOException;
import java.io.PrintWriter;
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
	
	/*当月分の日時取得処理*/
    Calendar cal = Calendar.getInstance();        
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
    sdf.applyPattern("yyyy");
    String strYear = sdf.format(cal.getTime());
    sdf.applyPattern("MM");
    String strMonth = sdf.format(cal.getTime());
    
    
    /*初回登録有無の判定*/
    String strInitSQL = "SELECT COUNT(*) FROM WORK_TRN　" + 
                    	"WHERE STAFF_ID = " + strUserid + 
    		            " AND YEAR = " + strYear + 
    		            " AND MONTH = "  + strMonth;
    
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

}

