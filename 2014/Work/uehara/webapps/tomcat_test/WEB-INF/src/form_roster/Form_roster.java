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
		//HttpSessionインタフェースのオブジェクトを取得
		HttpSession session = request.getSession();
		//idをsessionスコープで保存
		session.setAttribute("userid", strUserid);

		/*		try {
			//Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e1) {
			// TODO 自動生成された catch ブロック
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
			String strInitsql = "SELECT COUNT(*) cnt FROM unserver_01.WORK_TRN " + 
					"WHERE STAFF_ID = " + strUserid + 
					" AND YEAR = " + strYear + 
					" AND MONTH = "  + strMonth;

			ResultSet rs = stmt.executeQuery(strInitsql);

			//レコード数の取得
			rs.next();
			int cnt = rs.getInt("cnt");
			String strPerSQL = "";       
			cnt = 0;

			if (cnt == 0){
				/*初回登録の場合*/
				/*個人設定トランの呼出し*/   	
				strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST adjust FROM unserver_01.PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
				rs = stmt.executeQuery(strPerSQL);
				/*個人設定トラン情報より枠を追加*/
				while(rs.next()){
					int work_start = rs.getInt("work_start");
					int work_end = rs.getInt("work_end");
					String detail = rs.getString("detail");
					int zangyo = rs.getInt("adjust");
				}
			} else {
				/*勤怠トランのデータ呼び出し*/
				strPerSQL = "SELECT * FROM unserver_01.WORK_TRN　" + 
						"WHERE STAFF_ID = " + strUserid + 
						" AND YEAR = " + strYear + 
						" AND MONTH = "  + strMonth;
				ResultSet perrs = stmt.executeQuery(strPerSQL);   	
				/*勤怠データより枠を追加*/
				while(perrs.next()){

				}
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
			}

	public static void main(String[] args) throws InstantiationException, IllegalAccessException {
		String msg = "";
		/*			try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			msg = "ドライバのロードに成功しました";
		} catch (ClassNotFoundException e){
			msg = "ドライバのロードに失敗しました";
		}
		System.out.println(msg);
		 	}
		 */
	}
}//http://localhost:8080/tomcat_test/servlet/form_roster
