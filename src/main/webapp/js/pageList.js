
var index = 1;
var firstmenu;
var secondmenu;

window.onload=function(){

    InitMenu();

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






