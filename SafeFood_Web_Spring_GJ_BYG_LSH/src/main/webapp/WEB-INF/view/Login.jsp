<%--
  Created by IntelliJ IDEA.
  User: YUNKI
  Date: 2019-04-07
  Time: 오후 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>로그인</title>
</head>
<!--Bootstrap-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!--My CSS-->
<link rel="stylesheet" href="./css/loginStyle.css">
<style>
    a {
        padding: 5px;
        font-size: 1.1em;
    }
</style>
<body>
	<div class="container text-center">
	    <form id="form-signin" class="form-signin" method="post" action="/login">
	        <h2 class="form-signin-heading">로그인</h2>
	
	        <label for="inputEmail" class="sr-only">ID</label>
	        <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email" required autofocus>
	
	        <label for="inputPassword" class="sr-only">Password</label>
	        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
	
	        <div class="checkbox">
	            <label>
	                <a href="/findPassword">비밀번호 찾기</a>
	            </label>
	            <label>
	                <a href="/register">회원 가입</a>
	            </label>
	        </div>
	
	        <input id="loginBtn" class="btn btn-lg btn-primary btn-block" type="submit" value="로그인 하기">
	    </form>
	</div> 
	
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	let alarm = "${alarm}";
	if(alarm)
	{
		alert(alarm);
	}
	
</script>

</html>