<%@page import="com.ssafy.model.dto.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제 품 상세 정보 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.text-center {
	padding-top: 150px;
}

.imgs {
	padding-top: 50px;
	width: 250px;
}

.titles {
	width: 200px;
	font-family: 'Jua', sans-serif;
}

td {
	
}

h1 {
	font-family: 'Do Hyeon', sans-serif;
	font-size: -webkit-xxx-large;
}

.container {
	margin-right: auto;
	margin-left: auto;
	position: relative;
	width: 970px;
}


#prdt {
	width: 100px;
	height: 50%;
}

#ddd {
	padding-top: 10px;
	padding-bottom: 80px;
}
body {
	font-family: "Jua", Arial;
	background: #ffffff;
}
</style>



</head>
<body>
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<div class="text-center">
		<h1>제품 정보</h1>
	</div>
	<div id="foodapp">
		<div class="text-center" id="ddd">
			<c:url value="/static/img/인증마크.jpg" var="cartImg" />
			<img src="${cartImg }" id="prdt">
		</div>
		<div class="container">
			<div class="col-sm-4" id="main_img">
				<img class='imgs' :src="food.imgurl1">
			</div>
			<div class="col-sm-8">
				<table class="table">
					<tr>
						<td class="titles text-center">축산/식품구분</td>
						<td id="name">{{food.productGb}}</td>
					</tr>
					<tr>
						<td class="titles text-center">제품명</td>
						<td id="name">{{food.prdlstNm}}</td>
					</tr>
					<tr>
						<td class="titles text-center">원재료</td>
						<td id="name">{{food.rawmtrl}}</td>
					</tr>
					<tr>
						<td class="titles text-center">알레르기유발물질</td>
						<td id="name">{{food.allergy}}</td>
					</tr>
					<tr>
						<td class="titles text-center">영양성분</td>
						<td id="name">{{food.nutrient}}</td>
					</tr>
					<tr>
						<td class="titles text-center">바코드</td>
						<td id="name">{{food.barcode}}</td>
					</tr>
					<tr>
						<td class="titles text-center">유형명</td>
						<td id="name">{{food.prdkind}}</td>
					</tr>
					<tr>
						<td class="titles text-center">유형의상태</td>
						<td id="name">{{food.prdkindstate}}</td>
					</tr>
					<tr>
						<td class="titles text-center">제조원</td>
						<td id="name">{{food.manufacture}}</td>
					</tr>
					<tr>
						<td class="titles text-center">판매원</td>
						<td id="name">{{food.seller}}</td>
					</tr>
					<tr>
						<td class="titles text-center">용량</td>
						<td id="name">{{food.capacity}}</td>
					</tr>
				</table>
				<c:url value="/session/modify" var="modilUrl"></c:url>
				<form id="eat_form" method="post" action="${modilUrl}">
					<c:if test="${not empty loginUser}">
						<label>Quantity</label>
						<input type="number" class="form-control" name='quantity'>
						<br>
						<input hidden='true' name='eat' value='${food.code }'>
						<input hidden='true' name='haccp' value='1'>
						<button class='btn btn-primary' id="button_insert">
							<span id="insert" class='glyphicon glyphicon-plus'
								aria-hidden='true'></span>추가
						</button>
						<button type='button' class='btn btn-primary'>
							<span class='glyphicon glyphicon-shopping-cart'
								aria-hidden='true'></span>찜
						</button>
					</c:if>
				</form>
			</div>
		</div>
		<br>
	</div>
	<br>
	<br>
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />


</body>
<script>
	let alarm = "${alarm }";
	if (alarm) {
		alert(alarm);
	}

	let haccp = "${haccp}";
	
	let vi = new Vue({
		el:"#foodapp",
		data(){
			return {
				food:{}
			}
		},
		mounted(){
			this.loadData(haccp);
		},
		methods:{
			loadData(num){
				var userURL = "http://localhost:8080/SafeFood_Web_Spring_GJ_BYG_LSH";				
				var url = userURL + "/AjaxRequest.jsp?getUrl=";
				let apiurl = 'http://apis.data.go.kr/B553748/CertImgListService/getCertImgListService?ServiceKey=';
				let key = 'JHiCkjVmT8kUFVm183Ggm3ln1sDuay3V2EWzhmda%2B4773P90DoYKR7iFlXsTGiD6EJlntiX9UsmMtGpOjVTxIA%3D%3D&returnType=json';
				let page="&prdlstReportNo="+num;
				url += encodeURIComponent(apiurl+key+page);
				
				axios
				.get(url)
				.then(response => {
					this.food = response.data.list[0];
				})
				.catch(error =>{
					console.log(error)
					this.errored= true;
				})
				//함수에서의 this는 window, arrow 함수에서는 vue
				.finally(() => {this.loading = false})
			}
		}

	});
</script>

</html>
