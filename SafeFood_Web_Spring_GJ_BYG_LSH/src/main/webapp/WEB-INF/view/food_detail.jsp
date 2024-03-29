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
.appleimg{
width: 35px;
    border: 0;
    margin-top: 10px;
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
</style>
<!-- 그래프 -->
<style>
@
keyframes bake-pie {from { transform:rotate(0deg)translate3d(0, 0, 0);
	
}

}
body {
	font-family: "Jua", Arial;
	background: #ffffff;
}

main {
	width: 400px;
	margin: 30px auto;
}

section {
	margin-top: 30px;
}

.pieID {
	display: inline-block;
}

.pie {
	height: 200px;
	width: 200px;
	position: relative;
	margin: 0 30px 30px 0;
}

.pie::before {
	content: "";
	display: block;
	position: absolute;
	z-index: 1;
	width: 100px;
	height: 100px;
	background: #EEE;
	border-radius: 50%;
	top: 50px;
	left: 50px;
}

.pie::after {
	content: "";
	display: block;
	width: 120px;
	height: 2px;
	background: rgba(0, 0, 0, 0.1);
	border-radius: 50%;
	box-shadow: 0 0 3px 4px rgba(0, 0, 0, 0.1);
	margin: 220px auto;
}

.slice {
	position: absolute;
	width: 200px;
	height: 200px;
	clip: rect(0px, 200px, 200px, 100px);
	animation: bake-pie 1s;
}

.slice span {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	background-color: black;
	width: 200px;
	height: 200px;
	border-radius: 50%;
	clip: rect(0px, 200px, 200px, 100px);
}

.legend {
	list-style-type: none;
	padding: 0;
	margin: 0;
	background: #FFF;
	padding: 15px;
	font-size: 13px;
	box-shadow: 1px 1px 0 #DDD, 2px 2px 0 #BBB;
	width: 180px;
}

.legend li {
	height: 1.25em;
	margin-bottom: 0.7em;
	padding-left: 0.5em;
	border-left: 1.25em solid black;
}

.legend em {
	font-style: normal;
}

.legend span {
	float: right;
}

footer {
	position: fixed;
	bottom: 0;
	right: 0;
	font-size: 13px;
	background: #DDD;
	padding: 5px 10px;
	margin: 5px;
}

.ss {
	/* 	width:30px;
	padding-right: 30px; */
	
}

#graph {
	padding-top: 70px;
}

#prdt {
	width: 100px;
	height: 50%;
}

#ddd {
	padding-top: 10px;
	padding-bottom: 80px;
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
			<c:url value="/static/img/product.png" var="cartImg" />
			<img src="${cartImg }" id="prdt">
		</div>
		<div class="container row">
			<div>
				<table class="table">
					<tr>
						<td class="titles text-center">제품명</td>
						<td id="name">${food.name }</td>
					</tr>
					<tr>
						<td class="titles text-center">제조사</td>
						<td id="maker">${food.maker }</td>
					</tr>
					<tr>
						<td class="titles text-center">제품군</td>
						<td id="material">${food.foodGroup }</td>
					</tr>
					<tr>
						<!-- <td class="titles text-center">알레르기 성분</td>
					<td id="al">

					</td> -->
					</tr>
				</table>
					<c:if test="${not empty loginUser}">
				<c:url value="/session/modify" var="modilUrl"></c:url>
				<form id="eat_form" method="post" action="${modilUrl}" style="display: block;">
						<label>Quantity</label>
						<input type="number" class="form-control" name='quantity'>
						<br>
						<input hidden='true' name='name' value='${food.name }'> 
						<input hidden='true' name='code' value=${food.code }>
						<input hidden='true' name='haccp' value=0>
						<button class='btn btn-primary' id="button_insert">
							<span id="insert" class='glyphicon glyphicon-plus'
								aria-hidden='true'></span>추가
						</button>
						<button type='button' class="btn btn-primary" @click="likefood('i')">
						
							<span class='glyphicon glyphicon-shopping-cart'
								aria-hidden='true'></span>찜
						</button>
						<c:url value="/static/img/" var="likeImg" />
						<img class = "appleimg" :src="'${likeImg}'+image" alt="#">				
				</form>
			</c:if>
			</div>
		</div>
		<br>
		<hr>
		<br>
		<div class="container">
			<h3>영양 정보</h3>
			<div class="col-sm-6" id="graph">
				<div class="pieID pie"></div>


				<!--  도넛차트 -->
				<ul class="pieID legend">
					<li><em class="ss">탄수화물</em> <span class="tan"></span></li>
					<li><em class="ss">단백질</em> <span class="dan"></span></li>
					<li><em class="ss">지방</em> <span class="gi"></span></li>
					<li><em class="ss">당류</em> <span class="dang"></span></li>
					<li><em class="ss">나트륨</em> <span class="na"></span></li>
					<li><em class="ss">콜레스테론</em> <span class="col"></span></li>
					<li><em class="ss">포화 지방산</em> <span class="fat"></span></li>
					<li><em class="ss">트랜스지방</em> <span class="trans"></span></li>
				</ul>
			</div>
			<%
				long[] nutri = (long[]) session.getAttribute("nutri");
			%>
			
			<!--  도넛차트 옆 테이블 -->
			<div class="col-sm-6" id="detail">
				<table class="table text-center">
					<tr>
						<td>일일 제공량</td>
						<td></td>
						<td>
						<span class="daily"></span></td>
					</tr>
					<tr>
						<td>칼로리</td>
						<td>
						<%if(nutri !=null && nutri[0] > 1300) {%>
						<span style="color: red">과다섭취 주의</span>
						<% }%></td>
						<td>
						<span class="kcal"></span></td>
					</tr>
					<tr>
						<td>탄수화물</td>
						<td>
						<%if(nutri !=null && nutri[1] > 230) {%>
						<span style="color: red">과다섭취 주의</span>
						<% }%></td>
						<td>
						<span class="tan"></span></td>
					</tr>
					<tr>
						<td>단백질</td>
						<td>
						<%if(nutri !=null && nutri[2] > 27.5) {%>
						<span style="color: red">과다섭취 주의</span>
						<% }%></td>
						<td>
						<span class="dan"></span></td>
					</tr>
					<tr>
						<td>지방</td>
						<td>
						<%if(nutri !=null && nutri[3] > 800) {%>
						<span style="color: red">과다섭취 주의</span>
						<% }%>
						</td>
						<td>
						<span class="gi"></span></td>
					</tr>
					<tr>
						<td>당류</td>
						<td>
						<%if(nutri !=null && nutri[4] > 12.5) {%>
						<span style="color: red">과다섭취 주의</span>
						<% }%></td>
						<td>
						<span class="dang"></span></td>
					</tr>
					<tr>
						<td>나트륨</td>
						<td>
							<%if(nutri !=null && nutri[5] > 750) {%>
						<span style="color: red">과다섭취 주의</span>
							<% }%>
						</td>
						<td>
						<span class="na"></span></td>
					</tr>
					<tr>
						<td>콜레스테롤</td>
							<td></td>
						<td>
						<span class="col"></span></td>
					</tr>
					<tr>
						<td>포화 지방산</td>
							<td></td>
						<td>
						<span class="fat"></span></td>
					</tr>
					<tr>
						<td>트랜스지방</td>
							<td></td>
						<td>
						<span class="trans"></span></td>
					</tr>
				</table>
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
		
		let code= '${food.code}';
		let name= '${food.name}';
		let group= '${food.foodGroup}'; 
		let vi = new Vue({
			el:"#foodapp",
			data(){
				return {
					image:'apple_origin.png'
				}
			},
			mounted(){
				this.likefood('c');
			},
			methods:{
				likefood(func){
					axios
					.get("/SafeFood_Web_Spring_GJ_BYG_LSH/session/likefood/"
							+code+"/"
							+name+func+"/"+group)
							
					.then(response => {
							if(func ==='c'){
								if(response.data.result >0)
									this.image='apple_ate.png'; 
							}else{
								if(response.data.result >0)
									this.image='apple_ate.png';
								else
									this.image='apple_origin.png';
							}
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
		
		$(".daily").text('${food.supportpereat}');
		$(".kcal").text('${food.calory}');
		$(".tan").text('${food.carbo}');
		$(".dan").text('${food.protein}');
		$(".gi").text('${food.fat}');
		$(".dang").text('${food.sugar}');
		$(".na").text('${food.natrium}');
		$(".col").text('${food.chole}');
		$(".fat").text('${food.fattyacid}');
		$(".trans").text('${food.transfat}');

		createPie(".pieID.legend", ".pieID.pie");
		

		function sliceSize(dataNum, dataTotal) {
			return (dataNum / dataTotal) * 360;
		}
		function addSlice(sliceSize, pieElement, offset, sliceID, color) {
			$(pieElement).append(
					"<div class='slice "+sliceID+"'><span></span></div>");
			var offset = offset - 1;
			var sizeRotation = -179 + sliceSize;
			$("." + sliceID).css({
				"transform" : "rotate(" + offset + "deg) translate3d(0,0,0)"
			});
			$("." + sliceID + " span").css({
				"transform" : "rotate(" + sizeRotation + "deg) translate3d(0,0,0)",
				"background-color" : color
			});
		}
		function iterateSlices(sliceSize, pieElement, offset, dataCount,
				sliceCount, color) {
			var sliceID = "s" + dataCount + "-" + sliceCount;
			var maxSize = 179;
			if (sliceSize <= maxSize) {
				addSlice(sliceSize, pieElement, offset, sliceID, color);
			} else {
				addSlice(maxSize, pieElement, offset, sliceID, color);
				iterateSlices(sliceSize - maxSize, pieElement, offset + maxSize,
						dataCount, sliceCount + 1, color);
			}
		}
		function createPie(dataElement, pieElement) {
			var listData = [];
			$(dataElement + " span").each(function() {
				listData.push(Number($(this).html()));
			});
			var listTotal = 0;
			for (var i = 0; i < listData.length; i++) {
				listTotal += listData[i];
			}
			var offset = 0;
			var color = [ "cornflowerblue", "olivedrab", "orange", "tomato",
					"crimson", "purple", "turquoise", "forestgreen", "navy", "gray" ];
			for (var i = 0; i < listData.length; i++) {
				var size = sliceSize(listData[i], listTotal);
				iterateSlices(size, pieElement, offset, i, 0, color[i]);
				$(dataElement + " li:nth-child(" + (i + 1) + ")").css(
						"border-color", color[i]);
				offset += size;
			}
		}
	</script>

</html>
