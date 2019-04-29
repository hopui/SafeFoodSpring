<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>정보 변경</title>
	
		<!-- 부트스트랩 CDN -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	</head>
	
	<!-- Local CSS -->
	<style>
		fieldset {
			display: inline-block;
		}
		fieldset > label, fieldset > input {
			padding: 13px;
		}
	</style>
	
<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>정보변경</h3>
			</div>
		</div>
		
		<div class="col-sm-6 col-md-offset-3">
			<c:url value="/session/modifyUserInfo" var="modifyUserInfo"/>
			<form action="${modifyUserInfo }" method="post">
				<div class="form-group">
					<label for="email">이메일 주소 (변경불가)</label> 
					<input type="email" class="form-control" id="email" name="email" value="${loginUser.email }" readonly>
				</div>
				
				<div class="form-group">
					<label for="password">비밀번호</label> 
					<input type="password" class="form-control" id="password" name="password" placeholder="새로운 비밀번호를 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="modifyPasswordCheck">비밀번호 확인</label> 
					<input type="password" class="form-control" id="modifyPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" required>
				</div>
				
				<div class="form-group">
					<label for="name">이름</label> 
					<input type="text" class="form-control" id="name" name="name" value="${loginUser.name }" required>
				</div>
				<div class="form-group">
					<label for="address">주소</label> 
					<input type="text" class="form-control" id="address" name="address" value="${loginUser.address }" required>
				</div>
				<div class="form-group">
					<label for="phone">전화번호</label> 
					<input type="text" class="form-control" id="phone" name="phone" value="${loginUser.phone }" required>
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
				
				<!-- 정보수정 버튼 및 리셋버튼  -->
				<div class="form-group text-center"><c:url value="/main" var="main"/>
					<input type="submit" class="btn btn-primary" value="정보수정">
					<input type="button" class="btn btn-warning" value="메인으로" onClick="location.href='${main }'">
				</div>
			</form>
		</div>

	</article>
</body>
</html>