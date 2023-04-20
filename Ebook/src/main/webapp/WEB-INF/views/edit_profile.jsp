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
<meta charset="UTF-8">

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/icon2.png" type="image/png" class="icon">
 
<title>Ebook: Setting - EditProfile</title>
<%@include file="all_component/allCss.jsp"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
 
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"> 


<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

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

	<%@include file="all_component/navbar.jsp"%>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

				
<section class="contact" style="margin-top: 6%; width: 50%; margin-left: 25% ; background: white;">

    <a href="setting.jsp">
<i class="fas fa-caret-square-left" style="font-size: 347%; background: #f7f7f7; color: green;"></i>
</a>

    <div class="row">

        <form action="update_profile" method="post">
            <h3  class="text-center text-success" style="font-weight: bold;" >Edit Profile</h3>
            
                        <c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg }</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						 
						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg }</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<input type="hidden" value="${userobj.id }" name="id">
			
			<div class="inputBox">    
          			 <h4 >Full Name</h4>  
            </div> 
            			 
            <div class="inputBox">   
			       <input  style="width: 100%" placeholder="Enter Full Name" class="box" type="text"   id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"
									value="${userobj.name }" required > 
							 
            </div> 
            <br>
			<div class="inputBox">    
          			 <h4 >Email address</h4>  
            </div>		
			 <div class="inputBox">    
                   <input  style="width: 100%" placeholder="Email address" class="box" type="email"  id="exampleInputEmail2"
									aria-describedby="emailHelp" required="required" name="email"
									value="${userobj.email }" readonly  > 
							 
            </div>
            <br>
            <div class="inputBox">    
          			 <h4 >Phone No</h4>  
            </div>				
            <div class="inputBox"> 
				   <input style="width: 100%"  placeholder="Phone No" class="box" type="number"  id="exampleInputEmail3"
									aria-describedby="emailHelp" required="required" name="phno"
									value="${userobj.phno }" required>  
                          
            </div>
            <br>
            <div class="inputBox">    
          			 <h4 >Password</h4>  
            </div>
              <div class="inputBox">  
									
                   <input  style="width: 100%" placeholder="Password" type="password" id="password"
									placeholder="Password" name="password"  class="box" > 
                          
            </div>
            
            <button type="submit" value="Send message" class="btn"  style="margin-left: 74%; font-weight: bold;" >Update</button>
            
        </form>
 
   
    </div>

</section>

	<%-- <div class="container" style="margin-top: 10%">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h2 class="text-center text-primary">Edit Profile</h2>
						
						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg }</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						 
						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg }</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						
						<form action="update_profile" method="post">

							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<h1 for="exampleInputEmail1">Enter Full Name</h1> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"
									value="${userobj.name }">
							</div>
							<div class="form-group">
								<h1 for="exampleInputEmail1">Email address</h1> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									value="${userobj.email }">
							</div>
							<div class="form-group">
								<h1 for="exampleInputEmail1">Phone No</h1> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno"
									value="${userobj.phno }">
							</div>
							<div class="form-group">
								<h1 for="exampleInputPassword1">Password</h1> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div> --%>
	
	
	
	<script type="text/javascript">
		function changeTypePassword() {
			const password = document.getElementById('password');
			const show = document.getElementById('show');
			const hide = document.getElementById('hide');

			if (password.type == 'text') {
				password.type = 'password';
				hide.style.display = 'block';
				show.style.display = 'none';
			} else {
				password.type = 'text';
				show.style.display = 'block';
				hide.style.display = 'none';
			}

		}
	</script>
	

	<%@include file="all_component/footer.jsp"%>
	
	
	 
	
</body>
</html>