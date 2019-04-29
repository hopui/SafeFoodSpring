<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		
		<!-- 부트스트랩 CDN -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	
		<!-- local css -->
		<style>
			#findedPassword{
				background-color: black;
			}
			#findedPassword:hover {
				background-color: white;
			}
		</style>
	</head>
<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>비밀번호 찾기</h3>
			</div>
		</div>
		
		<div class="col-sm-6 col-md-offset-3"><c:url value="/findPassword" var="findPassword"/>
			<form action="${findPassword }" method="post">
				<!-- 이메일 입력란 -->
				<div class="form-group">
					<label for="findEmail">이메일 주소</label> 
					<input type="email" class="form-control" name="email" placeholder="찾고싶은 이메일을 입력하세요." required autofocus>
				</div>
				<!-- 찾기/메인 버튼 -->
				<div class="form-group text-center"><c:url value="/main" var="main"/>
					<input type="submit" class="btn btn-primary" value="비밀번호 찾기">
					<input type="button" class="btn btn-warning" value="메인으로" onClick="location.href='${main }'">
				</div>
			</form>
			
			<div class="form-group text-center">
				<h4>찾은 비밀번호</h4>
				<input type="text" id="findedPassword" value="${findedPassword }" readonly>
			</div>
			
		</div>
	</article>
</body>
<script>
	let alarm = "${alarm }";
	
	if(alarm) {
		alert(alarm);
	}
</script>
</html>