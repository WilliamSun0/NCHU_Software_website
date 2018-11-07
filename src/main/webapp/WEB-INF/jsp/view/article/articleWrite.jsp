<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: my-deepin
  Date: 18-4-30
  Time: 上午9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/editormd/editormd.min.css"/>
</head>
<body>
<div class="container" style="width:80%;">
    <div style="margin-top: 60px;">
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>文章撰写</strong>
            </legend>
        </fieldset>
    </div>
    <br/>
    <!-- 编辑器的表单 -->
    <div class="layui-form">
        <form action="<%=basePath%>/" method="post">
            <div class="layui-inline" style="margin-left: -10px;">
                <label class="layui-form-label" style="padding-left: 0;"><strong>文章作者</strong></label>
                <div class="layui-input-inline" style="margin-left:-255px;">
                    <input type="text" name="author" id="author" value="${sessionScope.name}" class="layui-input"/>
                </div>
                <label class="layui-form-label" style="margin-left:169px;padding-left: 0;"><strong>发布日期</strong></label>
                <div class="layui-input-inline" style="margin-left: 88px;">
                    <input type="text" name="uploadtime" id="uploadtime" value="<%=nowDate%>" class="layui-input" readonly="readonly"/>
                </div>
            </div>
            <hr style="margin-top: 0;"/>

            <br/>
            <br/>
            <label><strong>文章内容</strong></label>
            <!-- 添加Markdown的容器 -->
            <div id="editormd">
                <textarea class="editormd-markdown-textarea" name="editormd-markdown-doc"></textarea>
                <textarea class="editormd-html-textarea" name="editormd-html-code"></textarea>
            </div>
            <div class="layui-inline" style="margin-top: 20px;">
                <button type="button" id="verifyBtn" class="layui-btn">存入草稿箱</button>
                <button type="button" id="publishBtn" class="layui-btn">发布</button>
                <button type="button" id="cleanBtn" class="layui-btn">清空</button>
            </div>
        </form>
    </div>
    <br/>
    <br/>
    <br/>
</div>
</body>
<!-- JQuery的配置 -->
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<!-- 加载Layui的配置 -->
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<!-- Markdown富文本 -->
<script src="<%=basePath%>/static/editormd/editormd.min.js"></script>
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
<!-- Markdown富文本编辑器 -->
<script type="text/javascript">
    var markdown;
    $(function(){
        markdown=editormd("editormd",{
            width: '100%',
            height: '80%',
            syncScrolling: 'single',
            path: '<%=basePath%>/static/editormd/lib/',
            saveHTMLToTextarea: true
        });
    });
</script>
<script type="text/javascript">
    // 如果点击了发布按钮
    $("#publishBtn").click(function(){
        var pagecontextid = $("#pagecontextid").val();
        var author = $("#author").val();
        var r_summary = $("#summary").val();
        var r_content = markdown.getMarkdown();
        var uploadtime = $("#uploadtime").val();
        var verify = 1;
        var publish = 1;
        var status = 0;
        $.ajax({
            url: '<%=basePath%>/PageContextEntity/savePageContextEntity',
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
                alert("错误");
            }
        });
    });

    // 如果点击了存入草稿箱
    $("#verifyBtn").click(function(){
        var pagecontextid = $("#pagecontextid").val();
        var author = $("#author").val();
        var r_summary = $("#r_summary").val();
        var r_content = markdown.getMarkdown();
        var uploadtime = $("#uploadtime").val();
        var verify = 0;
        var publish = 0;
        var status = 0;
        $.ajax({
            url: '<%=basePath%>/PageContextEntity/savePageContextEntity',
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
                alert("错误");
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
