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

<title>EBook: ChangePassword</title>

<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="loginRegister/styleLoginRegister.css" rel="stylesheet">

<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>

<script type="text/javascript">

function check() {
	var email = $('#email').val();
	
	var currentPassword = $('#currentPassword').val();  
	var newPassword = $('#newPassword').val();
	var confirmPassword = $('#confirmPassword').val();
	
	console.log ("currentPassword: "+ currentPassword + " email : " + email);
	console.log ("newPassword: "+ newPassword + " confirmPassword : " + confirmPassword);
	
	$.ajax({
		type : 'GET',
		data : {
			email : email ,
			currentPassword : currentPassword ,
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
					<img src="loginRegister/logo.png" width="150px">
				</div>
				<div class="text-center mb-4">
					<h4>Change Password Account</h4>
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
				<form action="changePassword" method="POST"  class="px-3">
				
				<br> <span class="text-center text-danger" id="result"></span>
				
					<!-- Input Box -->
					<div class="form-input">
						<span><i class="fa fa-envelope"></i></span> <input type="email"
							id="email" aria-describedby="emailHelp"  name="email" placeholder="Email Address"
							tabindex="10" required>
				
				
					</div>

					<div class="form-input">
						<span><i class="fa fa-lock"></i></span> <input type="password"
							id="currentPassword"   name="currentPassword"
							placeholder="Current Password" required onchange="check()">
							 
							 <span><i
							id="hide" onclick="changeTypePassword1()"
							class="fas fa-eye-slash"></i></span> <span><i id="show"
							style="display: none;" onclick="changeTypePassword1()"
							class="fa-solid fa-eye"></i></span>

					</div>

					<div class="form-input">
						<span><i class="fa fa-lock"></i></span> <input type="password"
							id="newPassword" name="newPassword" placeholder="New Password"
							required onchange="check()"> 
							
							<span><i id="hide2"
							onclick="changeTypePassword()" class="fas fa-eye-slash"></i></span> <span><i
							id="show2" style="display: none;" onclick="changeTypePassword()"
							class="fa-solid fa-eye"></i></span>
					</div>

					<!-- BEGIN KIEM TRA DO MANH YEU CUA MAT KHAU -->
					<!-- <div class="indicator">
						<span class="yeu"></span> <span class="binh-thuong"></span> <span
							class="manh"></span>
					</div>
					<div class="text"></div>  -->
					<!-- END KIEM TRA DO MANH YEU CUA MAT KHAU -->

					<div class="form-input">
						<span><i class="fa fa-lock"></i></span> <input type="password"
							id="confirmPassword"  name="confirmPassword"
							placeholder="Confirm New Password" required onchange="check()"> 
							<span><i
							id="hide3" onclick="changeTypePassword3()"
							class="fas fa-eye-slash"></i></span> <span><i id="show3"
							style="display: none;" onclick="changeTypePassword3()"
							class="fa-solid fa-eye"></i></span>

					</div>

					<!-- <div class="row mb-3">
						Remember Box
						<div class="col-auto d-flex align-items-center">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="cb1">
								<label class="custom-control-label" for="cb1">Remember
									me</label>
							</div>
						</div>
					</div> -->
					<!-- Login Button -->

					<div class="mb-3">
						<button type="submit" class="btn btn-block">Change
							Password</button>
					</div>

					<div class="text-center mb-5">
						Already have password <a class="login-link" href="/Ebook/login">Login
							here</a>
					</div>

				</form>
			</div>
			<!-- FORM END -->

			<div class="col-md-1 infinity-right-space"></div>
		</div>
	</div>



	<script type="text/javascript">
		const indicator = document.querySelector(".indicator");
		const input = document.querySelector("input");
		const weak = document.querySelector(".yeu");
		const medium = document.querySelector(".binh-thuong");
		const strong = document.querySelector(".manh");
		const text = document.querySelector(".text");
		const showBtn = document.querySelector(".showBtn");
		let regExpWeak = /[a-z]/;
		let regExpMedium = /\d+/;
		let regExpStrong = /.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/;
		function trigger() {
			if (input.value != "") {
				indicator.style.display = "block";
				indicator.style.display = "flex";
				if (input.value.length <= 3
						&& (input.value.match(regExpWeak)
								|| input.value.match(regExpMedium) || input.value
								.match(regExpStrong)))
					no = 1;
				if (input.value.length >= 6
						&& ((input.value.match(regExpWeak) && input.value
								.match(regExpMedium))
								|| (input.value.match(regExpMedium) && input.value
										.match(regExpStrong)) || (input.value
								.match(regExpWeak) && input.value
								.match(regExpStrong))))
					no = 2;
				if (input.value.length >= 6 && input.value.match(regExpWeak)
						&& input.value.match(regExpMedium)
						&& input.value.match(regExpStrong))
					no = 3;
				if (no == 1) {
					weak.classList.add("active");
					text.style.display = "block";
					text.textContent = "Mật Khẩu Bạn Yếu";
					text.classList.add("weak");
				}
				if (no == 2) {
					medium.classList.add("active");
					text.textContent = "Mật Khẩu Bạn Bình Thường";
					text.classList.add("medium");
				} else {
					medium.classList.remove("active");
					text.classList.remove("medium");
				}
				if (no == 3) {
					weak.classList.add("active");
					medium.classList.add("active");
					strong.classList.add("active");
					text.textContent = "Mật Khẩu Bạn  Mạnh";
					text.classList.add("strong");
				} else {
					strong.classList.remove("active");
					text.classList.remove("strong");
				}
				showBtn.style.display = "block";
				showBtn.onclick = function() {
					if (input.type == "password") {
						input.type = "text";
						showBtn.textContent = "Ẩn";
						showBtn.style.color = "#23ad5c";
					} else {
						input.type = "password";
						showBtn.textContent = "Hiển";
						showBtn.style.color = "#000";
					}
				}
			} else {
				indicator.style.display = "none";
				text.style.display = "none";
				showBtn.style.display = "none";
			}
		}

		function changeTypePassword() {
			const password = document.getElementById('newPassword');
			const show = document.getElementById('show2');
			const hide = document.getElementById('hide2');

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

		function changeTypePassword1() {
			const currentPassword = document.getElementById('currentPassword');
			const show = document.getElementById('show');
			const hide = document.getElementById('hide');

			if (currentPassword.type == 'text') {
				currentPassword.type = 'password';
				hide.style.display = 'block';
				show.style.display = 'none';
			} else {
				currentPassword.type = 'text';
				show.style.display = 'block';
				hide.style.display = 'none';
			}

		}

		function changeTypePassword3() {
			const confirmPassword = document.getElementById('confirmPassword');
			const show = document.getElementById('show3');
			const hide = document.getElementById('hide3');

			if (confirmPassword.type == 'text') {
				confirmPassword.type = 'password';
				hide.style.display = 'block';
				show.style.display = 'none';
			} else {
				confirmPassword.type = 'text';
				show.style.display = 'block';
				hide.style.display = 'none';
			}

		}
	</script>

</body>
</html>
