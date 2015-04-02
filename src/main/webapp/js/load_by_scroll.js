/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
jQuery(window).scroll(function() {

        /* Если высота окна + высота прокрутки больше или равны высоте всего документа и ajax-запрос в настоящий момент не выполняется, то запускаем ajax-запрос */
    var piece = parseInt(jQuery(document).height() / 2);
    var page_type = jQuery("#page_type").val();
    var contstants = jQuery("#contstants").val();
    var last_item = jQuery("#last_item").val();
    var next_item = parseInt(last_item) + 9;
    var lan = jQuery("#lan").val();
    var menu_id = jQuery("#menu_id").val();
    var selected_country = jQuery("#selected_country").val();
    var count = jQuery("#count").val();
    //alert(count);
    //console.log("piece = " + piece);
    //console.log("window scroll top = "+jQuery(window).scrollTop());
    //console.log("window height = "+jQuery(window).height());
    //console.log("document height = "+jQuery(document).height());
    //console.log("document height - piece = " + (jQuery(document).height() - piece));
    if(parseInt(count) > parseInt(last_item))
    {
    if ($("html").height() - $(window).height() <= $(window).scrollTop() + 250) 
    //if(parseInt(jQuery(window).scrollTop()) >= parseInt(jQuery(document).height() - piece)) 
        {
            //alert("yeah!!");
            console.log("yeah!");
            jQuery(".loading_block").show();
           
            var data = new FormData();
            //var data = "'page_type' : page_type"; 
            data.append('page_type', page_type);
            data.append('last_item', last_item);
            data.append('lan', lan);
            jQuery.ajax({
                url: contstants+'load_more_content',
                data: "page_type="+page_type+"&last_item="+last_item+"&lan="+lan+"&menu_id="+menu_id+"&selected_country="+selected_country,
                cache: false,
                mimeType: "text/html; charset=UTF-8",
                type: 'GET',
                success: function(data){
                    console.log("succes");
                    //console.log("data = " + data);
                    jQuery(".all_news").append(data);
                    jQuery(".loading_block").hide();
                    jQuery("#last_item").val(next_item);
                },
                error: function(data)
                    {
                        console.log(data);
                    }
            });
        }
    }
});


