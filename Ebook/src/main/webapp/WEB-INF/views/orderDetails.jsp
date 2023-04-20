<%@page import="com.example.ebook.entity.OrderDetails"%>
<%@page import="com.example.ebook.dao.OrderDetailsDAOImpl"%>
<%-- <%@page import="org.apache.coyote.Request"%> ===================================================================== --%>
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
<link rel="icon" href="img/icon2.png" type="image/png" class="icon">

<title>EBook: Cart Page</title>
<%@include file="all_component/allCss.jsp"%>


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<!-- <link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style.css">  -->

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
		<c:redirect url="login.jsp" />
	</c:if>
  
  
	<div class="container " style="margin-top: 8%">
		<!-- <div class="row"> -->
			<div class=""> 
				<div class="card bg-white"  >
					<div class="card-body">
					
					<h1 class="text-center text-success">Your Selected Item</h1>
					 
					 <h1>${id}</h1>
					 
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
									<th scope="col"><h2 style="margin-left: 27%">Quantity</h2> </th>
									<th scope="col"><h2>Price</h2> </th>
									<th scope="col"><h2>Total</h2> </th> 
								</tr>
							</thead>
							<tbody>
<%-- 
								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.0;
								for (Cart c : cart) {
									totalPrice += c.getTotalPrice();
								%> --%>
								
								 <%
								 
    							String order_id = request.getParameter("order_id");
            					OrderDetailsDAOImpl dao = new OrderDetailsDAOImpl (DBConnect.getConn());
            					List<OrderDetails> list = dao.list(order_id);
            					
            					Double totalPrice = 0.0; 
            					for (OrderDetails o : list) {
            						totalPrice += o.getTotal_price();
            				 
								%>

								<tr  >
									<th  scope="row"><img alt="" src="book/<%=o.getImage()%>"
										style="width: 100px; height: 120px"></th>
									<th scope="row"><br> <br><br><h3 style=" "><%=o.getBookName()%></h3></th>
									<td><br> <br><br><h3 style=" "><%=o.getAuthor()%></h3></td>

									<td>
										<form action="updateQuantity" method="get"><br> <br><br>
										<h3 style=" ">
											<input name="quantity" type="number"
												value="<%=o.getQuantity()%>"
												style="width: 50%; text-align: center; margin-left: 17%" readonly> 
												
												</h3>
												 
										</form>
									</td>

									<td><br> <br><br><h3 style=" "><%=o.getPrice()%></h3></td>
									<td><br> <br><br><h3 style=" "><%=o.getTotal_price()%></h3></td>
									<%-- <td><a style="margin-top: 25%; background: red"
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger" ><i class="fas fa-trash-alt"></i></a></td> --%>
								</tr>

								<%
								}
								%>

								<tr>
									<td><h2  style="margin-top: 10%">Total Price</h2></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><h3 style="margin-top: 20%"><%=totalPrice%></h3></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
 </div>
 
									
			<div class="text-center text-white">
             
								<a href="order.jsp" class="btn btn-warning" style="background: orange;">Order Now</a>
								
								<a href="index.jsp" class="btn btn-success"> Continue Shopping</a>
			</div>

<%@include file="all_component/footer.jsp"%>

	<script type="text/javascript">
 
function edit_Quantity()() {
	alert("editQuantity");
}


</script>


</body>

</html>