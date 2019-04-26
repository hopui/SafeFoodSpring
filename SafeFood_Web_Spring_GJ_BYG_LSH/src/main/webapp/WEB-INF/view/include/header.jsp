<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<style>
	h2 {
		font-family: 'Jua', sans-serif;
	}
	
	#rred {
		color: red;
	}
	
	.btn-primary {
		margin-right: 10px;
		color: #fff;
		background-color: #337ab7;
		border-color: #2e6da4;
	}
	
	h1 {
		font-size: -webkit-xxx-large;
	}
	
	p {
		font-family: auto;
		font-size: x-large;
		margin-bottom: 34px;
	}
	
	.jumbotron2 {
		background-image:
			url(https://ak1.ostkcdn.com/img/mxc/122017_Plates_Plates_HERO.jpg?imwidth=1024&impolicy=medium);
		color: #fff;
		padding: 100px 25px;
		height: 500px;
		padding-top: 190px;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		position: relative;
	}
	
	.col-sm-12 {
		padding-right: 200px;
		padding-left: 200px;
		padding-bottom: 10px;
	}
	
	.jumbotron {
		background-color: gray;
		color: #fff;
		padding: 100px 25px;
	}
	
	.container-fluid {
		padding: 60px 50px;
	}
	
	.bg-grey {
		background-color: #f6f6f6;
	}
	
	}
	.logo {
		color: #f4511e;
		font-size: 200px;
	}
	
	.item h4 {
		font-size: 19px;
		line-height: 1.375em;
		font-weight: 400;
		font-style: italic;
		margin: 70px 0;
	}
	
	.item span {
		font-style: normal;
	}
	
	.navbar {
		margin-bottom: 0;
		background-color: white;
		z-index: 9999;
		border: 0;
		font-size: 12px !important;
		line-height: 1.42857143 !important;
		letter-spacing: 4px;
		border-radius: 0;
		height: 90px;
	}
	
	.navbar li span {
		padding: 10px;
	}
	
	.navbar li sapn, .navbar .navbar-brand {
		color: black !important;
	}
	
	.navbar-nav li span:hover, .navbar-nav li.active span{
		color: #f4511e !important;
		background-color: #fff !important;
	}
	
	.navbar-default .navbar-toggle {
		border-color: transparent;
		color: #fff !important;
	}
	
	@media screen and (max-width: 768px) {
		.col-sm-4 {
			text-align: center;
			margin: 25px 0;
		}
	}
	
	.btn-danger2 {
		color: #fff;
		background-color: rgba(0, 143, 204, 0.3);
		border-color: #fff;
	}
	
	#navtop {
		margin-bottom: 0;
		background-color: black;
		z-index: 9999;
		border: 0;
		font-size: 12px !important;
		line-height: 1.42857143 !important;
		letter-spacing: 4px;
		border-radius: 0;
		height: 90px;
	}
	
	.col-sm-12 {
		padding-right: 200px;
		padding-left: 200px;
	}
	
	.search-gray {
		background-color: rgba(0, 143, 204, 0.03);
		height: 270px;
		margin-bottom: 10px;
		border: solid 15px white;
	}
	
	.prdtimg2 {
		padding-left: 20px;
		width: 80%;
		height: 80%;
		width: 80%;
		padding-top: 31px;
	}
	
	.searchimg {
		padding-top: 30px;
	}
	
	#myNavbar2 {
		height: 100px;
	}
	
	a:link {text-decoration:none; color:#646464;}
	a:visited {text-decoration:none; color:#646464;}
	a:active {text-decoration:none; color:#646464;}
	</style>
	
	<!-- 로그인 style css -->
	<style type="text/css">
	body {
		font-family: 'Varela Round', sans-serif;
	}
	
	.modal-login {
		width: 350px;
	}
	
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	
	.modal-content {
		margin-top: 250px;
	}
	
	.modal-login .modal-header {
		border-bottom: none;
		position: relative;
		justify-content: center;
	}
	
	.modal-login .close {
		position: absolute;
		top: -10px;
		right: -10px;
	}
	
	.modal-login h4 {
		color: #636363;
		text-align: center;
		font-size: 26px;
		margin-top: 0;
	}
	
	.modal-login .modal-content {
		color: #999;
		border-radius: 1px;
		margin-bottom: 15px;
		background: #fff;
		border: 1px solid #f3f3f3;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		padding: 25px;
	}
	
	.modal-login .form-group {
		margin-bottom: 20px;
	}
	
	.modal-login label {
		font-weight: normal;
		font-size: 13px;
	}
	
	.modal-login .form-control {
		min-height: 38px;
		padding-left: 5px;
		box-shadow: none !important;
		border-width: 0 0 1px 0;
		border-radius: 0;
	}
	
	.modal-login .form-control:focus {
		border-color: #ccc;
	}
	
	.modal-login .input-group-addon {
		max-width: 42px;
		text-align: center;
		background: none;
		border-width: 0 0 1px 0;
		padding-left: 5px;
		border-radius: 0;
	}
	
	.modal-login .btn {
		font-size: 16px;
		font-weight: bold;
		background: #19aa8d;
		border-radius: 3px;
		border: none;
		min-width: 140px;
		outline: none !important;
	}
	
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #179b81;
	}
	
	.modal-login .hint-text {
		text-align: center;
		padding-top: 5px;
		font-size: 13px;
	}
	
	.modal-login .modal-footer {
		color: #999;
		border-color: #dee4e7;
		text-align: center;
		margin: 0 -25px -25px;
		font-size: 13px;
		justify-content: center;
	}
	
	.modal-login a {
		color: #fff;
		text-decoration: underline;
	}
	
	.modal-login a:hover {
		text-decoration: none;
	}
	
	.modal-login a {
		color: #19aa8d;
		text-decoration: none;
	}
	
	.modal-login a:hover {
		text-decoration: underline;
	}
	
	.modal-login .fa {
		font-size: 21px;
	}
	
	.trigger-btn {
		display: inline-block;
	}
	</style>
	
	<!-- hover -->
	<style>
	.container {
		position: relative;
		/* width: 50%; */
		    margin: auto;
	}
	
	.image {
		display: block;
	}
	
	.prdtimg {
		width: -webkit-fill-available;
		height: auto;
		padding-top: 50px;
	}
	
	.overlay {
		position: absolute;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		height: 30%;
		width: 100%;
		opacity: 0;
		transition: .5s ease;
		background-color: #a9d7e4;
		margin-top: 179px;
	}
	
	/* .container:hover .overlay {
		opacity: 0.5;
	} */
	
	.text {
		color: black;
		font-size: 20px;
		position: absolute;
		top: 50%;
		left: 50%;
		/* -webkit-transform: translate(-50%, -50%); */
		-ms-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
		text-align: center;
		width: -webkit-fill-available;
		opacity: 1;
		font-family: 'Do Hyeon', sans-serif;
	}
	</style>
</head>
	
<body>
<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="/safefood/login" method="post">
						<input type="hidden" name="action" value="login">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" name="inputEmail" id="email"
									placeholder="Username" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" name="inputPassword" id="password"
									placeholder="Password" required="required">
							</div>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block btn-lg" id="loginBtn">로그인</button>
						</div>
						<p class="hint-text">
							<a href="/safefood/findPassword.jsp">비밀번호 찾기</a>
						</p>
					</form>
				</div>
				<div class="modal-footer">
					회원가입을 해보세요 <a href="/safefood/register.jsp">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/safefood/food/food"> <img
					src="http://edu.ssafy.com/asset/images/header-logo.jpg">
				</a>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar2">
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${ empty sessionScope.account}">

						<li><a href="#myModal" class="trigger-btn"
							data-toggle="modal">Login</a></li>
						<li><a href="/safefood/register.jsp">Sign Up</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.account}">
						<li><a href="/safefood/login?action=logout">Logout</a></li>
						<li><a href="/safefood/session/UserInfo.jsp">Mypage</a></li>
					</c:if>

				</ul>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar"
				style="margin-top: 10px;">
				<ul class="nav navbar-nav navbar-right">

					<li><span>공지사항</span></li>
					<li><span><a id="menu" href='/safefood/food/food?action=foodlist'>상품정보</a></span></li>
					<li><span>베스트 섭취 정보</span></li>
					<li><span><a id="menu" href='/safefood/food/food?val=mytakeninfo'>내 섭취 정보</a></span></li>
					<li><span>예상 섭취 정보</span></li>

				</ul>
			</div>
		</div>
	</nav>


</body>
<script>
$("#loginBtn").click(function (e) {
    e.preventDefault();
    $.ajax({
        type: "post",
        url: "/safefood/login",
        data: {
			action : "login" ,
			inputEmail : $("#inputEmail").val(),
			inputPassword : $("#inputPassword").val()
		},
        success: function (resText) {
            if(resText=="true")
            {
                alert("로그인 되었습니다.");
                $(location).attr('href', '/safefood/food/food');
            }
            else
            {
                alert("아이디와 비밀번호를 확인하세요.");
            }
        },
        error: function () {
            alert("ERROR 발생");
        }
    });
});
</script>