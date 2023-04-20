<%@page import="com.example.ebook.entity.OrderDetails"%>
<%@page import="com.example.ebook.dao.OrderDetailsDAOImpl"%>
<%@page import="com.example.ebook.entity.Book_Order"%>
<%@page import="com.example.ebook.dao.BookOrderImpl"%>
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
<title>Admin : All Orders</title>

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/favicon.png" type="image/png" class="icon">
 
 
<%@include file="allCss.jsp"%>

<style type="text/css">
 	.bold {
 		font-weight: bold;
 		text-align: center;
 	}
 	.text { 
 		text-align: center;
 	}
</style>

</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	
	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->



	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	
	<!-- <h3 class="text-center p-3">Hello Admin</h3> -->



 	<div class="container " style="margin-top: 1%">
 	
 	<!-- <a href="setting.jsp">
		<i class="fas fa-caret-square-left" style="font-size: 347%; background: #f7f7f7; color: green;"></i>
	</a> -->

		<!-- <div class="row"> -->
			<div class=""> 
				<div class="card bg-white" style="width: 130%; margin-left: -15%" >
					<div class="card-body">
					
					<h1 class="text-center text-success" style="font-weight: bold;">ALL ORDERS</h1>
					 
					<c:if test="${not empty succMsg }">
						<div class="text-center alert alert-success" role="alert">${succMsg }</div>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty failedMsg }">
						<div class="text-center alert alert-danger text-center" role="alert">${failedMsg }</div>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

<br><br>
					<table class="table table-striped"  >
					
							<thead>
								<tr style="background: #5acce6;color: white;">
									<th scope="col"><h2 class="bold" >Order Id</h2></th>
									<th scope="col"><h2 class="bold" >Name</h2></th>
									<th scope="col"><h2 class="bold" >Email</h2></th>
									<th scope="col"><h2 class="bold" >Address</h2></th>
									<th scope="col"><h2 class="bold" >Ph No</h2></th>
									<th scope="col"><h2 class="bold" >Book Name</h2></th>
									<th scope="col"><h2 class="bold" >Author</h2></th>
									<th scope="col"><h2 class="bold" >Price</h2></th>
									<th scope="col"><h2 class="bold" >Payment type</h2></th>
								</tr>
							</thead>
							<tbody>

							<%
							BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
							List<Book_Order> blist = dao.getAllOrder();
							for (Book_Order b : blist) {
								 OrderDetailsDAOImpl dao1 = new OrderDetailsDAOImpl (DBConnect.getConn());
								 OrderDetails bookOrder = dao1.getOrderDetailsById(b.getOrderId());
							%>

							<tr  > 
									<th scope="row"><h3 class="text"><%=b.getOrderId()%></h3></th> 
									<td><h3 class="text"><%=b.getUserName()%></h3></td> 

									<td><h3 class="text"><%=b.getEmail()%></h3></td>
									<td><h3 class="text"><%=b.getFulladd()%></h3></td>
									<td><h3 class="text"><%=b.getPhno()%></h3></td>
									<td><h3 class="text"><%=bookOrder.getBookName()%></h3></td> 
									<td><h3 class="text"><%=bookOrder.getAuthor()%></h3></td>  
									<td><h3 class="text"><%=b.getPrice()%></h3></td>
									<td><h3 class="text"><%=b.getPaymentType()%></h3></td>
								</tr>

								<%
								}
								%> 

							</tbody>
						</table>
					</div>
				</div>
			</div>
			</div>



	<%-- <table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Ph No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>
		
		
				<%
			 
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getAllOrder();
				for (Book_Order b : blist) {
					 OrderDetailsDAOImpl dao1 = new OrderDetailsDAOImpl (DBConnect.getConn());
					 OrderDetails bookOrder = dao1.getOrderDetailsById(b.getOrderId());
				%>
				<tr>
				
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getFulladd()%></td>
					<td><%=b.getPhno()%></td>
					<td><%=bookOrder.getBookName()%></td>
					<td><%=bookOrder.getAuthor()%></td>  
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>

				</tr>
				<%
				}
				%>
				
			 
		</tbody>
	</table> --%>


</body>
</html>