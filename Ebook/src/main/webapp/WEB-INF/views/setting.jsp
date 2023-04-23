<%@page import="com.example.ebook.entity.User"%>
<%@page import="com.example.ebook.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.example.ebook.dao.BookDAOImpl"%>
<%@page import="com.example.ebook.connect.DBConnect"%>
<%@page import="java.sql.Connection"%>
<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@include file="all_component/allCss.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="../img/icon2.png" type="image/png" class="icon">
 
<title>Ebook: Setting</title>

<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.back-img {
	background: url("img/bak.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

</head>
<body style="background-color: #f7f7f7;">

	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="/Ebook/login" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
  
     


	<div class="container" style="margin-top: 10%">

    
		<c:if test="${not empty userobj }">
			<h1 class="text-center" style="font-weight: bold;">Hello, ${userobj.name }</h1>
		</c:if>
		
		<div class="row p-5" style="margin-top: 2%">


			<div class="col-md-4">
				<a href="/Ebook/sell_book">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary" >
								<i class="fas fa-book-open fa-5x" style="color: #5acce6" ></i>
							</div>
							<h1>Sell Old Book</h1>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="/Ebook/old_book">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-5x" style="color: #e66c30;"></i>
							</div>
							<h1>Old Book</h1>
						</div>
					</div>
				</a>
			</div>
 
			 <div class="col-md-4">
				<a href="/Ebook/edit_profile">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary" style="color: #028fcc">
								<i class="fas fa-edit fa-5x"></i>
							</div>
							<h1>Edit Profile</h1>
						</div>
					</div>
				</a>
			</div>
 
			<div class="col-md-4 mt-4">
				<a href="/Ebook/order">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-5x"></i>
							</div>
							<h1>My Order</h1>
							<h4>Track Your Order</h4>
						</div>
					</div>
				</a>
			</div>
 
			<div class="col-md-4 mt-4">
				<a href="/Ebook/changePassword">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary"  >
								<i class="fas fa-edit fa-5x" style="color: green;"></i>
							</div>
							<h1>Change Password</h1>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-4">
				<a href="/Ebook/helpline">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fas fa-user-circle fa-5x"></i>
							</div>
							<h1>Help Center</h1>
							<h4>24*7 Service</h4>
						</div>
					</div>
				</a>
			</div>
			<!-- END HANG CUOI -->

		</div>
	</div>




	<!--  End Old Book-->

	<%@include file="all_component/footer.jsp"%>
</body>
</html>