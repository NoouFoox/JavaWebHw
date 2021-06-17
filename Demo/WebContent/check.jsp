<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生信息登录</title>
</head>
<body>
<div class="header">
	<h1>学生信息登录</h1>
</div>
<div class="content">
	<jsp:useBean id="user" class="com.mybean.Users" scope="request"></jsp:useBean>
	<jsp:setProperty property="username" name="user" param="username"/>
	<jsp:setProperty property="password" name="user" param="password"/>
	<%
		if(user.loginCheck()){
	%>
	<jsp:forward page="succers.jsp"></jsp:forward>
	<%
		}else{
	%>
	<jsp:forward page="error.jsp"></jsp:forward>
	<%
		}
	%>
</div>
</body>
</html>