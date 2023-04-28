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
<link rel="icon" href="../img/icon2.png" type="image/png" class="icon">
<!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<title>Ebook: Index</title>
   
  <!-- custom css file link  -->
    <link rel="stylesheet" href="../css/style1.css">
    <link rel="stylesheet" href="../css/style.css">
    
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
<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
 
	<!-- <div class="container-fluid back-img p-5">
		text-success 
		<h2 class="text-center text-orange">EBook Management System</h2>
	</div> -->



<!-- header section ends -->

<section class="home">

    <div class="slides-container">

        <div class="slide active">
            <div class="content">
                <span>Immerse in literary meaning</span>
                <h3>On every page of the book</h3>
                <a href="#" class="btn">Shop now</a>
            </div>
            <div class="image">
                <img src="../image/home-img-1.png" alt="">
            </div>
        </div>

        <div class="slide">
            <div class="content">
                <span>Foreign language bookcase to help you improve
 </span>
                <h3>Level every day</h3>
                <a href="#" class="btn">shop now</a>
            </div>
            <div class="image">
                <img src="../image/home-img-2.png" alt="">
            </div>
        </div>

        <div class="slide">
            <div class="content">
                <span>Change every day
 </span>
                <h3>For a better life</h3>
                <a href="#" class="btn">shop now</a>
            </div>
            <div class="image">
                <img src="../image/home-img-3.png" alt="">
            </div>
        </div>

    </div>

    <div id="next-slide" class="fas fa-angle-right" onclick="next()"></div>
    <div id="prev-slide" class="fas fa-angle-left" onclick="next()"></div>

</section>
 
<section class="banner-container">

    <div class="banner">
        <img src="../image/banner-1.png" alt="">
        <div class="content">
            <span>Top of the book  <br> series</span>
            <h3>Revise</h3>
            <a href="#" class="btn">shop now</a>
        </div>
    </div>

    <div class="banner">
        <img src="../image/banner-2.png" alt="">
        <div class="content">
            <span>Health care</span>
            <h3>Scientific <br> standards</h3>
            <a href="#" class="btn">shop now</a>
        </div>
    </div>

    <div class="banner">
        <img src="../image/banner-3.png" alt="">
        <div class="content">
            <span>Review</span>
            <h3>Exam <br>preparation</h3>
            <a href="#" class="btn">shop now</a>
        </div>
    </div>

</section>


	<%-- <% Connection conn = DBConnect.getConn();
  out.println (conn );%> --%>
  
  
  
  
  
  
  
  
  
	<!--  Star Recent Book-->


	<div class="container">
		<h3 class="text-center">Recent Book</h3>


		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<img alt="" src="<%=b2.getPhotoName()%>"
							style="width: 100%; height: 170px" class="img-thumblin">


						<p><%=b2.getBookName()%></p>
						<p><%=b2.getAuthor()%></p>
						<p>

						<%
						if (b2.getBookCategory().equals("Old")) {
						%>

							Categories: <%=b2.getBookCategory()%></p>
						<div class="row">
							<a href="/Ebook/view_books?id=<%=b2.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
						</div>

						<%
						} else {
						%>
						
						    Categories: <%=b2.getBookCategory()%></p>
						<div class="row">


							<!-- NEU CHUA DANG NHAP VAO WEBSITE => KHONG CHO PHEP THEM VAO GIO HANG => DI CHUYEN VE TRANG LOGIN -->
							<%
							if (u == null) {
							%>
							     <a href="/Ebook/login" class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							
							<!--  NGUOC LAI NEU DA DANG NHAP VAO TAI KHOAN => DI CHUYEN DEN TRANG CARTSERVLET ( XU LY SU KIEN THEM SAN PHAM VAO GIO HANG )-->
							<a href="/Ebook/cart?bid=<%=b2.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							}
							%>

							<a href="/Ebook/view_books?id=<%=b2.getBookId()%>" class="btn btn-success btn-sm">View Details</a>
							<a href="" class="btn btn-danger btn-sm"><%=b2.getPrice()%><i class="fas fa-rupee-sign"></i></a>
						</div>
						
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-3">
			<a href="/Ebook/all_recent_book"
				class="btn btn-danger btn-sm text-while">View All</a>
		</div>
	</div>

	<!--  End Recent Book-->
	<hr>




<!-- popular section starts  -->

<section class="popular" id="popular">

    <div class="heading">
        <span>popular food</span>
        <h3>our special dishes</h3>
    </div>

    <div class="box-container">

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <div class="image">
                <img src="../image1/food-1.png" alt="">
            </div>
            <div class="content">
                <h3>delicious food</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                    <span> (50) </span>
                </div>
                <div class="price">$40.00 <span>$50.00</span></div>
                <a href="#" class="btn">add to cart</a>
            </div>
        </div>

   <div class="text-center mt-3">
			<a href="/Ebook/all_recent_book"
				class="btn btn-danger btn-sm text-while">View All</a>
		</div>
	</div>

	<!--  End Recent Book-->
	<hr>

</section>

<!-- popular section ends -->


















	<!--  Star New Book-->


	<div class="container">
		<h3 class="text-center">New Book</h3>

		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="<%=b.getPhotoName()%>"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<!-- ml-1 -->

							<!-- NEU CHUA DANG NHAP VAO WEBSITE => KHONG CHO PHEP THEM VAO GIO HANG => DI CHUYEN VE TRANG LOGIN -->
							<%
							if (u == null) {
							%>
							<a href="/Ebook/login" class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							<!--  NGUOC LAI NEU DA DANG NHAP VAO TAI KHOAN => DI CHUYEN DEN TRANG CARTSERVLET ( XU LY SU KIEN THEM SAN PHAM VAO GIO HANG )-->
							<a href="/Ebook/cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>Add
								Cart</a>

							<%
							}
							%>
							<a href="/Ebook/view_books?id=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-0">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>


	</div>

	<div class="text-center mt-3">
		<a href="/Ebook/all_new_book" class="btn btn-danger btn-sm text-while">View
			All</a>
	</div>
	</div>

	<!--  End New Book-->
	<hr>

	<!--  Star Old Book-->


	<div class="container">
		<h3 class="text-center">Old Book</h3>

		<div class="row">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b2 : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="<%=b2.getPhotoName()%>"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p><%=b2.getBookName()%></p>
						<p><%=b2.getAuthor()%></p>
						<p>
							Categories:
							<%=b2.getBookCategory()%></p>
						<div class="row">
							<a href="/Ebook/view_books?id=<%=b2.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-3">
			<a href="/Ebook/all_old_book" class="btn btn-danger btn-sm text-while">View
				All</a>
		</div>
	</div>

	<!--  End Old Book-->

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
<script src="../js/script.js"></script>

<!-- custom js file link  -->
<script src="../js/script1.js"></script>

</body>
</html>