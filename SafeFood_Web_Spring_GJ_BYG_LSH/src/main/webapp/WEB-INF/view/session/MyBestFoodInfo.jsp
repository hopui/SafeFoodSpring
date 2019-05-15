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
			.grad {
				/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#1e5799+0,2989d8+37,7db9e8+88 */
				background: #1e5799; /* Old browsers */
				background: -moz-linear-gradient(top,  #1e5799 0%, #2989d8 37%, #7db9e8 88%); /* FF3.6-15 */
				background: -webkit-linear-gradient(top,  #1e5799 0%,#2989d8 37%,#7db9e8 88%); /* Chrome10-25,Safari5.1-6 */
				background: linear-gradient(to bottom,  #1e5799 0%,#2989d8 37%,#7db9e8 88%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
				filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799', endColorstr='#7db9e8',GradientType=0 ); /* IE6-9 */
			}
			.jb-wrap {
				width: 40%;
				margin: 10px auto;
				position: relative;
			}
			.jb-wrap img {
				width: 100%;
				vertical-align: middle;
				opacity: 0.1;
			}
			.jb-text {
				padding: 5px 10px;
				text-align: center;
				position: absolute;
				top: 50%;
				left: 50%;
				transform: translate( -50%, -50% );
			}
			.jb-text input[type=button] {
				color: white;				
			}
		</style>
	</head>
	<body>
		<!-- header --><br><br><br><br><br><br>
		<jsp:include page="../include/header.jsp"/>
		
		<c:url value="/static/img/produce101.png" var="produceUrl"/>
		<div class="jb-wrap" id="app" v-cloak>
			<h1 class="font_Jua text-center">👑베스트 섭취 식품👑</h1>
			<div class="jb-image"><img src="${produceUrl }" alt="우리는 꿈을 꾸는...ㅎ"></div>
			<div class="jb-text" v-for="(food, idx) in top3" style="transform: translate( idx%, -50% );">
				<h3 class="font_Jua">{{idx+1}}위</h3>
				<input type="button" class="btn btn-lg grad font_Jua rank" v-model="food.etc">				
			</div>
		</div>
		
		<!-- footer --><br><br>
		<jsp:include page="../include/footer.jsp"/>
	</body>
	
	<script src="https://unpkg.com/vue"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<script>
		let hostname = "localhost";
		let contextRoot = "SafeFood_Web_Spring_GJ_BYG_LSH";
		let vi = new Vue({
			el:"#app",
			data(){
				return {
					top3: []	
				}
			},
			mounted() {
				this.loadTop3();
			},
			methods: {
				loadTop3() {
		    		let url = "http://"+hostname+":8080/"+contextRoot+"/session/takenfoods/top3foods";
	
		    		axios.get(url)
					.then(response => {
						this.top3 = [];
						this.top3 = response.data;
						console.log("top3: ",this.top3);
					}).catch(error => {
						console.log(error);
					});
				}
			}
		});
	</script>
</html>