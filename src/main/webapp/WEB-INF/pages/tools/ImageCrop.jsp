<%-- 
    Document   : imageCrop
    Created on : Dec 27, 2015, 5:11:29 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>
<html>
<head>
  <title>Image crop</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1"/>
  <link type="text/css" media="screen" rel="stylesheet" href="${Constants.URL}js/jquery.cropbox.css">
        <link href="${Constants.URL}css/bootstrap.min.css" rel="stylesheet" />
  <style type="text/css">
    body {
      font-family : sans-serif;
      font-size   : 13px;
    }
    .results {
      font-family : monospace;
      font-size   : 20px;
    }
  </style>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
  <script type="text/javascript" src="http://hammerjs.github.io/dist/hammer.min.js"></script>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.6/jquery.mousewheel.js"></script>
  <script type="text/javascript" src="${Constants.URL}js/jquery.cropbox.js"></script>
  <script type="text/javascript" defer>
    $( function () {
      $( '.cropimage' ).each( function () {
        var image = $(this),
            cropwidth = image.attr('cropwidth'),
            cropheight = image.attr('cropheight'),
            results = image.next('.results' ),
            x       = $('.cropX', results),
            y       = $('.cropY', results),
            w       = $('.cropW', results),
            h       = $('.cropH', results),
            download = results.next('.download').find('a');

          image.cropbox( {width: cropwidth, height: cropheight, showControls: 'auto' } )
            .on('cropbox', function( event, results, img ) {
              x.text( results.cropX );
              y.text( results.cropY );
              w.text( results.cropW );
              h.text( results.cropH );
              download.attr('href', img.getDataURL());
            });
      } );

      $('#select').on('change', function () {
          var size = parseInt(this.value);
          $('.cropimage').each(function () {
            $(this).cropbox({width: size, height: size})
          });
      });

    } );
  </script>
</head>
<body style="text-align: center;">


  <img class="cropimage" alt="" src="${Constants.URL}${file}" cropwidth="300" cropheight="195"/>
  <div style="display:none" class="results">
    <b>X</b>: <span class="cropX"></span>
    <b>Y</b>: <span class="cropY"></span>
    <b>W</b>: <span class="cropW"></span>
    <b>H</b>: <span class="cropH"></span>
  </div>

  <div class="download" style="display:none" >
    <a href="#" download="crop.png">Download</a>
  </div>
  <button style="display: block;
    margin: auto;
    width: 100px;
    margin-top: 10px;" type="button" id="saveBtn" class="btn btn-primary">Save</button>
  <br/>

  <select style="display:none" id="select">
    <option value="200" selected>200</option>
    <option value="300">300</option>
  </select>
</body>
<script>
    $("#saveBtn").click(function(){
        $(".download a").attr("href");
         var data = new FormData();
        data.append('path', '${fileR}');
        data.append('url', $(".download a").attr("href"));
        
        jQuery.ajax({
                    url: '/Carpath/system/downloadimage;jsessionid=<c:out value="${pageContext.session.id}"/>',
                    data: data,
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'POST',
                    success: function(data){
                        
        $("#avatarUpload .returnImage", window.parent.document).remove();
        $("#crop-this", window.parent.document).remove();
           $("#avatarUpload .img-content", window.parent.document).append("<a class='returnImage'>"
                                + "<img src='"+"${Constants.URL}"+ data + "' alt='" + data + "'  /><img src='"+"${Constants.URL}"+"img/remove.png' class='remove-icon'/></a>");
            
            $("#avatarUpload .img-input-box", window.parent.document).remove();
            $('#avatarUpload .image-upload', window.parent.document).append('<button type="button" id="avatarBtn"  class="btn btn-primary img-input-box" data-toggle="modal" data-target="#avatarModal">Browse avatar</button><button type="button" id="avatarBtnArchive"  class="btn btn-primary img-input-box" data-toggle="modal" style="margin-left: 5px;" data-target="#avatarModalArchive">Browse archive</button>');
            $("#avatar-path", window.parent.document).val(data);
            
            $("#avatarUpload .img-content-show-all", window.parent.document).removeAttr("current");
            $("#avatarUpload .img-content-show-all", window.parent.document).removeAttr("realpath");
            window.parent.imageInserted(); 
                    }
                    });
    });
</script>