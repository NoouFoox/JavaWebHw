<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	Connection conn = null;
	//简单 
	Statement st = null;
	//复杂 
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/interestdb?useSSL=true&serverTimezone=GMT&characterEncodding=UTF8","root", "root");
	String interestid =request.getParameter("interest_id");
	int interest_id=(interestid!=null)?(Integer.parseInt(interestid)):0;
	if (interest_id==0){
		String sql="select interest_id,name,subscribe_num,image from topic order by subscribe_num desc limit 6";
		ps=conn.prepareStatement(sql);
	}else{
		String sql="select interest_id,name,subscribe_num,image from topic where interest_id=? order by subscribe_num desc limit 6";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, interest_id);
	}
	rs=ps.executeQuery();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>淘兴趣首页</title>

		<link rel="stylesheet" href="css/bootstrap.min.css">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>

		<meta name="viewport" content="width=device-width,initial-scale=1.0">

	</head>
	<body>
		<header class="w-100 border-bottom">
			<nav class="navbar navbar-expand-lg navbar-light bg-white container">
				<a class="navbar-brand" href=""><img alt="" src="img/s-logo.png"></a>
				<button class="navbar-toggler" data-toggle="collapse" data-target="#bar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse  navbar-collapse" id="bar">
					<form class="form-inline" action="#" method="get">
						<input class="form-control mr-2" type="search">
						<button class="btn btn-outline-success" type="submit">搜索</button>
					</form>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a href="index.jsp" class="nav-link">首页</a></li>
						<%
						String account=(String)session.getAttribute("account");
						if(account==null){
						%>
						<li class="nav-item"><a href="login.jsp" class="btn btn-primary">登录</a></li>
						<%
						}else{
						%>
						<li class="nav-item btn"><kbd>用户名:<%=account %></kbd></li>
						<%
						}
						%>
					</ul>
				</div>
			</nav>
		</header>
		<article class="container py-3">
			<div class="row">
				<!-- 兴趣列表 -->
				<div id="interest_list" class="col-md-2">
					<div class="nav nav-pills flex-md-column flex-sm-row">
						<a href="index.jsp?interest_id=0" class="nav-link active">推荐</a>
						<a href="index.jsp?interest_id=1" class="nav-link">数据库兴趣</a>
						<a href="index.jsp?interest_id=2" class="nav-link">前端兴趣</a>
						<a href="index.jsp?interest_id=3" class="nav-link">后端兴趣</a>
						<a href="index.jsp?interest_id=4" class="nav-link">运维兴趣</a>
					</div>
				</div>
				<!-- 趣点列表 -->
				<div id="topic_list" class="col-md-10">
					<div class="card-columns">
					<%
						while(rs.next()){	
					%>
						<!-- 趣点1 -->
						<div class="card">
							<div class="card-body">
								<h3 class="card-title"><%=rs.getString("name")%></h3>
								<p class="text-muted">已订阅<%=rs.getInt("subscribe_num")%></p>
							</div>
							<a href="" class="text-dark text-decoration-none"> <img alt="" src="<%=rs.getString("image") %>" class="card-img-bottom">
							</a>
						</div>
						<%	
							}
						%>
					</div>
				</div>
			</div>
		</article>
		<footer class="container bg-light text-center">
			<p>
				<a>售后服务｜</a> <a>隐私策略｜</a> <a>广告服务｜</a> <a>客服中心</a>
			</p>
			<p>淘兴趣@关注你感兴趣的人和事</p>
		</footer>
	</body>
</html>
