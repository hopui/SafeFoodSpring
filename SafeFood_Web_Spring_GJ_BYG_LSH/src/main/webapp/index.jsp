<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>로딩중...</title>
</head>
<body>

<c:url value="/main" var="mainUrl"></c:url>
<a id="main" href="${mainUrl}">로딩중입니당..</a>
</body>

<script>
	$(document).ready(
		function(){
			let href =$('#main').attr('href');
			window.location.href=href;
		}		
	);
</script>

</html>