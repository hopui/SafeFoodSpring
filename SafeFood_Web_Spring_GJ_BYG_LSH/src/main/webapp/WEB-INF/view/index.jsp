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

#pagebar {
	
}
</style>
</head>
<script src="https://unpkg.com/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- 검색창 -->
	<div class="jumbotron2 text-center">
		<h1>WHAT WE PROVIDE</h1>
		<p>건강한 삶을 위한 먹거리 프로젝트</p>

		<!-- ※form action URL 수정필요※ -->
		<c:url value="/search" var="searchUrl"></c:url>
		<form class="form-inline" id="sendForm" method="post"
			action="${searchUrl }">
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
				<input type="text" name="search_text" id="search-text"
					class="form-control" size="50" placeholder="검색어를 입력하세요." required>
				<div class="input-group-btn">
					<button id="search" class="btn btn-danger2">검색</button>
				</div>
			</div>
		</form>
	</div>

	<!-- 상품정보 출력 -->
	<div class="container-fluid" id="app">
		<div class="col-sm-12">
			<h2>상품정보</h2>
		</div>
		<div id="product">

<%-- 			<table class="nutrition-result basic" oncontextmenu="return false;"
				ondragstart="return false;">
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
					<tr>
						<td rowspan="2">4907</td>
						<th scope="row">곡류 및 그 제품</th>
						<td>100</td>
						<td></td>
						<td>67.8</td>
						<td>10.1</td>
						<td>3.7</td>
					</tr>
					<tr>
						<th><a href="#"> 고량미,고량미, 알곡 </a></th>
						<td>0</td>
						<td>N/A</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
				</tbody>
			</table> --%>
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
									<button type='button' class='btn btn-primary'>
										<span class='glyphicon glyphicon-shopping-cart' aria-hidden='true'></span>
											찜
									</button>
									<img class="mark" alt="#" src="static/img/인증마크.jpg">
								</div>
							</div>
						</template>  

			<div v-if="foods.length == 0 " style='text-align: center;'>식품정보가
				없습니다.</div>

		<!-- 페이지 넘버 -->
			<div v-if="foods.length > 0" align="center">
				<button @click="nextPage(-1)">←</button>
	

				<template
					v-for="i in pageSelector.slice(nowPages*10, nowPages*10+10)">
				<a href="#" @click="loadData(i)" style="margin: 0 10px;">{{i}}</a> </template>

				<button @click="nextPage(1)">→</button>
	
			</div> 
		</div>
	</div>
	<!-- 상품정보 출력 끝 -->

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
</body>
<script>
		let alarm = "${alarm }";
		if(alarm) {
			alert(alarm);
		}	
		
		let allergy = "${loginUser.allergy}";
		
	 	let vi = new Vue({
			el:"#app",
			data(){
				return {
					numOfRows:0,
					foods:[],
					pageNo:0,
					totalCount:0,
					pageSelector:[],
					nowPages:0
				}
			},
			mounted(){
				this.loadData(1);
			},
			methods:{
				loadData(num){
					var userURL = "http://localhost:8080/SafeFood_Web_Spring_GJ_BYG_LSH";				
					var url = userURL + "/AjaxRequest.jsp?getUrl=";
					let apiurl = 'http://apis.data.go.kr/B553748/CertImgListService/getCertImgListService?ServiceKey=';
					let key = 'JHiCkjVmT8kUFVm183Ggm3ln1sDuay3V2EWzhmda%2B4773P90DoYKR7iFlXsTGiD6EJlntiX9UsmMtGpOjVTxIA%3D%3D&returnType=json';
					let page="&pageNo="+num;
					url += encodeURIComponent(apiurl+key+page);
					
					axios
					.get(url)
					.then(response => {
										this.foods = response.data.list;
										this.numOfRows = response.data.numOfRows;
										this.pageNo = response.data.pageNo;
										this.totalCount = response.data.totalCount;	
										
										for(let i=1; i<Math.round(this.totalCount/this.numOfRows); i++)
											this.pageSelector.push(i);
					})
					.catch(error =>{
						console.log(error)
						this.errored= true;
					})
					//함수에서의 this는 window, arrow 함수에서는 vue
					.finally(() => {this.loading = false})
				},
				checkAller(aller){
					if(allergy.length > 0){
						let users = allergy.split(",");
						for(let al of users){
							if(aller.indexOf(al) > -1){
								return true;	
							}
						}
					}
					return false;
				},
				nextPage(num){
					if(this.nowPages+num >-1 &&
							this.nowPages+num <=Math.round(this.totalCount/this.numOfRows)){
						this.nowPages+=num
					}
				}
			}
		}) 
		
		/* let vi = new Vue({
			el:"#app",
			data(){
				return {
					foods:[],
				}
			},
			mounted(){
				//this.loadData(1,1000);
			},
			methods:{
				loadData(first, end){
					var userURL = "http://localhost:8080/SafeFood_Web_Spring_GJ_BYG_LSH";				
					var url = userURL + "/AjaxRequest.jsp?getUrl=";
					let apiurl = 'http://openapi.foodsafetykorea.go.kr/api/246deb010b9d41149b25/I0750/json';
					let page="/"+first+"/"+end;
					url += encodeURIComponent(apiurl+page);
					
					axios
					.get(url)
					.then(response => {
										this.foods = response.data.I0750.row;
										
							
					})
					.catch(error =>{
						console.log(error)
						this.errored= true;
					})
					//함수에서의 this는 window, arrow 함수에서는 vue
					.finally(() => {this.loading = false})
				}
			}
		}) */
		
	</script>
</html>