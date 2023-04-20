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
<meta >

<!-- BIEU TUONG TRANG WEB -->
<link rel="icon" href="img/icon2.png" type="image/png" class="icon">
<!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
	
<title>Ebook: Index</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>

<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
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
<body style="background-color: while;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
 
	<!-- <div class="container-fluid back-img p-5">
		text-success 
		<h2 class="text-center text-orange">EBook Management System</h2>
	</div> -->
 
	<section id="carouselExampleIndicators" class="home carousel slide"
		data-ride="carousel">

		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>

		<div class="slides-container carousel-inner">


			<div class="slide active carousel-item">
				<div class="content d-block">
					<span>Immerse in literary meaning</span>
					<h3>On every page of the book</h3>
					<a href="#" class="btn">Shop now</a>
				</div>
				<div class="image">
					<img src="image/home-img-1.jpg" alt="">
				</div>
			</div>

			<div class="slide carousel-item">
				<div class="content d-block">
					<span>Foreign language bookcase to help you improve </span>
					<h3>Level every day</h3>
					<a href="#" class="btn">shop now</a>
				</div>
				<div class="image">
					<img src="image/home-img-2.jpg" alt="">
				</div>
			</div>

			<div class="slide carousel-item">
				<div class="content d-block">
					<span>Change every day </span>
					<h3>For a better life</h3>
					<a href="#" class="btn">shop now</a>
				</div>
				<div class="image">
					<img src="image/home-img-3.jpg" alt="">
				</div>
			</div>


		</div>

		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>

	</section>

    
<section class="banner-container">

    <div class="banner">
        <img src="image/banner-1.png" alt="">
        <div class="content">
            <span>Top of the book  <br> series</span>
            <h3>Revise</h3>
            <a href="#" class="btn">shop now</a>
        </div>
    </div>

    <div class="banner">
        <img src="image/banner-2.png" alt="">
        <div class="content">
            <span>Health care</span>
            <h3>Scientific <br> standards</h3>
            <a href="#" class="btn">shop now</a>
        </div>
    </div>

    <div class="banner">
        <img src="image/banner-3.png" alt="">
        <div class="content">
            <span>Review</span>
            <h3>Exam <br>preparation</h3>
            <a href="#" class="btn">shop now</a>
        </div>
    </div>

</section>


	<%-- <% Connection conn = DBConnect.getConn();
  out.println (conn );%> --%>
  
  
   <hr style="width: 25%; margin-left: 38%">


<!-- popular section starts  -->

<section class="popular" id="popular" style="margin-top:-8%">

    <div class="heading">
        <span>Recent Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container">

     		<% 
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b2 : list2) {
			%>
			
			
        <div class="box">
         
            
            				<%
							if (u == null) {
							%>
							     <a href="#" class="fas fa-heart"></a>
							<%
							} else {
							%>
							
							<a href="favourite?bid=<%=b2.getBookId()%>&&uid=<%=u.getId()%>" class="fas fa-heart"></a>
							
							<%
							}
							%>
							
            <div class="image">
                <img src="book/<%=b2.getPhotoName()%>" alt="">
            </div>
            
            <div class="content">
                <h3><%=b2.getBookName()%></h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                    <span> (50) </span>
                </div>
                <div class="price">$<%=b2.getPrice()%><span>  $50.00</span></div>
                <!-- <a href="#" class="btn">add to cart</a>  -->
               
						 
			<!-- <h5> -->

						<%
						if (b2.getBookCategory().equals("Old")) {
						%>

							<%-- Categories: <%=b2.getBookCategory()%></h5> --%>
						<div class="row" style="margin-left: 25%">
							<a href="view_books.jsp?id=<%=b2.getBookId()%>" class="btn btn-success btn-sm ml-5"><i class="fas fa-eye"></i></a>  
						</div>

						<%
						} else {
						%>
						
						    <%-- Categories: <%=b2.getBookCategory()%></h5> --%>
						<div style="text-align: center; margin-left: 17%" class="row" >


							<!-- NEU CHUA DANG NHAP VAO WEBSITE => KHONG CHO PHEP THEM VAO GIO HANG => DI CHUYEN VE TRANG LOGIN -->
							<%
							if (u == null) {
							%>
							     <a href="/Ebook/login" class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i></a>
							<%
							} else {
							%>
							
							<!--  NGUOC LAI NEU DA DANG NHAP VAO TAI KHOAN => DI CHUYEN DEN TRANG CARTSERVLET ( XU LY SU KIEN THEM SAN PHAM VAO GIO HANG )-->
							<a href="cart?bid=<%=b2.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i></a>

							<%
							}
							%>

							<a style="margin-left: 5%" href="view_books.jsp?id=<%=b2.getBookId()%>" class="btn btn-success btn-sm"><i class="fas fa-eye"></i></a> 
						</div>
						
						<%
						}
						%>
			
			
		
            </div>
        </div>
        
        <%} %>

         
	</div>

    <div class="text-center mt-7"  >
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-while">View All</a>
		</div> 
		
	<!--  End Recent Book-->
	
</section>

<!-- popular section ends -->





<!-- about section starts  -->

<section class="about" id="about">

    <div class="image">
        <img src="image1/about-img.jpg" alt="">
    </div>

    <div class="content">
        <span>why choose us?</span>
        <h3 class="title">Lots of good books filled with gifts!</h3> 
        <p>Thinking orientation, career development, professional bookcases provide knowledge to help you succeed</p>
        <a href="#" class="btn">read more</a>
        <div class="icons-container">
            <div class="icons">
                <img src="image1/serv-1.png" alt="">
                <h3>Fast delivery</h3>
            </div>  
            <div class="icons">
                <img style="width: 20%; height: 65%" src="image1/serv-2.jpg" alt="">
                <h3>Good book</h3>
            </div>   
            <div class="icons">
                <img src="image1/serv-3.png" alt="">
                <h3>Best quality</h3>
            </div>  
            <div class="icons">
                <img src="image1/serv-4.png" alt="">
                <h3>24/7 support</h3>
            </div>           
        </div>
    </div>

</section>

<!-- about section ends -->





<!-- SAN PHAM BEGINS PRODUCT SHOP  -->
	<section class="products">

		<h1 class="title">
			New <span>Book</span> <a  href="all_new_book.jsp" >View All >></a>
		</h1>

		<div class="box-container">


           <%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			
			
			<div class="box">
			 				
			
				<div class="icons">
				<!-- NEU CHUA DANG NHAP VAO WEBSITE => KHONG CHO PHEP THEM VAO GIO HANG => DI CHUYEN VE TRANG LOGIN -->
			
				           <%
							if (u == null) {
							%>
					<a href="/Ebook/login" class="fas fa-shopping-cart"></a> 
					<%
							} else {
							%>
							<!--  NGUOC LAI NEU DA DANG NHAP VAO TAI KHOAN => DI CHUYEN DEN TRANG CARTSERVLET ( XU LY SU KIEN THEM SAN PHAM VAO GIO HANG )-->
							<a  href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="fas fa-shopping-cart"></a> 
						<%
							}
							%>
							
						<%
							if (u == null) {
							%>
							     <a href="#" class="fas fa-heart"></a>
							<%
							} else {
							%>
							
							<a href="favourite?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="fas fa-heart"></a>
							
							<%
							}
							%>
					<a href="view_books.jsp?id=<%=b.getBookId()%>" class="fas fa-eye"></a>
				</div>
				
				
				<div class="image">
					<img src="book/<%=b.getPhotoName()%>" alt="">
				</div>
				<div class="content">
					<h3><%=b.getBookName()%></h3>
					<div class="price">$<%=b.getPrice()%></div>
					<div class="stars">
						<i class="fas fa-star"></i> 
						<i class="fas fa-star"></i> 
						<i class="fas fa-star"></i> 
						<i class="fas fa-star"></i> 
						<i class="far fa-star"></i>
					</div>
				</div>
			</div>

            <%
			}
			%>
			
		</div>

	</section>

<!-- SAN PHAM END PRODUCT SHOP  -->



	<hr>

 
<!-- menu section starts  -->

<section class="menu" id="menu" style="margin-top:-8%">

    <div class="heading">
        <span>Old Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container">

            <%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b2 : list3) {
			%>
			
        <a href="view_books.jsp?id=<%=b2.getBookId()%>" class="box">
            <img src="book/<%=b2.getPhotoName()%>" alt="">
            <div class="content">
                <h3><%=b2.getBookName()%></h3>
                <div class="price">$<%=b2.getPrice()%></div>
            </div>
        </a>

           <%
			}
			%>
    </div>

    <div class="text-center mt-7"  >
			<a href="all_old_book.jsp"
				class="btn btn-danger btn-sm text-while">View All</a>
		</div> 
	 
</section>

<!-- menu section ends -->

	 <hr style="width: 25%; margin-left: 38%">
	 
	
<!-- blogs section starts  -->

<section class="blogs" id="blogs" style="margin-top:-8%">

    <div class="heading">
        <span>Our blogs</span>
        <h3>Our daily stories</h3>
    </div>

    <div class="box-container">

        <div class="box">
            <div class="image">
                <h3> <i class="fas fa-calendar"></i>06/05/2020</h3>
                <img src="image1/blog-1.png" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Book / </a>
                    <a href="#"> <i class="fas fa-tag"></i> News / </a>
                    <a href="#"> <i class="fas fa-tag"></i> Event  </a>
                </div>
                <h3>How to distinguish real and fake books accurately?</h3>
                <p>So that readers, parents, students and teachers...<br> do not buy fake reference books, pirated books, etc......</p>
                <a href="about.jsp" class="btn">Read more</a>
            </div>
        </div>


        <div class="box">
            <div class="image">
                <h3> <i class="fas fa-calendar"></i> 26/05/2020 </h3>
                <img src="image1/blog-2.png" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i>  Book / </a> 
                    <a href="#"> <i class="fas fa-tag"></i> News / </a>
                    <a href="#"> <i class="fas fa-tag"></i> Event  </a>
                </div>
                <h3>How to use Edu Book discount code</h3>
                <p>Once you get the code, of course you have to know how to use it. Basically, EduBook allows you to use the same</p>
                <a href="about.jsp" class="btn">Read more</a>
            </div>
        </div>

        <div class="box">
            <div class="image">
                <h3> <i class="fas fa-calendar"></i> 22/05/2020 </h3>
                <img src="image1/blog-3.png" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Book / </a>
                    <a href="#"> <i class="fas fa-tag"></i> News / </a>
                    <a href="#"> <i class="fas fa-tag"></i> Event  </a>
                </div>
                <h3>Instructions for returning books, refunding Edu Book</h3>
                <p>Purchased on Edu Book but the product you received is not the same as the picture, the product is defective. You think you've been tricked,...</p>
                <a href="about.jsp" class="btn">Read more</a>
            </div>
        </div>

    </div>

</section>

<!-- blogs section ends --> 
	 
	 
	<%@include file="all_component/footer.jsp"%>

<script>
    function formSubmit(){
        var name = document.getElementById("name").value;
        var message = document.getElementById("message").value;
        var dataString = 'name='+ name + '&message=' + message;
        jQuery.ajax({
            url: "submit.php",
            data: dataString,
            type: "POST",
            success: function(data){
                $("#myForm").html(data);
            },
            error: function (){}
        });
    return true;
    } 
    

    /* function next(){
    	
    	let slides = document.querySelectorAll('.home .slides-container .slide');
        let index = 0;
        
    	console.log ("jjjjjjjjjjjj");
        slides[index].classList.remove('active');
        index = (index + 1) % slides.length;
        slides[index].classList.add('active');
    }

    function prev(){
    	let slides = document.querySelectorAll('.home .slides-container .slide');
        let index = 0;
        
        slides[index].classList.remove('active');
        index = (index - 1 + slides.length) % slides.length;
        slides[index].classList.add('active');
    } */
    
</script> 
  
  
<!-- custom css file link  -->
<script src="js/script.js"></script>

<!-- custom js file link  -->
<script src="js/script1.js"></script>

</body>
</html>