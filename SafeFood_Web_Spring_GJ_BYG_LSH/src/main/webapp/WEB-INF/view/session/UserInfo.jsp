<%@page import="com.ssafy.model.dto.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		.tableDiv
		{
			max-width: 500px;
		}
		th{
			text-align: center;
		}
	</style>
</head>
<body>

	<div class="container text-center table-responsive-md tableDiv">
		<h2>사용자 정보</h2>
		<c:if test="${!empty account }">
	
		<table class="table table-striped table-hover">
			<tr>
				<th scope="col">이메일</th>
				<td>${account.email }</td>
			</tr>
			
			<tr>
				<th scope="col">이름</th>
				<td>${account.name }</td>
			</tr>	
			
			<tr>
				<th scope="col">주소</th>
				<td>${account.address }</td>
			</tr>	
			
			<tr>
				<th scope="row">전화번호</th>
				<td>${account.phone }</td>
			</tr>
			
			<tr>
				<th scope="row">알레르기 목록</th>
				<td>
					<c:forEach var="item" items="${account.allergy }">
						${item }<br>
					</c:forEach>
				</td>
			</tr>		
		</table>
		
		<input type="button" class="btn btn-success" value="메인으로" onClick="location.href='/safefood/food/food'">
		<input type="button" class="btn btn-primary" value="정보변경" onClick="location.href='/safefood/session/ModifyAccount.jsp'">
		<input id="dropAccount" type="button" class="btn btn-danger" value="회원탈퇴">
		<hr>
		<div id="myfood">
		</div>
		<div id="myfood_chart">
		</div>
		</c:if>
	</div>
</body>

<script>
	$("#dropAccount").click(function(e){
		let result = confirm("정말로 탈퇴하시겠습니까?");
		if(!result)
		{
			return false;
		}
		else
		{
			location.href = "/safefood/register?action=dropAccount&email=${account.email}";
		}
	});
</script>

</html>