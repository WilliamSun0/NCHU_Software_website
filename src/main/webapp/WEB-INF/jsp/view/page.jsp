<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: my-deepin
  Date: 18-3-17
  Time: 下午4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>软件学院文章管理后台</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 17px;"><strong>软件学院文章管理系统</strong></div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>/admin/page" style="text-decoration: none;"><strong>首页</strong></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="text-decoration: none;">
                    <img src="<%=basePath%>/static/img/avatar.jpg" class="layui-nav-img">
                    <strong>${sessionScope.name}</strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="" style="text-decoration: none;"><strong>基本资料</strong></a></dd>
                    <dd><a href="" style="text-decoration: none;"><strong>安全设置</strong></a></dd>
                    <hr/>
                    <dd><a href="<%=basePath%>/admin/outLogin" style="text-decoration: none;;"><strong>退出登录</strong></a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a style="text-decoration: none">
                    <span class="fa fa-github"></span>
                    <strong>Github</strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a style="text-decoration: none;"><strong>联系Leader</strong></a></dd>
                    <hr/>
                    <dd><a style="text-decoration: none;"><strong>github地址</strong></a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="<%=basePath%>/admin/outLogin" style="text-decoration: none;;"><strong>退出</strong></a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;文章管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: toPageContextEntityManage();" style="text-decoration: none;"><strong>文章列表</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toPageContextEntityWrite();" style="text-decoration: none;"><strong>文章草稿</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toPageContextEntityTrash();" style="text-decoration: none;"><strong>回收站</strong></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="" style="text-decoration: none;"><strong><span class="fa fa-twitter fa-fw"></span>&nbsp;&nbsp;&nbsp;关于我们</strong></a></li>
                <li class="layui-nav-item"><a href="" style="text-decoration: none;"><strong><span class="fa fa-send-o fa-fw"></span>&nbsp;&nbsp;&nbsp;联系我们</strong></a></li>
            </ul>
        </div>
    </div>
    <!-- 以上都是共享内容 -->

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div id="content">
            <div style="font-size: 45px;color: #1D9D73;margin-top: 300px;" class="text-center"><strong>欢迎登录后台管理系统</strong></div>
            <p class="text-center">
                <strong style="color: #1D9D73;">本系统由各种Copy来的代码实现功能以及页面的美化</strong>
            </p>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <strong>© 后台管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;Create by TyCoding</strong>
        <strong class="layui-layout-right">系统时间：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
    </div>
</div>
</body>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<script src="<%=basePath%>/static/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function toPageContextEntityWrite() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/PageContextEntity/toPageContextEntityWrite\" width=\"100%\" height=\"100%\"></object>";
    }
    function toPageContextEntityManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/PageContextEntity/toPageContextEntityManage\" width=\"100%\" height=\"100%\"></object>";
    }
    function toPageContextEntityTrash() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/PageContextEntity/toPageContextEntityTrash\" width=\"100%\" height=\"100%\"></object>";
    }
</script>
</html>