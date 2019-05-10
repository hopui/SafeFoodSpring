<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
		<!-- jQuery & Bootstrap -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

		<!-- WebFont -->
		<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">
	
		<!-- global css -->
		<c:url value="/static/css/notice.css" var="noticeCSS"/>
		<link href="${noticeCSS }" rel="stylesheet">
	
		<!-- local css -->
		<style>
			th, td{
				text-align:center;
			}
		</style>
	</head>
	<body>
		<!-- 헤더 -->
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
		
		<div class="container" id="container" align="center" style="margin-bottom: 50px;">
			<br><br><br><br><br>
			<!-- 본문 --><c:url value="/static/img/notice.png" var="noticeImgUrl"/>
			<div align="left"><img src="${noticeImgUrl }" class="img_style"><span class="web_font">공지사항</span></div>
			<hr style="margin-top: 5px;">
			<table class="table table-hover">
				<thead>
				    <tr>
				    	<th scope="col">선택</th>
						<th scope="col">번호</th>
					    <th scope="col">제목</th>
					    <th scope="col">글쓴이</th>
					    <th scope="col">조회수</th>
					    <th scope="col">작성일</th>
				    </tr>
			  	</thead>
		  	
		  		<tbody>
				    <tr v-for="board in boards">
						<td>
							<input v-if="board.userEmail === '${loginUser.email }' || '${loginUser.authority }' === 'admin'" 
								   type="checkbox" name="checked" 
								   :value="board.boardId"
								   v-model="checked">
						</td>
						<th class="row">{{ board.boardId }}</th>
						<td @click="goToDetail(board.boardId)"><a href="#">{{ board.title }}</a></td>
						<td>{{ board.name }}</td>
						<td>{{ board.hit }}</td>
						<td>{{ board.regDate }}</td>
				     </tr>
				</tbody>
			</table>
			<div>
				<span style="margin-right: 450px;">
					<select>
						<option>질문제목
						<option>글쓴이
						<option>내용
					</select>
					<input type="text" placeholder="검색어를 입력해주세요">
					<input class="btn btn-info btn-sm" type="button" value="검색">
				</span>
				
				<span><c:url value="/session/writeQna" var="writeQnaUrl"/>
					<input class="btn btn-danger btn-sm" type="button" value="선택삭제" @click="deleteChecked">
					<input class="btn btn-success btn-sm" type="button" value="글쓰기" onClick="location.href='${writeQnaUrl }'">
				</span>			
			</div>
			
			<!-- 페이지 넘버 -->
			<div v-if="boards.length > 0">
				<button>←</button> <!-- @click="prevPage" -->
				
				<template v-for="i in maxPage">
					<a href="#" @click="goToPage(i)" style="margin:0 10px;">{{i}}</a>
				</template>
				
				<button>→</button> <!-- @click="nextPage" -->
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
					boards:[], // Board 객체들
					maxPage:0,
					checked:[] // check된 게시글들
				};
			},
			mounted(){
				this.reload();
			},
			methods:{
				reload(){
					axios.get("http://localhost:9090/api/page")
					.then(response => {
						this.boards = response.data.data;
						this.maxPage = Math.ceil(response.data.maxPage/10);
						console.log(this.maxPage);
					}).catch(error => {
						console.log(error);
					}).finally(()=> ( this.isProcessing=false ));
				},
				goToPage(i){
					axios.get("http://localhost:9090/api/page/"+i)
					.then(response => {
						this.boards = response.data.data;
					}).catch(error => {
						console.log(error);
					}).finally(()=> ( this.isProcessing=false ));
				},
				goToDetail(num){
					location.href="readDetail/"+num;
				},
				deleteChecked(){
					console.log(this.checked);
					for(let check of this.checked){
						axios.delete("http://localhost:9090/api/delete/" + check)
						.then(response => {
							this.checked = null;
							console.log(this.checked);
						}).catch(error => {
							console.log(error);
						}).finally(()=> ( this.reload() ));
					}
				}
			}
		});
	</script>
</html>