<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册服务</title>
</head>
<body>
	<h1 style="text-align: center;">register_server页面</h1>
	<%
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String re_password = request.getParameter("re_password");
		String nickname = request.getParameter("nickname");
// 		out.print(account += "<br>");
// 		out.print(password + "<br>");
// 		out.print(re_password + "<br>");
// 		out.print(nickname + "<br>");
		if(account.trim().isEmpty()||password.trim().isEmpty()){
			response.sendRedirect("register.jsp?message="+URLEncoder.encode("账号密码不能为空","utf-8"));
		}
		if(!password.equals(re_password)){
			response.sendRedirect("register.jsp?message="+URLEncoder.encode("两次密码不一致","utf-8"));
		}
	%>
	<!-- <hr> -->
<%-- 	账号<%=account %><br> --%>
<%-- 	密码<%=password %><br> --%>
<%-- 	<%=re_password %><br> --%>
<%-- 	昵称<%=nickname %><br> --%>

</body>

</html>