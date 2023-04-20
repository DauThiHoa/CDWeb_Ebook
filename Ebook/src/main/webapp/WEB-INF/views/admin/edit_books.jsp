<%@page import="com.example.ebook.entity.BookDtls"%>
<%@page import="com.example.ebook.connect.DBConnect"%>
<%@page import="com.example.ebook.dao.BookDAOImpl"%>
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
<title>Admin : Edit Books</title>


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
	
	 
	 
			
<section class="contact" style="margin-top: 1%; width: 50%; margin-left: 25% ; background: white;">

<a href="all_books.jsp">
<i class="fas fa-caret-square-left" style="font-size: 347%; background: #f7f7f7; color: green;"></i>
</a>
  
    <div class="row"> 
			
        <form action="../editbooks" method="post" enctype="multipart/form-data">
        
            <h3  class="text-center text-success" style="font-weight: bold;">EDIT BOOKS</h3>
            
                        <c:if test="${not empty failedMsg }">
							<h2 class="text-center text-danger">${failedMsg }</h2>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						 
						<c:if test="${not empty succMsg }">
							<h2 class="text-center text-success">${succMsg }</h2>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						  
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>
						
			<input type="hidden" name="id" value="<%=b.getBookId()%>">
						
			<div class="inputBox">    
          			 <h4 class="bold">Book Name <span style="color: red;">*</span> </h4>  
            </div> 
            		
            <div class="inputBox" >  
									<input  style="width: 100%" class="box" 
									aria-describedby="emailHelp" required
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>">
							 
            </div> 
            
			<br>
			<div class="inputBox">    
          			 <h4 class="bold" >Author Name <span style="color: red;">*</span> </h4>  
            </div>							
             <div class="inputBox" >    
									
									<input  style="width: 100%" placeholder="" class="box" 
									aria-describedby="emailHelp" required
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							 
            </div> 
            
            <br>
			<div class="inputBox">    
          			 <h4 class="bold">Price <span style="color: red;">*</span></h4>  
            </div>	
             <div class="inputBox" >    
									
									<input  style="width: 100%" placeholder="" class="box" 
									aria-describedby="emailHelp" required type=""
									name="price" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							 
            </div> 
              
             <br>
			<div class="inputBox">    
          			 <h4 class="bold">Book Status</h4>  
            </div>
              <div class="inputBox" >      
								
								<select required style="width: 100%" class="box" 
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())){
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							 
            </div> 
             
            
            <button type="submit" class="btn" style="margin-left: 80%; font-weight: bold;">Update</button>
            
        </form>
 
   
    </div>

</section>

	<!--  End Old Book--> 
	<div style="margin-bottom: 1%"></div>
		<%@include file="footer.jsp"%></div>

</body>
</html>