$(function(){

    var $el, leftPos, newWidth,
        $mainNav = $("#example-one"),
        $mainNav2 = $("#main-menu");
    
    /*
        EXAMPLE TWO
    */
    $mainNav2.append("<li id='magic-line'></li>");
    
    var $magicLineTwo = $("#magic-line");
    

    $magicLineTwo
        .width($(".current_page_item").width())
        .height("35px")
        .css("margin", "10px 0 0 -4px")
        .css("left", $(".current_page_item a").position().left)
        .data("origLeft", $(".current_page_item a").position().left)
        .data("origWidth", $magicLineTwo.width())
        .data("origColor", $(".current_page_item a").attr("rel"));
                
    $("#main-menu li").find("a").hover(function() {
        $el = $(this);
        leftPos = $el.position().left;
        newWidth = $el.parent().width();
        $magicLineTwo.stop().animate({
            left: leftPos,
            width: newWidth,
            backgroundColor: $el.attr("rel")
        })
    }, function() {
        $magicLineTwo.stop().animate({
            left: $magicLineTwo.data("origLeft"),
            width: $magicLineTwo.data("origWidth"),
            backgroundColor: $magicLineTwo.data("origColor")
        });    
    });
});
