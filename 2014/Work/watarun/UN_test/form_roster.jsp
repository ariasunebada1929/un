<%@ page contentType="text/html; charset=Shift_JIS"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%!
// サーブレットのinitメソッドに相当
public void jspInit() {
    try {
        // JDBCドライバをロード
        Class.forName("com.mysql.jdbc.Driver");
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

<html>
<head>
	<title>勤務表入力 -らくらく勤怠（仮）</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_roster.css" />
</head>

<body>
<!-- ヘッダー-->
<ul>
	<li><button id="btnView"   OnClick="">勤務表閲覧</button></li>
	<li><button ID="btnRegist"   OnClick="">勤怠情報登録</button></li>
	<li><button id="btnOutput"   OnClick="">勤務表出力</button></li>
	<li id="login_panel">ログイン者</li>
</ul>
<hr>
<!--勤務表-->
<!-- <ul>
	<li id="zangyo_panel">残業調整</li>
	<li>
	<select name="zangyo">
	<option value="No">×</option>
	<option value="Yes">○</option>
	</li>
</ul>
-->
<table border="0" cellspacing="0">
	<tr>
		<td rowspan="2">日</td>
		<td rowspan="2">曜日</td>
		<td colspan="4">メール届出申請</td>
		<td rowspan="2">振替日</td>
		<td rowspan="2">詳細</td>
		<td colspan="2">基本勤務時間</td>
		<td colspan="3">実績勤務時間</td>
		<td rowspan="2">残業調整</td>
			<tr>
				<td>休暇</td>
				<td>休出/振代休</td>
				<td>通院/電遅</td>
				<td>A/B変</td>
				<td>出社</td>
				<td>退社</td>
				<td>出社</td>
				<td>退社</td>
				<td>休憩</td>
			</tr>
	</tr>
	<!---入力フォーム -->
	<form>
	
	<%
        // データベースへのアクセス開始
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String strUserid = "00001";
        
        try {
            // データベースに接続するConnectionオブジェクトの取得
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost/unserver2014",
                "root", "");
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
            String strInitsql = "SELECT COUNT(*) cnt FROM unserver2014.WORK_TRN " + 
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
				strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST adjust FROM unserver2014.PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
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
					out.println("<td>" + i +"</td>");
					out.println("<td></td>");
					out.println("<td>");
					out.println("<select name=\"example1\" size=\"1\">");						
					String strSeq1 = "SELECT SUBMIT_REQUEST_1_CD req_value, SUBMIT_REQUEST_1_NAME req_name FROM unserver2014.SUBMIT_REQUEST_1_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq1);
					
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}			
					out.println("</select>");
					
					out.println("</td>");
					out.println("<td>");
					out.println("<select name=\"example2\" size=\"1\">");
					String strSeq2 = "SELECT SUBMIT_REQUEST_2_CD req_value, SUBMIT_REQUEST_2_NAME req_name FROM unserver2014.SUBMIT_REQUEST_2_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq2);		
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}		
					out.println("</select>");
					out.println("</td>");
					out.println("<td>");
					
					out.println("<select name=\"example3\" size=\"1\">");
					String strSeq3 = "SELECT SUBMIT_REQUEST_3_CD req_value, SUBMIT_REQUEST_3_NAME req_name FROM unserver2014.SUBMIT_REQUEST_3_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq3);		
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}	
					out.println("</select>");
					out.println("</td>");
					out.println("<td>");
					out.println("<select name=\"example4\" size=\"1\">");
					String strSeq4 = "SELECT SUBMIT_REQUEST_4_CD req_value, SUBMIT_REQUEST_4_NAME req_name FROM unserver2014.SUBMIT_REQUEST_4_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq4);		
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}	
					out.println("</select>");
					out.println("</td>");
					out.println("<td><input type=\"text\"></td>");
					out.println("<td><input type=\"text\" value=" + detail + "></td>");
					out.println("<td><input type=\"text\" value=" + work_start + "></td>");
					out.println("<td><input type=\"text\" value=" + work_end + "></td>");
					out.println("<td><input type=\"text\"></td>");
					out.println("<td><input type=\"text\"></td>");
					out.println("<td><input type=\"text\"></td>");
					out.println("<td><input type=\"text\"></td>");
	                out.println("</tr>");
					i = i + 1;
				}
            } else {
        	    /*勤怠トランのデータ呼び出し*/
        	    strPerSQL = "SELECT * FROM unserver2014.WORK_TRN　" + 
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

    %>
	</form>
</table>

</body>

</html>