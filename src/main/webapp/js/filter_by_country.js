/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function change_country(country)
    {
        var selected_country = jQuery("#selected_country").val();
        jQuery( "#"+selected_country).removeClass( "selected_country" );
        jQuery( "#"+country ).addClass( "selected_country" );
        jQuery("#selected_country").val(country);
        jQuery("#last_item").val("9");
        var contstants = jQuery("#contstants").val();
        var lan = jQuery("#lan").val();
        var page_type = jQuery("#page_type").val();
        var menu_id = jQuery("#menu_id").val();
        var lan = jQuery("#lan").val();
        jQuery.ajax({
            url: contstants+'filter_by_country',
            data: "page_type="+page_type+"&country="+country+"&lan="+lan+"&menu_id="+menu_id+"&lan="+lan,
            cache: false,
            mimeType: "text/html; charset=UTF-8",
            type: 'GET',
            success: function(data){
                console.log("succes filter");
                //console.log("data = " + data);
                jQuery(".all_news").html(data);
                jQuery(".loading_block").hide();
            },
            error: function(data)
                {
                    console.log(data);
                }
        });
    }
function change_routes_country(country)
    {
        var selected_country = jQuery("#selected_country").val();
        jQuery( "#"+selected_country).removeClass( "selected_country" );
        jQuery( "#"+country ).addClass( "selected_country" );
        jQuery("#selected_country").val(country);
        jQuery("#last_item").val("9");
        var contstants = jQuery("#contstants").val();
        var lan = jQuery("#lan").val();
        var page_type = jQuery("#page_type").val();
        var menu_id = jQuery("#menu_id").val();
        var lan = jQuery("#lan").val();
        jQuery.ajax({
            url: contstants+'filter_by_country_routes',
            data: "page_type="+page_type+"&country="+country+"&lan="+lan+"&menu_id="+menu_id+"&lan="+lan,
            cache: false,
            mimeType: "text/html; charset=UTF-8",
            type: 'GET',
            success: function(data){
                console.log("succes filter");
                //console.log("data = " + data);
                jQuery(".all_news").html(data);
                var files = jQuery("#file_array").val();
                console.log("file array = "+files);
                files = files.split(",");
                console.log("file array after split = "+files);
                map = [];
                build_route(files);
            },
            error: function(data)
                {
                    console.log(data);
                }
        });
    }

function change_routes_type(type)
    {
        var selected_type = jQuery("#selected_type").val();
        console.log("selected_type = " + selected_type);
        jQuery( "#"+selected_type).removeClass("selectedCountryTrip");
        jQuery( "#"+type).addClass( "selectedCountryTrip" );
        jQuery("#selected_type ").val(type); 
        jQuery("#last_item").val("9");
        var contstants = jQuery("#contstants").val();
        var lan = jQuery("#lan").val();
        var page_type = jQuery("#page_type").val();
        var menu_id = jQuery("#menu_id").val();
        var lan = jQuery("#lan").val();
        var country = jQuery("#selected_country").val();
        jQuery.ajax({
            url: contstants+'filter_by_type_routes',
            data: "page_type="+page_type+"&country="+country+"&lan="+lan+"&menu_id="+menu_id+"&lan="+lan+"&type="+type,
            cache: false,
            mimeType: "text/html; charset=UTF-8",
            type: 'GET',
            success: function(data){
                console.log("succes filter");
                //console.log("data = " + data);
                jQuery(".all_news").html(data);
                var files = jQuery("#file_array").val();
                console.log("file array = "+files);
                files = files.split(",");
                console.log("file array after split = "+files);
                build_route(files);
            },
            error: function(data)
                {
                    console.log(data);
                }
        });
    }

