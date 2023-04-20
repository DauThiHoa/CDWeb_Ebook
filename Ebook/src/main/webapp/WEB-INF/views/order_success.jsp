<%@page import="com.example.ebook.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.example.ebook.connect.DBConnect"%>
<%@page import="com.example.ebook.dao.CartDAOImpl"%>
<%@page import="com.example.ebook.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_component/allCss.jsp"%>

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/icon2.png" type="image/png" class="icon">
 
<title>EBook: Order Success</title>

<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="text-center" style="margin-top: 8%">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Successfully</h2>
		<h5>With in 7 Days Your Product will be Delivered In Your Address</h5>
		<a href="Ebook" class="btn btn-primary mt-3">Home</a> <a
			href="order.jsp" style="background: orange;" class="btn btn-danger mt-3">View Order</a>
	</div>

<%@include file="all_component/footer.jsp"%>
</body>
</html>