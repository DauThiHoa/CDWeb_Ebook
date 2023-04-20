<%@page import="com.example.ebook.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE jsp>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
<link rel="icon" href="img/icon2.png" type="image/png" class="icon">
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> 
    
    <!-- custom css file link  --> 
    <link rel="stylesheet" href="css/style1.css">
    <link rel="stylesheet" href="css/style.css">
<%@include file="all_component/allCss.jsp"%>

</head>
<body>
      
    <%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>


<div class="heading" style="margin-top: 2%">
    <h1>Contact us</h1>
    <p> <a href="index.jsp">home >></a> contact </p>
</div>
 
				    <c:if test="${not empty failedMsg }"> 
                
				<!-- begin toast -->
				<!-- ------------------- -->
				<div id="toast">${failedMsg}</div>
				<script type="text/javascript">
showToast ();
function showToast(content) {
	$('#toast').addClass ("display");
	$('#toast').html(content);
	setTimeout (()=>{
		$("#toast").removeClass ("display");
	}, 2000)
}

</script>
				<!-- end toast -->

				<c:remove var="failedMsg" scope="session" />

			</c:if>

				<c:if test="${not empty succMsg }">
					
				<!-- begin toast -->
				<!-- ------------------- -->
				<div id="toast">${succMsg}</div>
				<script type="text/javascript">
showToast ();
function showToast(content) {
	$('#toast').addClass ("display");
	$('#toast').html(content);
	setTimeout (()=>{
		$("#toast").removeClass ("display");
	}, 2000)
}

</script>
				<!-- end toast -->

				<c:remove var="succMsg" scope="session" />
				</c:if>
				
<section class="contact" style="margin-top: -2%">

    <div class="icons-container">

        <div class="icons">
            <img src="image1/icon-1.png" alt="">
            <h3>7:00am to 10:30pm</h3>
        </div>

        <div class="icons">
            <img src="image1/icon-2.png" alt="">
            <h3>+123-456-7890</h3>
        </div>

        <div class="icons">
            <img src="image1/icon-3.png" alt="">
            <h3>Ho Chi Minh City</h3>
        </div>

    </div>

    <div class="row">

        <form action="contact" method="post">
            <h3 class="text-center text-success" style="color: green; text-align: center;">Get in touch</h3>
            <div class="inputBox">
                            <%
							if (u == null) {
							%>
							 <input type="text" name="name" placeholder="Enter your name" class="box" required >
                             <input type="email" name="email" placeholder="Enter your email" class="box" required>
							
							<%
							} else {
							%>
							<input type="text" name="name" placeholder="Enter your name" class="box" value="<%=u.getName()%>">
                             <input type="email" name="email" placeholder="Enter your email" class="box" value="<%=u.getEmail()%>">
							<%
							}
							%>
            </div>
            <div class="inputBox">
           
                            <%
							if (u == null) {
							%>
							 <input type="number" name="number" placeholder="Enter your number" class="box" required>
							 <%
							} else {
							%>
							<input type="number" name="number" placeholder="Enter your number" class="box" value="<%=u.getPhno()%>">
							<%
							}
							%>
                <input type="text" name="subject" placeholder="Enter your subject" required class="box">
            </div>
            <textarea name="message"  placeholder="Your message" cols="30" rows="10" required></textarea>
            <button type="submit" value="Send message" class="btn"  style="margin-left: 68%" >Send message</button>
           
				
        </form>

             
				
        <iframe class="map" 
        src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3919.6222423427866!2d106.65440106462233!3d10.763568992330226!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1z4bqnbmcgNCwgdMOyYSBuaMOgIEZsZW1pbmd0b24sIHPhu5EgMTgyLCDEkcaw4budbmcgTMOqIMSQ4bqhaSBIw6BuaCwgcGjGsOG7nW5nIDE1LCBxdeG6rW4gMTEsIFRwLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1639496942948!5m2!1svi!2s" allowfullscreen="" loading="lazy"></iframe>

    </div>

</section>

  

<!-- footer section starts  -->

	<%@include file="all_component/footer.jsp"%>
<!-- footer section ends -->


<!-- custom css file link  -->
<script src="js/script.js"></script>

</body>
</html>