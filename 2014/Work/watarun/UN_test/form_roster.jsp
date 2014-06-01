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
	<title>勤務表入力 -らくらく勤怠（仮）</title>
	<link rel="stylesheet" type="text/css" href="form_roster.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/btnRegist.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/zangyoCheck.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/mailCheck1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/mailCheck2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/validate.js"></script>	
</head>

<body>
<!-- ヘッダー-->
<div id="container">
<div id="header">
<form method="post">
<ul>
	<li><button id="btnView"   OnClick="">勤務表閲覧</button></li>
	<li><button ID="btnRegist"   OnClick="">勤怠情報登録</button></li>
	<li><button id="btnOutput"   OnClick="">勤務表出力</button></li>
	<li id="login_panel">ログイン者</li>
</ul>
<hr>
</div>
<!--勤務表-->
<div id="header_roster">
<h1>5月勤務表</h1>
<table border="0" cellspacing="0" id="table_caption">
<!--<caption>5月勤務表</caption>-->
	<tr>
		<td class="column_name2">残業調整</td>
		<td>
		<select name="zangyo" onChange="zangyou_Change()" id="Zangyo_chousei">
		<option value="No">×</option>
		<option value="Yes">○</option>
		</td>
	</tr>
	<tr>
		<td class="column_name2">時短勤務</td>
		<td>
		<select name="jitan">
		<option value="No">×</option>
		<option value="Yes">○</option>
		</td>
	</tr>
</table>
<table border="0" cellspacing="0" id="table_personalinfo">
	<tr>
		<td class="column_name2">社員番号</td>
		<td>000208</td>
	</tr>
	<tr>
		<td class="column_name1">所属</td>
		<td>BI課</td>
	</tr>
	<tr>
		<td class="column_name1">氏名</td>
		<td>池田忠繁</td>
	</tr>
</table>
</div>
<!---勤務表各種項目名 -->
<div id="main_roster">
<table border="0" cellspacing="0" id="table_roster">
	<tr>
		<td rowspan="2" class="column_name1" id="column_day">日</td>
		<td rowspan="2" class="column_name1" id="column_youbi">曜日</td>
		<td colspan="4" class="column_name2" id="column_mail">メール届出申請</td>
		<td rowspan="2" class="column_name2" id="column_Furikae">振替日</td>
		<td rowspan="2" class="column_name2" id="column_detail">詳細</td>
		<td colspan="2" class="column_name2" id="column_kihon">基本勤務時間</td>
		<td colspan="3" class="column_name2" id="column_jisseki">実績勤務時間</td>
		<td rowspan="2" class="column_name2" id="column_zangyo">残業調整</td>
			<tr>
				<td class="column_name2" id="column_mail1">休暇</td>
				<td class="column_name2" id="column_mail2">休出/振代休</td>
				<td class="column_name2" id="column_mail3">通院/電遅</td>
				<td class="column_name2" id="column_mail4">A/B変</td>
				<td class="column_name2" id="column_kihon1">出社</td>
				<td class="column_name2" id="column_kihon2">退社</td>
				<td class="column_name2" id="column_jisseki1">出社</td>
				<td class="column_name2" id="column_jisseki2">退社</td>
				<td class="column_name2" id="column_jisseki3">休憩</td>
			</tr>
	</tr>
	<!---入力フォーム -->
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
            String serverName = "unserver2014";
	    	/*当月分の日時取得処理*/
        	Calendar cal = Calendar.getInstance();                
        	int Maxday = cal.getActualMaximum(cal.DATE);
 
 			int i = 1;
            
			while(i < Maxday + 1){
				out.println("<tr>");
				out.println("<td class=\"row_day\">" + i + "</td>");
				out.println("<td class=\"row_youbi\"></td>");
				out.println("<td>");
				out.println("<select name=\"example1-" + i + "\" size=\"1\" class=\"input_select\">");						
				String strSeq1 = "SELECT SUBMIT_REQUEST_1_CD req_value, SUBMIT_REQUEST_1_NAME req_name FROM unserver2014.SUBMIT_REQUEST_1_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq1);
				out.println("<option value=" + "0" + "></option>");	
				while(rs.next()){
					out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
				}			
				out.println("</select>");
				
				out.println("</td>");
				out.println("<td>");
				out.println("<select name=\"example2-" + i + "\" size=\"1\" class=\"input_select\">");
				String strSeq2 = "SELECT SUBMIT_REQUEST_2_CD req_value, SUBMIT_REQUEST_2_NAME req_name FROM unserver2014.SUBMIT_REQUEST_2_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq2);
        	    out.println("<option value=" + "0" + "></option>");
				while(rs.next()){
					out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
				}		
				out.println("</select>");
				out.println("</td>");
				out.println("<td>");
				
				out.println("<select name=\"example3-" + i + "\" size=\"1\" class=\"input_select\">");
				String strSeq3 = "SELECT SUBMIT_REQUEST_3_CD req_value, SUBMIT_REQUEST_3_NAME req_name FROM unserver2014.SUBMIT_REQUEST_3_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq3);
        	    out.println("<option value=" + "0" + "></option>");	
				while(rs.next()){
					out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
				}	
				out.println("</select>");
				out.println("</td>");
				out.println("<td>");
				out.println("<select name=\"example4-" + i + "\" size=\"1\" class=\"input_select\">");
				String strSeq4 = "SELECT SUBMIT_REQUEST_4_CD req_value, SUBMIT_REQUEST_4_NAME req_name FROM unserver2014.SUBMIT_REQUEST_4_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq4);
        	    out.println("<option value=" + "0" + "></option>");
				while(rs.next()){
					out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
				}	
				out.println("</select>");
				out.println("</td>");
				out.println("<td><input type=\"text\" class=\"input_text1\" id=\"id_furikae\" name=\"hurikae_" + i + "\"></td>");
				out.println("<td><input type=\"text\" class=\"input_text2\" maxlength=\"20\" id=\"id_syousai\" name=\"syousai_" + i + "\"></td>");
				out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_kihonS1\" name=\"kihonS_" + i + "\"></td>");
				out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_kihonE1\" name=\"kihonE_" + i + "\"></td>");
				out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiS1\" name=\"jissekiS_" + i + "\"></td>");
				out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiE1\" name=\"jissekiE_" + i + "\"></td>");
				out.println("<td><input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiR1\" name=\"jiseekiR_" + i + "\"></td>");
				out.println("<td class=\"zangyou_coloumn\"><input type=\"text\" class=\"input_text1\"  maxlength=\"5\" id=\"id_zangyou1\" name=\"zangyou_" + i + "\" readonly=\"readonly\" style=\"background-color:#808080;\" ></td>");
                out.println("</tr>");
				i = i + 1;
			}         
            
	        /*当月分の日時取得処理*/      
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
            
            if (cnt == 0){
	        	/*初回登録の場合*/
	        	/*個人設定トランの呼出し*/   	
	        	strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST adjust FROM " + serverName +".PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
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
    	    	strPerSQL = "SELECT YEAR year, MONTH month, DAY day, SUBMIT_REQUEST_1_CD req_1, " + 
            	            "       SUBMIT_REQUEST_2_CD req_2, SUBMIT_REQUEST_3_CD req_3, " +
            	            "       SUBMIT_REQUEST_4_CD req_4, DETAIL detail, " +
            	            "       BASIC_WORK_START work_start, BASIC_WORK_END work_end, " +
            	            "       ACTUAL_WORK_START act_start, ACTUAL_WORK_END act_end, " +
            	            "       RESTHOURS rest_hours, ZANGYO_ADJUST zan_adj " +
            	            "       FROM unserver2014.WORK_TRN WHERE STAFF_ID = " + strUserid;    
    	    	rs = stmt.executeQuery(strPerSQL);
        		/*勤怠データより枠を追加*/
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
</div>
<!-- フッター --> 
<div id="footer">
<p>らくらく勤務表 Version 0.0.0 20140524 Copyright (C) 2014 UN ROOM</p>
</div>
</div>
</body>

</html>