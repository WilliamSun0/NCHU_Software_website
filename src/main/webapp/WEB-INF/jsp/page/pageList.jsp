<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String secondMenuId = request.getParameter("secondMenuId");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <base href="<%=basePath%>">
    
    <title>这里要设置一下</title>

	  <%@include file="../common/head.jsp" %>
	  <link href="<%=path%>/css/pagelist_main.css" rel="stylesheet"/>
	<%--<script src="<%=path%>/js/pageList.js"></script>--%>


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
	  <div class="col-sm-2">


		  <ul id="second_list" class="nav nav-tabs">

		  </ul>
	  </div>
	  <div class="col-sm-7">
		  <div class="post-list page_list_body">

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
  <div class="footer">
	  <div>

		  <ul id='pageInfo'></ul>

	  </div>
	  © 2018 南昌航空大学软件学院 地址：南昌市丰和南大道696号 学校邮编：330063 赣ICP备
  </div>

  <script src="<%=path%>/js/jquery-3.2.1.js"></script>
  <script src="<%=path%>/js/bootstrap.js"></script>

  <script src="<%=path%>/js/bootstrap-paginator.js"></script>
  <script src="<%=path%>/js/pageList.js"></script>


    <script>


        var element = $("#pageInfo");

        var pageList = "";

        var firstId = ${firstMenuId};

		initList(firstId);

        function changePageContext(secondMenuId){
            $(".page_list_body").empty();
            pageList = "";
            //var tag = document.activeElement.tagName
            pageStart(secondMenuId);
		}

        function initList(firstId) {
			var first = "";
            $.ajax({
                type: "get",
                url: "/page/getSecondListValue",
                data: {firstMenuId:firstId},
                dataType: "json",
                success: function (data) {

                    $.each(data, function (index, node) {
                        console.log(data);
						if (index == 0){
                            first += `<li><a  data-toggle="tab" class="active" href="javascript:void(0);" onclick="changePageContext(`+ node.secondmenuid +`)">`+ node.secondmenuname+ `</a></li>`;
                            pageStart(node.secondmenuid)
						}else {
                            first += `<li><a data-toggle="tab" href="javascript:void(0);" onclick="changePageContext(`+ node.secondmenuid +`)">`+ node.secondmenuname+ `</a></li>`;
                        }
                    });

                    $("#second_list").append(first);
                }
            });

        }


        function initPageContext(data){
            console.log(data.list);

            $.each(data.list,function(index,node) {

                pageList += `  <div class="post-list-item">

				  <div class="col-xs-12">
					  <a href='/page/`+ node.pagecontextid +`/getPageById'>
						  <div class="post-heading">`+node.title+`</div>
					  </a>

					  <p class="text-muted">·
                        <span>

                        `+ node.author +`
                        </span> ⋅
                        <span>

                        `+ node.source +`
                        </span> ⋅
						  <span>
                        `+ node.count +`已浏览
                        </span> ⋅
						  <span>
                        `+getMyDate(node.uploadtime) +`
                        </span>
					  </p>
				  </div>
			  </div>`

            });
            $(".page_list_body").append(pageList);
        }

        function pageStart(secondMenuId){

            $.ajax({

                type:"GET",

                url:"/page/getlist",

                dataType:"json",

                data:{page:1,secondMenuId:secondMenuId},

                success:function(data){

                    //后台返回的需要显示的信息列表

                    //根据自己需求再进行前端渲染

                   	initPageContext(data);


                    var options = {

                        bootstrapMajorVersion:3, //bootstrap的版本要求

                        currentPage:data.page,//当前页数

                        totalPages:data.totalPage,//总页数

                        numberOfPages:data.pageSize,//每页记录数

                        itemTexts : function(type, page, current) {//设置分页按钮显示字体样式

                            switch (type) {

                                case "first":

                                    return "首页";

                                case "prev":

                                    return "上一页";

                                case "next":

                                    return "下一页";

                                case "last":

                                    return "末页";

                                case "page":

                                    return page;

                            }

                        },

                        onPageClicked:function(event,originalEvent,type,page){//分页按钮点击事件

                            console.log(page);



                            $.ajax({//根据page去后台加载数据

                                url:"/page/getlist",

                                type:"GET",

                                dataType:"json",

                                data:{"page":page,secondMenuId:secondMenuId},

                                success:function(data){

                                    $(".page_list_body").empty();
                                    pageList = "";

                                    initPageContext(data);

                                }

                            })

                        }

                    }

                    //初始化分页框

                    element.bootstrapPaginator(options);

                }

            })

        }

        function getMyDate(str){
            var oDate = new Date(str),
                oYear = oDate.getFullYear(),
                oMonth = oDate.getMonth()+1,
                oDay = oDate.getDate(),
                oHour = oDate.getHours(),
                oMin = oDate.getMinutes(),
                oSen = oDate.getSeconds(),
                oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+
                    getzf(oMin) +':'+getzf(oSen);//最后拼接时间
            return oTime;
        };
        //补0操作
        function getzf(num){
            if(parseInt(num) < 10){
                num = '0'+num;
            }
            return num;
        }


	</script>
  </body>
</html>
