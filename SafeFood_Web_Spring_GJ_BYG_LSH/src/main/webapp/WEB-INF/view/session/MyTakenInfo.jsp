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
		
		<!-- bootstrap & jquery -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">
				
		<!-- global css -->
		<c:url value="/static/css/myTakenFoodCSS.css" var="takenFoodCSSUrl"/>
		<link rel="stylesheet" href="${takenFoodCSSUrl }">
		
		<!-- local css -->
		<style>
		.titleFont {
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
		</style>
	</head>
	
	<body>
		<!-- header -->
		<jsp:include page="../include/header.jsp"/>
	
		<!-- 제목 -->
		<div class="text-center">
			<c:url value="/static/img/check.png" var="checkImg"/>
			<img src="${checkImg }" style="width:64px; margin-bottom:30px"id="prdt">
			<span class="titleFont">나의 섭취 달력</span>
		</div>

		<!-- 나의 섭취달력 iframe -->
		<c:url value="/session/calendar" var="calendarUrl"/>
		<div align="center">
			<iframe width="1024" height="800" frameborder="0" scrolling="no" src="${calendarUrl }"></iframe>
		</div>
		
		
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
		<br><br>
		
		<!-- footer -->
		<jsp:include page="../include/footer.jsp"/>
	</body>
	
	<script>
	let alarm = "${alarm }";
	if(alarm) {
		alert(alarm);
	}	
	//파이차트 생성
	<% long[] sum = (long[]) request.getAttribute("nutriSum");%>

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
			/* createPie(".pieID.legend", ".pieID.pie"); */
	
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