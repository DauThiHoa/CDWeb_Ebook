<%@page import="com.example.ebook.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.example.ebook.connect.DBConnect"%>
<%@page import="com.example.ebook.dao.BookDAOImpl"%>
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
<meta charset="UTF-8">
<title>Admin : All Books</title>


<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="../admin/img/favicon.png" type="image/png" class="icon">
 
 
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
	
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->
	<c:if test="${empty userobj }">
		<c:redirect url="/Ebook/login" />
	</c:if>
	 
	 
	 
	 
 	<div class="container " style="margin-top: 1%">
 	
 	<!-- <a href="setting.jsp">
		<i class="fas fa-caret-square-left" style="font-size: 347%; background: #f7f7f7; color: green;"></i>
	</a> -->

		<!-- <div class="row"> -->
			<div class=""> 
				<div class="card bg-white" style="width: 130%; margin-left: -15%" >
					<div class="card-body">
					
					<h1 class="text-center text-success" style="font-weight: bold;">ALL BOOKS</h1>
					 
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
									<th scope="col"><h2 class="bold" >ID</h2></th>
									<th scope="col"><h2 class="bold" >Image</h2></th>
									<th scope="col"><h2 class="bold" >Book Name</h2></th>
									<th scope="col"><h2 class="bold" >Author</h2></th>
									<th scope="col"><h2 class="bold" >Price</h2></th>
									<th scope="col"><h2 class="bold" >Categories</h2></th>
									<th scope="col"><h2 class="bold" >Status</h2></th>
									<th scope="col"><h2 class="bold" >Action</h2></th>
								</tr>
							</thead>
							<tbody>

							<%
							BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
							List<BookDtls> list = dao.getAllBooks();
							for (BookDtls b : list) {
							%>

							<tr  > 
									<th scope="row"><h3 class="text"><%=b.getBookId()%></h3></th>
									<td><img class="text" src="../book/<%=b.getPhotoName()%>"
												style="width: 80px; height: 80px"></td>
									<td><h3 class="text"><%=b.getBookName()%></h3></td> 

									<td><h3 class="text"><%=b.getAuthor()%></h3></td>
									<td><h3 class="text"><%=b.getPrice()%></h3></td>
									<td><h3 class="text"><%=b.getBookCategory()%></h3></td>
									<td><h3 class="text"><%=b.getStatus()%></h3></td> 
									<td> 
										<%-- <a style=" "
						 				href="orderDetails.jsp?order_id=<%=b.getOrderId()%>"
										class="btn btn-sm btn-danger"><i class="fas fa-search"></i></a> --%>
										
										<a href="/Ebook/editbooks?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i style="padding: 5%;" class="fas fa-edit"></i>Edit</a> <a href="/Ebook/delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger"><i  style="padding: 5%;" class="fas fa-trash-alt"></i>Delete</a>
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
			
	 
	 
 
	<!--  End Old Book--> 
		<%@include file="footer.jsp"%></div>

</body>
</html>