<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
		if (account.trim().isEmpty() || password.trim().isEmpty()) {
			response.sendRedirect("register.jsp?message=" + URLEncoder.encode("账号密码不能为空", "utf-8"));
			return;
		}
		if (!password.equals(re_password)) {
			response.sendRedirect("register.jsp?message=" + URLEncoder.encode("两次密码不一致", "utf-8"));
			return;
		}

		Connection conn = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/interestdb?useSSL=true&serverTimezone=GMT", "root", "root");
		String sql ="select account from user where account=?";
		ps=conn.prepareStatement(sql);
		ps.setString(1, account);
		rs=ps.executeQuery();
		if (rs.next()) {
			response.sendRedirect("register.jsp?message=" + URLEncoder.encode("该账户已经存在", "utf-8"));
			return;
		}
	%>
</body>

</html>