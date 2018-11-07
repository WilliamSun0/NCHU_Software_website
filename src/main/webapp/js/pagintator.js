var element = $("#pageInfo");

var pageList = "";
var sss;


pageStart();

function pageStart(){

    $.ajax({

        type:"GET",

        url:"/page/getlist",

        dataType:"json",

        data:{page:1,secondMenuId:sss},

        success:function(data){

            //后台返回的需要显示的信息列表

            //根据自己需求再进行前端渲染

            console.log(data.list);

            $.each(data.list,function(index,node) {
                pageList += "<tr><td>" +
                    "<a href='/page/"+ node.pagecontextid +"/getPageById'>"+ node.title +"</a></td>" +
                    "<td>"+ node.author+"</td>" +
                    "<td>"+ node.source+"</td>" +
                    "<td>"+ node.uploadtime +"</td>"+
                    "<td>"+node.count+"</td>"+
                    "</tr>"

            });
            $(".page_list_body").append(pageList);


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

                        data:{"page":page,secondMenuId:sss},

                        success:function(data){

                            $(".page_list_body").empty();

                            //后台返回的需要显示的信息列表

                            //根据自己需求再进行前端渲染

                            console.log(data.list);

                            pageList = "";

                            $.each(data.list,function(index,node2) {
                                pageList += "<tr><td>" +
                                    "<a href='/page/"+ node2.pagecontextid +"/getPageById'>"+ node2.title +"</a></td>" +
                                    "<td>"+ node2.author+"</td>" +
                                    "<td>"+ node2.source+"</td>" +
                                    "<td>"+ node2.uploadtime +"</td>"+
                                    "<td>"+node2.count+"</td>"+
                                    "</tr>"

                            });


                            $(".page_list_body").append(pageList);

                        }

                    })

                }

            }

            //初始化分页框

            element.bootstrapPaginator(options);

        }

    })

}

