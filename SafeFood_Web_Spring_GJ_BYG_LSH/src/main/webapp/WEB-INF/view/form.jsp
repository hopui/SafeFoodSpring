<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="app">
<c:url value="/insert/food" var="formUrl"></c:url>
<form method="get" action="${formUrl}" >
<input type="submit" value="입력">
	<template v-for="food in foods">
		<input type="text" :value="food.DESC_KOR" name="name">
		<input type="text" :value="food.NUTR_CONT1" name="calory">
		<input type="text" :value="food.NUTR_CONT2" name="carbo">
		<input type="text" :value="food.NUTR_CONT3" name="protein">
		<input type="text" :value="food.NUTR_CONT4" name="fat">
		<input type="text" :value="food.NUTR_CONT5" name="sugar">
		<input type="text" :value="food.NUTR_CONT6" name="natrium">
		<input type="text" :value="food.NUTR_CONT7" name="chole">
		<input type="text" :value="food.NUTR_CONT8" name="fattyacid">
		<input type="text" :value="food.NUTR_CONT9" name="transfat">
		<input type="text" :value="food.SERVING_WT" name="supportpereat">
		<input type="text" :value="food.NUM" name="code">
		<input type="text" :value="food.ANIMAL_PLANT" name="maker">
		<input type="text" :value="food.FDGRP_NM" name="foodGroup">
	</template>
</form>
</div>
</body>

<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script type="text/javascript">
	let vi = new Vue({
	el:"#app",
	data(){
		return {
			foods:[],
		}
	},
	mounted(){
		this.loadData(1,1);
	},
	methods:{
		loadData(first, end){
			var userURL = "http://localhost:8080/SafeFood_Web_Spring_GJ_BYG_LSH";				
			var url = userURL + "/AjaxRequest.jsp?getUrl=";
			let apiurl = 'http://openapi.foodsafetykorea.go.kr/api/246deb010b9d41149b25/I0750/json';
			let page="/"+first+"/"+end;
			url += encodeURIComponent(apiurl+page);
			
			axios
			.get(url)
			.then(response => {
								this.foods = response.data.I0750.row;		
			})
			.catch(error =>{
				console.log(error)
				this.errored= true;
			})
			//함수에서의 this는 window, arrow 함수에서는 vue
			.finally(() => {this.loading = false})
		}
	}
})
</script>
</html>