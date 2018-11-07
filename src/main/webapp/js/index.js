var big_lunbo_time;
var index = 1;
var firstmenu;
var secondmenu;

window.onload=function(){
	Nav();
	lunbo_start();
	InitMenu();
	
	}
//大图轮播
function lunbo_start(){
		big_lunbo_time = setInterval(lunbo_toggle,2000);
		}
	function lunbo_toggle(){
		//获取元素数组
		var img=$("#banner_show img");
		var list=$("#yq_banner_list li");
		
		//for里面
		$(img).hide();
		$(list).css({backgroundPosition:"-246px -117px"});
		
		//fadeIn/fadeOut淡入淡出
		$(img).eq(index).fadeIn(200);
		$(list).eq(index).css({backgroundPosition:"-230px -117px"});
		index++;
		if(index>img.length-1){
			index=0;
			}
		
		}
	function dianji(newIndex){
		clearInterval(big_lunbo_time);
		index = newIndex;
		lunbo_toggle();
		lunbo_start();
		}


function InitMenu() {
    $.ajax({
        url: "index/",
        type: "get",
        data: {},
        dataType: "json",
        success: function (data) {
            firstmenu = data.firstmenu;
            secondmenu = data.secondmenu;
            var first = "";
            var second = "";
            var pages = "";

            $.each(data.firstmenu, function (index, node) {

                first += `<li><a href='/page/`+ node.firstmenuid +`/secondList'>`+ node.firstmenuname+ `</a></li>`;

            });

            $(".navbar-nav").append(first);
        }
    });
}
	
	
	function Nav(){
		$(".box").hover(function(){
			$(".li_content").eq($(this).index(".box")).slideDown(300);
		},function(){
			$(".li_content").eq($(this).index(".box")).slideUp(300);
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



