<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<meta charset="UTF-8">

<div class="container-fluid bg-grey">
	<h2 class="text-center" style='padding: 0 0;'>Find Us</h2>
	<div class="row">
		<div class="col-sm-5">
			<p>Contact us and we'll get back to you within 24 hours.</p>
			<p><span class="glyphicon glyphicon-map-marker"></span> Korea, GJ</p>
			<p><span class="glyphicon glyphicon-phone"></span> +00 1515151515</p>
			<p><span class="glyphicon glyphicon-envelope"> ssafy@ssafy.com</span></p>
		</div>
		<div class="col-sm-7">
			<div class="row">
				<div class="col-sm-6 form-group">
					<input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
				</div>
				<div class="col-sm-6 form-group">
					<input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
				</div>
			</div>
			
			<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
			<div class="row">
				<div class="col-sm-12 form-group">
					<button class="btn btn-default pull-right" type="submit">Send</button>
				</div>
			</div>
		</div>
	</div>
</div>