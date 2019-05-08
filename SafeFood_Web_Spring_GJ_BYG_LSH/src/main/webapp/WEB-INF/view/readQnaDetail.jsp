<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 열람</title>
		
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
				margin: 100px auto;
				padding: 20px;
			}
			
			.tableArea {
				width: auto;
			}
			
			h2
			{
				font-size: 3em;
				padding: 2px 20px;
			}
			
			input[type=button], input[type=text], input[type=password] 
			{
				margin: 5px;
				border: 1px solid black;
				border-radius: 5px;
			}
			
			table 
			{
				padding: 50px;
				text-align: center;
				font-size: 1.25em;
				width: 960px;
				margin: 20px;
			}
			
			th 
			{
				min-width: 70px;
				padding: 5px;
				text-align: left;
			}
			
			.title 
			{
				min-width: 500px;
			}
			
			#btns 
			{
				display: inline-block;
				float: right;
				margin-right: 22px;
			}
			
			textarea 
			{
				font-size: 1.25em;
				resize: none;
				border-radius: 10px;
				width: 920px;
				height: 250px;
			}
			
			#title
			{
				padding: 0 5px;
				min-width: 300px;
			}
			#writer, #readCnt
			{
				max-width: 70px;
			}
			#regDate
			{
				max-width: 120px;
			}
			#writer, #readCnt, #regDate
			{
				text-align: center;
			}
			.bottom_btns
			{
				text-align: right;
				margin: 15px;
			}

		</style>
	</head>
	<body>
		<!-- 헤더 -->
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	
		<div class="container2" id="container">
			<h2 style="margin-bottom:50px;">게시글 열람</h2>
			<div class="tableArea">
				<table>
					<tr>
						<th>제목
						<td><input type="text" id="title" name="title" readonly="readonly" :value="board.title">
						<th>조회수
						<td><input type="text" id="readCnt" name="readCnt" readonly="readonly" :value="board.hit">
					</tr>
					<tr>
						<th>작성자
						<td><input type="text" id="writer" name="writer" readonly="readonly" :value="board.name">
						
						<th>작성일
						<td><input type="text" id="regDate" name="regDate" readonly="readonly" :value="board.regDate">
					</tr>
				</table>
				<textarea id="content" name="content" readonly="readonly">{{board.content }}</textarea>
			</div>
			
			<div class="bottom_btns">
				<input type="button" class="btn btn-success btn-lg" value="수정" @click="goToModify(board.boardId)">
				<input type="button" class="btn btn-danger btn-lg" value="삭제" @click="doDelete">
			</div>
			
		</div>
		
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</body>
	<script src="https://unpkg.com/vue"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
	
	<script>
		let vi = new Vue({
			el:"#container",
			data(){
				return {
					board:{} // Board 객체들
				};
			},
			mounted(){
				this.reload();
			},
			methods:{
				reload(){
					axios.get("http://localhost:9090/api/detail/"+${num })
					.then(response => {
						this.board = response.data.data;
						console.log(this.board);
					}).catch(error => {
						console.log(error);
					}).finally(()=> ( this.isProcessing=false ));
				},
				goToModify(num) {
					location.href="../session/modifyQna/"+num;
				},
				doDelete() {
					axios.delete("http://localhost:9090/api/delete/"+${num })
					.then(response => {
						if(response.status == 200) {
							location.href="../qna";			
						} 
						console.log(this.board);
					}).catch(error => {
						console.log(error);
					}).finally(()=> ( this.isProcessing=false ));
				}
			}
		});
	</script>
</html>