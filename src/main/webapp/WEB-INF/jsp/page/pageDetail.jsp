<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'news.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=path%>/css/index.css" rel="stylesheet"/> 
	<script src="<%=path%>/js/jquery-3.2.1.js"></script>
	<script src="<%=path%>/js/index.js"></script>
	<script src="<%=path%>/js/pageDetail.js"></script>

  </head>
  
  <body>
    <div class="head1">
	<div class="head1_content">
    	<div class="head1_logo"></div>
        <div class="head1_gif"></div>
    </div>
</div>
<div class="nav">
    <ul>
    	<li><a href="index.jsp">首页</a>
        	<div class="shuxian"></div>
        </li>
    </ul>
</div>
<input type="hidden" value="aaaa" name="pageData" id="data">
<iframe name="pageDetailFrame" height="100%" id="pageDetailFrame" width="100%">
</iframe>
  </body>
  <script type="text/javascript">
  var strUrl=window.location.href;
  var arrUrl=strUrl.split("/");
  var strPage=arrUrl[arrUrl.length-1];
  
  /* alert(strPage);
  alert(strUrl); */
  $(function(){
	  $("#pageDetailFrame").attr("src", "/software/page/pageDetail/" + strPage);
  })
  </script>
</html>
