var strUrl=window.location.href;
var arrUrl=strUrl.split("/");
var strPage=arrUrl[arrUrl.length-1].split(".")[0];
/*var secondmenuid = strPage.split("")*/

$(function(){
	page();
})
function page(){
	$.ajax({
		url:"page/getPageBySecId",
		type:"GET",
		data:{"secondmenuid":strPage},
		success:function(result){
			/*var str = "";
			if(result.length > 1){
				str = "<ul>";
				$.each(result,function(index,node) {
	            	str += "<li><span><a href='#'>" + node.title + "</a></span><span>" + getTime(node.uploadtime) + "</span></li>"
	            });
				str += "</ul>";
			}else{
        		str += "<h2 style='text-align:center;'>" + result.title + "</h2><p style='front-size=20px;text-align:center;'>作者"
        		+ result.author + "文章来源：" + result.source + "点击数：" + result.count + "更新时间：" + getTime(result.uploadtime) + "</p>";
			}
			$("#div1").append(str);
		}*/
			var str = "";
			
				$.each(result,function(index,node) {
					if(result.length > 1){
						str += "<li><span><a href='#'>" + node.title + "</a></span><span>" + getTime(node.uploadtime) + "</span></li>"
					}else{
		        		str += "<h2 style='text-align:center;'>" + node.title + "</h2><p style='front-size=20px;text-align:center;'>作者"
		        		+ node.author + "文章来源：" + node.source + "点击数：" + node.count + "更新时间：" + getTime(node.uploadtime) + "</p>";
					}
	            });
				if(result.length > 1){
					$("ul").append(str);
				}else{
					$("#div1").append(str);
				}
			}
		
	});
}

function getTime( /** timestamp=0 **/ ) {
	var ts = arguments[0] || 0;
	var t,h,i;
	t = ts ? new Date(ts) : new Date();
	y = t.getFullYear();
    m = t.getMonth() + 1;
    d = t.getDate();
    // 可根据需要在这里定义时间格式  
    return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d); 
}