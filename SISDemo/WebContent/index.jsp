<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>学生信息管理系统</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/style.css">   
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
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
      <a class="navbar-brand acitve" href="index.jsp" style="color: white;">管理系统</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class=""><a href="search.jsp?id=&name=&math=&english=&physics=">查询</a></li>
        <li><a href="insert.jsp?id=&name=&math=&english=&physics=">插入</a></li>
        <li><a href="#" class="">修改</a></li>
        <li><a href="remove.jsp?id=&name=&math=&english=&physics=" class="">删除</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h2>关于我</h2>
      <h5>我的照片:</h5>
      <div class="fakeimgylp">
      <img alt="袁隆平院士" src="./img/ylp.jpg" class="fakeimgylp img-responsive">
      </div>
      <p>关于我的介绍..</p>
      <h3>链接</h3>
      <p>描述文本。</p>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#">链接 1</a></li>
        <li><a href="#" class="">链接 2</a></li>
        <li><a href="#" class="">链接 3</a></li>
      </ul>
      <hr class="hidden-sm hidden-md hidden-lg">
    </div>
    <div class="col-sm-8">
      <h2>标题</h2>
      <h5>副标题</h5>
      <div class="fakeimgfa">
			<img class="fakeimg img-responsive" alt="" src="./img/img02.jpg">
      </div>
      <p>一些文本..</p>
      <p>菜鸟教程，学的不仅是技术，更是梦想！！！菜鸟教程，学的不仅是技术，更是梦想！！！菜鸟教程，学的不仅是技术，更是梦想！！！</p>
      <br>
      <h2>标题</h2>
      <h5>副标题</h5>
      <div class="fakeimgfa">
      		<img class="fakeimg img-responsive" alt="" src="./img/img01.jpg">
      </div>
      <p>一些文本..</p>
      <p>菜鸟教程，学的不仅是技术，更是梦想！！！菜鸟教程，学的不仅是技术，更是梦想！！！菜鸟教程，学的不仅是技术，更是梦想！！！</p>
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