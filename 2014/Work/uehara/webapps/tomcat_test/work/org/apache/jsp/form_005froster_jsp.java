/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.53
 * Generated at: 2014-06-01 14:50:51 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Calendar;
import java.text.SimpleDateFormat;

public final class form_005froster_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


// サーブレットのinitメソッドに相当
public void jspInit() {
    try {
        // JDBCドライバをロード
        Class.forName("com.mysql.jdbc.Driver");
    } catch (Exception e) {
        e.printStackTrace();
    }
}

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=Shift_JIS");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<title>勤務表入力 -らくらく勤怠（仮）</title>\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/css/form_roster.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<!-- ヘッダー-->\r\n");
      out.write("<div id=\"container\">\r\n");
      out.write("<div id=\"header\">\r\n");
      out.write("<form method=\"post\">\r\n");
      out.write("<ul>\r\n");
      out.write("\t<li><button id=\"btnView\"   OnClick=\"\">勤務表閲覧</button></li>\r\n");
      out.write("\t<li><button ID=\"btnRegist\"   OnClick=\"\">勤怠情報登録</button></li>\r\n");
      out.write("\t<li><button id=\"btnOutput\"   OnClick=\"\">勤務表出力</button></li>\r\n");
      out.write("\t<li id=\"login_panel\">ログイン者</li>\r\n");
      out.write("</ul>\r\n");
      out.write("<hr>\r\n");
      out.write("</div>\r\n");
      out.write("<!--勤務表-->\r\n");
      out.write("<div id=\"header_roster\">\r\n");
      out.write("<h1>5月勤務表</h1>\r\n");
      out.write("<table border=\"0\" cellspacing=\"0\" id=\"table_caption\">\r\n");
      out.write("<!--<caption>5月勤務表</caption>-->\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"column_name2\">残業調整</td>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t<select name=\"zangyo\" onChange=\"zangyou_Change()\" id=\"Zangyo_chousei\">\r\n");
      out.write("\t\t<option value=\"No\">×</option>\r\n");
      out.write("\t\t<option value=\"Yes\">○</option>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"column_name2\">時短勤務</td>\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t<select name=\"jitan\">\r\n");
      out.write("\t\t<option value=\"No\">×</option>\r\n");
      out.write("\t\t<option value=\"Yes\">○</option>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table border=\"0\" cellspacing=\"0\" id=\"table_personalinfo\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"column_name2\">社員番号</td>\r\n");
      out.write("\t\t<td>000208</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"column_name1\">所属</td>\r\n");
      out.write("\t\t<td>BI課</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=\"column_name1\">氏名</td>\r\n");
      out.write("\t\t<td>池田忠繁</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("<!---勤務表各種項目名 -->\r\n");
      out.write("<div id=\"main_roster\">\r\n");
      out.write("<table border=\"0\" cellspacing=\"0\" id=\"table_roster\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td rowspan=\"2\" class=\"column_name1\" id=\"column_day\">日</td>\r\n");
      out.write("\t\t<td rowspan=\"2\" class=\"column_name1\" id=\"column_youbi\">曜日</td>\r\n");
      out.write("\t\t<td colspan=\"4\" class=\"column_name2\" id=\"column_mail\">メール届出申請</td>\r\n");
      out.write("\t\t<td rowspan=\"2\" class=\"column_name2\" id=\"column_Furikae\">振替日</td>\r\n");
      out.write("\t\t<td rowspan=\"2\" class=\"column_name2\" id=\"column_detail\">詳細</td>\r\n");
      out.write("\t\t<td colspan=\"2\" class=\"column_name2\" id=\"column_kihon\">基本勤務時間</td>\r\n");
      out.write("\t\t<td colspan=\"3\" class=\"column_name2\" id=\"column_jisseki\">実績勤務時間</td>\r\n");
      out.write("\t\t<td rowspan=\"2\" class=\"column_name2\" id=\"column_zangyo\">残業調整</td>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"column_name2\" id=\"column_mail1\">休暇</td>\r\n");
      out.write("\t\t\t\t<td class=\"column_name2\" id=\"column_mail2\">休出/振代休</td>\r\n");
      out.write("\t\t\t\t<td class=\"column_name2\" id=\"column_mail3\">通院/電遅</td>\r\n");
      out.write("\t\t\t\t<td class=\"column_name2\" id=\"column_mail4\">A/B変</td>\r\n");
      out.write("\t\t\t\t<td class=\"column_name2\" id=\"column_kihon1\">出社</td>\r\n");
      out.write("\t\t\t\t<td class=\"column_name2\" id=\"column_kihon2\">退社</td>\r\n");
      out.write("\t\t\t\t<td class=\"column_name2\" id=\"column_jisseki1\">出社</td>\r\n");
      out.write("\t\t\t\t<td class=\"column_name2\" id=\"column_jisseki2\">退社</td>\r\n");
      out.write("\t\t\t\t<td class=\"column_name2\" id=\"column_jisseki3\">休憩</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t<!---入力フォーム -->\r\n");
      out.write("\t");

        // データベースへのアクセス開始
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String strUserid = "00001";
        
        try {
            // データベースに接続するConnectionオブジェクトの取得
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost/UnServer",
                "root", "root");
            // データベース操作を行うためのStatementオブジェクトの取得
            stmt = con.createStatement();
            
	        /*当月分の日時取得処理*/
            Calendar cal = Calendar.getInstance();        
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
            sdf.applyPattern("yyyy");
            String strYear = sdf.format(cal.getTime());
            sdf.applyPattern("MM");
            String strMonth = sdf.format(cal.getTime());
    
            /*初回登録有無の判定*/
            String strInitsql = "SELECT COUNT(*) cnt FROM unserver_01.WORK_TRN " + 
        	    	"WHERE STAFF_ID = " + strUserid + 
        	    	" AND YEAR = " + strYear + 
        	    	" AND MONTH = "  + strMonth;
    
            rs = stmt.executeQuery(strInitsql);
            
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
				rs.next();
				int work_start = rs.getInt("work_start");
				int work_end = rs.getInt("work_end");
				String detail = rs.getString("detail");
				int zangyo = rs.getInt("adjust");		
				int i = 1;
				
				while(i < 32){
					out.println("<tr>");
					out.println("<td class=\"row_day\">" + i + "</td>");
					out.println("<td class=\"row_youbi\"></td>");
					out.println("<td>");
					out.println("<select name=\"example1\" size=\"1\" class=\"input_select\">");						
					String strSeq1 = "SELECT SUBMIT_REQUEST_1_CD req_value, SUBMIT_REQUEST_1_NAME req_name FROM unserver_01.SUBMIT_REQUEST_1_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq1);
					
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}			
					out.println("</select>");
					
					out.println("</td>");
					out.println("<td>");
					out.println("<select name=\"example2\" size=\"1\" class=\"input_select\">");
					String strSeq2 = "SELECT SUBMIT_REQUEST_2_CD req_value, SUBMIT_REQUEST_2_NAME req_name FROM unserver_01.SUBMIT_REQUEST_2_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq2);		
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}		
					out.println("</select>");
					out.println("</td>");
					out.println("<td>");
					
					out.println("<select name=\"example3\" size=\"1\" class=\"input_select\">");
					String strSeq3 = "SELECT SUBMIT_REQUEST_3_CD req_value, SUBMIT_REQUEST_3_NAME req_name FROM unserver_01.SUBMIT_REQUEST_3_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq3);		
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}	
					out.println("</select>");
					out.println("</td>");
					out.println("<td>");
					out.println("<select name=\"example4\" size=\"1\" class=\"input_select\">");
					String strSeq4 = "SELECT SUBMIT_REQUEST_4_CD req_value, SUBMIT_REQUEST_4_NAME req_name FROM unserver_01.SUBMIT_REQUEST_4_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq4);		
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}	
					out.println("</select>");
					out.println("</td>");
					out.println("<td><input type=\"text\" class=\"input_text1\" id=\"id_furikae\" name=\"hurikae_1\"></td>");
					out.println("<td><input type=\"text\" class=\"input_text2\" maxlength=\"20\" id=\"id_syousai\" name=\"syousai_1\" value=" + detail + "></td>");
					out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_kihonS1\" name=\"kihonS_1\" value=" + work_start + "></td>");
					out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_kihonE1\" name=\"kihonE_1\" value=" + work_end + "></td>");
					out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiS1\"></td>");
					out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiE1\" name=\"jissekiE_1\"></td>");
					out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiR1\" name=\"jiseekiR_1\"></td>");
					out.println("<td class=\"zangyou_coloumn\"><input type=\"text\" class=\"input_text1\"  maxlength=\"5\" id=\"id_zangyou1\" name=\"zangyou_1\" readonly=\"readonly\" style=\"background-color:#808080;\" ></td>");
	                out.println("</tr>");
					i = i + 1;
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
            	     
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // データベースとの接続をクローズ
            try { rs.close(); } catch (Exception e) {}
            try { stmt.close(); } catch (Exception e) {}
            try { con.close(); } catch (Exception e) {}
        }        

    
      out.write("\r\n");
      out.write("\t</form>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- フッター --> \r\n");
      out.write("<div id=\"footer\">\r\n");
      out.write("<p>らくらく勤務表 Version 0.0.0 20140524 Copyright (C) 2014 UN ROOM</p>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
