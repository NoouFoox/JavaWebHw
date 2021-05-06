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
<title>登录</title>
</head>
<body>
	<div class="container w-50">
		<form action="login_server.jsp" method="post">
			<h1 class="text-center">用户登录</h1>
			<div class="form-group">
				账号:<input type="text" class="form-control" name="account">
			</div>

			<div class="form-group">
				密码:<input type="password" class="form-control" name="password">
			</div>
			<span class="text-danger"> <%
 	if (request.getParameter("message") != null) {
 		out.print(request.getParameter("message"));
 	}
 %>
			</span>
			<div class="form-group">
				<input type="submit" name="" id="" value="登录"
					class="btn btn-primary btn-block" />
			</div>
		</form>
	</div>

</body>
</html>