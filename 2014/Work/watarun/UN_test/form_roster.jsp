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
	
	<tr>
		<td>1</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>2</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>3</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>4</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>5</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>6</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>7</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>8</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	
	<tr>
		<td>9</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>10</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>11</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>12</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>13</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>14</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>15</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>16</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>17</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>18</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>19</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>20</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>21</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>22</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>23</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>24</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>25</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>26</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>27</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>28</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>29</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>30</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>31</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="サンプル1">サンプル1</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="サンプル1">サンプル2</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="サンプル1">サンプル3</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="サンプル1">サンプル4</option>

			<option value="サンプル2">サンプル2</option>

			<option value="サンプル3">サンプル3</option>

			</select>
		</td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
	</tr>
	</form>
</table>

</body>

</html>