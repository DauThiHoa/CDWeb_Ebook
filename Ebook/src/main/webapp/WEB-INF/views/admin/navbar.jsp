
<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
 
  
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>


<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  --> 
<link rel="stylesheet" href="style.css">
 
 
 
 <style type="text/css">
  
  .bold {
    font-weight: bold;
  }
  
 </style>
 
 
	<!-- header section starts  -->

	<header class="header">

		<!--  logo -->
		<div class="logo"> 
		<a href="../index.jsp"  > <span><img alt=""
				style="width: 10%; height: 10%" src="../img/icon1.png"></span> 
				</a>
				<a  href="home.jsp">
				 	<span><img alt="" style="width: 20%; height: 20%" src="../img/ebook2.png"></span> 
				</a>
				 
		</div>
      
		<!--  THANH menu  -->
		<nav style="margin-left: -40%" class="navbar">
			<a href="add_books.jsp"  >Add books</a> 
			<a href="all_books.jsp"  >All books</a>  
			<a href="orders.jsp"   >Orders</a>  
		</nav>



		<c:if test="${not empty userobj }">
 
			<!-- CAC ICON SEARCH - LOGIN  -->
			<div class="icons" >  
				
				</a> <a href="../login.jsp">
					<div id="login-btn" class="fas fa-user"  >
					 
					</div> 

				</a> <a href="" data-toggle="modal" data-target="#exampleModalCenter">
					<div id="login-btn" class="fas fa-sign-in-alt"></div>
					
				</a> <a href="home.jsp">
					<div id="login-btn" class="fas fa-cog"></div>
				</a>
			</div>
			 
			   
			
	<!-- Begin Logout Modal -->

 
		</c:if>


		<c:if test="${empty userobj }">

			<!-- CAC ICON SEARCH - LOGIN  -->
			<div class="icons">
				<div id="menu-btn" class="fas fa-bars"></div>
				<div id="search-btn" class="fas fa-search"></div>

				</a> <a href="../login.jsp">
					<div id="login-btn" class="fas fa-user"></div>
					
				</a> <a href="../register.jsp">
					<div id="login-btn" class="fas fa-user-plus"></div>
					
				</a> <a href="home.jsp">
					<div id="login-btn" class="fas fa-cog"></div>
				</a>
				 
			</div>
			  
		</c:if>
   
	 
		 
			
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
						data-dismiss="modal" style="font-weight: bold;background: green; " >Close</button>
					<a href="../logout" type="button"
						class="btn btn-primary text-white" style="font-weight: bold;background: green;">Logout</a>

				</div>

			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- End Logout Modal -->

 
 	<script src="js/script.js"></script>
	<script src="js/script1.js"></script>
	
	