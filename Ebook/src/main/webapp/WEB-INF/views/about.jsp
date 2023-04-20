<!DOCTYPE jsp>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>about</title>
<link rel="icon" href="img/icon2.png" type="image/png" class="icon">
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
	
	<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@include file="all_component/allCss.jsp"%>

<!-- custom css file link  -->
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
    
<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>



<div class="heading heading1" style="margin-top: 3%">
    <h1>about us</h1>
    <p> <a href="index.jsp">home >></a> about </p>
</div>


<section class="info-container" style="margin-top: -3%; margin-left: 8%">

    <div class="info">
        <img src="image/icon-1.png" alt="">
        <div class="content">
            <h3>fast delivery</h3>
            <span>within 30 minutes</span>
        </div>
    </div>

    <div class="info">
        <img src="image/icon-2.png" alt="">
        <div class="content">
            <h3>24 / 7 available</h3>
            <span>call us anytime</span>
        </div>
    </div>

    <div class="info">
        <img src="image/icon-3.png" alt="">
        <div class="content">
            <h3>easy payments</h3>
            <span>cash or credits</span>
        </div>
    </div>

</section>

<section class="about">

    <div class="image">
        <img src="image/about-img.jpg" alt="">
    </div>

    <div class="content">
        <span>Welcome to our shop</span>
        <h3>The source of knowledge</h3>
        
        <p> EBook is a store that always provides you with knowledge and passion for reading all over the country.</p>
        <p>We will continuously update the best, newest and best quality books to help readers have books. Best to read!</p>
        <a href="#" class="btn">read more</a>
    </div>

</section>



<section class="review">

    <div class="box">
        <div class="user">
            <img src="image/design2.jpg" alt="">
            <div class="info">
                <h3>Dau Hoa</h3>
                <span>Design The Theme</span>
            </div>
        </div>
        <p> Dynamic, enthusiastic, persistent, hard-working, able to withstand pressure and high work intensity. 
        Have a sense of responsibility, honesty, will to progress, eager to research and learn to improve professional skills. 
        Respect, listen and be humble.</p>
    </div>

    <div class="box">
        <div class="user">
            <img src="image/pic-2.png" alt="">
            <div class="info">
                <h3>My Dung</h3>
                <span>Design The Theme</span>
            </div>
        </div>
        <p>Have a positive attitude, learn quickly, don't be afraid of difficulties, don't be afraid to change to perfect yourself to the best of your ability as a designer.
         Ability to arrange work, meet deadlines, be organized, be able to work under high pressure when implementing many projects at the same time.
          Able to work well independently as well as in a team.</p>
    </div>

     
</section>


<section class="gallery">

    <h1 class="title"> our <span>gallery</span> <a href="#">view all >></a> </h1>

    <div class="box-container">

        <div class="box">
            <img src="image/gallery-img-1.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-eye"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-share-alt"></a>
            </div>
        </div>

        <div class="box">
            <img src="image/gallery-img-2.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-eye"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-share-alt"></a>
            </div>
        </div>

        <div class="box">
            <img src="image/gallery-img-3.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-eye"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-share-alt"></a>
            </div>
        </div>

        <div class="box">
            <img src="image/gallery-img-4.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-eye"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-share-alt"></a>
            </div>
        </div>

       <!--  <div class="box">
            <img src="image/gallery-img-5.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-eye"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-share-alt"></a>
            </div>
        </div>

        <div class="box">
            <img src="image/gallery-img-6.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-eye"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-share-alt"></a>
            </div>
        </div> -->

    </div>

</section>





 


<!-- footer section starts  -->

	<%@include file="all_component/footer.jsp"%>
<!-- footer section ends -->

 


<!-- custom css file link  -->
<script src="js/script.js"></script>
<!-- custom js file link  -->
<script src="js/script1.js"></script>

</body>
</html>