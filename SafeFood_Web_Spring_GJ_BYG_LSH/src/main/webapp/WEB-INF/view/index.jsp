<%@page import="com.ssafy.service.FoodService"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>안전먹거리</title>

<!-- jQuery & Bootstrap -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- WebFont -->
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua"
	rel="stylesheet">


<!-- local css -->
<style>
.container:hover .overlay {
	opacity: 0.5;
}

body {
	font-family: 'Varela Round', sans-serif;
}

h2 {
	font-family: 'Jua', sans-serif;
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

#foodtable {
	align-self: center;
	border: 1px solid gray;
	align-content: center;
}

th {
	border-bottom: 1px solid gray;
	padding: 10px 10px;
	font-weight: bold;
	background: #eeeeee;
}

td {
	border-bottom: 1px solid gray;
	padding: 10px 10px;
}

#lastitem {
	border-bottom: 2px solid gray;
}
</style>
</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />
	<div id="app">
		<!-- 검색창 -->
		<div class="jumbotron2 text-center">
			<h1>WHAT WE PROVIDE</h1>
			<p>건강한 삶을 위한 먹거리 프로젝트</p>
		</div>

		<!-- 상품정보 출력 -->
		<div class="container-fluid">
			<div class="col-sm-12">
				<h2>상품정보</h2>
			</div>
			<div id="product">
				<!-- ※form action URL 수정필요※ -->
				<c:url value="/search" var="searchUrl"></c:url>
				<form class="form-inline" method="get"
					action="${searchUrl }">
					<input type="hidden" name="kind" value="${comp }">
					<div align="center" class="col-sm-12"
						style="border-bottom: 1px solid #eeeeee; padding-bottom: 30px">
						<div class="input-group" class="col-sm-4">
							<div class="input-group-btn">
								<div id="search-option" class="btn btn-danger2">검색조건</div>
							</div>
							<!-- 검색조건 -->
							<select class="form-control" name="sort">
								<option v-for="option in getOptions()" :value="option.name">{{option.value}}</option>
							</select>
						</div>

						<!-- 검색바 -->
						<div class="input-group" class="col-sm-8">
							<input type="text" name="search_text" id="search-text"
								class="form-control" placeholder="검색어를 입력하세요." required>
							<div class="input-group-btn">
								<button id="search" class="btn btn-danger2">검색</button>
							</div>
						</div>
					</div>
				</form>
				<component v-bind:is="currentview"></component>

			</div>
		</div>
	</div>
	<!-- 상품정보 출력 끝 -->
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	<script type="text/x-template" id="main-temp">
<div>
	<template v-for="food in foods">
		<div class='col-sm-12 foodbox'>
			<div class='col-sm-4'>
				<div class = 'container'>
						<c:url value="/detail/haccp/" var="detailUrl"></c:url>
						<a v-bind:href='"${detailUrl }"+food.prdlstReportNo'>
							<img class='prdtimg image' alt='Avatar' :src='food.imgurl2'>
					</a>
						<div class='overlay align-bottom'>
							<div class='text'>{{food.prdlstNm}}<br>{{food.productGb}}</div>
						</div>
					</div>
				</div>
				<div class='col-sm-8 content'>
					<h2>{{food.prdlstNm}}</h2>

					<p v-if="checkAller(food.allergy)" id='rred'>알러지 주의</p>
				 
					<hr>
					<span v-if="food.rawmtrl.length< 200">{{food.rawmtrl}}</span>
					<span v-else v-html='food.rawmtrl.substring(0,200)+"..."'></span>
					<br> 
					<span>{{food.manufacture}}</span>
					<br>
					<c:if test="${not empty loginUser}">
					<button type='button' class='btn btn-primary'>
						<span class='glyphicon glyphicon-shopping-cart' aria-hidden='true'></span>
							찜
					</button>
					</c:if>
					<img class="mark" alt="#" src="static/img/인증마크.jpg">
				</div>
			</div>
		</template> 

		<div v-if="foods.length == 0 " style='text-align: center;'>식품정보가
				없습니다.</div>

		<!-- 페이지 넘버 -->
			 <div v-if="foods.length > 0" align="center" style="margin-top: 10px;">
				<button @click="nextPage(-1)">←</button>
				<template
					v-for="i in pageSelector.slice(nowPages*10, nowPages*10+10)">
				<a href="#" @click="loadData(i)" style="margin: 0 10px;">{{i}}</a> </template>

				<button @click="nextPage(1)">→</button>
	
			</div> 
</div> 
</script>
	<script type="text/x-template" id="table-temp">
<div>
	<table id="foodtable" align="center">
				<caption>식품 간편검색</caption>
				<colgroup>
					<col style="width: 5%">
					<col style="width: 35%">
					<col style="width: 12%">
					<col style="width: 12%">
					<col style="width: 12%">
					<col style="width: 12%">
					<col style="width: 12%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" rowspan="2">번호</th>
						<th scope="col">식품군</th>
						<th scope="col">1회제공량<br> (g)
						</th>
						<th scope="col">열량<br> (kcal)
						</th>
						<th scope="col">탄수화물<br> (g)
						</th>
						<th scope="col">단백질<br> (g)
						</th>
						<th scope="col">지방<br> (g)
						</th>
					</tr>
					<tr>
						<th scope="col">식품명</th>
						<th scope="col">당류<br> (g)
						</th>
						<th scope="col">나트륨<br> (mg)
						</th>
						<th scope="col">콜레스테롤<br> (mg)
						</th>
						<th scope="col">포화지방산<br> (g)
						</th>
						<th scope="col">트랜스지방산<br> (g)
						</th>
					</tr>
				</thead>
				<tbody>
				<template v-for="food in foodSection">
					<tr>
						<td rowspan="2">{{food.code}}</td>
						<th scope="row">{{food.foodGroup}}</th>
						<td>{{food.supportpereat}}</td>
						<td>{{food.calory}}</td>
						<td>{{food.carbo}}</td>
						<td>{{food.protein}}</td>
						<td>{{food.fat}}</td>
					</tr>
					<tr id="lastitem">
						<c:url value="detail/" var="detailUrl"/>
						<td><a :href="'${detailUrl}'+food.code">{{food.name}} </a></td>
						<td>{{food.sugar}}</td>
						<td>{{food.natrium}}</td>
						<td>{{food.chole}}</td>
						<td>{{food.fattyacid}}</td>
						<td>{{food.transfat}}</td>
					</tr>
					</template>
				</tbody>
			</table> 

		<div v-if="foodSection.length == 0 " style='text-align: center;'>식품정보가
				없습니다.</div>

		<!-- 페이지 넘버 -->
			 <div v-if="foodSection.length > 0" align="center" style="margin-top: 10px;">
				<button @click="nextPage(-1)">←</button>
				<template
					v-for="i in pageSelector.slice(nowPages*10, nowPages*10+10)">
				<a href="#" @click="getPage(i)" style="margin: 0 10px;">{{i}}</a> </template>

				<button @click="nextPage(1)">→</button>
	
			</div> 
</div>
</script>
</body>
<!-- 인덱스 전용 js -->
<c:url value="/static/script/index.js" var="indexJSurl" />
<script type="text/javascript">
	let alarm = "${alarm }";
	if (alarm) {
		alert(alarm);
	}

	let allergy = "${loginUser.allergy}";
	let current = "${comp}";
	let methodurl = "${methodurl}";
	let sort ="${sort}";
	let searchtext = "${search_text}";
</script>
<script src="${indexJSurl }">
	
</script>
</html>