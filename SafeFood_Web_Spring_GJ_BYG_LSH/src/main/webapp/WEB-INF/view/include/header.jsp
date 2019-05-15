<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://unpkg.com/vue"></script>
	
	<!-- static CSS-->
	<c:url value="/static/css/mainCSS.css" var="mainCSS"/>
	<link rel="stylesheet" href="${mainCSS }">
	
	<!-- local CSS -->
	<style>
		body {font-family: 'Varela Round', sans-serif;}
		h2 {font-family: 'Jua', sans-serif;}
		h1 {font-size: -webkit-xxx-large;}
		p {
			font-family: auto;
			font-size: x-large;
			margin-bottom: 34px;
		}
	
		a:link {text-decoration:none; color:#646464;}
		a:visited {text-decoration:none; color:#646464;}
		a:active {text-decoration:none; color:#646464;}
	</style>
</head>
	
<body>
	<!-- 로그인 모달 페이지(jsp) -->
	<jsp:include page="/WEB-INF/view/include/loginModal.jsp"/>
	
	<!-- 메인 네비게이션 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<!-- 메인 로고 -->
				<c:url value="/main" var="main"/>
				<a class="navbar-brand" href="${main }"> 
					<img src="http://edu.ssafy.com/asset/images/header-logo.jpg">
				</a>
			</div>
			
			<!-- 로그인 정보 링크 -->
			<div class="collapse navbar-collapse" id="myNavbar2">
				<ul class="nav navbar-nav navbar-right">
					<!-- 로그인X: 로그인, 가입 -->
					<c:if test="${ empty loginUser}">
						<c:url value="/register" var="register"/>
						<!-- 링크를 누르면 모달페이지 연결 -->
						<li><a href="#myModal" class="trigger-btn" data-toggle="modal">Login</a></li>
						<li><a href="${register }">Sign Up</a></li>
					</c:if>
					<!-- 로그인O: 로그아웃, 마이페이지 -->
					<c:if test="${not empty loginUser}">
						<c:url value="/session/logout" var="logout"/>
						<c:url value="/session/userInfo" var="userInfo"/>
						<li><a href="${logout }">Logout</a></li>
						<li><a href="${userInfo }">MyPage</a></li>
					</c:if>
				</ul>
			</div>
			
			<!-- 페이지 링크 -->
			<div class="collapse navbar-collapse" id="myNavbar"
				style="margin-top: 10px;">
				<ul class="nav navbar-nav navbar-right">

					<li>
						<span>
							<c:url value="/notice" var="notieUrl"></c:url>
							<a id="menu" href='${notieUrl }'>공지사항</a>
						</span>
					</li>
					<li>
						<span>
							<c:url value="/table" var="tableUrl"></c:url>
							<a id="menu" href='${tableUrl}'>상품정보</a>
						</span>
					</li>
					<li>
						<span>
							<c:url value="/session/myBestFoodInfo" var="bestFoodUrl"></c:url>
							<a id="menu" href='${bestFoodUrl }'>베스트 섭취 정보</a>
						</span>
					</li>
					<li>
						<span>
							<c:url value="/session/myTakenInfo" var="myTakenInfo"/>
							<a id="menu" href='${myTakenInfo }'>내 섭취 정보</a>
						</span>
					</li>
					<li><span>예상 섭취 정보</span></li>
				</ul>
			</div>
		</div>
	</nav>
</body>