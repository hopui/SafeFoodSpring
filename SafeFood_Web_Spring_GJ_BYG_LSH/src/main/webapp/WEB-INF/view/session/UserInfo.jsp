<%@page import="com.ssafy.model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 정보</title>
	
	<!-- 부트스트랩 CDN -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	
	<!-- 타이틀 폰트 -->
	<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
	
	<style>
		th{
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="container text-center table-responsive-md">
		<h1>사용자 정보</h1>
		<c:if test="${!empty loginUser }">

			<table class="table table-striped table-hover">
				<tr>
					<th scope="col">등급</th>
					<td>${loginUser.authority }</td>
				</tr>
				<tr>
					<th scope="col">이메일</th>
					<td>${loginUser.email }</td>
				</tr>

				<tr>
					<th scope="col">이름</th>
					<td>${loginUser.name }</td>
				</tr>

				<tr>
					<th scope="col">주소</th>
					<td>${loginUser.address }</td>
				</tr>

				<tr>
					<th scope="row">전화번호</th>
					<td>${loginUser.phone }</td>
				</tr>

				<tr>
					<th scope="row">알레르기 목록</th>
					<td>${loginUser.allergy }</td>
				</tr>
			</table>
			<c:url value="/main" var="main"/>
			<c:url value="/session/modifyUserInfo" var="modifyUserInfo"/>
			<c:url value="/session/dropUserInfo" var="dropUserInfo"/>
			<input type="button" class="btn btn-success btn-lg" value="메인으로" onClick="location.href='${main }'">
			<input type="button" class="btn btn-primary btn-lg" value="정보변경" onClick="location.href='${modifyUserInfo }'">
			<input type="button" class="btn btn-danger btn-lg" id="dropUserInfo" value="회원탈퇴">
			<hr>
			<div id="myfood"></div>
			<div id="myfood_chart"></div>
		</c:if>
	</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$("#dropUserInfo").click(function(e) {
		let result = confirm("정말로 탈퇴하시겠습니까?");
		if(!result)
			return false;
		else
			location.href = "${dropUserInfo }"+"?email=${loginUser.email }";
	});
</script>

</html>