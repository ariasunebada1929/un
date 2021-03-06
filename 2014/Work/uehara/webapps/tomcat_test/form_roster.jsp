<%@ page contentType="text/html; charset=Shift_JIS"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="javax.swing.JTextField"%>
<%@ page import="java.util.GregorianCalendar"%>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/btnRegist.js" charset="shift_jis"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/zangyoCheck.js" charset="shift_jis"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/mailCheck1.js" charset="shift_jis"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/mailCheck2.js" charset="shift_jis"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/validate.js" charset="shift_jis"></script>	
</head>

<body>
<!-- ヘッダー-->
<div id="container">
<div id="header">
<form method="post" name="form_roster">
<ul>
	<li><button id="btnView"   OnClick="func('Eturan');">勤務表閲覧</button></li>
	<li><button ID="btnRegist"   OnClick="func('Toroku');">勤怠情報登録</button></li>
	<li><button id="btnOutput"   OnClick="func('ExcelOut');">勤務表出力</button></li>
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
	<% request.setCharacterEncoding("Windows-31J"); %>
	<%
        // データベースへのアクセス開始
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ResultSet Perrs = null;
        String strUserid = "00001";
        
        try {
            // データベースに接続するConnectionオブジェクトの取得
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost/UnServer",
                "root", "root");
            // データベース操作を行うためのStatementオブジェクトの取得
            stmt = con.createStatement();
            String serverName = "UnServer";
	    	/*当月分の日時取得処理*/
        	Calendar cal = Calendar.getInstance();                
        	int iMaxday = cal.getActualMaximum(cal.DATE);
 
 			int i = 1;
 			
 			/*当月分の日時取得処理*/      
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
            sdf.applyPattern("yyyy");
            String strYear = sdf.format(cal.getTime());
            sdf.applyPattern("MM");
            String strMonth = sdf.format(cal.getTime());
            String[] strweek_name = {"日", "月", "火", "水", 
                                  "木", "金", "土"};
            
                
            /*初回登録有無の判定*/
            String strInitsql = "SELECT COUNT(*) cnt FROM unserver_01.WORK_TRN " + 
        	    	"WHERE STAFF_ID = " + strUserid + 
        	    	" AND YEAR = " + strYear + 
        	    	" AND MONTH = "  + strMonth;
    
            Perrs = stmt.executeQuery(strInitsql);
            
            //レコード数の取得
            Perrs.next();
            int cnt = Perrs.getInt("cnt");
            String strPerSQL = "";  
            ResultSet Ors = null;
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
            out.println("<input type=\"hidden\" name=\"MySubmit\" />");
            
            if (cnt == 0){
	        	/*初回登録の場合*/
	        	/*個人設定トランの呼出し*/   	
	        	strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST zan_adj FROM unserver_01.PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
	    	    Ors = stmt.executeQuery(strPerSQL);
	        	/*個人設定トラン情報より枠を追加*/
        		i = 0;
        		Ors.next();
        		strdetail[i] = Ors.getString("detail");
        		iwork_start[i] = Ors.getString("work_start");
        		iwork_end[i] = Ors.getString("work_end");
        		izan_adj[i] = Ors.getString("zan_adj");
        		i = 1;
        		out.println("<input type=\"hidden\" name=\"hdn_worktrn\" value=\"0\" />");
            } else {
    	    	/*勤怠トランのデータ呼び出し*/
    	    	strPerSQL = "SELECT YEAR year, MONTH month, DAY day, SUBMIT_REQUEST_1_CD req_1, " + 
            	            "       SUBMIT_REQUEST_2_CD req_2, SUBMIT_REQUEST_3_CD req_3, " +
            	            "       SUBMIT_REQUEST_4_CD req_4, DETAIL detail, " +
            	            "       BASIC_WORK_START work_start, BASIC_WORK_END work_end, " +
            	            "       ACTUAL_WORK_START act_start, ACTUAL_WORK_END act_end, " +
            	            "       RESTHOURS rest_hours, ZANGYO_ADJUST zan_adj, " +
            	            "       DETAIL detail " +
            	            "       FROM unserver_01.WORK_TRN WHERE STAFF_ID = " + strUserid +
            	            "       AND YEAR = " + strYear +
                            "       AND MONTH = "  + strMonth;    
    	    	Ors = stmt.executeQuery(strPerSQL);
        		/*勤怠データより枠を追加*/
        		i = 0;
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
        		i = 1;
        		out.println("<input type=\"hidden\" name=\"hdn_worktrn\" value=\"1\" />");
            }
            
            String strcolortd = "";
            String strholiday = "";
            
			while(i < iMaxday + 1){
				out.println("<tr>");
				GregorianCalendar calendar = new GregorianCalendar(Integer.parseInt(strYear), Integer.parseInt(strMonth) - 1, i);
				if (calendar.get(Calendar.DAY_OF_WEEK) - 1 == 0){
					/*日曜日*/
					out.println("<td class=\"holiday_day\">" + i + "</td>");
					out.println("<td class=\"holiday_youbi\">" + strweek_name[calendar.get(Calendar.DAY_OF_WEEK) - 1] + "</td>");
					strcolortd = "<td class=\"holiday_color\">";
					out.println(strcolortd);
				}else if (calendar.get(Calendar.DAY_OF_WEEK) - 1 == 6){
					/*土曜日*/
					out.println("<td class=\"holiday_day\">" + i + "</td>");
					out.println("<td class=\"holiday_youbi\">" + strweek_name[calendar.get(Calendar.DAY_OF_WEEK) - 1] + "</td>");
					strcolortd = "<td class=\"holiday_color\">";
					out.println(strcolortd);
				}else{
					/*平日*/
					out.println("<td class=\"row_day\">" + i + "</td>");
					out.println("<td class=\"row_youbi\">" + strweek_name[calendar.get(Calendar.DAY_OF_WEEK) - 1] + "</td>");
					strcolortd = "<td>";
					out.println(strcolortd);
				}

				/*休暇列*/
				out.println("<select id=\"id_Kyuka_" + i + "\" name=\"nm_Kyuka_" + i + "\" size=\"1\" class=\"input_select\" onchange=\"mailCheck1();\">");						
				String strSeq1 = "SELECT SUBMIT_REQUEST_1_CD req_value, SUBMIT_REQUEST_1_NAME req_name FROM unserver_01.SUBMIT_REQUEST_1_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq1);
				out.println("<option value=" + "0" + "></option>");	
				while(rs.next()){
					out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
				}
				out.println("</select>");
				out.println("</td>");
				
				/*休出・振代休*/
				out.println(strcolortd);
				out.println("<select id=\"id_KyusyutuFuridai_" + i + "\" name=\"nm_KyusyutuFuridai_" + i + "\" size=\"1\" class=\"input_select\" onchange=\"mailCheck2();\">");
				String strSeq2 = "SELECT SUBMIT_REQUEST_2_CD req_value, SUBMIT_REQUEST_2_NAME req_name FROM unserver_01.SUBMIT_REQUEST_2_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq2);
        	    out.println("<option value=" + "0" + "></option>");
				while(rs.next()){
					out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
				}
				out.println("</select>");
				out.println("</td>");
				
				/*通院・電遅*/
				out.println(strcolortd);	
				out.println("<select id=\"id_Shift_" + i + "\" name=\"nm_Shift_" + i + "\" size=\"1\" class=\"input_select\">");
				String strSeq3 = "SELECT SUBMIT_REQUEST_3_CD req_value, SUBMIT_REQUEST_3_NAME req_name FROM unserver_01.SUBMIT_REQUEST_3_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq3);
        	    out.println("<option value=" + "0" + "></option>");	
				while(rs.next()){
					out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
				}	
				out.println("</select>");
				out.println("</td>");
				
				/*A・B変*/
				out.println(strcolortd);
				out.println("<select id=\"id_Hendou_" + i + "\" name=\"nm_Hendou_" + i + "\" size=\"1\" class=\"input_select\">");
				String strSeq4 = "SELECT SUBMIT_REQUEST_4_CD req_value, SUBMIT_REQUEST_4_NAME req_name FROM unserver_01.SUBMIT_REQUEST_4_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq4);
        	    out.println("<option value=" + "0" + "></option>");
				while(rs.next()){
					out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
				}	
				out.println("</select>");
				out.println("</td>");
				
				if (cnt == 0){
				    out.println("<td class=\"furikaebi_column\"><input type=\"text\" class=\"input_text1\" id=\"id_furikae_" + i + "\" name=\"nm_furikae_" + i + "\" style=\"background-color:#808080;\" maxlength=\"5\"></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text2\" maxlength=\"20\" id=\"id_syousai_" + i + "\" name=\"nm_syousai_" + i + "\" value=" + strdetail[0] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_kihonS_" + i + "\" name=\"nm_kihonS_" + i + "\" value=" + iwork_start[0] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_kihonE_" + i + "\" name=\"nm_kihonE_" + i + "\" value=" + iwork_end[0] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiS_" + i + "\" name=\"nm_jissekiS_" + i + "\"></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiE_" + i + "\" name=\"nm_jissekiE_" + i + "\"></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiR_" + i + "\" name=\"nm_jiseekiR_" + i + "\"></td>");
				    out.println("<td class=\"zangyou_coloumn\"><input type=\"text\" class=\"input_text1\"  maxlength=\"5\" id=\"id_zangyou_" + i + "\" name=\"nm_zangyou_" + i + "\" readonly=\"readonly\" style=\"background-color:#808080;\" value=" + izan_adj[0] + "></td>");
                    out.println("</tr>");
                }else{  
				    out.println("<td class=\"furikaebi_column\"><input type=\"text\" class=\"input_text1\" id=\"id_furikae_" + i + "\" name=\"nm_furikae_" + i + "\" readonly=\"readonly\" style=\"background-color:#808080;\" maxlength=\"5\"></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text2\" maxlength=\"20\" id=\"id_syousai_" + i + "\" name=\"nm_syousai_" + i + "\" value=" + strdetail[i-1] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_kihonS_" + i + "\" name=\"nm_kihonS_" + i + "\" value=" + iwork_start[i-1] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_kihonE_" + i + "\" name=\"nm_kihonE_" + i + "\" value=" + iwork_end[i-1] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiS_" + i + "\" name=\"nm_jissekiS_" + i + "\" value=" + iact_start[i-1] + " ></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiE_" + i + "\" name=\"nm_jissekiE_" + i + "\" value=" + iact_end[i-1] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"5\" id=\"id_jissekiR_" + i + "\" name=\"nm_jiseekiR_" + i + "\" value=" + irest_hours[i-1] + "></td>");
				    out.println("<td class=\"zangyou_coloumn\"><input type=\"text\" class=\"input_text1\"  maxlength=\"5\" id=\"id_zangyou_" + i + "\" name=\"nm_zangyou_" + i + "\" readonly=\"readonly\" style=\"background-color:#808080;\" value=" + izan_adj[i-1] + "></td>");
                    out.println("</tr>");
                }
				i = i + 1;
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
</div>
</body>

</html>

<script language="JavaScript"> 
 function func(MyCommand){ 
 document.form_roster.MySubmit.value=MyCommand;
 } 
 </script> 