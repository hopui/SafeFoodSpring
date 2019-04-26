<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>정보변경</h3>
			</div>
		</div>
		
		<div class="col-sm-6 col-md-offset-3">
			<form action="/register" method="post">
				
				<input type="hidden" name="action" value="modifyAccount">
				
				<div class="form-group">
					<label for="modifyEmail">이메일 주소 (변경불가)</label> 
					<input type="email" class="form-control" id="modifyEmail" name="email" value="${sessionScope.account.email }" readonly>
				</div>
				
				<div class="form-group">
					<label for="modifyPassword">비밀번호</label> 
					<input type="password" class="form-control" id="modifyPassword" name="password" placeholder="새로운 비밀번호를 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="modifyPasswordCheck">비밀번호 확인</label> 
					<input type="password" class="form-control" id="modifyPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" required>
				</div>
				
				<div class="form-group">
					<label for="modifyName">이름</label> 
					<input type="text" class="form-control" id="modifyName" name="name" value="${sessionScope.account.name }" required>
				</div>
				<div class="form-group">
					<label for="modifyAddress">주소</label> 
					<input type="text" class="form-control" id="modifyAddress" name="address" value="${sessionScope.account.address }" required>
				</div>
				<div class="form-group">
					<label for="modifyPhone">전화번호</label> 
					<input type="text" class="form-control" id="modifyPhone" name="phone" value="${sessionScope.account.phone }" required>
				</div>
				
				<!-- 알레르기 -->
				<div class="form-group">
					<fieldset>
						<legend><b>알레르기 체크</b></legend>
						<input type="checkbox" id="cb01" name="allery" value="대두"><label for="cb01">대두</label>
						<input type="checkbox" id="cb02" name="allery" value="땅콩"><label for="cb02">땅콩</label>
						<input type="checkbox" id="cb03" name="allery" value="우유"><label for="cb03">우유</label>
						<input type="checkbox" id="cb04" name="allery" value="게"><label for="cb04">게</label>
						<input type="checkbox" id="cb05" name="allery" value="새우"><label for="cb05">새우</label>
						<input type="checkbox" id="cb06" name="allery" value="참치"><label for="cb06">참치</label>
						<input type="checkbox" id="cb07" name="allery" value="연어"><label for="cb07">연어</label>
						<input type="checkbox" id="cb08" name="allery" value="쑥"><label for="cb08">쑥</label>
						<input type="checkbox" id="cb09" name="allery" value="소고기"><label for="cb09">소고기</label>
						<input type="checkbox" id="cb10" name="allery" value="닭고기"><label for="cb10">닭고기</label>
						<input type="checkbox" id="cb11" name="allery" value="돼지고기"><label for="cb11">돼지고기</label>
						<input type="checkbox" id="cb12" name="allery" value="복숭아"><label for="cb12">복숭아</label>
						<input type="checkbox" id="cb13" name="allery" value="민들레"><label for="cb13">민들레</label>
						<input type="checkbox" id="cb14" name="allery" value="계란흰자"><label for="cb14">계란흰자</label>
					</fieldset>
				</div>
				
				<!-- 정보수정 버튼 및 리셋버튼  -->
				<div class="form-group text-center">
					<button type="submit" id="modify-submit" class="btn btn-primary">
						정보수정<i class="fa fa-check spaceLeft"></i>
					</button>
					<input type="button" id="goHome" class="btn btn-warning" value="메인으로" onClick="location.href='/index.jsp'">
				</div>
			</form>
		</div>

	</article>
</body>
</html>