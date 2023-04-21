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
<!-- BIEU TUONG TRANG WEB -->
<link rel="icon" href="img/icon1.png" type="image/png" class="icon">

<title>EBook: Login</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="../loginRegister/styleLoginRegister.css" rel="stylesheet">
 
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"> 


</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
 
	<div class="container infinity-container">
		<div class="row">
			<div class="col-md-1 infinity-left-space"></div>

			<!-- FORM BEGIN -->
			<div
				class="col-lg-10 col-md-10 col-sm-12 col-xs-12 text-center infinity-form">
				<!-- Company Logo -->
				<div class="text-center mb-3 mt-5">
					<!-- <img src="../img/ebook2.png"  width="150px"> -->
					
					<span><img alt=""
				style="width: 20%; height: 20%" src="../img/icon1.png"></span>
			 
				 <span><img alt="" style="width: 40%; height: 40%" src="../img/ebook1.png"></span>
				 
				</div>
				<div class="text-center mb-4">
					<h4>Login into account</h4>
				</div>



				<c:if test="${not empty failedMsg }">
					<h5 class="text-center text-danger">${failedMsg }</h5>
					<c:remove var="failedMsg" scope="session" />
				</c:if>

				<c:if test="${not empty succMsg }">
					<h5 class="text-center text-success">${succMsg }</h5>
					<c:remove var="succMsg" scope="session" />
				</c:if>


				<!-- Form -->
				<form action="/Ebook/login" method="post" class="px-3">
					<!-- Input Box -->
					<div class="form-input">
						<span><i class="fa fa-envelope"></i></span> <input type="email"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							required="required" name="email" placeholder="Email Address"
							tabindex="10" required>
					</div>
					<div class="form-input">
						<span><i class="fa fa-lock"></i></span> <input type="password"
							id="password" required="required" name="password"
							placeholder="Password" required> 
							
							<span><i
							id="hide" onclick="changeTypePassword()" class="fas fa-eye-slash"></i></span>
						<span><i id="show" style="display: none;"
							onclick="changeTypePassword()" class="fa-solid fa-eye"></i></span>
							
							
					</div>
					<div class="row mb-3">
						<!-- Remember Box -->
						<div class="col-auto d-flex align-items-center">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="cb1">
								<label class="custom-control-label" for="cb1">Remember
									me</label>
							</div>
						</div>
					</div>
					<!-- Login Button -->
					<div class="mb-3">
						<button type="submit" class="btn btn-block">Login</button>
					</div>
					<div class="text-right ">
						<a href="/Ebook/reset" class="forget-link">Forgot password?</a>
					</div>
					<div class="text-center mb-2">
						<div class="text-center mb-3" style="color: #777;">or login
							with</div>

						<!-- Facebook Button -->
						<a href="" class="btn btn-social btn-facebook"><i class="fa-brands fa-facebook-f"></i></a>

						<!-- Google Button -->
						<a href="" class="btn btn-social btn-google"><i class="fa-brands fa-google"></i></a>

						<!-- Twitter Button -->
						<a href="" class="btn btn-social btn-twitter"><i class="fa-brands fa-twitter"></i></a>
					</div>
					<div class="text-center mb-5" style="color: #777;">
						Don't have an account? <a class="register-link"
							href="/Ebook/register">Register here</a>
					</div>
				</form>
			</div>
			<!-- FORM END -->

			<div class="col-md-1 infinity-right-space"></div>
		</div>
	</div>

	<script type="text/javascript">
		function changeTypePassword() {
			const password = document.getElementById('password');
			const show = document.getElementById('show');
			const hide = document.getElementById('hide');

			if (password.type == 'text') {
				password.type = 'password';
				hide.style.display = 'block';
				show.style.display = 'none';
			} else {
				password.type = 'text';
				show.style.display = 'block';
				hide.style.display = 'none';
			}

		}
	</script>
</body>
</html>
