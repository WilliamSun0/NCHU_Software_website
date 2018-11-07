<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>这里要设置一下</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script src="<%=path%>/js/jquery-3.2.1.js"></script>
	<script src="<%=path%>/js/bootstrap.js"></script>
	<script src="<%=path%>/js/pageList.js"></script>
	<%--<script src="<%=path%>/js/pageList.js"></script>--%>
	<%@include file="../common/head.jsp" %>
	<link href="<%=path%>/css/pagelist_main.css" rel="stylesheet"/>
</head>
<body>
<div class="navbar navbar-default">

	<div class="container">

		<ul class="nav navbar-nav">
			<li><a href="#">首页</a></li>

		</ul>

	</div>

</div>
<div class="container">
	<div class="col-md-8 news">
		<h1 class="title"><c:out value="${data.title}"/></h1>
		<p class="info">
			<span>阅读：<c:out value="${data.count}"/></span> •
			<span>作者：<c:out value="${data.author}"/></span> •
			<span>源：<c:out value="${data.source}"/></span>
			<span><fmt:formatDate value="${data.uploadtime}" pattern="yyyy-MM-dd" /></span>
			<span class="label label-default">教育</span>

		</p>
		<div class="content">
			<c:out value="${data.context}"></c:out>
		</div>
	</div>
	<div class="col-md-4">
		<div class="side-bar-well">
			<strong class="side-bar-well-title">
				相关推荐
			</strong>
			<a href="#" class="news-item clearfix">
				<div class="row">
          <span class="col-xs-5">
            <img src="https://dummyimage.com/600x500/ddd/999" alt="">
          </span>
					<span class="col-xs-7">
            <div class="news-title">Lorem adipisicing elit. Consequuntur aut </div>
            <div class="news-info">
                8.9万次播放  ⋅ 3367评论
            </div>
          </span>
				</div>
			</a>
			<a href="#" class="news-item clearfix">
				<div class="row">
          <span class="col-xs-5">
            <img src="https://dummyimage.com/600x500/ddd/999" alt="">
          </span>
					<span class="col-xs-7">
            <div class="news-title">Lorem adipisicing elit. Consequuntur aut </div>
            <div class="news-info">
                8.9万次播放  ⋅ 3367评论
            </div>
          </span>
				</div>
			</a>
			<a href="#" class="news-item clearfix">
				<div class="row">
          <span class="col-xs-5">
            <img src="https://dummyimage.com/600x500/ddd/999" alt="">
          </span>
					<span class="col-xs-7">
            <div class="news-title">Lorem adipisicing elit. Consequuntur aut </div>
            <div class="news-info">
                8.9万次播放  ⋅ 3367评论
            </div>
          </span>
				</div>
			</a>
			<a href="#" class="news-item clearfix">
				<div class="row">
          <span class="col-xs-5">
            <img src="https://dummyimage.com/600x500/ddd/999" alt="">
          </span>
					<span class="col-xs-7">
            <div class="news-title">Lorem adipisicing elit. Consequuntur aut </div>
            <div class="news-info">
                8.9万次播放  ⋅ 3367评论
            </div>
          </span>
				</div>
			</a>
			<a href="#" class="news-item clearfix">
				<div class="row">
          <span class="col-xs-5">
            <img src="https://dummyimage.com/600x500/ddd/999" alt="">
          </span>
					<span class="col-xs-7">
            <div class="news-title">Lorem adipisicing elit. Consequuntur aut </div>
            <div class="news-info">
                8.9万次播放  ⋅ 3367评论
            </div>
          </span>
				</div>
			</a>
		</div>
		<div class="side-bar-well">
			<strong class="side-bar-well-title">
				24小时热闻
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
<div class="footer">
	© 2017 拴蛋头条 中国互联网举报中心京ICP证1401号京ICP备125439号-3京公网安备
</div>
</body>
</html>