<%-- 
    Document   : TestPage
    Created on : Jan 22, 2015, 11:18:57 AM
    Author     : kiwi
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<body>
		<form action="getContent" method="get">
			<textarea cols="80" id="editor1" name="editor1" rows="10"></textarea>				
			<input type="submit" value="Submit" /> 
                        s
		</form>
		<ckfinder:setupCKEditor basePath="/ckfinder/" editor="editor1" />
		<ckeditor:replace replace="editor1" basePath="/Carpath/ckeditor/" />
	</body>	
</html>