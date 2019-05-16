<%@page import="com.ssafy.model.dto.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>나의 섭취 정보</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap & jquery -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua"
	rel="stylesheet">

<!-- global css -->
<c:url value="/static/css/myTakenFoodCSS.css" var="takenFoodCSSUrl" />
<link rel="stylesheet" href="${takenFoodCSSUrl }">

<!-- local css -->
<style>
.titleFont, h3 {
	font-family: 'Do Hyeon', sans-serif;
	font-size: -webkit-xxx-large;
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

footer {
	position: fixed;
	bottom: 0;
	right: 0;
	font-size: 13px;
	background: #DDD;
	padding: 5px 10px;
	margin: 5px;
}

.likeimg {
	width: 100px;
	height: 100px;
}

.likebox {
	width: 210px;
	height: 250px;
	border-radius: 1.2rem 1.2rem 1.2rem 1.2rem;
	border: 1px solid #eeeeee;
	margin-right: 10px;
	padding: 5px 5px;
	-webkit-box-shadow: 0 10px 15px 2px #C9C9C9;
	box-shadow: 0 10px 15px 2px #C9C9C9;
}

#mylist {
	width: 1024px;
	height: 100%;
}

dl {
	width: 1024px;
}

dt {
	-webkit-border-radius: 100px 100px 0 0;
	border-radius: 100px 100px 0 0;
	background: #ffede3; padding : 10px 10px;
	height: 40px;
	float: left;
	width: 150px;
	z-index: 9;
	text-align: center;
	position: relative;
	padding: 10px 10px;
}

dd {
	padding: 10px 10px;
	position: absolute;
	padding-top: 50px;
	width: 960px;
	height: 0 auto;
	border-bottom: 2px solid #ffede3;
}

dd.hidden {
	display: none;
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

.npieID {
	display: inline-block;
}

.npie {
	height: 200px;
	width: 200px;
	position: relative;
	margin: 0 30px 30px 0;
}

.npie::before {
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

.npie::after {
	content: "";
	display: block;
	width: 120px;
	height: 2px;
	background: rgba(0, 0, 0, 0.1);
	border-radius: 50%;
	box-shadow: 0 0 3px 4px rgba(0, 0, 0, 0.1);
	margin: 220px auto;
}

.nlegend {
	list-style-type: none;
	padding: 0;
	margin: 0;
	background: #FFF;
	padding: 15px;
	font-size: 13px;
	box-shadow: 1px 1px 0 #DDD, 2px 2px 0 #BBB;
	width: 180px;
}

.nlegend li {
	height: 1.25em;
	margin-bottom: 0.7em;
	padding-left: 0.5em;
	border-left: 1.25em solid black;
}

.nlegend em {
	font-style: normal;
}

.nlegend span {
	float: right;
}

.fpieID {
	display: inline-block;
}

.fpie {
	height: 200px;
	width: 200px;
	position: relative;
	margin: 0 30px 30px 0;
}

.fpie::before {
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

.fpie::after {
	content: "";
	display: block;
	width: 120px;
	height: 2px;
	background: rgba(0, 0, 0, 0.1);
	border-radius: 50%;
	box-shadow: 0 0 3px 4px rgba(0, 0, 0, 0.1);
	margin: 220px auto;
}

.flegend {
	list-style-type: none;
	padding: 0;
	margin: 0;
	background: #FFF;
	padding: 15px;
	font-size: 13px;
	box-shadow: 1px 1px 0 #DDD, 2px 2px 0 #BBB;
	width: 180px;
}

.flegend li {
	height: 1.25em;
	margin-bottom: 0.7em;
	padding-left: 0.5em;
	border-left: 1.25em solid black;
}

.flegend em {
	font-style: normal;
}

.flegend span {
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://unpkg.com/vue"></script>
<body>
	<!-- header -->
	<jsp:include page="../include/header.jsp" />

	<!-- 제목 -->
	<div class="text-center">
		<c:url value="/static/img/check.png" var="checkImg" />
		<img src="${checkImg }" style="width: 64px; margin-bottom: 30px"
			id="prdt"> <span class="titleFont">나의 섭취 달력</span>
	</div>

	<!-- 나의 섭취달력 iframe -->
	<c:url value="/session/calendar" var="calendarUrl" />
	<div align="center">
		<iframe width="1280" height="800" frameborder="0" scrolling="no"
			src="${calendarUrl }"></iframe>
	</div>
	<div class="container" id="mylist">
		<!-- 탭메뉴 만들기 -->
		<dl>
			<dt>나의 영양 그래프</dt>
			<dd>
			<!-- 실험용 그래프 출력 -->
				<c:url value="/session/takenFoodChart" var="takenFoodChartUrl" />
				<div align="center">
					<iframe width="1000" height="700" frameborder="0" scrolling="no"
						src="${takenFoodChartUrl }"> </iframe>
				</div>
			</dd>

			<dt>나의 섭취 알레르기</dt>
			<dd class="hidden">
				<graphcomp></graphcomp>
			</dd>

			<dt>나의 찜리스트</dt>
			<dd class="hidden">
				<maincomp></maincomp>
			</dd>
		</dl>
		<div style="width: 1024px; height: 900px;"></div>
		<div align="center" style="position: absolute; top: 1550px;">
		<div class="col-sm-6" id="graph" v-show="isEat">
			<%
				long[] nutri = (long[]) session.getAttribute("nutri");
			%>
			<!--도넛차트-->
			<div align="center" style="margin-bottom: 20px">
				<div class="pieID pie"></div>
				<ul class="pieID legend">
					<li><em class="ss">칼로리</em> <span class="kcal"><%=nutri[0]%></span></li>
					<li><em class="ss">탄수화물</em> <span class="tan"><%=nutri[1]%></span></li>
					<li><em class="ss">단백질</em> <span class="dan"><%=nutri[2]%></span></li>
					<li><em class="ss">지방</em> <span class="gi"><%=nutri[3]%></span></li>
					<li><em class="ss">당류</em> <span class="dang"><%=nutri[4]%></span></li>
					<li><em class="ss">나트륨</em> <span class="na"><%=nutri[5]%></span></li>
					<li><em class="ss">콜레스테론</em> <span class="col"><%=nutri[6]%></span></li>
					<li><em class="ss">포화 지방산</em> <span class="fat"><%=nutri[7]%></span></li>
					<li><em class="ss">트랜스지방</em> <span class="trans"><%=nutri[8]%></span></li>
				</ul>
			</div>
			<h4 align="center">섭취 전</h4>
		</div>

		<div class="col-sm-6" id="graph" v-show="isEat">
			<div align="center" style="margin-bottom: 20px">
				<div class="npieID npie"></div>
				<ul class="npieID nlegend">
					<li><em class="ss">칼로리</em> <span v-text="kcal"></span></li>
					<li><em class="ss">탄수화물</em> <span v-text="tan"></span></li>
					<li><em class="ss">단백질</em> <span v-text="dan"></span></li>
					<li><em class="ss">지방</em> <span v-text="gi"></span></li>
					<li><em class="ss">당류</em> <span v-text="dang"></span></li>
					<li><em class="ss">나트륨</em> <span v-text="na"></span></li>
					<li><em class="ss">콜레스테론</em> <span v-text="col"></span></li>
					<li><em class="ss">포화 지방산</em> <span v-text="fat"></span></li>
					<li><em class="ss">트랜스지방</em> <span v-text="trans"></span></li>
				</ul>
			</div>
			<h4 align="center">섭취 후</h4>
		</div>
		</div>
	</div>
	<br>
	<br>

	<!-- footer -->
	<jsp:include page="../include/footer.jsp" />
</body>
<script type="text/x-template" id="main-temp">
<div>
			<h3 class="titleFont">나의 찜리스트</h3>
			<br>
			<div class="col-sm-12" style="margin-bottom: 20px;">
				<div class="col-sm-2 likebox" v-for="(item, index) in mylist">
					<div align="right"
						style="margin-right: 5px; width: 18px; height: 13px;">
						<input v-if="item.haccp =='0'" type="checkbox" name="food"
							:value="item.foodCode" v-model="checkList">
					</div>

					<div align="center"
						style="width: 200px; height: 250px; padding: 20px 20px;">
						<div align="center">
							<c:url value="/static/img/" var="ImgUrl"></c:url>
							<c:url value="/detail/haccp/" var="hdetailUrl"></c:url>
							<a class="likeimg" v-if="item.haccp =='1'"
								:href="'${hdetailUrl}'+item.foodCode+'/'+item.foodName"> <img
								alt="#" :src="'${ImgUrl }'+img[index]">
							</a>

							<c:url value="/detail/" var="detailUrl"></c:url>
							<a v-if="item.haccp =='0'" class="likeimg"
								:href="'${detailUrl}'+item.foodCode"> <img alt="#"
								:src="'${ImgUrl }'+img[index]">
							</a>
						</div>
						<h5 align="center" v-text="item.foodName"></h5>
						<div align="center">
							<c:url value="/session/modify" var="modilUrl"></c:url>
							<form method="post" action="${modilUrl}" style="width:68px; display:inline-block;">
								<input type="hidden" name='quantity' value=0> <input
									type="hidden" name='name' :value='item.foodName'> <input
									type="hidden" name='code' :value='item.foodCode'> <input
									type="hidden" name='haccp' :value='item.haccp'>
								<button class='btn btn-primary' id="button_insert">
									<span id="insert" class='glyphicon glyphicon-plus'
										aria-hidden='true'></span>냠냠
								</button>
							</form>
								<button class='btn btn-danger' id="button_delete"
									@click="deleteLike(item)">

									<span id="delete" class='glyphicon glyphicon-minus'
										aria-hidden='true'></span>찜해제
								</button>
						</div>
					</div>
				</div>
			</div>
			<button class="btn btn-success" @click="showChart">찜한 식품 예상 통계보기</button>
		</div>
</script>
<script type="text/x-template" id="graph-temp">
<div>
<h3>섭취 알레르기 정보</h3>
			<div class="col-sm-6" id="graph">
				<div class="fpieID fpie"></div>
				<ul class="fpieID flegend">
					<li v-for="(item, index) in allergyName">
					<em class="ss">{{item}}</em>
					<span v-text="allergyCount[index]"></span></li>
				</ul>
			</div>
</div>
</script>
<script>
	let alarm = "${alarm }";
	if(alarm) {
		alert(alarm);
	}	

	$(document).on("click", "dt" , function(){
		 $('dd').addClass('hidden');
		 $(this).next().removeClass('hidden');
		 if(vi.isEat)
			 vi.isEat = !vi.isEat;
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
	
	var maincomp = Vue.component("maincomp", {
		template:"#main-temp",
		data(){
			return {
				mylist:[],
				img:[],
				checkList:[]
			}
		},
		mounted(){
			this.loadData();
		},
		methods:{
			loadData(){				
				axios
				.get("/SafeFood_Web_Spring_GJ_BYG_LSH/session/likelist")
				.then(response => {
					this.mylist=[];
					this.img=[];
					this.mylist = response.data.mylike;
					this.img = response.data.img;
				})
				.catch(error =>{
					console.log(error)
					this.errored= true;
				})
				//함수에서의 this는 window, arrow 함수에서는 vue
				.finally(() => {this.loading = false;
				});
			},
			deleteLike(item){
				let compare='';
				if(item.haccp=='1')
					compare= 'haccp/';
				
				axios
				.get("/SafeFood_Web_Spring_GJ_BYG_LSH/session/likefood/"+compare
						+item.foodCode+"/"
						+item.foodName+"i/none")
				.then(response => {
						this.loadData();
				})
				.catch(error =>{
					console.log(error)
					this.errored= true;
				})
				//함수에서의 this는 window, arrow 함수에서는 vue
				.finally(() => {this.loading = false});
			},
			showChart(){
				vi.isEat = !vi.isEat;
				createPie(".pieID.legend", ".pieID.pie");
				
				for(let i=0; i<this.checkList.length; i++){
					axios
					.get("/SafeFood_Web_Spring_GJ_BYG_LSH/session/nextfood/"+this.checkList[i])
					.then(response => {
						let data = response.data;
						vi.kcal+=data.kcal;
						vi.tan+=data.tan;
						vi.dan+=data.dan;
						vi.gi+=data.gi;
						vi.dang+=data.dang;
						vi.na+=data.na;
						vi.col+=data.col;
						vi.fat+=data.fat;
						vi.trans+=data.trans;
						if(i == this.checkList.length-1){
							createPie(".npieID.nlegend", ".npieID.npie");
						}
					})
					.catch(error =>{
						console.log(error)
						this.errored= true;
					})
					//함수에서의 this는 window, arrow 함수에서는 vue
					.finally(() => {this.loading = false});
				}
			}
		}
	});
	
	var graphcomp = Vue.component("graphcomp", {
		template:"#graph-temp",
		data(){
			return {
				allergyName:[],
				allergyCount:[]
			}
		},
		mounted(){
			this.loadData();
		},
		methods:{
			loadData(){
				axios
				.get("/SafeFood_Web_Spring_GJ_BYG_LSH/session/allerglist")
				.then(response => {
					this.allergyCount = response.data.alCount;
					this.allergyName = response.data.alName;
				})
				.catch(error =>{
					console.log(error)
					this.errored= true;
				})
				//함수에서의 this는 window, arrow 함수에서는 vue
				.finally(() => {this.loading = false;
				createPie(".fpieID.flegend", ".fpieID.fpie");
				});
			}
		}
	});
	
	let vi = new Vue({
		el:"#mylist",
		data: {
			  currentview: 'maincomp',
		      allviews:['maincomp','graphcomp'],
		      kcal:<%=nutri[0]%>,
				tan:<%=nutri[1]%>,
				dan:<%=nutri[2]%>,
				gi:<%=nutri[3]%>,
				dang:<%=nutri[4]%>,
				na:<%=nutri[5]%>,
				col:<%=nutri[6]%>,
				fat:<%=nutri[7]%>,
				trans:<%=nutri[8]%>, 
		      isEat:false
		   },
		   components: {
			   maincomp: maincomp,
			   graphcomp: graphcomp,
		     },
		   methods:{
			   clickTab(){
				   if(this.currentview == 'maincomp'){
					   currentview ='graphcomp';
				   }
				   else{
					   currentview ='maincomp';
				   }
			   }
		   }
	});
	</script>
</html>