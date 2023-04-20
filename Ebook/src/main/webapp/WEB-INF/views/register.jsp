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
<link rel="icon" href="img/icon2.png" type="image/png" class="icon">

<title>EBook: Register</title>
<%@include file="all_component/allCss.jsp"%>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<link href="loginRegister/styleLoginRegister.css" rel="stylesheet">
<!-- <link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">  -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">



<%@include file="all_component/allCss.jsp"%>


<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>

<script type="text/javascript">
	function check() {
		var email = $('#email').val();

		var currentPassword = $('#currentPassword').val();
		var newPassword = $('#newPassword').val();
		var confirmPassword = $('#confirmPassword').val();

		console
				.log("currentPassword: " + currentPassword + " email : "
						+ email);
		console.log("newPassword: " + newPassword + " confirmPassword : "
				+ confirmPassword);

		$.ajax({
			type : 'GET',
			data : {
				email : email,
				currentPassword : currentPassword,
				newPassword : newPassword,
				confirmPassword : confirmPassword,

			},
			url : 'changePassword',
			success : function(result) {
				$('#result').html(result)
			}
		})
	}
</script>

</head>
<body>

	<%-- <%@include file="all_component/navbar.jsp"%> --%>

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
					<span><img alt=""
						style="width: 20%; height: 20%" src="img/icon1.png"></span>
					  <img src="img/ebook1.png" width="150px">   
					
					<!-- <span><img alt=""
				style="width: 5%; height: 5%" src="img/icon1.png"></span>
			 
				 <span><img alt="" style="width: 10%; height: 10%" src="img/ebook1.png"></span>  -->
				 
				</div>
				<div class="text-center mb-4">
					<h4>Create an account</h4>
				</div>

				<br> <span class="text-center text-danger" id="result"></span>

				<!-- Begin Register Servlet - Xu ly form DangKi  -->

				<c:if test="${ not empty succMsg }">
					<p class="text-center text-success">${succMsg }</p>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${ not empty failedMsg }">
					<p class="text-center text-danger">${failedMsg }</p>
					<c:remove var="failedMsg" scope="session" />
				</c:if>


				<!-- End Register Servlet - Xu ly form DangKi  -->



				<!-- Form -->
				<form action="register" method="post" class="px-3">
					<!-- Input Box -->
					<div class="form-input">
						<span><i class="fa fa-user"></i></span> <input type="text"
							name="fname" placeholder="Full Name" tabindex="10" required>
					</div>
					<div class="form-input">
						<span><i class="fa fa-envelope"></i></span> <input type="email"
							name="email" placeholder="Email Address" tabindex="10" required onchange="check()">
					</div>
					<div class="form-input">
						<span><i class="fa-solid fa-phone-volume"></i></span> <input
							type="number" name="phno" placeholder="Phone"
							tabindex="10" required>
					</div>
					<div class="form-input">
						<span><i class="fa fa-lock"></i></span> <input type="password"
							name="password" placeholder="Password" required id="password">


						<span><i id="hide" onclick="changeTypePassword()"
							class="fas fa-eye-slash"></i></span> <span><i id="show"
							style="display: none;" onclick="changeTypePassword()"
							class="fa-solid fa-eye"></i></span>

					</div>

					<!-- <div class="mb-3 d-flex align-items-center">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="check"
								id="exampleCheck1"> <label class="custom-control-label"
								for="cb1">I agree all terms & conditions</label>
						</div>
					</div> -->

					<div class="form-check">
						<input type="checkbox" class="form-check-input" name="check"
							id="exampleCheck1"> <label class="form-check-label"
							for="exampleCheck1">Agree terms & Condition</label>
					</div>

					<!-- Register Button -->
					<div class="mb-3">
						<button type="submit" class="btn btn-block">Register</button>
					</div>
					<div class="text-center mb-2">
						<div class="text-center mb-3" style="color: #777;">or
							register with</div>

						<!-- Facebook Button -->
						<a href="" class="btn btn-social btn-facebook"><i
							class="fa-brands fa-facebook-f"></i></a>

						<!-- Google Button -->
						<a href="" class="btn btn-social btn-google"><i
							class="fa-brands fa-google"></i></a>

						<!-- Twitter Button -->
						<a href="" class="btn btn-social btn-twitter"><i
							class="fa-brands fa-twitter"></i></a>

					</div>
					<div class="text-center mb-5" style="color: #777;">
						Already have an account? <a class="login-link" href="/Ebook/login">Login
							here</a>
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
