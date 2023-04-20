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

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/icon2.png" type="image/png" class="icon">
 
<title>Ebook: Setting - OrderBook</title>
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
	User u1 = (User) session.getAttribute("userobj");
	%>
	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->



	<c:if test="${empty userobj }">
		<c:redirect url="/Ebook/login" />
	</c:if>

  
 
 	<div class="container " style="margin-top: 8%">
 	
 	<!-- <a href="setting.jsp">
		<i class="fas fa-caret-square-left" style="font-size: 347%; background: #f7f7f7; color: green;"></i>
	</a> -->

		<!-- <div class="row"> -->
			<div class=""> 
				<div class="card bg-white" style="width: 130%; margin-left: -15%" >
					<div class="card-body">
					
					<h1 class="text-center text-success" style="font-weight: bold;">Your Order</h1>
					 
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
									<th scope="col"><h2>Order Id</h2></th>
									<th scope="col"><h2>User name</h2> </th>
									<th scope="col"><h2>Address</h2> </th>
									<th scope="col"><h2>Phone</h2> </th> 
									<th scope="col"><h2>Price</h2> </th>
									<th scope="col"><h2>Payment</h2> </th> 
									<th scope="col"><h2>Action</h2> </th>
								</tr>
							</thead>
							<tbody>

							<%
							User u = (User) session.getAttribute("userobj");
							BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
							List<Book_Order> blist = dao.getBook(u.getEmail());
							for (Book_Order b : blist) {
							%>

							<tr  >
									<%-- <th  scope="row"><img alt="" src="book/<%=b.getPhotoName()%>"
										style="width: 100px; height: 120px"></th> --%>
									<th scope="row"><h3 style=""><%=b.getOrderId()%></h3></th>
									<td><h3 style=""><%=b.getUserName()%></h3></td> 

									<td><h3 style=""><%=b.getFulladd()%></h3></td>
									<td><h3 style=""><%=b.getPhno()%></h3></td>
									<td><h3 style=""><%=b.getPrice()%></h3></td>
									<td><h3 style=""><%=b.getPaymentType()%></h3></td>
									<%-- href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>"  background: #078660 --%>
									<td> 
										<a style=" "
						 				href="orderDetails.jsp?order_id=<%=b.getOrderId()%>"
										class="btn btn-sm btn-danger"><i class="fas fa-search"></i></a>
										
										</td>
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
			
 
 			<div class="text-center text-white">
             
								<a href="setting.jsp" class="btn btn-warning" style="background: orange;">Setting Now</a>
								
								<a href="Ebook" class="btn btn-success"> Continue Shopping</a>
			</div>
	
	
	<%@include file="all_component/footer.jsp"%>
</body>
</html>