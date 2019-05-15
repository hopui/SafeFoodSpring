<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>베스트 섭취 식품</title>

		<!-- bootstrap & jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">
		
		<!-- local CSS -->
		<style>
			[v-cloak]::before {
				content: '로딩중...'
			}
			[v-cloak]>* {
				display: none;
			}
			.font_Jua {
				font-family: 'Jua', sans-serif;
			}
			.imgBox {
				position: relative;
			}
			.produceLogo {
				width: 512px;
				opacity: 0.2;
			}
			.produceTitle {
				position: absolute;
				right: 40%;
				top: 80%;
				font-weight: 300;
				font-size: 5rem;
				opacity: 0.2;
			}
			.rainbow_anim {
				-webkit-animation: rainbow infinite 3s;
			}
			@-webkit-keyframes rainbow {
				0%{color:#B85656;}
				9%{color:#C2795F;}
				18%{color:#CCC166;}
				27%{color:#8CB85A;}
				36%{color:#5CC75C;}
				45%{color:#58BA86;}
				54%{color:#609ABF;}
				63%{color:#5A6CBA;}
				72%{color:#7858B3;}
				81%{color:#B461BA;}
				90%{color:#BA5D8C;}
				100%{color:#B55D7E;}
			}
		</style>
	</head>
	<body>
		<!-- header --><br><br><br><br><br><br>
		<jsp:include page="../include/header.jsp"/>
		
		<div class="container" id="app" v-cloak>
			<div>
				<div class="imgBox text-center">
					<c:url value="/static/img/produce101.png" var="produceImgUrl"/>
					<img class="produceLogo" src="${produceImgUrl }">
					<span class="font_Jua rainbow_anim produceTitle">Best Food</span>
				</div>
			</div>
		</div>
		
		<!-- footer --><br><br>
		<jsp:include page="../include/footer.jsp"/>
	</body>
	<script>
		let vi = new Vue({
			el:"#app"
		});
	</script>
</html>