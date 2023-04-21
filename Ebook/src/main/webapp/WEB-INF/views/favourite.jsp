<%@page import="com.example.ebook.entity.Favourite"%>
<%@page import="com.example.ebook.dao.FavouriteDAOImpl"%>
<%@page import="com.example.ebook.entity.OrderDetails"%>
<%@page import="com.example.ebook.dao.OrderDetailsDAOImpl"%>
<%-- <%@page import="org.apache.coyote.Request"%> ================================================================== --%>
<%@page import="com.example.ebook.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.example.ebook.connect.DBConnect"%>
<%@page import="com.example.ebook.dao.CartDAOImpl"%>
<%@page import="com.example.ebook.entity.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
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

<!-- BIEU TUONG TRANG WEB -->
<link rel="icon" href="../img/icon2.png" type="image/png" class="icon">

<title>EBook: Favourite Page</title>
<%@include file="all_component/allCss.jsp"%>


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  --> 
<link rel="stylesheet" href="../css/style1.css">
<link rel="stylesheet" href="../css/style.css">

<script type="text/javascript" src="../scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="../scripts/jquery-ajax.js"></script>
<script>
  
</script>

<%@include file="all_component/allCss.jsp"%>
</head>

<!-- AJAX - Update Quantity -->



<body style="background-color: #f0f1f2;">

	 <%@include file="all_component/navbar.jsp"%> 



	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->



	<c:if test="${empty userobj }">
		<c:redirect url="/Ebook/login" />
	</c:if>
	 
  
	<div class="container " style="margin-top: 8%">
		<!-- <div class="row"> -->
			<div class=""> 
				<div class="card bg-white p-2"  >
					<div class="card-body">
					
					<h1 class="text-center text-success">Your Selected Item</h1>
					  
					 
					<c:if test="${not empty succMsg }">
						<div class="text-center alert alert-success" role="alert">${succMsg }</div>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty failedMsg }">
						<div class="text-center alert alert-danger text-center" role="alert">${failedMsg }</div>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

<br><br>
					 
						
						<table class="table table-striped">
					
							<thead>
								<tr>
									<th scope="col"><h2>Image</h2></th>
									<th scope="col"><h2>Book Name</h2> </th>
									<th scope="col"><h2>Author</h2> </th> 
									<th scope="col"><h2>Price</h2> </th>  
									<th scope="col"><h2>View</h2> </th>
									<th scope="col"><h2>Delete</h2> </th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj"); 
					            
								FavouriteDAOImpl dao = new FavouriteDAOImpl(DBConnect.getConn());
								List<Favourite> list = dao.getBookByFavourite(u.getId());
								    /* Double total = 0.0; */
									for (Favourite f  : list) { 
									     /* total += c.getPrice(); */
								%>


								<tr style="" >
								<a href="/Ebook/view_books?id=<%=f.getBid()%>"> 
									<th style="margin: auto;" scope="row"><img alt="" src="../book/<%=f.getPhotoName()%>"
										style="width: 100px; height: 120px"></th>
								</a>
									<th scope="row"><br> <br><br><h3 style=""><%=f.getBookName()%></h3></th>
									<td><br> <br><br><h3 style=""><%=f.getAuthor()%></h3></td>
  
									<td><br> <br><br><h3 style=""><%=f.getPrice()%></h3></td> 
									
									<td><br> <br><br>
									
										<a style="margin-left: 5%" href="/Ebook/view_books?id=<%=f.getBid()%>"
									 class="btn btn-success btn-sm"><i class="fas fa-eye"></i></a>
									</td> 
									
									<td><br> <br><br>
										<a style="margin-top: 4%; background: red"
										href="remove_favourite?bid=<%=f.getBid()%>&&uid=<%=f.getUid()%>"
										class="btn btn-sm btn-danger" ><i class="fas fa-trash-alt"></i></a>
										  
										</td> 
									<!-- <td><a style=" background: red"
										href=""
										class="btn btn-sm btn-danger" ><i class="fas fa-trash-alt"></i></a></td> -->
									 
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
             
								<!-- <a href="order.jsp" class="btn btn-warning" style="background: orange;">Order Now</a> -->
								
								<a href="/Ebook/" class="btn btn-success p-2"> Continue Shopping</a>
			</div>

<%@include file="all_component/footer.jsp"%>

	<script type="text/javascript">
 
function edit_Quantity()() {
	alert("editQuantity");
}


</script>
  
<!-- custom css file link  -->
<script src="../js/script.js"></script>

<!-- custom js file link  -->
<script src="../js/script1.js"></script>

</body>

</html>