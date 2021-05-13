<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录服务</title>
</head>
<body>
	<%
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		if (account.trim().isEmpty() || password.trim().isEmpty()) {
			response.sendRedirect("login.jsp?message=" + URLEncoder.encode("账号密码不能为空", "utf-8"));
			return;
		}
		
		Connection conn = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interestdb?useSSL=true&serverTimezone=GMT",
				"root", "root");
		String sql = "select account from user where account=? and password=?";
		//查询账号密码是否在数据库 
		ps = conn.prepareStatement(sql);
		ps.setString(1, account);
		ps.setString(2, password);
		rs = ps.executeQuery();
		if (rs.next()) {
// 			response.sendRedirect("index.jsp?");
//保存账号
			session.setAttribute("account", account);
			response.sendRedirect("index.jsp?message=" + URLEncoder.encode("登录成功 账号名", "utf-8")+account);
		}else{
			response.sendRedirect("register.jsp?message=" + URLEncoder.encode("账号密码错误", "utf-8"));
			return;
		}
	%>
</body>
</html>