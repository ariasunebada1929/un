<jsp:useBean id="appData" class="keiziban_Req.Data" scope="application" />
<%@ page language="java" contentType="text/html; charset=Shift_JIS"
	pageEncoding="Shift_JIS"%>
<%@ page import="keiziban_Cus.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<title>掲示板</title>
<style type="text/css">
body {
	line-height: 200%;
}
</style>
</head>
<body>
	<FORM METHOD="POST" ACTION="Keiziban">
		<center>
			<H1>
				<b>掲示板</b>
			</H1>
		</center>
		<div style="text-alingn: center">

			<center>
				<%
					if (appData.Error) {
				%>
				ちゃんと記入してちょ。
				<%
					}
				%>
			</center>
			<center>
				<p
					style="width: 30%; margin-left: auto; margin-right: auto; text-align: left;">
					名前 <INPUT TYPE="TEXT" NAME="NAME" SIZE="20" MAXLENGTH="15"><br>
					件名 <INPUT TYPE="TEXT" NAME="KENMEI" SIZE="40" MAXLENGTH="30"><br>
				    <pre><TEXTAREA NAME="KOMENT" ROWS="10" COLS="60"></TEXTAREA></pre>
				    <INPUT TYPE="submit" VALUE="投稿"><br>
			</center>
				<center>
					<H2>
						<b><font size="+2">メッセージ一覧</font></b>
					</H2>
				</center>
				<hr width="1500">


				<%
					if (appData.nameData != null) {
				%>
				<%
					for (int i = appData.nameData.size() - 1; i >= 0; i--) {
				%>

				<font color="#ff0000"><%=appData.nameData.get(i)%></font>&nbsp;&nbsp;&nbsp;&nbsp;
				<%=appData.kenmeiData.get(i)%><br> &nbsp;&nbsp;<%=appData.dayData.get(i)%>&nbsp;&nbsp;&nbsp;No.<%=appData.numData.get(i)%><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<pre><%=appData.komentData.get(i)%></pre>
				<br>
				<hr width="1500">
				<%
					}
				%>
				<%
					}
				%>

		</div>
	</FORM>
</body>
</html>
