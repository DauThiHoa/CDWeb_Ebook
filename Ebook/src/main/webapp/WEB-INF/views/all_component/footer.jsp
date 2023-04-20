<!-- footer section starts  -->

<%@page import="com.example.ebook.entity.User"%>
<section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>quick links</h3>
            <a href="index.jsp"> <i class="fas fa-arrow-right"></i> home</a>
            <a href="shop.jsp"> <i class="fas fa-arrow-right"></i> shop</a>
            <a href="about.jsp"> <i class="fas fa-arrow-right"></i> about</a>
            <a href="review.jsp"> <i class="fas fa-arrow-right"></i> review</a>
            <a href="blog.jsp"> <i class="fas fa-arrow-right"></i> blog</a>
            <a href="contact.jsp"> <i class="fas fa-arrow-right"></i> contact</a>
        </div>

        <div class="box">
            <h3>extra links</h3>
            <a href="#"> <i class="fas fa-arrow-right"></i> my order </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> my favorite </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> my wishlist </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> my account </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> terms or use </a>
        </div>

        <div class="box">
            <h3>follow us</h3>
            <a href="#"> <i class="fab fa-facebook-f"></i> facebook </a>
            <a href="#"> <i class="fab fa-twitter"></i> twitter </a>
            <a href="#"> <i class="fab fa-instagram"></i> instagram </a>
            <a href="#"> <i class="fab fa-linkedin"></i> linkedin </a>
            <a href="#"> <i class="fab fa-pinterest"></i> pinterest </a>
        </div>
         

        <div class="box">
            <h3>newsletter</h3>
            <p>subscribe for latest updates</p>
            <form action="subscribe" method="post" > 
							      <input type="email" name="email" placeholder="Enter your email" required > 
							      <input type="submit" value="subscribe" class="btn"> 
                 
            </form  >
            <img src="image/payment.png" class="payment" alt="">
        </div>


    </div>

</section>

<section class="credit">created by mr. web designer | all rights reserved!</section>

<!-- footer section ends -->

