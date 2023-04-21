<%@page import="com.example.ebook.entity.BookDtls"%>
<%@page import="com.example.ebook.dao.BookDAOImpl"%>
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
<title>FOOD WEBSITE</title>
<!-- BIEU TUONG TRANG WEB -->
<link rel="icon" href="../img/icon2.png" type="image/png" class="icon"> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript" src="../scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="../scripts/jquery-ajax.js"></script>


<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="../css/style1.css">
<link rel="stylesheet" href="../css/style.css">


</head>
<body>

	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->



	<%-- <c:if test="${empty userobj }">
		<c:redirect url="/Ebook/login" />
	</c:if> --%>


	<!-- header section starts  -->

	<header class="header">

		<!--  logo -->
		<a href="/Ebook/" class="logo"> <span><img alt=""
				style="width: 15%; height: 15%" src="../img/icon1.png"></span>
			 
				 <span><img alt="" style="width: 22%; height: 22%" src="../img/ebook1.png"></span>
		</a>

		<!--  THANH menu  -->
		<nav style="margin-left: -23%" class="navbar">
			<a href="/Ebook/">home</a> 
			<a href="/Ebook/shop">shop</a> 
 

			<a href="/Ebook/about">about</a> 
		
			<a href="/Ebook/blog">blog</a> 
			<a href="/Ebook/contact">contact</a> 
		</nav>



		<c:if test="${not empty userobj }">
 
			<!-- CAC ICON SEARCH - LOGIN  -->
			<div class="icons" style="margin-right: -6%;">
				<div id="menu-btn" class="fas fa-bars"></div>
				<div id="search-btn" class="fas fa-search"></div>

				<a href="/Ebook/checkout">
					<div id="cart-btn" class="fas fa-shopping-cart"></div>
					
				<a href="/Ebook/favourite">
					<div id="login-btn" class="fas fa-heart"></div> 
				</a>
				
				</a> <a href="/Ebook/login">
					<div id="login-btn" class="fas fa-user"></div>
 

				</a> <a href="" data-toggle="modal" data-target="#exampleModalCenter">
					<div id="login-btn" class="fas fa-sign-in-alt"></div>
					
				</a> <a href="/Ebook/setting">
					<div id="login-btn" class="fas fa-cog"></div>
				</a>
			</div>
			 
	<!-- Begin Logout Modal -->

 
		</c:if>


		<c:if test="${empty userobj }">

			<!-- CAC ICON SEARCH - LOGIN  -->
			<div class="icons" style="margin-right: -6%;">
				<div id="menu-btn" class="fas fa-bars"></div>
				<div id="search-btn" class="fas fa-search"></div>

				</a> <a href="/Ebook/login">
					<div id="login-btn" class="fas fa-user"></div>
				</a> <a href="/Ebook/register">
					<div id="login-btn" class="fas fa-user-plus"></div>
				</a> <a href="/Ebook/setting">
					<div id="login-btn" class="fas fa-cog"></div>
				</a>
			</div>
		</c:if>
   
		<!--  SEARCH -->
		<form class="search-form" action="searchBook" method="post">
		<!-- name="ch" -->
		 
			 <input type="search" placeholder="Search here..." id="search-box" 
			 name="text" aria-label="Search" > 
			  
			  
			  <button type="submit"  style="background: white;"> 
					<span><i  type="submit" style="font-size: 300%; margin-top: 40%; margin-left: -40%;  background: white;" class="fas fa-search"></i></span>
              </button> 
			  
<div class="dropdown">
 
    <button type="submit" class="btn btn-secondary " id="dropdownMenuButton"  
    	data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > 
    				     
  	</button>   
  
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="background: width; 
  						margin-left: -1104%; width: 1207%; height: 1805%;top: 23px;"> 
 
    <table class="table table-striped dropdown-item" style="background:; overflow-y: auto; width: 100%; height: 100%">
					
							<thead style="background: ;">
								<tr style=" width: 100%">
									<th  style="background: ; width: 30%"><p>Image</p></th>
									<th  style="background: ; width: 360%"><p>Book Name</p></th>
									<th  style="background: ; width: 30%"><p>Author</p></th> 
									<th  style="width: 10"><p>Price</p></th> 
								</tr>
							</thead>
							
							<tbody style="background: ;" >

 								<%
 									List<BookDtls> listBook = (List<BookDtls>) session.getAttribute("listBook");
 								    
								/* String search_box = request.getParameter("ch"); 
								BookDAOImpl daoSearch1 = new BookDAOImpl(DBConnect.getConn());
								List<BookDtls> listSearch1 = daoSearch1.getBookBySearch(search_box); */
								
								if ( listBook != null ){
								    Double totalPrice1 = 0.0;
									for (BookDtls c  : listBook) { 
									     totalPrice1 += c.getPrice();
								%>
 
								<tr  >
									<th><img alt="" src="../book/<%=c.getPhotoName()%>" style="width: 100%; height: 100%" ></th>
									<th><p style=""><%=c.getBookName()%></p></th>
									<td><p style=""><%=c.getAuthor()%></p></td> 
									<td><p style="">$<%=c.getPrice()%></p></td>
									 
								  </tr>
 
								<%
								  } 
								}else {
									 
								%>
								<tr  >
									<th><img alt="" src=" " style="width: 100%; height: 100%" ></th>
									<th><p style=""> </p></th>
									<td><p style=""> </p></td> 
									<td><p style=""> </p></td>
									 
								  </tr>
								<%} %>
								 
							</tbody>
						</table> 
  </div>
</div> 
			
		</form>
		 
			
	</header>
 

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
						<a href="/Ebook/logout" type="button"
							class="btn btn-primary text-white">Logout</a>

					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- End Logout Modal -->
	 
	 
	<!-- header section ends -->

	<!-- custom css file link  -->
	<script src="../js/script.js"></script>
	<script src="../js/script1.js"></script>

	<script type="text/javascript">
	
	function searchBook() {
		var search_box = $('#search-box').val(); 
		var dropdown = document.getElementById ('dropdown'); 
		
		/* dropdown.css.display = 'block'; */
		console.log ("search_box: "+ search_box ); 
		
		$.ajax({
			type : 'GET',
			data : {
				search_box : search_box , 
				
			},
			url : 'searchBook',
			success : function(result) {
				$('#result').html(result)
			}
		})
			
	} 

	</script>
</body>
</html>
