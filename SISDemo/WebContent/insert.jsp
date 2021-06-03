<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%
 	String id=request.getParameter("id");
 	String name=request.getParameter("name");
 	String math=request.getParameter("math");
 	String english=request.getParameter("english");
 	String physics=request.getParameter("physics");
 	
	Connection conn = null;
	Statement st = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?useSSL=true&serverTimezone=GMT&characterEncodding=UTF8","root", "root");
	
	if(id.trim().isEmpty()||name.trim().isEmpty()||math.trim().isEmpty()||english.trim().isEmpty()||physics.trim().isEmpty()){
		
	}else{
		String sql="insert into score values(?,?,?,?,?)";
		ps=conn.prepareStatement(sql);
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setInt(3,Integer.parseInt(math));
		ps.setInt(4,Integer.parseInt(english));
		ps.setInt(5,Integer.parseInt(physics));
		ps.executeUpdate();
	}
	String sql="select * from score";
	st=conn.createStatement();
	rs=st.executeQuery(sql);
 %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>学生信息管理系统</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
	.topbg{
			background-image: url('./img/dg.jpg')
	}
  </style>
</head>
<body>

<div class="jumbotron text-center container topbg" style="margin-bottom:0">
  <h1>学生信息管理系统</h1>
  <p><kbd>19307103贺俊浩</kbd></p> 
</div>

<nav class="navbar navbar-inverse container">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.jsp">管理系统</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
		<li class=""><a href="search.jsp?id=&name=&math=&english=&physics=">查询</a></li>
        <li class="active"><a href="#" class="">插入</a></li>
        <li><a href="#" class="">修改</a></li>
        <li><a href="remove.jsp?id=&name=&math=&english=&physics=" class="">删除</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="row">
    <div class="col-sm-3">
    	<form action="">
    		<div class="form-group">
    			学号:<input type="text" name="id" class="form-control">
    		</div>
    		<div class="form-group">
    			姓名:<input type="text" name="name" class="form-control">
    		</div>
    		<div class="form-group">
    			数学:<input type="text" name="math" class="form-control">
    		</div>   
    		<div class="form-group">
    			英语:<input type="text" name="english" class="form-control">
    		</div> 		
    		<div class="form-group">
    			物理:<input type="text" name="physics" class="form-control">
    		</div>
    		<div class="form-group">
    			<input type="submit" value="插入"  class="btn btn-primary">
    		</div>
    	</form>
    </div>
    <div class="col-sm-9">
      <h2>信息插入</h2>
      <h5>详细信息</h5>
      <%
      out.print("<table class='table table-striped table-bordered'>");
      out.print("<tr>");
      out.print("<th>序号</th>");
      out.print("<th>姓名</th>");
      out.print("<th>数学</th>");
      out.print("<th>英语</th>");
      out.print("<th>物理</th>");
      out.print("</tr>");
      while(rs.next()){
          out.print("<tr>");
          out.print("<td>"+rs.getInt("id")+"</td>");
          out.print("<td>"+rs.getString("name")+"</td>");
          out.print("<td>"+rs.getInt("math")+"</td>");
          out.print("<td>"+rs.getInt("english")+"</td>");
          out.print("<td>"+rs.getInt("physics")+"</td>");
          out.print("</tr>");
      }
      out.print("</table>");
      %>
    </div>
  </div>
</div>

		<footer class="container bg-light text-center">
			<p>
				<a>售后服务｜</a> <a>隐私策略｜</a> <a>广告服务｜</a> <a>客服中心</a>
			</p>
			<p>淘兴趣@关注你感兴趣的人和事</p>
		</footer>
</body>
</html>