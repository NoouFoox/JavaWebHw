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
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interestdb?useSSL=true&serverTimezone=GMT",
				"root", "root");
		String sql = "select account from user where account=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, account);
		rs = ps.executeQuery();
		if (rs.next()) {
			response.sendRedirect("register.jsp?message=" + URLEncoder.encode("该账户已经存在", "utf-8"));
			return;
		}
		// 		注册
		sql = "insert into user(account,password,nickname,update_time) values(?,?,?,?)";
		response.setCharacterEncoding("GBK");
		ps = conn.prepareStatement(sql);
		ps.setString(1, account);
		ps.setString(2, password);
		ps.setString(3, nickname);
		ps.setDate(4, new java.sql.Date(new java.util.Date().getTime()));
		int num = ps.executeUpdate();
		if (num != 0) {
			response.sendRedirect("login.jsp");
			out.print("插入成功 ID:"+account);
		} else {
			response.sendRedirect("register.jsp?message=" + URLEncoder.encode("注册不成功", "utf-8"));
			out.print("插入失败");
			return;
		}
	%>
</body>

</html>