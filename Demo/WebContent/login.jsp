<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<title>登录</title>
</head>
<body>
<div class="header">
	<h1>学生信息登录</h1>
</div>
<div class="centent">
	<form action="check.jsp" class="from">
		<table>
			<tr><td>账号: </td><td><input type="text" id="username" name="username"></td></tr>
			<tr><td>密码: </td><td><input type="password" id="pwd" name="password"></td></tr>
			<tr><td colspan="2"><input type="submit" value="登录"><input type="reset" value="清除"></td></tr>
		</table>
	</form>
</div>
</body>
</html>
