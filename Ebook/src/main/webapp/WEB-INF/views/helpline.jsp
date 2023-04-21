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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="../img/icon2.png" type="image/png" class="icon">
 
<title>Ebook: Setting - HelpLine</title>
<%@include file="all_component/allCss.jsp"%>

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

	<%@include file="all_component/navbar.jsp"%>

<%
	User u = (User) session.getAttribute("userobj");
	%>
	
	
	<div class="container" style="margin-top: 10%">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 text-center">
				<div class="text-success">
					<i class="fas fa-phone-square-alt fa-7x"></i>
				</div>
				<h1 style="font-weight: bold;">24*7 Service</h1>
				<h2>Help Line Number</h2>
				<h3>+0671 869899023</h3>
				<!-- <a href="/Ebook/" class="btn btn-primary" style="font-weight: bold;">Home</a> -->
				
				<div class="text-center text-white">
             
								<a href="/Ebook/setting" class="btn btn-warning" style="background: orange;">Setting Now</a>
								
								<a href="/Ebook/" class="btn btn-success p-2"> Continue Shopping</a>
			    </div>
			
			</div>
		</div>

	</div>
 
			

	<%@include file="all_component/footer.jsp"%>

</body>
</html>