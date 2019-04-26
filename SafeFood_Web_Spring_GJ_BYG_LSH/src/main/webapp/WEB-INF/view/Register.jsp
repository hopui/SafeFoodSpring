<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>회원가입</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="../food/food" method="post">
				<input type="hidden" name="action" value="register">
				<div class="form-group">
					<label for="registerEmail">이메일 주소</label> 
					<input type="email" class="form-control" id="registerEmail" name="registerEmail" placeholder="이메일 주소를 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="registerPassword">비밀번호</label> 
					<input type="password" class="form-control" id="registerPassword" name="registerPassword" placeholder="비밀번호를 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="registerPasswordCheck">비밀번호 확인</label> 
					<input type="password" class="form-control" id="registerPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" required>
				</div>
				<div class="form-group">
					<label for="registerName">이름</label> 
					<input type="text" class="form-control" id="registerName" name="registerName" placeholder="이름" required>
				</div>
				<div class="form-group">
					<label for="registerAddress">주소</label> 
					<input type="text" class="form-control" id="registerAddress" name="registerAddress" placeholder="주소를 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="registerPhone">전화번호</label> 
					<input type="text" class="form-control" id="registerPhone" name="registerPhone" placeholder="010-0000-0000" required>
				</div>
				<!-- 알레르기 -->
				<div class="form-group">
					<fieldset>
						<legend><b>알레르기 체크</b></legend>
						<input type="checkbox" id="cb01" name="registerAllergies" value="대두"><label for="cb01">대두</label>
						<input type="checkbox" id="cb02" name="registerAllergies" value="땅콩"><label for="cb02">땅콩</label>
						<input type="checkbox" id="cb03" name="registerAllergies" value="우유"><label for="cb03">우유</label>
						<input type="checkbox" id="cb04" name="registerAllergies" value="게"><label for="cb04">게</label>
						<input type="checkbox" id="cb05" name="registerAllergies" value="새우"><label for="cb05">새우</label>
						<input type="checkbox" id="cb06" name="registerAllergies" value="참치"><label for="cb06">참치</label>
						<input type="checkbox" id="cb07" name="registerAllergies" value="연어"><label for="cb07">연어</label>
						<input type="checkbox" id="cb08" name="registerAllergies" value="쑥"><label for="cb08">쑥</label>
						<input type="checkbox" id="cb09" name="registerAllergies" value="소고기"><label for="cb09">소고기</label>
						<input type="checkbox" id="cb10" name="registerAllergies" value="닭고기"><label for="cb10">닭고기</label>
						<input type="checkbox" id="cb11" name="registerAllergies" value="돼지고기"><label for="cb11">돼지고기</label>
						<input type="checkbox" id="cb12" name="registerAllergies" value="복숭아"><label for="cb12">복숭아</label>
						<input type="checkbox" id="cb13" name="registerAllergies" value="민들레"><label for="cb13">민들레</label>
						<input type="checkbox" id="cb14" name="registerAllergies" value="계란흰자"><label for="cb14">계란흰자</label>
					</fieldset>
					
				</div>
				
				<div class="form-group text-center">
					<button type="submit" id="join-submit" class="btn btn-primary">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					
					<button type="reset" class="btn btn-warning">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>

	</article>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</html>