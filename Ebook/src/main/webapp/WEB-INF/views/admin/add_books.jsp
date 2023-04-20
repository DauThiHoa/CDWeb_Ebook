<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>Admin : Add Books</title>


<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/favicon.png" type="image/png" class="icon">
 
 <style type="text/css">
  
  .bold {
    font-weight: bold;
  }
  
 </style>
<%@include file="allCss.jsp"%>
</head>

<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->
	<c:if test="${empty userobj }">
		<c:redirect url="/Ebook/login" />
	</c:if>
	
	
	
			
<section class="contact" style="margin-top: 1%; width: 50%; margin-left: 25% ; background: white;">

<a href="/Ebook/home">
<i class="fas fa-caret-square-left" style="font-size: 347%; background: #f7f7f7; color: green;"></i>
</a>
  
    <div class="row"> 
			
        <form action="/Ebook/add_books" method="post" enctype="multipart/form-data">
        
            <h3  class="text-center text-success" style="font-weight: bold;">ADD BOOKS</h3>
            
                        <c:if test="${not empty failedMsg }">
							<h4 class="text-center text-danger">${failedMsg }</h4>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						 
						<c:if test="${not empty succMsg }">
							<h4 class="text-center text-success">${succMsg }</h4>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						 
						<input type="hidden" value="${userobj.email }" name="user">
						
						
			<div class="inputBox">    
          			 <h4 class="bold">Book Name <span style="color: red;">*</span> </h4>  
            </div> 
            		
            <div class="inputBox" >   
			       <!-- <input style="width: 100%" placeholder="        " class="box"  
									aria-describedby="emailHelp"  required >  -->
									
									<input  style="width: 100%" class="box" 
									aria-describedby="emailHelp" required
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							 
            </div> 
            
			<br>
			<div class="inputBox">    
          			 <h4 class="bold" >Author Name <span style="color: red;">*</span> </h4>  
            </div>							
             <div class="inputBox" >    
									
									<input  style="width: 100%" placeholder="" class="box" 
									aria-describedby="emailHelp" required
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							 
            </div> 
            
            <br>
			<div class="inputBox">    
          			 <h4 class="bold">Price <span style="color: red;">*</span></h4>  
            </div>	
             <div class="inputBox" >    
									
									<input  style="width: 100%" placeholder="" class="box" 
									aria-describedby="emailHelp" required type="double"
									name="price" class="form-control"
									id="exampleInputPassword1">
							 
            </div> 
             
             <br>
			<div class="inputBox">    
          			 <h4 class="bold">Book Categories</h4>  
            </div>
              <div class="inputBox" >     
									
									<select required style="width: 100%" class="box" 
									id="inputState" name="categories" class="form-control">
									<option selected>-- Select --</option>
									<option value="New">New Book</option>
									
									<option value="Foreign language books">Foreign language books</option>
									<option value="Literature">Literature</option>
									<option value="Life skills book">Life skills book</option>
									<option value="Book of art - architecture">Book of art - architecture</option>
									<option value="Medicine & sport books">Medicine & sport books</option>
								</select>
							 
            </div> 
            
             <br>
			<div class="inputBox">    
          			 <h4 class="bold">Book Status</h4>  
            </div>
              <div class="inputBox" >      
								
								<select required style="width: 100%" class="box" 
									id="inputState" name="status" class="form-control">
									<option selected>-- Select --</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							 
            </div> 
            
             <br>
			<div class="inputBox">    
          			 <h4 class="bold">Upload Photo</h4>  
            </div>
              <div class="inputBox" >    
									
									<input  style="width: 100%" placeholder="" class="box" 
									aria-describedby="emailHelp" required
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
									 
							 
            </div> 
            
            <button type="submit" value="Send message" class="btn" style="margin-left: 84%; font-weight: bold;">ADD</button>
            
        </form>
 
   
    </div>

</section>
 
 


<!--  End Old Book-->
	<div style="margin-top: 1%">  
	<%@include file="footer.jsp"%></div>
	
</body>
</html>