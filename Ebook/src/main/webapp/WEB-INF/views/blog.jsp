<!DOCTYPE jsp>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>blogs</title>
    <!-- BIEU TUONG TRANG WEB -->
<link rel="icon" href="img/icon2.png" type="image/png" class="icon">
 
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<%@include file="all_component/allCss.jsp"%>
    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

    <%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>


<div class="heading" style="margin-top: 3%">
    <h1>our blogs</h1>
    <p> <a href="index.jsp">home >></a> blogs </p>
</div>

<section class="blogs" style="margin-top: -3%">

    <h1 class="title"> our <span>blogs</span> <a href="#">view all >></a> </h1>

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
                <p>So that readers, parents, students and teachers... Do not buy fake reference books, pirated books, etc......</p>
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
                <p>Purchased on Edu Book but the product you received is not the same as the picture. </p>
                <a href="about.jsp" class="btn">Read more</a>
            </div>
        </div>

       <div class="box">
            <div class="image">
                <h3> <i class="fas fa-calendar"></i> 28/05/2020 </h3>
                <img src="image1/blog-4.png" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Book / </a>
                    <a href="#"> <i class="fas fa-tag"></i> News / </a>
                    <a href="#"> <i class="fas fa-tag"></i> Event  </a>
                </div>
                <h3>Tips for hunting discount voucher codes at EBook</h3>
                <p>If you are facing problems with hunting, retrieving, use EduBook voucher codes.  </p>
                <a href="about.jsp" class="btn">Read more</a>
            </div>
        </div>


   <div class="box">
            <div class="image">
                <h3> <i class="fas fa-calendar"></i> 29/05/2020 </h3>
                <img src="image1/blog-5.jpg" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Book / </a>
                    <a href="#"> <i class="fas fa-tag"></i> News / </a>
                    <a href="#"> <i class="fas fa-tag"></i> Event  </a>
                </div>
                <h3>Program to exchange old books for trees</h3>
                <p>The project "Exchange old books - Get green trees" received a great response from everyone.
                 Everyone hurry up to participate in the program "Green Living Festival 2021" 
                 and visit booth D6  </p>
                <a href="about.jsp" class="btn">Read more</a>
            </div>
        </div>
 <div class="box">
            <div class="image">
                <h3> <i class="fas fa-calendar"></i> 30/05/2020 </h3>
                <img src="image1/blog-6.jpg" alt="">
            </div>
            <div class="content">
                <div class="tags">
                    <a href="#"> <i class="fas fa-tag"></i> Book / </a>
                    <a href="#"> <i class="fas fa-tag"></i> News / </a>
                    <a href="#"> <i class="fas fa-tag"></i> Event  </a>
                </div>
                <h3>Collect old books, give new joy to poor children</h3>
                <p>Today, sitting and stacking books that I have just received from Dinh Thien Ly school,
                 they have donated and supported children in remote areas, feeling very happy.  </p>
                <a href="about.jsp" class="btn">Read more</a>
            </div>
        </div>





    </div>

</section>



<!-- footer section starts  -->

	<%@include file="all_component/footer.jsp"%>
<!-- footer section ends -->



<!-- custom css file link  -->
<script src="js/script.js"></script>

</body>
</html>