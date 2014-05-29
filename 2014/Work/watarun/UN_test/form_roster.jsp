<%@ page contentType="text/html; charset=Shift_JIS"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
	<title>�Ζ��\���� -�炭�炭�ΑӁi���j</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_roster.css" />
</head>

<body>
<!-- �w�b�_�[-->
<div id="container">
<div id="header">
<form method="post">
<ul>
	<li><button id="btnView"   OnClick="">�Ζ��\�{��</button></li>
	<li><button ID="btnRegist"   OnClick="">�Αӏ��o�^</button></li>
	<li><button id="btnOutput"   OnClick="">�Ζ��\�o��</button></li>
	<li id="login_panel">���O�C����</li>
</ul>
<hr>
</div>
<!--�Ζ��\-->
<div id="header_roster">
<h1>5���Ζ��\</h1>
<table border="0" cellspacing="0" id="table_caption">
<!--<caption>5���Ζ��\</caption>-->
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
<table border="0" cellspacing="0" id="table_personalinfo">
	<tr>
		<td class="column_name2">�Ј��ԍ�</td>
		<td>000208</td>
	</tr>
	<tr>
		<td class="column_name1">����</td>
		<td>BI��</td>
	</tr>
	<tr>
		<td class="column_name1">����</td>
		<td>�r�c����</td>
	</tr>
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
        // �f�[�^�x�[�X�ւ̃A�N�Z�X�J�n
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String strUserid = "00001";
        
        try {
            // �f�[�^�x�[�X�ɐڑ�����Connection�I�u�W�F�N�g�̎擾
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost/unserver2014",
                "root", "");
            // �f�[�^�x�[�X������s�����߂�Statement�I�u�W�F�N�g�̎擾
            stmt = con.createStatement();
            
	        /*�������̓����擾����*/
            Calendar cal = Calendar.getInstance();        
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
            sdf.applyPattern("yyyy");
            String strYear = sdf.format(cal.getTime());
            sdf.applyPattern("MM");
            String strMonth = sdf.format(cal.getTime());
    
            /*����o�^�L���̔���*/
            String strInitsql = "SELECT COUNT(*) cnt FROM unserver2014.WORK_TRN " + 
        	    	"WHERE STAFF_ID = " + strUserid + 
        	    	" AND YEAR = " + strYear + 
        	    	" AND MONTH = "  + strMonth;
    
            rs = stmt.executeQuery(strInitsql);
            
            //���R�[�h���̎擾
            rs.next();
            int cnt = rs.getInt("cnt");
            String strPerSQL = "";       
            cnt = 0;
            
            if (cnt == 0){
           	    /*����o�^�̏ꍇ*/
        	    /*�l�ݒ�g�����̌ďo��*/   	
				strPerSQL = "SELECT BASIC_WORK_START work_start, BASIC_WORK_END work_end, DETAIL detail, ZANGYO_ADJUST adjust FROM unserver2014.PARSONAL_TRN WHERE STAFF_ID = " + strUserid;
				rs = stmt.executeQuery(strPerSQL);
				/*�l�ݒ�g���������g��ǉ�*/
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
					String strSeq1 = "SELECT SUBMIT_REQUEST_1_CD req_value, SUBMIT_REQUEST_1_NAME req_name FROM unserver2014.SUBMIT_REQUEST_1_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq1);
					
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}			
					out.println("</select>");
					
					out.println("</td>");
					out.println("<td>");
					out.println("<select name=\"example2\" size=\"1\" class=\"input_select\">");
					String strSeq2 = "SELECT SUBMIT_REQUEST_2_CD req_value, SUBMIT_REQUEST_2_NAME req_name FROM unserver2014.SUBMIT_REQUEST_2_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq2);		
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}		
					out.println("</select>");
					out.println("</td>");
					out.println("<td>");
					
					out.println("<select name=\"example3\" size=\"1\" class=\"input_select\">");
					String strSeq3 = "SELECT SUBMIT_REQUEST_3_CD req_value, SUBMIT_REQUEST_3_NAME req_name FROM unserver2014.SUBMIT_REQUEST_3_MST WHERE VALID_FLAG = \'1\'";
	        	    rs = stmt.executeQuery(strSeq3);		
					while(rs.next()){
						out.println("<option value=" + rs.getString("req_value") + ">" + rs.getString("req_name") + "</option>");
					}	
					out.println("</select>");
					out.println("</td>");
					out.println("<td>");
					out.println("<select name=\"example4\" size=\"1\" class=\"input_select\">");
					String strSeq4 = "SELECT SUBMIT_REQUEST_4_CD req_value, SUBMIT_REQUEST_4_NAME req_name FROM unserver2014.SUBMIT_REQUEST_4_MST WHERE VALID_FLAG = \'1\'";
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
        	    /*�ΑӃg�����̃f�[�^�Ăяo��*/
        	    strPerSQL = "SELECT * FROM unserver2014.WORK_TRN�@" + 
        		    	"WHERE STAFF_ID = " + strUserid + 
        			    " AND YEAR = " + strYear + 
        			    " AND MONTH = "  + strMonth;
        	    ResultSet perrs = stmt.executeQuery(strPerSQL);   	
        	    /*�ΑӃf�[�^���g��ǉ�*/
        	    while(perrs.next()){

        	    }
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
<!-- �t�b�^�[ --> 
<div id="footer">
<p>�炭�炭�Ζ��\ Version 0.0.0 20140524 Copyright (C) 2014 UN ROOM</p>
</div>
</div>
</body>

</html>