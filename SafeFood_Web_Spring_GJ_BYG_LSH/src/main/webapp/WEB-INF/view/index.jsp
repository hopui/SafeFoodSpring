<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
	<head>
		<title>안전먹거리</title>

		<!-- jQuery & Bootstrap -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

		<!-- WebFont -->
		<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">

		
		<!-- local css -->
		<style>
			.container:hover .overlay {
				opacity: 0.5;
			}
		
			body {font-family: 'Varela Round', sans-serif;}
			h2 {font-family: 'Jua', sans-serif;}	
			h1 {
				font-size: -webkit-xxx-large;
				font-family: cursive;
			}
			p {
				font-family: auto;
				font-size: x-large;
				margin-bottom: 34px;
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
			
			.container {
			position: relative;
			width: 50%;
			}
		</style>
	</head>
	<body>
		<!-- 헤더 -->
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	
		<!-- 검색창 -->
		<div class="jumbotron2 text-center">
			<h1>WHAT WE PROVIDE</h1>
			<p>건강한 삶을 위한 먹거리 프로젝트</p>
			
			<!-- ※form action URL 수정필요※ -->
			<c:url value="/search" var="searchUrl"></c:url>
			<form class="form-inline" id="sendForm" method="post" action="${searchUrl }">
				<div class="input-group">
					<div class="input-group-btn">
						<div id="search-option" class="btn btn-danger2">검색조건</div>
					</div>
					<!-- 검색조건 -->
					<select class="form-control" id="sorted" name="sort">
						<option value="productname" selected="selected">상품명</option>
						<option value="maker">제조사</option>
						<option value="material">성분명</option>
					</select>
				</div>
				
				<!-- 검색바 -->
				<div class="input-group">
					<input type="text" name="search_text" id="search-text" class="form-control" size="50"
						placeholder="검색어를 입력하세요." required>
					<div class="input-group-btn">
						<button id="search" class="btn btn-danger2">검색</button>
					</div>
				</div>
			</form>
		</div>
	
		<!-- 상품정보 출력 -->
		<div class="container-fluid">
			<div class="col-sm-12">
				<h2>상품정보</h2>
			</div>
			<div id="product">
				<!-- 식품 정보들을 받아왔을 때 비어있지 않을 경우 -->
				<c:if test="${not empty foods}">
					<c:if test="${empty foodlist}">
						<c:forEach var="food" items="${foods}">
							<div class='col-sm-12'>
								<div class='col-sm-4'>
									<div class = 'container'>
										<c:url value="/detail/${food.code }" var="detailUrl"></c:url>
										<a href='${detailUrl}'>
											<img class='prdtimg image' alt='Avatar' src='static/${food.image }'>
										</a>
										<div class='overlay align-bottom'>
											<div class='text'>${food.name }<br>${food.maker }</div>
										</div>
									</div>
								</div>
								<div class='col-sm-8'>
									<h2>${food.name }</h2>
	
									 <c:if test="${not empty loginUser.email}">
										<c:set var="loop_flag" value="false" />
										<c:set var="mater" value="${food.material}" />
										<c:forTokens items="${loginUser.allergy }"
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
	
					<!-- 상품정보 출력 -->
					<c:if test="${not empty foodlist}">
						<c:forEach var="food" items="${foods}">
							<div class='col-sm-6 search-gray'>
								<div class='col-sm-4 search-img'>
								<c:url value="/detail/${food.code }" var="detailUrl"></c:url>
									<a href='${detailUrl}'>
									<c:url value="static/${food.image }" var="foodImg"/>
									<img class='prdtimg2' src='${foodImg }'></a>
								</div>
								
								<!-- 개별 정보 출력 -->
								<div class='col-sm-8 search-text'>
									<h2>${food.name }</h2>
									<!-- 재료정보는 200자 내로 출력 -->
									<c:choose>
										<c:when test="${fn:length(food.material) gt 200}">
											<span>${fn:substring(food.material, 0, 200)}...</span>
											<br><br>
										</c:when>
										<c:otherwise>
											<span>${food.material }</span>
											<br><br>
										</c:otherwise>
									</c:choose>
									
									<!-- 알러지 표시 출력 -->
									<c:set var="mater" value="${food.material}" />
									<c:set var="loop_flag" value="false" />
									<c:forTokens items="${loginUser.allergy }" delims="," var="mySplit">
										<c:if test="${not loop_flag }">
											<c:if test="${fn:contains(mater, mySplit)}">
												<div class='btn btn-danger'>
													<span class='glyphicon glyphicon-remove' aria-hidden='true'>
													</span>알러지 주의
												</div>
												<c:set var="loop_flag" value="true" />
											</c:if>
										</c:if>
									</c:forTokens>
								</div> <!-- 개별 정보 출력 끝 -->
								
							</div>
						</c:forEach>
					</c:if>
				</c:if>
				<c:if test="${empty foods}">
					<div style='text-align: center;'>식품정보가 없습니다.</div>
				</c:if>
			</div> 
		</div> <!-- 상품정보 출력 끝 -->
	
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</body>
	<script>
		let alarm = "${alarm }";
		if(alarm) {
			alert(alarm);
		}	
	</script>
</html>