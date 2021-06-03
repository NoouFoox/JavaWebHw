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
	String sql="select * from score";
	int flag = 0;
	if(!(id.trim().isEmpty())){
		sql = sql + " where id='" + id + "'";
		flag=1;
	}
	
	if(!(name.trim().isEmpty())){
		if(flag==1){
			sql = sql + " and name='" + name + "'";
		}else{
			sql = sql + " where name='" + name + "'";
			flag=1;
		}
	}
	
	if(!(math.trim().isEmpty())){
		int m= Integer.parseInt(math);
		if(flag==1){
			sql = sql + " and math=" + m;
		}else{
			sql = sql + " where math=" + m;
			flag=1;
		}
	}
	
	if(!(english.trim().isEmpty())){
		int e= Integer.parseInt(english);
		if(flag==1){
			sql = sql + " and english=" + e;
		}else{
			sql = sql + " where english=" + e;
			flag=1;
		}
	}
	
	if(!(physics.trim().isEmpty())){
		int p= Integer.parseInt(physics);
		if(flag==1){
			sql = sql + " and physics=" + p;
		}else{
			sql = sql + " where physics=" + p;
			flag=1;
		}
	}
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
        <li class="active"><a href="#">查询</a></li>
        <li><a href="#" class="">插入</a></li>
        <li><a href="#" class="">修改</a></li>
        <li><a href="#" class="">删除</a></li>
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
    			<input type="submit" value="查询"  class="btn btn-primary">
    		</div>
    	</form>
    </div>
    <div class="col-sm-9">
      <h2>信息展示</h2>
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

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>底部内容</p>
</div>
</body>
</html>