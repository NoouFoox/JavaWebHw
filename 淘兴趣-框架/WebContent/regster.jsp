<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container w-50">
		<form action="" method="post">
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
		</form>
	</div>
	<%
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String re_password = request.getParameter("re_password");
		String nickname = request.getParameter("nickname");

		out.print(account = "<br>");
		out.print(password = "<br>");
		out.print(re_password = "<br>");
		out.print(nickname = "<br>");
	%>


</body>
</html>