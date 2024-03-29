<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
	<head>
		<title>공지작성</title>

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
				font-family: 'Varela Round', sans-serif;
				width: 960px;
				margin: 70px auto;
				padding: 20px;
				border-radius: 5px;
			}
			
			h2 {
				font-size: 4em;
			}
			
			input[type=button], input[type=text], input[type=password] {
				margin: 5px;
			}
			
			table {
				font-size: 1.25em;
			}
			
			th {
				padding: 5px;
				text-align: left;
			}
			
			#btns {
				float: right;
			}
			
			.content{
				font-size: 1.25em;
				min-width: 920px;
				min-height: 400px;
			}
		</style>
	</head>
	<body>
		<!-- 헤더 -->
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
		
		<div class="container2" id="container">
			<h2 align="left">공지사항</h2>
			
			<form method="post" @submit.prevent="doInsert">
				<div align="left">
					<table>
						<tr>
							<th><b>제&nbsp; &nbsp; 목</b></th>
							<td class="title">
								<input class="title" type="text" name="title" v-model:value="notice.title" required>
							</td>
						</tr>
						<tr>
							<th><b>작성자</b></th>
							<td><span id="name"><b>&nbsp;${loginUser.name }</b></span>
						</tr>	
					</table><input type="hidden" value="${loginUser.email }" id="userEmail"><br>
					
					<textarea class="content" name="content" v-model="notice.content"></textarea>
					
					<div id="btns">
						<input type="submit" class="btn btn-success btn-lg" value="올리기">
						<input type="reset" class="btn btn-warning btn-lg" value="다시작성">
					</div>
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
				notice:{title:null, content:null, userEmail:null}
			},
			methods:{
				doInsert() {
					this.notice.userEmail = $("#userEmail").val();
					axios.post("http://localhost:9090/api/insert", this.notice)
					.then(response => {
						if(response.status == 200) {
							location.href="../notice";			
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
</html>s