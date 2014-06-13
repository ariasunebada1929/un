<%@ page contentType="text/html; charset=Shift_JIS"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="javax.swing.JTextField"%>
<%@ page import="java.util.GregorianCalendar"%>
<%!
// �T�[�u���b�g��init���\�b�h�ɑ���
public void jspInit() {
    try {
        // JDBC�h���C�o�����[�h
        Class.forName("com.mysql.jdbc.Driver");
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
	<title>�Ζ��\���� -�炭�炭�ΑӁi���j</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_roster.css" />
	<title>�Ζ��\���� -�炭�炭�ΑӁi���j</title>
	<link rel="stylesheet" type="text/css" href="form_roster.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/btnRegist.js" charset="shift_jis"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/zangyoCheck.js" charset="shift_jis"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/mailCheck1.js" charset="shift_jis"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/mailCheck2.js" charset="shift_jis"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/validate.js" charset="shift_jis"></script>	
</head>

<body>
<!-- �w�b�_�[-->
<div id="container">
<div id="header">
<form method="post" name="form_roster" path="/UN_test">
<input type="hidden" name="hdn_sttafId" />
<ul>
	<li><button id="btnView" OnClick="return func('Eturan');">�Ζ��\�{��</button></li>
	<li><button id="btnRegist" OnClick="return�@func('Toroku');">�Αӏ��o�^</button></li>
	<li><button id="btnOutput" OnClick="return�@func('ExcelOut');">�Ζ��\�o��</button></li>
	<li><input id="txtPersonal_id" name="txtPersonal_nm" type="text" maxlength=5></input></li>
	<li><button id="btnPersonal" OnClick="return�@func('Personal');">�l�I��</button></li>
</ul>
<hr>
</div>
<!--�Ζ��\-->
<div id="header_roster">
<h1>6���Ζ��\</h1>
<table border="0" cellspacing="0" id="table_caption">
<!--<caption>6���Ζ��\</caption>-->
	<tr>
		<td class="column_name2">�c�ƒ���</td>
		<td>
		<select name="zangyo" onChange="zangyou_Change()" id="Zangyo_chousei">
		<option value="No">�~</option>
		<option value="Yes">��</option>
		</td>
	</tr>
	<tr>
		<td class="column_name2">���Z�Ζ�</td>
		<td>
		<select name="jitan">
		<option value="No">�~</option>
		<option value="Yes">��</option>
		</td>
	</tr>
</table>
	<%

        // �f�[�^�x�[�X�ւ̃A�N�Z�X�J�n
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ResultSet Countrs = null; // ����o�^����p
        ResultSet Perrs = null;   // �l�ݒ�Ăяo���p
        ResultSet Ors = null;     // �ΑӃf�[�^�Ăяo���p
        String strUserSQL = ""; 
  
        //�Œ�^�O�̐ݒ�
        
        try {
        
            String strUserid = "";
            if (session.isNew()) {
                strUserid = "99999";
            }else{
                strUserid = String.valueOf(session.getAttribute("Pesonal_ID"));
            }
            //id��session�X�R�[�v�ŕۑ�
            //session.setAttribute("userid", strUserid);
            String serverName = "unserver2014";

            // �f�[�^�x�[�X�ɐڑ�����Connection�I�u�W�F�N�g�̎擾
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost/" + serverName,
                "root", "");
            // �f�[�^�x�[�X������s�����߂�Statement�I�u�W�F�N�g�̎擾
            stmt = con.createStatement();

            /*�l�f�[�^�̎擾*/
            strUserSQL = "SELECT par_trn.STAFF_ID, per_mst.FIRST_NAME fst_nm, per_mst.LAST_NAME lst_nm, sec_mst.SECTION_NAME sec_nm, uni_mst.UNIT_NAME uni_nm " + 
                         " FROM " + serverName + ".PARSONAL_TRN par_trn " + 
                         "LEFT JOIN " + serverName + ".PERSONAL_MST per_mst ON " +
                         "par_trn.STAFF_ID = per_mst.STAFF_ID " +
                         "LEFT JOIN " + serverName + ".SECTION_MST sec_mst ON " +
                         "par_trn.SECTION_CD = sec_mst.SECTION_CD " +
                         "LEFT JOIN " + serverName + ".UNIT_MST uni_mst ON " +
                         "par_trn.UNIT_CD = uni_mst.UNIT_CD " +
                         " WHERE par_trn.STAFF_ID = " + strUserid;

            Perrs = stmt.executeQuery(strUserSQL);
            boolean bRecord = false;
            String strUsername = "";
            String strSectionname = "";

            //���R�[�h���̎擾
            while(Perrs.next()){
                strUsername = Perrs.getString("fst_nm") + Perrs.getString("lst_nm");
    	      	strSectionname = Perrs.getString("sec_nm");
    	      	bRecord = true;
            }

            if (bRecord == false){
                session.removeAttribute("Pesonal_ID");
            }
  
          	out.println("<input type=\"hidden\" name=\"hdn_strid\" value=" + strUserid + " />");
          	out.println("<input type=\"hidden\" name=\"hdn_strsecnm\" value=\"" + strSectionname + "\" />");
          	out.println("<input type=\"hidden\" name=\"hdn_strnm\" value=" + strUsername + " />");
          	    	  	    	
      		out.println("<table border=\"0\" cellspacing=\"0\" id=\"table_personalinfo\">");
      		out.println("<tr>");
      		out.println("<td class=\"column_name2\">�Ј��ԍ�</td>");
      		out.println("<td id=\"lblPersonal_id\" name=\"lblPersonal_nm\">" + strUserid + "</td>");
      		out.println("</tr>");
      		out.println("<tr>");
      		out.println("<td class=\"column_name1\">����</td>");
      		out.println("<td>" + strSectionname + "</td>");
      		out.println("</tr>");
      		out.println("<tr>");
      		out.println("<td class=\"column_name1\">����</td>");
      		out.println("<td>" + strUsername + "</td>");
      		out.println("</tr>");
	%>
</table>
</div>
<!---�Ζ��\�e�퍀�ږ� -->
<div id="main_roster">
<table border="0" cellspacing="0" id="table_roster">
	<tr>
		<td rowspan="2" class="column_name1" id="column_day">��</td>
		<td rowspan="2" class="column_name1" id="column_youbi">�j��</td>
		<td colspan="4" class="column_name2" id="column_mail">���[���͏o�\��</td>
		<td rowspan="2" class="column_name2" id="column_Furikae">�U�֓�</td>
		<td rowspan="2" class="column_name2" id="column_detail">�ڍ�</td>
		<td colspan="2" class="column_name2" id="column_kihon">��{�Ζ�����</td>
		<td colspan="3" class="column_name2" id="column_jisseki">���ыΖ�����</td>
		<td rowspan="2" class="column_name2" id="column_zangyo">�c�ƒ���</td>
			<tr>
				<td class="column_name2" id="column_mail1">�x��</td>
				<td class="column_name2" id="column_mail2">�x�o/�U��x</td>
				<td class="column_name2" id="column_mail3">�ʉ@/�d�x</td>
				<td class="column_name2" id="column_mail4">A/B��</td>
				<td class="column_name2" id="column_kihon1">�o��</td>
				<td class="column_name2" id="column_kihon2">�ގ�</td>
				<td class="column_name2" id="column_jisseki1">�o��</td>
				<td class="column_name2" id="column_jisseki2">�ގ�</td>
				<td class="column_name2" id="column_jisseki3">�x�e</td>
			</tr>
	</tr>
	<!---���̓t�H�[�� -->
	<%

	    	/*���̏����̔h��*/
            if (bRecord == false){
                System.exit(0);
            }

	    	/*�������̓����擾����*/
        	Calendar cal = Calendar.getInstance();                
        	int iMaxday = cal.getActualMaximum(cal.DATE);
 
 			int i = 1;
 			
 			/*�������̓����擾����*/      
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
            sdf.applyPattern("yyyy");
            String strYear = sdf.format(cal.getTime());
            sdf.applyPattern("MM");
            String strMonth = sdf.format(cal.getTime());
            String[] strweek_name = {"��", "��", "��", "��", 
                                  "��", "��", "�y"};
                                      
            /*����o�^�L���̔���*/
            String strInitsql = "SELECT COUNT(*) cnt FROM " + serverName + ".WORK_TRN " + 
        	    	"WHERE STAFF_ID = " + strUserid + 
        	    	" AND YEAR = " + strYear + 
        	    	" AND MONTH = "  + strMonth;
    
            Countrs = stmt.executeQuery(strInitsql);
            
            //���R�[�h���̎擾
            Countrs.next();
            int cnt = Countrs.getInt("cnt");
            String strPerSQL = "";  
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
	        	/*����o�^�̏ꍇ*/
	        	/*�l�ݒ�g�����̌ďo��*/   	
	        	strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST zan_adj FROM " + serverName +".PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
	    	    Ors = stmt.executeQuery(strPerSQL);
	        	/*�l�ݒ�g���������g��ǉ�*/
        		i = 0;
        		Ors.next();
        		strdetail[i] = Ors.getString("detail");
        		iwork_start[i] = Ors.getString("work_start");
        		iwork_end[i] = Ors.getString("work_end");
        		izan_adj[i] = Ors.getString("zan_adj");
        		i = 1;
        		out.println("<input type=\"hidden\" name=\"hdn_worktrn\" value=\"0\" />");
            } else {
    	    	/*�ΑӃg�����̃f�[�^�Ăяo��*/
    	    	strPerSQL = "SELECT YEAR year, MONTH month, DAY day, SUBMIT_REQUEST_1_CD req_1, " + 
            	            "       SUBMIT_REQUEST_2_CD req_2, SUBMIT_REQUEST_3_CD req_3, " +
            	            "       SUBMIT_REQUEST_4_CD req_4, DETAIL detail, " +
            	            "       BASIC_WORK_START work_start, BASIC_WORK_END work_end, " +
            	            "       ACTUAL_WORK_START act_start, ACTUAL_WORK_END act_end, " +
            	            "       RESTHOURS rest_hours, ZANGYO_ADJUST zan_adj, " +
            	            "       DETAIL detail " +
            	            "       FROM " + serverName + ".WORK_TRN WHERE STAFF_ID = " + strUserid;    
    	    	Ors = stmt.executeQuery(strPerSQL);
        		/*�ΑӃf�[�^���g��ǉ�*/
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
					/*���j��*/
					out.println("<td class=\"holiday_day\">" + i + "</td>");
					out.println("<td class=\"holiday_youbi\">" + strweek_name[calendar.get(Calendar.DAY_OF_WEEK) - 1] + "</td>");
					strcolortd = "<td class=\"holiday_color\">";
					out.println(strcolortd);
				}else if (calendar.get(Calendar.DAY_OF_WEEK) - 1 == 6){
					/*�y�j��*/
					out.println("<td class=\"holiday_day\">" + i + "</td>");
					out.println("<td class=\"holiday_youbi\">" + strweek_name[calendar.get(Calendar.DAY_OF_WEEK) - 1] + "</td>");
					strcolortd = "<td class=\"holiday_color\">";
					out.println(strcolortd);
				}else{
					/*����*/
					out.println("<td class=\"row_day\">" + i + "</td>");
					out.println("<td class=\"row_youbi\">" + strweek_name[calendar.get(Calendar.DAY_OF_WEEK) - 1] + "</td>");
					strcolortd = "<td>";
					out.println(strcolortd);
				}

				/*�x�ɗ�*/
				out.println("<select id=\"id_Kyuka_" + i + "\" name=\"nm_Kyuka_" + i + "\" size=\"1\" class=\"input_select\" onchange=\"mailCheck1();\">");						
				String strSeq1 = "SELECT SUBMIT_REQUEST_1_CD req_value, SUBMIT_REQUEST_1_NAME req_name FROM " + serverName + ".SUBMIT_REQUEST_1_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq1);
				out.println("<option value=" + "00" + "></option>");	
				while(rs.next()){
					if (cnt > 0 && rs.getString("req_value").equals(strreq_1[i-1])){
						out.println("<option selected=\"selected\" value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}else{
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}
				}
				out.println("</select>");
				out.println("</td>");
				
				/*�x�o�E�U��x*/
				out.println(strcolortd);
				out.println("<select id=\"id_KyusyutuFuridai_" + i + "\" name=\"nm_KyusyutuFuridai_" + i + "\" size=\"1\" class=\"input_select\" onchange=\"mailCheck2();\">");
				String strSeq2 = "SELECT SUBMIT_REQUEST_2_CD req_value, SUBMIT_REQUEST_2_NAME req_name FROM " + serverName + ".SUBMIT_REQUEST_2_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq2);
        	    out.println("<option value=" + "00" + "></option>");
				while(rs.next()){
					if (cnt > 0 && rs.getString("req_value").equals(strreq_2[i-1])){
						out.println("<option selected=\"selected\" value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}else{
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}
				}
				out.println("</select>");
				out.println("</td>");
				
				/*�ʉ@�E�d�x*/
				out.println(strcolortd);	
				out.println("<select id=\"id_Shift_" + i + "\" name=\"nm_Shift_" + i + "\" size=\"1\" class=\"input_select\">");
				String strSeq3 = "SELECT SUBMIT_REQUEST_3_CD req_value, SUBMIT_REQUEST_3_NAME req_name FROM " + serverName + ".SUBMIT_REQUEST_3_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq3);
        	    out.println("<option value=" + "00" + "></option>");	
				while(rs.next()){
					if (cnt > 0 && rs.getString("req_value").equals(strreq_3[i-1])){
						out.println("<option selected=\"selected\" value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}else{
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}
				}	
				out.println("</select>");
				out.println("</td>");
				
				/*A�EB��*/
				out.println(strcolortd);
				out.println("<select id=\"id_Hendou_" + i + "\" name=\"nm_Hendou_" + i + "\" size=\"1\" class=\"input_select\">");
				String strSeq4 = "SELECT SUBMIT_REQUEST_4_CD req_value, SUBMIT_REQUEST_4_NAME req_name FROM " + serverName + ".SUBMIT_REQUEST_4_MST WHERE VALID_FLAG = \'1\'";
        	    rs = stmt.executeQuery(strSeq4);
        	    out.println("<option value=" + "00" + "></option>");
				while(rs.next()){
					if (cnt > 0 && rs.getString("req_value").equals(strreq_4[i-1])){
						out.println("<option selected=\"selected\" value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}else{
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}
				}	
				out.println("</select>");
				out.println("</td>");
				
				if (cnt == 0){
				    out.println("<td class=\"furikaebi_column\"><input type=\"text\" class=\"input_text1\" id=\"id_furikae_" + i + "\" name=\"nm_furikae_" + i + "\" style=\"background-color:#808080;\" maxlength=\"5\"></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text2\" maxlength=\"20\" id=\"id_syousai_" + i + "\" name=\"nm_syousai_" + i + "\" value=" + strdetail[0] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_kihonS_" + i + "\" name=\"nm_kihonS_" + i + "\" value=" + iwork_start[0] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_kihonE_" + i + "\" name=\"nm_kihonE_" + i + "\" value=" + iwork_end[0] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_jissekiS_" + i + "\" name=\"nm_jissekiS_" + i + "\"></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_jissekiE_" + i + "\" name=\"nm_jissekiE_" + i + "\"></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_jissekiR_" + i + "\" name=\"nm_jiseekiR_" + i + "\"></td>");
				    out.println("<td class=\"zangyou_coloumn\"><input type=\"text\" class=\"input_text1\"  maxlength=\"5\" id=\"id_zangyou_" + i + "\" name=\"nm_zangyou_" + i + "\" readonly=\"readonly\" style=\"background-color:#808080;\" value=" + izan_adj[0] + "></td>");
                    out.println("</tr>");
                }else{  
				    out.println("<td class=\"furikaebi_column\"><input type=\"text\" class=\"input_text1\" id=\"id_furikae_" + i + "\" name=\"nm_furikae_" + i + "\" readonly=\"readonly\" style=\"background-color:#808080;\" maxlength=\"5\"></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text2\" maxlength=\"20\" id=\"id_syousai_" + i + "\" name=\"nm_syousai_" + i + "\" value=" + strdetail[i-1] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_kihonS_" + i + "\" name=\"nm_kihonS_" + i + "\" value=" + iwork_start[i-1] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_kihonE_" + i + "\" name=\"nm_kihonE_" + i + "\" value=" + iwork_end[i-1] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_jissekiS_" + i + "\" name=\"nm_jissekiS_" + i + "\" value=" + iact_start[i-1] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_jissekiE_" + i + "\" name=\"nm_jissekiE_" + i + "\" value=" + iact_end[i-1] + "></td>");
				    out.println( strcolortd + "<input type=\"text\" class=\"input_text1\" maxlength=\"4\" id=\"id_jissekiR_" + i + "\" name=\"nm_jiseekiR_" + i + "\" value=" + irest_hours[i-1] + "></td>");
				    out.println("<td class=\"zangyou_coloumn\"><input type=\"text\" class=\"input_text1\"  maxlength=\"5\" id=\"id_zangyou_" + i + "\" name=\"nm_zangyou_" + i + "\" readonly=\"readonly\" style=\"background-color:#808080;\" value=" + izan_adj[i-1] + "></td>");
                    out.println("</tr>");
                }
				i = i + 1;
			}
            	     
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // �f�[�^�x�[�X�Ƃ̐ڑ����N���[�Y
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
    if (MyCommand == "Toroku"){
        return btnRegist_Click();
    }else if(MyCommand == "ExcelOut"){
		alert("Excel���o�͂��܂��B\n�o�͂�����O�Ƀf�[�^�̓o�^���s���ĉ������B");
		return true;
    }else if(MyCommand == "Personal"){
        var staff_id = document.getElementById("txtPersonal_id").value;
 		if (!staff_id.match(/[0-9][0-9][0-9][0-9][0-9]+$/)) {
				alert("���l5����ID����͂��Ă��������B");
				return false;
		}
		return true;
    }
 } 
 </script> 