<%@ page contentType="text/html; charset=Shift_JIS" %>
<html>
<head>
	<title>�Ζ��\���� -�炭�炭�ΑӁi���j</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_roster.css" />
</head>

<body>
<!-- �w�b�_�[-->
<ul>
	<li><button id="btnView"   OnClick="">�Ζ��\�{��</button></li>
	<li><button ID="btnRegist"   OnClick="">�Αӏ��o�^</button></li>
	<li><button id="btnOutput"   OnClick="">�Ζ��\�o��</button></li>
	<li id="login_panel">���O�C����</li>
</ul>
<hr>
<!--�Ζ��\-->
<!-- <ul>
	<li id="zangyo_panel">�c�ƒ���</li>
	<li>
	<select name="zangyo">
	<option value="No">�~</option>
	<option value="Yes">��</option>
	</li>
</ul>
-->
<table border="0" cellspacing="0">
	<tr>
		<td rowspan="2">��</td>
		<td rowspan="2">�j��</td>
		<td colspan="4">���[���͏o�\��</td>
		<td rowspan="2">�U�֓�</td>
		<td rowspan="2">�ڍ�</td>
		<td colspan="2">��{�Ζ�����</td>
		<td colspan="3">���ыΖ�����</td>
		<td rowspan="2">�c�ƒ���</td>
			<tr>
				<td>�x��</td>
				<td>�x�o/�U��x</td>
				<td>�ʉ@/�d�x</td>
				<td>A/B��</td>
				<td>�o��</td>
				<td>�ގ�</td>
				<td>�o��</td>
				<td>�ގ�</td>
				<td>�x�e</td>
			</tr>
	</tr>
	<!---���̓t�H�[�� -->
	<form>
	
	<tr>
		<td>1</td>
		<td></td>
		<td>
			<select name="example1" size="1">

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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

			<option value="�T���v��1">�T���v��1</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example2" size="1">

			<option value="�T���v��1">�T���v��2</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example3" size="1">

			<option value="�T���v��1">�T���v��3</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

			</select>
		</td>
		<td>
			<select name="example4" size="1">

			<option value="�T���v��1">�T���v��4</option>

			<option value="�T���v��2">�T���v��2</option>

			<option value="�T���v��3">�T���v��3</option>

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