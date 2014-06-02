<%@ page contentType="text/html; charset=Shift_JIS" %>
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
	    int i = 1;
        while(i < 32){
        out.println("<tr>");
    	out.println("<td>" + i +"</td>");
        out.println("<td></td>");
        out.println("<td>");
        out.println("<select name=\"example1\" size=\"1\">");
        out.println("<option value=\"サンプル1\">サンプル1</option>");
        out.println("<option value=\"サンプル2\">サンプル2</option>");
        out.println("<option value=\"サンプル3\">サンプル3</option>");
        out.println("</select>");
        out.println("</td>");
        out.println("<td>");
        out.println("<select name=\"example2\" size=\"1\">");
        out.println("<option value=\"サンプル2\">サンプル2</option>");
        out.println("<option value=\"サンプル2\">サンプル2</option>");
        out.println("<option value=\"サンプル3\">サンプル3</option>");
        out.println("</select>");
        out.println("</td>");
        out.println("<td>");
        out.println("<select name=\"example3\" size=\"1\">");
        out.println("<option value=\"サンプル3\">サンプル3</option>");
        out.println("<option value=\"サンプル2\">サンプル2</option>");
        out.println("<option value=\"サンプル3\">サンプル3</option>");
        out.println("</select>");
        out.println("</td>");
        out.println("<td>");
        out.println("<select name=\"example4\" size=\"1\">");
        out.println("<option value=\"サンプル4\">サンプル4</option>");
        out.println("<option value=\"サンプル2\">サンプル2</option>");
        out.println("<option value=\"サンプル3\">サンプル3</option>");
        out.println("</select>");
        out.println("</td>");
		out.println("<td><input type=\"text\"></td>");
		out.println("<td><input type=\"text\"></td>");
		out.println("<td><input type=\"text\"></td>");
		out.println("<td><input type=\"text\"></td>");
		out.println("<td><input type=\"text\"></td>");
		out.println("<td><input type=\"text\"></td>");
		out.println("<td><input type=\"text\"></td>");
		out.println("<td><input type=\"text\"></td>");
        out.println("</tr>");
        i = i + 1;
        }
    %>
	</form>
</table>

</body>

</html>