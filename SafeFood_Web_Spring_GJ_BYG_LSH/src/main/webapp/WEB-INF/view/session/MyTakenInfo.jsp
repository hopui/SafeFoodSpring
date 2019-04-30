<%@page import="com.ssafy.model.dto.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<title>나의 섭취 정보</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
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
		h1 {
			font-family: 'Do Hyeon', sans-serif;
			font-size: -webkit-xxx-large;
		}
		.takenimg {
		width: -webkit-fill-available;
		height: auto;
		}
		</style>
		
		<style>
		@keyframes bake-pie {
			from { 
				transform:rotate(0deg)translate3d(0, 0, 0);
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
		.img_box
		{
			width: auto;
		}
		
		.container2 {
			display: inline-block;
			position: relative;
			width: 960px;
			margin: 0 380px;
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
		
		.overlay:hover {
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
		<!-- header -->
		<jsp:include page="../include/header.jsp"/>
	
		<!-- 제목 -->
		<div class="text-center">
			<h1>나의 섭취 정보</h1>
		</div>
		
		
		<!-- 상단 이미지 -->
		<c:url value="/static/img/check.png" var="checkImg"/>
		<div class="text-center" id="ddd">
			<img src="${checkImg }" id="prdt">
		</div>
		
		<!-- 섭취 리스트 -->
		<div class="container2">
			<c:if test="${empty foods }">
				<h2 style="text-align: center;">섭취식품이 없습니다.</h2>
			</c:if>
			<c:forEach var="food" items="${foods}">
				<div class='col-md-3'>
				<c:url value="/static/${food.image }" var="foodImg"/>
				<c:url value="/detail/${food.code}/modi" var="detailUrl"></c:url>
				<h4 style="text-align: center;">${food.quantity} 개</h4>
					<a href='${detailUrl }'><img class='takenimg image' id = "imgbox" alt='Avatar' src='${foodImg}'></a>
					
					<div class='align-bottom overlay'>
						<div class='text'>${food.name }<br>${food.maker }</div>
					</div>
				</div>
			
			</c:forEach>
		</div>
		
	
		<!-- 여백의 -->
		<br>
		<hr>
		<br>
		<!-- 아름다움 -->
		
		<div class="container">
			<h3>하루 섭취량</h3>
			<div class="col-sm-6" id="graph">
				<div class="pieID pie"></div>

				<!--  도넛차트 -->
				<ul class="pieID legend">
					<li><em class="ss">칼로리</em> <span class="kcal"></span></li>
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
		</div>
		<br> <br>
		<!-- footer -->
		<jsp:include page="../include/footer.jsp"/>
	</body>
	<script>
	<% long[] sum = (long[]) request.getAttribute("nutriSum");%>
	let alarm = "${alarm }";
	if(alarm) {
		alert(alarm);
	}	
		$(".kcal").text('<%=sum[0]%>');
		$(".tan").text('<%=sum[1]%>');
		$(".dan").text('<%=sum[2]%>');
		$(".gi").text('<%=sum[3]%>');
		$(".dang").text('<%=sum[4]%>');
		$(".na").text('<%=sum[5]%>');
		$(".col").text('<%=sum[6]%>');
		$(".fat").text('<%=sum[7]%>');
		$(".trans").text('<%=sum[8]%>'); 
	
		<%if(sum[0] <1)%>
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