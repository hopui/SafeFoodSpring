<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>

<!-- 부트스트랩 CDN -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<!-- Local CSS -->
<style>
	fieldset
	{
		display: inline-block;
	}
	fieldset > label, fieldset > input 
	{
		padding: 13px;
	}
</style>

</head>
<body>
	<div class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>회원가입</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<c:url value="/register" var="register"/>
			<form action="${register }" method="post">
				<input type="hidden" name="action" value="register">
				<div class="form-group">
					<label for="registerEmail">이메일 주소</label> 
					<input type="email" class="form-control" id="registerEmail" name="email" placeholder="이메일 주소를 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="registerPassword">비밀번호</label> 
					<input type="password" class="form-control" id="registerPassword" name="password" placeholder="비밀번호를 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="registerPasswordCheck">비밀번호 확인</label> 
					<input type="password" class="form-control" id="registerPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" required>
				</div>
				<div class="form-group">
					<label for="registerName">이름</label> 
					<input type="text" class="form-control" id="registerName" name="name" placeholder="이름" required>
				</div>
				<div class="form-group">
					<label for="registerAddress">주소</label> 
					<input type="text" class="form-control" id="registerAddress" name="address" placeholder="주소를 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="registerPhone">전화번호</label> 
					<input type="text" class="form-control" id="registerPhone" name="phone" placeholder="010-0000-0000" required>
					<input type="hidden" name="authority" value="member">
				</div>
				<!-- 알레르기 -->
				<div class="form-group">
					<fieldset>
						<legend><b>알레르기 체크</b></legend>
						<input type="checkbox" id="cb01" name="allergy" value="대두"><label for="cb01">대두</label>
						<input type="checkbox" id="cb02" name="allergy" value="땅콩"><label for="cb02">땅콩</label>
						<input type="checkbox" id="cb03" name="allergy" value="우유"><label for="cb03">우유</label>
						<input type="checkbox" id="cb04" name="allergy" value="게"><label for="cb04">게</label>
						<input type="checkbox" id="cb05" name="allergy" value="새우"><label for="cb05">새우</label>
						<input type="checkbox" id="cb06" name="allergy" value="참치"><label for="cb06">참치</label>
						<input type="checkbox" id="cb07" name="allergy" value="연어"><label for="cb07">연어</label>
						<input type="checkbox" id="cb08" name="allergy" value="쑥"><label for="cb08">쑥</label>
						<input type="checkbox" id="cb09" name="allergy" value="소고기"><label for="cb09">소고기</label>
						<input type="checkbox" id="cb10" name="allergy" value="닭고기"><label for="cb10">닭고기</label>
						<input type="checkbox" id="cb11" name="allergy" value="돼지고기"><label for="cb11">돼지고기</label>
						<input type="checkbox" id="cb12" name="allergy" value="복숭아"><label for="cb12">복숭아</label>
						<input type="checkbox" id="cb13" name="allergy" value="민들레"><label for="cb13">민들레</label>
						<input type="checkbox" id="cb14" name="allergy" value="계란흰자"><label for="cb14">계란흰자</label>
					</fieldset>
					
				</div>
				
				<div class="form-group text-center">
					<input type="submit" id="join-submit" class="btn btn-primary" value="회원가입"><c:url value="/main" var="main"/>
					<input type="button" class="btn btn-warning" value="메인으로" onClick="location.href='${main }'">
				</div>
			</form>
		</div>
	</div>
</body>
</html>