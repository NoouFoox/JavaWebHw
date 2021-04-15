<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册服务</title>
</head>
<body>
	<%
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String re_password = request.getParameter("re_password");
		String nickname = request.getParameter("nickname");

		out.print(account += "<br>");
		out.print(password + "<br>");
		out.print(re_password + "<br>");
		out.print(nickname + "<br>");
	%>
	账号<%=account %><br>
	密码<%=password %><br>
	密码<%=re_password %><br>
	昵称<%=nickname %><br>
</body>
</html>