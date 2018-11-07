<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link href="./css/index.css" rel="stylesheet"/>
	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">


<title>首页</title>
</head>
<body>

<div class="head1">
	<div class="head1_content">
    	<div class="head1_logo"></div>
        <div class="head1_gif"></div>
    </div>
</div>
	<div class="navbar navbar-default">

		<div class="container">

			<ul class="nav navbar-nav">
				<li><a href="#">首页</a></li>

			</ul>

		</div>

	</div>
<div style="width:100%; height:421px; position:relative;">
	<div id="lunbo_div">
		<div id="banner_show">
	    	<img src="image/1.jpg"/>
	        <img src="image/2.jpg"/>
	        <img src="image/3.jpg"/>
	        <img src="image/4.jpg"/>
	        <img src="image/5.jpg"/>
	    </div>
	   	<ul id="yq_banner_list">
	    	<li style="background-position:-230px -117px;" onClick="dianji(0);"></li>
	        <li onClick="dianji(1);"></li>
	        <li onClick="dianji(2);"></li>
	        <li onClick="dianji(3);"></li>
	        <li onClick="dianji(4);"></li>
	    </ul>
	</div>
</div>
<div class="neirong">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div class="row">
					<div class="col-sm-6">
						<div class="panel panel-default">
							<div class="panel-heading">面板标题</div>
							<div class="panel-body">
								<p>这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
								</p>
							</div>
							<ul class="list-group">
								<li class="list-group-item">免费域名注册</li>
								<li class="list-group-item">免费 Window 空间托管</li>
								<li class="list-group-item">图像的数量</li>
								<li class="list-group-item">24*7 支持</li>
								<li class="list-group-item">每年更新成本</li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="panel panel-default">
							<div class="panel-heading">面板标题</div>
							<div class="panel-body">
								<p>这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
								</p>
							</div>
							<ul class="list-group">
								<li class="list-group-item">免费域名注册</li>
								<li class="list-group-item">免费 Window 空间托管</li>
								<li class="list-group-item">图像的数量</li>
								<li class="list-group-item">24*7 支持</li>
								<li class="list-group-item">每年更新成本</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="panel panel-default">
							<div class="panel-heading">面板标题</div>
							<div class="panel-body">
								<p>这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
								</p>
							</div>
							<ul class="list-group">
								<li class="list-group-item">免费域名注册</li>
								<li class="list-group-item">免费 Window 空间托管</li>
								<li class="list-group-item">图像的数量</li>
								<li class="list-group-item">24*7 支持</li>
								<li class="list-group-item">每年更新成本</li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="panel panel-default">
							<div class="panel-heading">面板标题</div>
							<div class="panel-body">
								<p>这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
									这是一个基本的面板内容。这是一个基本的面板内容。
								</p>
							</div>
							<ul class="list-group">
								<li class="list-group-item">免费域名注册</li>
								<li class="list-group-item">免费 Window 空间托管</li>
								<li class="list-group-item">图像的数量</li>
								<li class="list-group-item">24*7 支持</li>
								<li class="list-group-item">每年更新成本</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="side-bar-well">
					<strong class="side-bar-well-title">
						本月浏览数TOP5
					</strong>
					<a href="#" class="news-item">
						<div class="news-title">Consectetur adipisicing elit. Consequuntur aut </div>
						<div class="news-info">
							5.9万次播放  ⋅ 167评论
						</div>
					</a>
					<a href="#" class="news-item">
						<div class="news-title">Lorem adipisicing elit. Consequuntur aut </div>
						<div class="news-info">
							8.9万次播放  ⋅ 3367评论
						</div>
					</a>
					<a href="#" class="news-item">
						<div class="news-title">Consectetur adipisicing elit. Consequuntur aut </div>
						<div class="news-info">
							5.9万次播放  ⋅ 167评论
						</div>
					</a>
					<a href="#" class="news-item">
						<div class="news-title">Lorem adipisicing elit. Consequuntur aut </div>
						<div class="news-info">
							8.9万次播放  ⋅ 3367评论
						</div>
					</a>

				</div>
			</div>
		</div>

	</div>

</div>

<div class="footer"/>

© 2018 南昌航空大学软件学院 地址：南昌市丰和南大道696号 学校邮编：330063 赣ICP备<a href="/admin/index">管理员</a>
</div>
</body>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/index.js"></script>
</html>