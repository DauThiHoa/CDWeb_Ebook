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
		<c:redirect url="/Ebook/login" />
	</c:if>

	<!--  HIEN THI THONG BAO XOA SAN PHAM TRONG GIO HANG HAY CHUA-->
  

	<div class="container " style="margin-top: 8%">
		<!-- <div class="row"> -->
			<div class=""> 
				<div class="card bg-white"  >
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
									<th scope="col"><h2 style="margin-left: 27%">Quantity</h2> </th>
									<th scope="col"><h2>Price</h2> </th>
									<th scope="col"><h2>Total</h2> </th>
									<th scope="col"><h2>Action</h2> </th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.0;
								for (Cart c : cart) {
									totalPrice += c.getTotalPrice();
								%>

								<tr >
									<th  scope="row"><img alt="" src="book/<%=c.getImage()%>"
										style="width: 100px; height: 120px"></th>
									<th scope="row">
									<br> <br><br>
									<h3 style=" "><%=c.getBookName()%></h3>
									</th>
									<td><br> <br><br>
									<h3 style=" "><%=c.getAuthor()%></h3>
									</td>

									<td>
										<form action="updateQuantity" method="get"><br> <br><br>
										<h3 style="  ">
											<input name="quantity" type="number"
												value="<%=c.getQuantity()%>"
												style=" width: 50%; text-align: center; margin-left: 17%"> 
												
												</h3>
												<h3 style=" "><input
												type="hidden" name="bid" value="<%=c.getBid()%>"> </h3>
												<h3 style=" "><input
												type="hidden" name="uid" value="<%=c.getUserId()%>"> </h3>
												<h3 style=" "><input
												type="hidden" name="cid" value="<%=c.getCid()%>"></h3>
										</form>
									</td>

									<td><br> <br><br><h3 style=" "><%=c.getPrice()%></h3></td>
									<td><br> <br><br><h3 style=" "><%=c.getTotalPrice()%></h3></td>
									<td><br> <br><br><a style=" background: red"
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger" ><i class="fas fa-trash-alt"></i></a></td>
								</tr>

								<%
								}
								%>

								<tr>
									<td><h2  style=" ">Total Price</h2></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><h3 style=" "><%=totalPrice%></h3></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>


 <div class="contact"> 
 <section class="contact" style="width: 130% ; margin-left: -15%" > 

    
    <div class="row" >

        <form action="order" method="post" >
            <h1 class="text-center text-success">Your Details For Order</h1>
             
			  	 <c:if test="${not empty failedOrder }">
							<h4 class="text-center text-danger">${failedOrder }</h4>
							<c:remove var="failedOrder" scope="session" />
				 </c:if> 
				 <c:if test="${not empty succOrder }">
							<h4 class="text-center text-success">${succOrder }</h4>
							<c:remove var="succOrder" scope="session" />
			  	</c:if>
						  
						 
						<input type="hidden" value="${userobj.id }" name="id">
						 
						 <br><br>
            <div class="inputBox">    
          			 <h4 >Full Name</h4> 
			         <h4 style="margin-right: 40%">Email address</h4>
            </div> 
            
            <div class="inputBox"> 

            		<input placeholder="Name" class="box" type="text"   id="exampleInputEmail1" 
									value="${userobj.name }"  
										name="username" required>
				   <input placeholder="Email address" type="email"
										class="box" id="exampleInputEmail2"  
										value="${userobj.email }" name="email" readonly required>		
							 
			</div>
					 <br>
			 <div class="inputBox">    
          			 <h4 >Phone Number</h4> 
			         <h4 style="margin-right: 44%">Address</h4>
            </div>		 
            <div class="inputBox">   
			       <input placeholder="Phone Number" class="box" type="number"   id="inputEmail4" 
									value="${userobj.phno }" name="phno" required>
										 
				   <input placeholder="Address" type="text"
										class="box" id="inputPassword4"  
										value="${userobj.address }" name="address"   required>		
							 
            </div> 
             <br>
             <div class="inputBox">    
          			 <h4>Landmark</h4> 
			         <h4 style="margin-right: 46%">City</h4>
            </div>
            <div class="inputBox">   
			       <input placeholder="Landmark" class="box" type="text"   id="inputEmail5" 
									value="<%=u.getLandmark()%>" name="landmark" required>
										 
				   <input placeholder="City" type="text"
										class="box" id="inputPassword5" 
										value="<%=u.getCity()%>" name="city"  required>		
							 
            </div> 
             <br>
              <div class="inputBox">    
          			 <h4>State</h4> 
			         <h4 style="margin-right: 43%">Pin code</h4>
            </div>
             <div class="inputBox">   
			       <input placeholder="State" class="box" type="text"   id="inputEmail6" 
									value="<%=u.getState()%>" name="state" required>
										 
				   <input placeholder="Pin code" type="text"
										class="box" id="inputPassword6" 
										value="<%=u.getPincode()%>" name="pincode" required>		
							 
            </div> 
             <br>
             <div class="inputBox">    
          			 <h4>Payment Mode</h4>  
            </div>
             <div class="inputBox" >     
									<select style="width: 100%"  class="box"
									name="payment">
									<option value="noselect">--- Select ---</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							 
            </div> 
            
            <div class="text-center text-white">
            
            					<input type="hidden" class="box" value="<%=u.getId()%>" name="uid" required>
            					<input type="hidden" class="box" value="<%=totalPrice%>" name="total" required>
								<button type="submit" class="btn btn-warning" style="background: orange;">Order Now</button>
								
								<a href="/Ebook/" class="btn btn-success"> Continue
									Shopping</a>
			</div>
							
        </form>
 
   
    </div>

</section> 
			</div>
			 
		</div>
	<!-- </div> -->
	

<%@include file="all_component/footer.jsp"%>

	<script type="text/javascript">
 
function edit_Quantity()() {
	alert("editQuantity");
}


</script>


</body>

</html>