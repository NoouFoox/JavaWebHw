<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/Testcss.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>注册</title>
</head>
<body>
	<div class="container w-50">
		<form action="register_server.jsp" method="post">
			<h1 class="text-center">用户注册</h1>
			<div class="form-group">
				账号:<input type="text" class="form-control" name="account">
			</div>

			<div class="form-group">
				密码:<input type="password" class="form-control" name="password">
			</div>
			<div class="">
				确认密码：<input type="password" class="form-control" name="re_password">
			</div>
			<div class="form-group">
				昵称:<input type="text" name="nickname" class="form-control" id=""
					value="" />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="提交">
			</div>
			<div class="form-group">
				<input type="button" name="" id="" value="注册"
					class="btn btn-primary btn-block" /> <span> <%
 	if (request.getParameter("message") != null) {
 		out.print(request.getParameter("message"));
 	}
 	%>
				</span>
			</div>
		</form>
	</div>

</body>
</html>