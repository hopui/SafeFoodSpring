<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<style>
	.modal-content
	{
		width: 350px;	
		margin-left: 100px;
	}
	
</style>
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">로그인</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			
			<div class="modal-body">
				<c:url value="/login" var="login"/>
				<form action="${login }" method="post">
					<!-- 이메일 입력란 -->
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="email" class="form-control" name="email" placeholder="Username" required="required">
						</div>
					</div>
					<!-- 비밀번호 입력란 -->
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" class="form-control" name="password" id="password" placeholder="password" required="required">
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block btn-lg" id="loginBtn">로그인</button>
					</div>
					<p class="hint-text">
						<c:url value="/findPassword" var="findPassword"/>
						<a href="${findPassword }">비밀번호 찾기</a>
					</p>
				</form>
			</div>
			<div class="modal-footer">
				<c:url value="/register" var="register"/>
				계정이 없다면? <a href="${register }">회원가입</a>
			</div>
		</div>
	</div>
</div>