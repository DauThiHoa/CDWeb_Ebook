<%@page import="com.example.ebook.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<title>Reset</title>
<!-- BIEU TUONG TRANG WEB -->
<link rel="icon" href="img/icon1.png" type="image/png" class="icon">

<%@include file="all_component/allCss.jsp"%>
<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="loginRegister/styleLoginRegister.css" rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->

<script type="text/javascript">
	$(document).ready(function() {

		$('#sendEmail').click(function() {
			var email = $('#email').val();

			$.ajax({
				type : 'POST',
				data : {
					email : email
				},
				url : 'sendMail',
				success : function(result) {
					$('#sendMail').html(result)
				}
			})

		});

	});
</script>

</head>
<body>

	<div class="container infinity-container">
		<div class="row">
			<div class="col-md-1 infinity-left-space"></div>

			<div
				class="col-lg-10 col-md-10 col-sm-12 col-xs-12 text-center infinity-form">
				<div class="text-center mb-3 mt-5">
					<span><img alt=""
				style="width: 20%; height: 20%" src="img/icon1.png"></span>
			 
				 <span><img alt="" style="width: 40%; height: 40%" src="img/ebook1.png"></span>
				</div>
				<div class="reset-form d-block">

					<!-- reset-password-form -->
					<form action="sendMail" method="post"
						class="reset-password-form px-3">
						<h4>Reset Your password</h4>

						<p class="mb-3" style="color: #777">Please enter your email
							address and we will send you a password reset link.</p>
						<div class="form-input">
							<span><i class="fa fa-envelope"></i></span> <input id="email"
								type="email" name="email" placeholder="Email Address"
								tabindex="10" required>
						</div>
						<div class="mb-3">
							<button type="submit" class="btn">Send
								Reset Link</button>
						</div>
						<label id="sendMail"></label>



						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg }</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg }</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>



						<div class="text-center mb-5">
							Already have password <a class="login-link" href="/Ebook/login">Login
								here</a>
						</div>

					</form>
				</div>
				<div class="reset-confirmation d-none px-3">
					<div class="mb-4">
						<h4 class="mb-3">Link was sent</h4>
						<h6 style="color: #777">Please, check your inbox for a
							password reset link.</h6>
					</div>
					<div class="mb-3">
						<a href="/Ebook/login">
							<button type="submit" class="btn">Login Now</button>
						</a>

						<div class="text-center mb-5">
							Already have password <a class="login-link" href="/Ebook/login">Login
								here</a>
						</div>

					</div>
				</div>

				<div class="col-md-1 infinity-right-space"></div>
			</div>
		</div>
</body>



</html>
