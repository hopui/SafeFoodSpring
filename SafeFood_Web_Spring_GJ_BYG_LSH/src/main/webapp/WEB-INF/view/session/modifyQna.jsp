<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
	<head>
		<title>질문하기</title>

		<!-- jQuery & Bootstrap -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

		<!-- WebFont -->
		<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">

		<style>
			.container2 {
				font-family:  'Varela Round', sans-serif;
				width: 960px;
				margin: 100px auto;
				padding: 20px;
				border-radius: 5px;
			}
			
			h2 {
				font-size: 4em;
				padding: 2px 20px;
			}
			
			input[type=button], input[type=text], input[type=password] {
				margin: 5px;
				border: 1px solid black;
				border-radius: 5px;
			}
			
			table {
				font-size: 1.25em;
			}
			
			th {
				padding: 5px;
				text-align: left;
			}
			
			#btns {
				display: inline-block;
				float: right;
				margin-right: 22px;
			}
			
			.content{
				font-size: 1.25em;
				text-align: left;
				min-width: 920px;
				min-height: 400px;
			}
			.title{
				width: 500px;
			}
		</style>
	</head>
	<body>
		<!-- 헤더 -->
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
		
		<div class="container2" id="container">
			<h2 align="left">수정하기</h2>
			
			<form method="post" @submit.prevent="doUpdate">
				<div align="left">
					<table>
						<tr>
							<th><b>제목</b></th>
							<td class="title">
								<input class="title" type="text" name="title" v-model:value="board.title" required>
							</td>
						</tr>
						<tr>
							<th colspan="1"><b>작성자</b></th>
							<td><label id="name">${loginUser.name }</label>
						</tr>	
					</table>
					<input type="hidden" value="${loginUser.email }" id="userEmail">
				</div>
				
				<div class="row text-center">
					<input class="content" type="text" name="content" v-model:value="board.content">
				</div>
			
				<div id="btns">
					<input type="submit" class="btn btn-success btn-lg" value="수정하기">
					<input type="reset" class="btn btn-warning btn-lg" value="다시작성">
				</div>
			</form>
		</div>
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</body>
	<script src="https://unpkg.com/vue"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<script>
		let vi = new Vue({
			el:"#container",
			data:{
				board:{}
			},
			mounted() {
				this.reload();
			},
			methods:{
				reload() {
					axios.get("http://localhost:9090/api/detail/"+${num })
					.then(response => {
						this.board = response.data.data;
					}).catch(error => {
						console.log(error);
					}).finally(()=> ( this.isProcessing=false ));
				},
				doUpdate() {
					axios.put("http://localhost:9090/api/update", this.board)
					.then(response => {
						if(response.status == 200) {
							location.href="../../qna";			
						} 
						else {
							alert("실패!");
						}
					}).catch(error =>{
						console.log(error);
					}).finally(()=>{
					})
				}
			}
		});
	</script>
</html>