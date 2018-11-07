<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: my-deepin
  Date: 18-4-30
  Time: 上午9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
    <!-- 文章信息的表单 -->
    <div class="layui-form">
        <form>
            <div class="layui-inline" style="margin-left: -10px;">
                <label class="layui-form-label" style="padding-left: 0;"><strong>文章编号</strong></label>
                <div class="layui-input-inline" style="margin-left: -502px;">
                    <input name="pagecontextid" id="pagecontextid" class="layui-input" value="${PageContextEntity.pagecontextid}" readonly="readonly"/>
                </div>
                <label class="layui-form-label" style="margin-left: 157px;width:90px;"><strong>文章作者</strong></label>
                <div class="layui-input-inline" style="margin-left:87px;">
                    <input type="text" name="author" id="author" value="${PageContextEntity.author}" class="layui-input"/>
                </div>
                <label class="layui-form-label" style="margin-left:169px;padding-left: 0;"><strong>发布日期</strong></label>
                <div class="layui-input-inline" style="margin-left: 88px;">
                    <input type="text" name="date" id="uploadtime" value="${PageContextEntity.uploadtime}" class="layui-input"/>
                </div>
            </div>
            <hr style="margin-top: 0;"/>
            <div class="layui-inline" style="margin-left: -10px;padding-left: 0;">
                <label class="layui-form-label" style="padding-left: 0;"><strong>文章简介</strong></label>
                <div class="layui-input-inline" style="margin-left: -6px;width: 275px;">
                        <input type="text" name="r_summary" id="r_summary" value="${PageContextEntity.r_summary}" class="layui-input"/>
                </div>
            </div>
            <br/>
            <br/>
            <label><strong>文章内容</strong></label>
            <!-- 加载Markdown富文本容器 -->
            <div id="content" class="form-control">${PageContextEntity.r_content}</div>
            <div class="layui-inline" style="margin-top: 20px;">
                <button type="button" id="verifyBtn" class="layui-btn">存入草稿箱</button>
                <button type="button" id="publishBtn" class="layui-btn">发布</button>
                <button type="button" id="cleanBtn" class="layui-btn">清空</button>
            </div>
        </form>
    </div>

</div>
</body>

<!-- JQuery的配置 -->
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<!-- 加载Layui的配置 -->
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<!-- Markdwon富文本 -->
<script src="<%=basePath%>/static/editormd/lib/marked.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/prettify.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/raphael.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/underscore.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/sequence-diagram.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/flowchart.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/jquery.flowchart.min.js"></script>
<script src="<%=basePath%>/static/editormd/editormd.min.js"></script>
<script type="text/javascript">
    var markdown;
    $(function(){
        markdown = editormd.markdownToHTML('content',{
            htmlDecode: "style,script,iframe",
            syncScrolling: 'single',
            emoji: true,
            taskList: true,
            tex: true,
            flowChart: true,
            sequenceDiagram: true,
            codeFold: true
        });
    });
</script>
<script type="text/javascript">
    <!-- 初始化layui -->
    layui.use('element', function(){
        var element = layui.element;
    });
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#uploadtime'
        });
    });
</script>
<script type="text/javascript">
    // 如果点击了存入草稿箱
    $("#verifyBtn").click(function(){
        var pagecontextid = $("#pagecontextid").val();
        var author = $("#author").val();
        var r_summary = $("#r_summary").val();
        var r_content = ue.getContent();
        var uploadtime = $("#uploadtime").val();
        var verify = 1;
        var publish = 0;
        var status = 0;
        $.ajax({
            url: '<%=basePath%>/PageContextEntity/update',
            type: 'POST',
            data: {
                pagecontextid: pagecontextid,
                author: author,
                r_summary: r_summary,
                r_content: r_content,
                uploadtime: uploadtime,
                verify: verify,
                publish: publish,
                status: status
            },
            success: function(data){
                $("body").html(data);
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '更新信息失败'
                });
            }
        });
    });

    // 如果点击了发布按钮
    $("#publishBtn").click(function(){
        var pagecontextid = $("#pagecontextid").val();
        var author = $("#author").val();
        var r_summary = $("#r_summary").val();
        var r_content = ue.getContent();
        var uploadtime = $("#uploadtime").val();
        var verify = 1;
        var publish = 1;
        var status = 0;
        $.ajax({
            url: '<%=basePath%>/PageContextEntity/update.do',
            type: 'POST',
            data: {
                pagecontextid: pagecontextid,
                author: author,
                r_summary: r_summary,
                r_content: r_content,
                uploadtime: uploadtime,
                verify: verify,
                publish: publish,
                status: status
            },
            success: function(data){
                $("body").html(data);
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '更新信息失败'
                });
            }
        });
    });

    // 清空
    $("#cleanBtn").click(function(){
        layer.open({
            title: '警告信息',
            content: '你确定要清空文章内容吗？',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                ue.execCommand('cleardoc');
                layer.close(index);
            }
        });
    });
</script>

</html>
