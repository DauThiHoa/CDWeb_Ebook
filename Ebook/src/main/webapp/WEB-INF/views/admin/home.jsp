<%@page import="com.example.ebook.entity.BookDtls"%>
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
<title>Admin : Home</title> 

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/favicon.png" type="image/png" class="icon">
 
 
 
 
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>


<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  --> 
<link rel="stylesheet" href="style.css">
 
 <%@include file="allCss.jsp"%>  
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: orange;
}
 .bold {
    font-weight: bold;
  }
</style>
</head>
<body style="background-color: #f0f1f2">
	 <%@include file="navbar.jsp"%> 
 

<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

<!-- #e1ffd3 -->

	<div class="container" style="margin-top: 10%">
	<c:if test="${not empty userobj }">
			<h1 class="text-center" style="font-weight: bold;">Hello, ${userobj.name }</h1>
		</c:if>
		
		<div class="row p-5">
		 

			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-5x"  style="color: green;"></i><br>
							<h1 class="bold">Add Books</h1>
							<p>--------------</p>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-5x text-danger"></i><br>
							<h1  class="bold">All Books</h1>
							<p>--------------</p>
						</div>
					</div>
				</a>
			</div>
 

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-5x text-warning"></i><br>
							<h1  class="bold">Orders</h1>
							<p>--------------</p>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3">
				<a href="" data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-5x text-primary"></i><br>
							<h1  class="bold">Logout</h1>
							<p>--------------</p>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>



	<!-- Begin Logout Modal -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do You Want Logout</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../logout" type="button"
							class="btn btn-primary text-white">Logout</a>

					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- End Logout Modal -->


	<!--  End Old Book-->
	<div style="margin-top: 150px">
		<%@include file="footer.jsp"%></div>



 	<script src="js/script.js"></script>
	<script src="js/script1.js"></script>
	
	
</body>


</html>