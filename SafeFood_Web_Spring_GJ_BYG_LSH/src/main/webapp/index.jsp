<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<title>안전먹거리</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">

		<!-- 메인 css -->
		<style>
		h2 {
			font-family: 'Jua', sans-serif;
		}
		
		#rred {
			font-size: 20px;
			color: red;
			font-family: 'Jua', sans-serif;
		}
		
		.btn-primary {
			margin-right: 10px;
			color: #fff;
			background-color: #337ab7;
			border-color: #2e6da4;
		}
		
		h1 {
			font-size: -webkit-xxx-large;
			font-family: cursive;
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
		
		.navbar-nav li span:hover, .navbar-nav li.active span {
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
		
		a:link {
			text-decoration: none;
			color: #646464;
		}
		
		a:visited {
			text-decoration: none;
			color: #646464;
		}
		
		a:active {
			text-decoration: none;
			color: #646464;
		}
		
		a:hover {
			text-decoration: none;
			color: #646464;
		}
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
			width: 50%;
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
		
		.container:hover .overlay {
			opacity: 0.5;
		}
		
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
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	
		<div class="jumbotron2 text-center">
			<h1>WHAT WE PROVIDE</h1>
			<p>건강한 삶을 위한 먹거리 프로젝트</p>
			<form class="form-inline" id="sendForm" method="post"
				action="food?foodlist">
				<div class="input-group">
					<div class="input-group-btn">
						<div id="search-option" class="btn btn-danger2">검색조건</div>
					</div>
					<select class="form-control" id="sorted" name="sort">
						<option value="productname" selected="selected">상품명</option>
						<option value="maker">제조사</option>
						<option value="material">성분명</option>
					</select>
				</div>
	
				<div class="input-group">
	
					<input id="search-text" type="text" class="form-control" size="50"
						placeholder="검색어를 입력하세요." required name="search_text">
					<div class="input-group-btn">
						<button id="search" class="btn btn-danger2">검색</button>
					</div>
				</div>
			</form>
		</div>
	
		<!-- 상품정보 -->
		<div class="container-fluid">
			<div class="col-sm-12">
				<h2>상품정보</h2>
			</div>
			<div id="product">
				<c:if test="${not empty foods}">
					<c:if test="${empty foodlist}">
						<c:forEach var="food" items="${foods}">
							<div class='col-sm-12'>
								<div class='col-sm-4'>
									<div class='container'>
										<a href='food?val=${food.code }'><img class='prdtimg image'
											alt='Avatar' src='../${food.img }'></a>
										<div class='overlay align-bottom'>
											<div class='text'>${food.name }<br>${food.maker }</div>
										</div>
									</div>
								</div>
								<div class='col-sm-8'>
									<h2>${food.name }</h2>
	
									<c:if test="${not empty sessionScope.account.email}">
										<c:set var="loop_flag" value="false" />
										<c:set var="mater" value="${food.material}" />
										<c:forTokens items="${sessionScope.account.allergy }"
											delims="," var="mySplit">
											<c:if test="${not loop_flag }">
												<c:if test="${fn:contains(mater, mySplit)}">
													<p id='rred'>알러지 주의</p>
													<c:set var="loop_flag" value="true" />
												</c:if>
											</c:if>
										</c:forTokens>
									</c:if>
									<hr>
									<span>${food.material }</span><br> <br>
								</div>
							</div>
						</c:forEach>
					</c:if>
	
					<c:if test="${not empty foodlist}">
						<c:forEach var="food" items="${foods}">
							<div class='col-sm-6 search-gray'>
								<div class='col-sm-4 search-img'>
									<a href='food?val=${food.code }'><img class='prdtimg2'
										src='../${food.img}'></a>
								</div>
								<div class='col-sm-8 search-text'>
									<h2>${food.name }</h2>
									<c:choose>
										<c:when test="${fn:length(food.material) gt 200}">
											<span>${fn:substring(food.material, 0, 200)}...</span>
											<br>
											<br>
										</c:when>
										<c:otherwise>
											<span>${food.material }</span>
											<br>
											<br>
										</c:otherwise>
									</c:choose>
									<c:set var="mater" value="${food.material}" />
									<c:set var="loop_flag" value="false" />
									<c:forTokens items="${sessionScope.account.allergy }" delims=","
										var="mySplit">
										<c:if test="${not loop_flag }">
											<c:if test="${fn:contains(mater, mySplit)}">
												<div class='btn btn-danger'>
													<span class='glyphicon glyphicon-remove'
														aria-hidden='true'></span>알러지 주의
												</div>
												<c:set var="loop_flag" value="true" />
											</c:if>
										</c:if>
									</c:forTokens>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</c:if>
			</div>
		</div>
	
		<!-- Footer -->
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</body>

</html>