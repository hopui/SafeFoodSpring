<%@page import="com.ssafy.service.nation"%>
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
				<c:if test="${not empty loginUser}">
					<c:url value="/session/modify" var="modilUrl"></c:url>
					<form id="eat_form" method="post" action="${modilUrl}">
						<label>Quantity</label> 
						<input type="number" class="form-control"name='quantity'> <br>
						
						 <input type="hidden" name='like' v-model="code">
						 <input type="hidden" name='name' v-model='name'> 
						 <input hidden='true' name='haccp' value=1>
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
	<br>
		<hr>
		<br>
		<div class="container">
			<h3>원재료 국가별 통계</h3>
			<div class="col-sm-6" id="graph">
				<div class="pieID pie"></div>
				<!--  도넛차트 -->
				<ul class="pieID legend">
					<li v-for="nation in rank"><em class="ss" v-text="nation.name"></em> <span class="kcal" v-text="nation.count"></span></li>
				</ul>
			</div>

			<!--  도넛차트 옆 테이블 -->
			<div class="col-sm-6" id="detail">
				<table class="table text-center">
					<tr  v-for="nation in rank">
						<td>{{nation.name}}</td>
						<td class="daily" v-html="nation.count+'개'"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<br>
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />


</body>
<script>
	let alarm = "${alarm }";
	if (alarm) {
		alert(alarm);
	}

	let haccp = "${haccp}";
	let nations =[];
	<%
		nation n = new nation();
		for(String na : n.nations){
	%>
		nations.push("<%=na%>");
	<%}%>
	let vi = new Vue({
		el:"#foodapp",
		data(){
			return {
				food:{},
				image:'apple_origin.png',
				rank:[],
				code:'',
				name:''
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
					let count = new Array();
					
					for(let i=0; i<nations.length; i++)
						count.push(0);
					
					for(let a=0; a<nations.length; a++) {
						for(let i=0; i<this.food.rawmtrl.length; i++) {
							let result=this.food.rawmtrl.indexOf(nations[a],i);
							if(result >0) {
								count[a]++;
								i= result+nations[a].length;
							}else
								break;
						}
					}
		 
					for(let i=0; i<count.length; i++){
						if(count[i] !=0){
							this.rank.push({name:nations[i], count:count[i]});
						}
					}
					this.code = this.food.prdlstReportNo;
					this.name = this.food.prdlstNm;
					this.likefood('c'); 
				})
				.catch(error =>{
					console.log(error)
					this.errored= true;
				})
				//함수에서의 this는 window, arrow 함수에서는 vue
				.finally(() => {this.loading = false;
					createPie(".pieID.legend", ".pieID.pie");
				})
			},
			likefood(func){
				axios
				.get("/SafeFood_Web_Spring_GJ_BYG_LSH/session/likefood/haccp/"
						+this.code+"/"
						+this.name+func)
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
							console.log(this.food);
				})
				.catch(error =>{
					console.log(error)
					this.errored= true;
				})
				//함수에서의 this는 window, arrow 함수에서는 vue
				.finally(() => {this.loading = false});
				
			},
			checkNations(mater){
				
				
			}
		}

	});
	

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
