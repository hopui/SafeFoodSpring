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
			select, input[type="text"]{
				height: 32px;
			}
			.imgBtn {
			    background-color: Transparent;
			    background-repeat:no-repeat;
			    border: none;
			    cursor:pointer;
			    overflow: hidden;
			    outline:none;
			}
		</style>
	</head>
	<body>
		<!-- 헤더 -->
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
		
		<div class="container" id="container" align="center" style="margin-bottom: 50px;">
			<br><br><br><br><br>
			<!-- 본문 --><c:url value="/static/img/notice.png" var="noticeImgUrl"/>
			<div align="left">
				<img src="${noticeImgUrl }" class="img_style">
				<span class="web_font">공지사항</span>
				<span style="margin-left: 440px;">
					<select v-model="searchMode">
						<option>질문제목
						<option>글쓴이
						<option>내용
					</select>
					<input type="text" placeholder="검색어를 입력해주세요" v-model:value="searchValue" @keyup.enter="search">
					<input class="btn btn-info btn-sm" type="button" value="검색" @click="search">
				</span>
			</div>
			
			<hr style="margin-top: 5px;"><!-- --------------밑줄---------------- -->
			
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
			<div align="right">
				<span v-if="'${loginUser.authority }' === 'admin'"><c:url value="/session/writeNotice" var="writeNoticeUrl"/>
					<input class="btn btn-danger btn-sm" type="button" value="선택삭제" @click="deleteChecked">
					<input class="btn btn-success btn-sm" type="button" value="글쓰기" onClick="location.href='${writeNoticeUrl }'">
				</span>			
			</div>
			
			<!-- 페이지 넘버 -->
			<div v-if="boards.length > 0">
				<c:url value="/static/img/prevBtn.png" var="prevBtnUrl"/>
				<button class="imgBtn"><img src="${prevBtnUrl }"></button> 
				
				<template v-for="i in maxPage">
					<a href="#" @click="goToPage(i)" style="margin:0 10px;">{{i}}</a>
				</template>
				
				<c:url value="/static/img/nextBtn.png" var="nextBtnUrl"/>
				<button class="imgBtn"><img src="${nextBtnUrl }"></button>
			</div>
		</div>
		
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</body>
	<script src="https://unpkg.com/vue"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
	
	<!-- 공지사항용 JavaScript -->
	<c:url value="/static/script/notice.js" var="noticeJSurl"/>
	<script src="${noticeJSurl }"></script>
</html>