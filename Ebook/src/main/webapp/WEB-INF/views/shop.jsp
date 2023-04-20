<%@page import="com.example.ebook.entity.User"%>
<%@page import="com.example.ebook.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.example.ebook.dao.BookDAOImpl"%>
<%@page import="com.example.ebook.connect.DBConnect"%>
<%@page import="java.sql.Connection"%>
<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="all_component/allCss.jsp"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE jsp>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- BIEU TUONG TRANG WEB -->
<link rel="icon" href="img/icon2.png" type="image/png" class="icon">
<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<title>Shop</title> 
<!-- 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
 integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  -->

<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>


<!-- custom css file link  -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style1.css">

<style type="text/css">
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  font-size: 22px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

</style>

<script type="text/javascript">

/* function checkDescPrice() {
	/* descPrice ascPrice descName ascName */
	
/*	var descPrice = $('#descPrice').val();
	var ascPrice = $('#ascPrice').val();  
	var descName = $('#descName').val();
	var ascName = $('#ascName').val();
	
	console.log ("descPrice: "+ descPrice + " ascPrice : " + ascPrice);
	console.log ("descName: "+ descName + " ascName : " + ascName);
	
	$.ajax({
		type : 'GET',
		data : {
			descPrice : descPrice ,
			ascPrice : ascPrice ,
			descName : descName,
			ascName : ascName,
			
		},
		url : 'arrangeServlet',
		success : function(result) {
			$('#result').html(result)
		}
	})
} */

function checkAscPrice() {
	/* descPrice ascPrice descName ascName */
	
	/* var descPrice = $('#descPrice').val(); 
	var descName = $('#descName').val();
	var ascName = $('#ascName').val(); */
	
	var ascPrice = $('#ascPrice').val(); 
	
	console.log ("descPrice: "+ descPrice + " ascPrice : " + ascPrice);
	
	$.ajax({
		type : 'GET',
		data : { 
			ascPrice : ascPrice , 
			
		},
		url : 'arrangeServlet',
		success : function(result) {
			/* $('#result').style.display = 'none'
		    $('#result').css('display'​​​​​​​​​​​​​​​​​​​​​​​​​​​,'none'); */​​​​​​
			/*  $('#popular1').style.display = result  */
			
		}
	})
} 
	
	
</script>


</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

				

	<div class="heading" style="margin-top: 3%">
		
		
		<h1>our shop</h1>
		<p>
			<a href="Ebook">home >></a> shop
		</p>
		
		<c:if test="${not empty addCart }">

		<!-- begin toast -->
		<!-- ------------------- -->
		<div id="toast">${addCart}</div>
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

		<c:remove var="addCart"
			scope="session"/>

	</c:if>
	
	</div>
	 
	
	<!-- <div class="list-group">
			<a href="#" class="list-group-item list-group-item-action active">
				Cras justo odio </a> <a href="#"
				class="list-group-item list-group-item-action">Dapibus ac
				facilisis in</a> <a href="#"
				class="list-group-item list-group-item-action">Morbi leo risus</a> <a
				href="#" class="list-group-item list-group-item-action">Porta ac
				consectetur ac</a> <a href="#"
				class="list-group-item list-group-item-action disabled">Vestibulum
				at eros</a>
	</div> -->
		 

	<section class="category" style="margin-top: -5%">


		<form action="arrangeServlet"  method="post" class="category">
 
			<button type="submit" id="categoryLanguage" class="box"> 
				<img src="image/cat-1.png" alt="">
				<input  style="display: none" value="categoryLanguage" name="categoryLanguage"> 
				<h3 >Foreign language books</h3>  
			</button> 
			
		</form>
		
		<form action="arrangeServlet"  method="post" class="category">
			<button type="submit" id="categoryLiterature" class="box"> 
				<img src="image/cat-2.png" alt="">
				<input  style="display: none" value="categoryLiterature" name="categoryLiterature"> 
				<h3>Literature</h3> 
			</button> 
		</form>
		
		<form action="arrangeServlet"  method="post" class="category">	
			<button type="submit" id="categorySkills" class="box"> 
				<img src="image/cat-3.png" alt="">
				<input  style="display: none" value="categorySkills" name="categorySkills"> 
				<h3>Life skills book</h3> 
			</button> 
		</form>
		
		<form action="arrangeServlet"  method="post" class="category">	
			<button type="submit" id="categoryArt" class="box"> 
				<img src="image/cat-4.png" alt="">
				<input  style="display: none" value="categoryArt" name="categoryArt"> 
				<h3>Book of art - architecture</h3>
			</button> 
		</form>
		
		<form action="arrangeServlet"  method="post" class="category">		
			<button type="submit" id="categorySport" class="box"> 
				<img src="image/cat-5.png" alt="">
				<input  style="display: none" value="categorySport" name="categorySport"> 
				<h3>Medicine & sport books</h3>
			</button>  
		</form>
		 	    

		</section>

		<!-- category section ends -->


	
	
	<c:if test="${not empty succMsg }">
					<h5 class="text-center text-success">${succMsg }</h5>
					<c:remove var="succMsg" scope="session" />
	</c:if> 
				 
	<!-- //	PRODUCT LIST getAllBooksDescPrice - getAllBooksAscPrice - getAllBooksDescName - getAllBooksAscName -->
	<section class="category" style="margin-top: -5%">

		<section class="category">

			<form action="arrangeServlet"  method="post"><input  style="display: none" value="ascName" name="ascName"> <button type="submit" onclick="" id="ascName" class="btn btn-outline-primary" style="font-weight: bold;">Ascending by name</button>
			</form> 
			<form action="arrangeServlet"  method="post"><input  style="display: none" value="descName" name="descName">  <button type="submit" value="descName" onclick="" id="descName" class="btn btn-outline-warning" style="font-weight: bold;">Descending by name</button>
			</form> 
			<form action="arrangeServlet"  method="post"><input  style="display: none" value="ascPrice" name="ascPrice">  <button type="submit" value="ascPrice" onclick="" id="ascPrice" class="btn btn-outline-success" style="font-weight: bold;">Ascending by price</button>
			</form> 
			<form action="arrangeServlet"  method="post"><input  style="display: none" value="descPrice" name="descPrice">  <button type="submit" value="descPrice" onclick="" id="descPrice" class="btn btn-outline-info" style="font-weight: bold;">Descending by price</button>
			</form>

			<!-- <a href="#" class="box">
        <img src="image/cat-6.png" alt="">
        <h3>coffee</h3>
    </a> -->

			<!--    <button type="button" class="btn btn-outline-warning">Warning</button>
					<button type="button" class="btn btn-outline-info">Info</button>
					<button type="button" class="btn btn-outline-light">Light</button>
					<button type="button" class="btn btn-outline-dark">Dark</button> -->


		</section>

		<!-- category section ends -->  
	</section>
	
	   
    <section class="popular" id="popular1" style="margin-top:-8%; display: ${ascName}"> 

    <div class="heading">
        <span>All Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container" > 
    
    
  
<%
    int first = 0, last = 0, pages = 1;
     
    if (request.getParameter("pages") != null) {
        pages = (int) Integer.parseInt(request.getParameter("pages"));
    }
    //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
    // int total = new ShopDAO().getCount();
    BookDAOImpl dao7 = new BookDAOImpl(DBConnect.getConn());
	/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
	int total = dao7.getCount();
	
    if (total <= 8) {
        first = 0; 
        last = total; 
    } else {
        first = (pages - 1 ) * 8;
        last = 8;
    }
    // Lấy ra danh sách sản phẩm
    // List<Shop> list = new ShopDAO().getShop(first, last); 
    // for (Shop item : list) { 
    	
    	List<BookDtls> list7 = dao7.getAllBooksAscName(first, last);  
		for (BookDtls b2 : list7) { 
%> 
		

<!-- //Ở đây là chỗ cần lặp sản phẩm cần hiển thị
//Ở bài này sẽ hiển thi 4 sản phẩm trên 1 trang
//Nếu nhiều sản phẩm thì sẽ phân trang sang trang 2 3 ... 
//Ví dụ: hiển thị tên sản phẩm <span></span> -->

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
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
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
        
        
<%}%> 

<br>
</div> 
<div  class="pagination" style="margin-left: 38%">    
    <%                //Button Previous
        int back = 0;
        if (pages == 0 || pages == 1) {
            back = 1;//Luon la page 1
        } else {
            back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
        }
    %>
    <a href="shop.jsp?pages=<%=back%>">&laquo;</a>
                <%
                    //Button Number pages
                    int loop = 0, num = 0;
                    if ((total / 4) % 2 == 0) {
                        num = total / 4;
                    } else {
                        num = (total + 1) / 4;
                    }
                    //Nếu total lẻ thêm 1
                    if (total % 2 != 0) {
                        loop = (total / 4) + 1;

                    } else {
                        //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                        if (total < (num * 4) + 4 && total != num * 4) {
                            loop = (total / 4) + 1;
                        } else {
                            //Nếu bằng fullPage thì không thêm
                            loop = (total / 4);
                        }
                    }
                    //Lap so pages
                    for (int i = 1; i <= loop; i++) {%>
                <% if (pages == i) {%> 

    <span><a class="active" href="shop.jsp?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="shop.jsp?pages=<%=i%>"><%=i%></a> 

        <%}
             }%>
        <%
            //Button Next
            int next = 0;
            //Nếu total lẻ
            if (total % 2 != 0) {
                if (pages == (total / 4) + 1) {
                    next = pages;//Khong next
                } else {
                    next = pages + 1;//Co next
                }
            } else {
                //Nếu total chẵn nhỏ hơn fullpage
                //Và không fullPage thì thêm 1
                if (total < (num * 4) + 4 && total != num * 4) {
                    if (pages == (total / 4) + 1) {
                        next = pages;//Khong next
                    } else {
                        next = pages + 1;//Co next
                    }
                } else {
                    //Nếu fullPage đến trang cuối dừng
                    //Chưa tới trang cuối thì được next
                    if (pages == (total / 4)) {
                        next = pages;//Khong next
                    } else {
                        next = pages + 1;//Co next
                    }
                }
            }
        %>
    <a href="shop.jsp?pages=<%=next%>">&raquo;</a>
</div>
 
  
		<!-- </div>  -->
    </section> 





<!--  getAllBooksDescName PRODUCT LIST BEGIN-->

<!-- popular section starts  -->

<section class="popular" id="popular2" style="margin-top:-8%; display: ${descName}">

    <div class="heading">
        <span>All Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container" > 
    
    
  
<%
    int first3 = 0, last3 = 0, pages3 = 1;
     
    if (request.getParameter("pages") != null) {
        pages3 = (int) Integer.parseInt(request.getParameter("pages"));
    }
    //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
    // int total3 = new ShopDAO().getCount();
    BookDAOImpl dao10 = new BookDAOImpl(DBConnect.getConn());
	/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
	int total3 = dao10.getCount();
	
    if (total3 <= 8) {
        first3 = 0; 
        last3 = total3; 
    } else {
        first3 = (pages3 - 1 ) * 8;
        last3 = 8;
    }
    // Lấy ra danh sách sản phẩm
    // List<Shop> list = new ShopDAO().getShop(first3, last3); 
    // for (Shop item : list) { 
    	
    	List<BookDtls> list10 = dao10.getAllBooksDescName(first3, last3); 
		for (BookDtls b2 : list10) { 
%> 
		

<!-- //Ở đây là chỗ cần lặp sản phẩm cần hiển thị
//Ở bài này sẽ hiển thi 4 sản phẩm trên 1 trang
//Nếu nhiều sản phẩm thì sẽ phân trang sang trang 2 3 ... 
//Ví dụ: hiển thị tên sản phẩm <span></span> -->

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
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
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
        
        
<%}%> 

<br>
</div> 
<div  class="pagination" style="margin-left: 38%">    
    <%                //Button Previous
        int back3 = 0;
        if (pages3 == 0 || pages3 == 1) {
            back3 = 1;//Luon la page 1
        } else {
            back3 = pages3 - 1;//Neu pages3 tu 2 tro len thi back3 tru 1
        }
    %>
    <a href="shop.jsp?pages=<%=back3%>">&laquo;</a>
                <%
                    //Button num3ber pages3
                    int loop3 = 0, num3 = 0;
                    if ((total3 / 4) % 2 == 0) {
                        num3 = total3 / 4;
                    } else {
                        num3 = (total3 + 1) / 4;
                    }
                    //Nếu total3 lẻ thêm 1
                    if (total3 % 2 != 0) {
                        loop3 = (total3 / 4) + 1;

                    } else {
                        //Nếu total3 chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                        if (total3 < (num3 * 4) + 4 && total3 != num3 * 4) {
                            loop3 = (total3 / 4) + 1;
                        } else {
                            //Nếu bằng fullPage thì không thêm
                            loop3 = (total3 / 4);
                        }
                    }
                    //Lap so pages3
                    for (int i = 1; i <= loop3; i++) {%>
                <% if (pages3 == i) {%> 

    <span><a class="active" href="shop.jsp?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="shop.jsp?pages=<%=i%>"><%=i%></a> 

        <%}
             }%>
        <%
            //Button next3
            int next3 = 0;
            //Nếu total3 lẻ
            if (total3 % 2 != 0) {
                if (pages3 == (total3 / 4) + 1) {
                    next3 = pages3;//Khong next3
                } else {
                    next3 = pages3 + 1;//Co next3
                }
            } else {
                //Nếu total3 chẵn nhỏ hơn fullpage
                //Và không fullPage thì thêm 1
                if (total3 < (num3 * 4) + 4 && total3 != num3 * 4) {
                    if (pages3 == (total3 / 4) + 1) {
                        next3 = pages3;//Khong next3
                    } else {
                        next3 = pages3 + 1;//Co next3
                    }
                } else {
                    //Nếu fullPage đến trang cuối dừng
                    //Chưa tới trang cuối thì được next3
                    if (pages3 == (total3 / 4)) {
                        next3 = pages3;//Khong next3
                    } else {
                        next3 = pages3 + 1;//Co next3
                    }
                }
            }
        %>
    <a href="shop.jsp?pages=<%=next3%>">&raquo;</a>
</div>
 
  
		<!-- </div>  -->
    </section>  


<!-- popular section ends -->'
<!-- getAllBooksDescName PRODUCT LIST ENDS -->

 
 <!--  getAllBooksAscPrice PRODUCT LIST BEGIN-->

<!-- popular section starts  -->

   <section class="popular" id="popular3" style="margin-top:-8%; display: ${ascPrice}">

    <div class="heading">
        <span>All Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container" > 
    
    
  
<%
    int first2 = 0, last2 = 0, pages2 = 1;
     
    if (request.getParameter("pages") != null) {
        pages2 = (int) Integer.parseInt(request.getParameter("pages"));
    }
    //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
    // int total2 = new ShopDAO().getCount();
    BookDAOImpl dao9 = new BookDAOImpl(DBConnect.getConn());
	/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
	int total2 = dao9.getCount();
	
    if (total2 <= 8) {
        first2 = 0; 
        last2 = total2; 
    } else {
        first2 = (pages2 - 1 ) * 8;
        last2 = 8;
    }
    // Lấy ra danh sách sản phẩm
    // List<Shop> list = new ShopDAO().getShop(first2, last2); 
    // for (Shop item : list) { 
    	
    	List<BookDtls> list9 = dao9.getAllBooksAscPrice(first2, last2); 
		for (BookDtls b2 : list9) { 
%> 
		

<!-- //Ở đây là chỗ cần lặp sản phẩm cần hiển thị
//Ở bài này sẽ hiển thi 4 sản phẩm trên 1 trang
//Nếu nhiều sản phẩm thì sẽ phân trang sang trang 2 3 ... 
//Ví dụ: hiển thị tên sản phẩm <span></span> -->

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
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
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
        
        
<%}%> 

<br>
</div> 
<div  class="pagination" style="margin-left: 38%">     
    <%                //Button Previous
        int back2 = 0;
        if (pages2 == 0 || pages2 == 1) {
            back2 = 1;//Luon la page 1
        } else {
            back2 = pages2 - 1;//Neu pages2 tu 2 tro len thi back2 tru 1
        }
    %>
    <a href="shop.jsp?pages=<%=back2%>">&laquo;</a>
                <%
                    //Button num2ber pages2
                    int loop2 = 0, num2 = 0;
                    if ((total2 / 4) % 2 == 0) {
                        num2 = total2 / 4;
                    } else {
                        num2 = (total2 + 1) / 4;
                    }
                    //Nếu total2 lẻ thêm 1
                    if (total2 % 2 != 0) {
                        loop2 = (total2 / 4) + 1;

                    } else {
                        //Nếu total2 chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                        if (total2 < (num2 * 4) + 4 && total2 != num2 * 4) {
                            loop2 = (total2 / 4) + 1;
                        } else {
                            //Nếu bằng fullPage thì không thêm
                            loop2 = (total2 / 4);
                        }
                    }
                    //Lap so pages2
                    for (int i = 1; i <= loop2; i++) {%>
                <% if (pages2 == i) {%> 

    <span><a class="active" href="shop.jsp?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="shop.jsp?pages=<%=i%>"><%=i%></a> 

        <%}
             }%>
        <%
            //Button next2
            int next2 = 0;
            //Nếu total2 lẻ
            if (total2 % 2 != 0) {
                if (pages2 == (total2 / 4) + 1) {
                    next2 = pages2;//Khong next2
                } else {
                    next2 = pages2 + 1;//Co next2
                }
            } else {
                //Nếu total2 chẵn nhỏ hơn fullpage
                //Và không fullPage thì thêm 1
                if (total2 < (num2 * 4) + 4 && total2 != num2 * 4) {
                    if (pages2 == (total2 / 4) + 1) {
                        next2 = pages2;//Khong next2
                    } else {
                        next2 = pages2 + 1;//Co next2
                    }
                } else {
                    //Nếu fullPage đến trang cuối dừng
                    //Chưa tới trang cuối thì được next2
                    if (pages2 == (total2 / 4)) {
                        next2 = pages2;//Khong next2
                    } else {
                        next2 = pages2 + 1;//Co next2
                    }
                }
            }
        %>
    <a href="shop.jsp?pages=<%=next2%>">&raquo;</a>
</div>
 
  
		<!-- </div>  -->
    </section>  

<!-- popular section ends -->'
<!-- getAllBooksAscPrice PRODUCT LIST ENDS -->

 





<!--  getAllBooksDescPrice PRODUCT LIST BEGIN-->

<!-- popular section starts  -->

    <section class="popular" id="popular4" style="margin-top:-8%; display: ${descPrice}"> 

    <div class="heading">
        <span>All Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container" > 
    
    
  
<%
    int first1 = 0, last1 = 0, pages1 = 1;
     
    if (request.getParameter("pages") != null) {
        pages1 = (int) Integer.parseInt(request.getParameter("pages"));
    }
    //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
    // int total1 = new ShopDAO().getCount();
    BookDAOImpl dao8 = new BookDAOImpl(DBConnect.getConn());
	/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
	int total1 = dao8.getCount();
	
    if (total1 <= 8) {
        first1 = 0; 
        last1 = total1; 
    } else {
        first1 = (pages1 - 1 ) * 8;
        last1 = 8;
    }
    // Lấy ra danh sách sản phẩm
    // List<Shop> list = new ShopDAO().getShop(first1, last1); 
    // for (Shop item : list) { 
    	
    	List<BookDtls> list8 = dao8.getAllBooksDescPrice(first1, last1);
    	//List<BookDtls> list8 = dao8.getAllBooksfilterCate(category, first, last)(first1, last1);
		for (BookDtls b2 : list8) { 
%> 
		

<!-- //Ở đây là chỗ cần lặp sản phẩm cần hiển thị
//Ở bài này sẽ hiển thi 4 sản phẩm trên 1 trang
//Nếu nhiều sản phẩm thì sẽ phân trang sang trang 2 3 ... 
//Ví dụ: hiển thị tên sản phẩm <span></span> -->

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
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
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
        
        
<%}%> 

<br>
</div> 
<div  class="pagination" style="margin-left: 38%">     
    <%                //Button Previous
        int back1 = 0;
        if (pages1 == 0 || pages1 == 1) {
            back1 = 1;//Luon la page 1
        } else {
            back1 = pages1 - 1;//Neu pages1 tu 2 tro len thi back1 tru 1
        }
    %>
    <a href="shop.jsp?pages=<%=back1%>">&laquo;</a>
                <%
                    //Button num1ber pages1
                    int loop1 = 0, num1 = 0;
                    if ((total1 / 4) % 2 == 0) {
                        num1 = total1 / 4;
                    } else {
                        num1 = (total1 + 1) / 4;
                    }
                    //Nếu total1 lẻ thêm 1
                    if (total1 % 2 != 0) {
                        loop1 = (total1 / 4) + 1;

                    } else {
                        //Nếu total1 chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                        if (total1 < (num1 * 4) + 4 && total1 != num1 * 4) {
                            loop1 = (total1 / 4) + 1;
                        } else {
                            //Nếu bằng fullPage thì không thêm
                            loop1 = (total1 / 4);
                        }
                    }
                    //Lap so pages1
                    for (int i = 1; i <= loop1; i++) {%>
                <% if (pages1 == i) {%> 

    <span><a class="active" href="shop.jsp?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="shop.jsp?pages=<%=i%>"><%=i%></a> 

        <%}
             }%>
        <%
            //Button next1
            int next1 = 0;
            //Nếu total1 lẻ
            if (total1 % 2 != 0) {
                if (pages1 == (total1 / 4) + 1) {
                    next1 = pages1;//Khong next1
                } else {
                    next1 = pages1 + 1;//Co next1
                }
            } else {
                //Nếu total1 chẵn nhỏ hơn fullpage
                //Và không fullPage thì thêm 1
                if (total1 < (num1 * 4) + 4 && total1 != num1 * 4) {
                    if (pages1 == (total1 / 4) + 1) {
                        next1 = pages1;//Khong next1
                    } else {
                        next1 = pages1 + 1;//Co next1
                    }
                } else {
                    //Nếu fullPage đến trang cuối dừng
                    //Chưa tới trang cuối thì được next1
                    if (pages1 == (total1 / 4)) {
                        next1 = pages1;//Khong next1
                    } else {
                        next1 = pages1 + 1;//Co next1
                    }
                }
            }
        %>
    <a href="shop.jsp?pages=<%=next1%>">&raquo;</a>
</div>
 
  
		<!-- </div>  -->
    </section>  
<!-- popular section ends -->'
<!-- getAllBooksAscPrice PRODUCT LIST ENDS -->





	<!--  BEGIN
	Foreign language books 
	Literature 
	Life skills book 
	Book of art - architecture 
	Medicine & sport books 
	categoryLanguage categoryLiterature categorySkills categoryArt categorySport
	-->
	

<!--  categoryLanguage PRODUCT LIST BEGIN-->

<!-- popular section starts  -->

    <section class="popular" id="popular5" style="margin-top:-8%; display: ${categoryLanguage}"> 

    <div class="heading">
        <span>All Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container" > 
    
    
  
<%
    int first4 = 0, last4 = 0, pages4 = 1;
     
    if (request.getParameter("pages") != null) {
        pages4 = (int) Integer.parseInt(request.getParameter("pages"));
    }
    //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
    // int total4 = new ShopDAO().getCount();
    BookDAOImpl dao11 = new BookDAOImpl(DBConnect.getConn());
	/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
	int total4 = dao11.getCount();
	
    if (total4 <= 8) {
        first4 = 0; 
        last4 = total4; 
    } else {
        first4 = (pages4 - 1 ) * 8;
        last4 = 8;
    }
    // Lấy ra danh sách sản phẩm
    // List<Shop> list = new ShopDAO().getShop(first4, last4); 
    // for (Shop item : list) { 
    	
    	List<BookDtls> list11 = dao11.getAllBooksfilterCate("Foreign language books",first4, last4); 
		for (BookDtls b2 : list11) { 
%> 
		

<!-- //Ở đây là chỗ cần lặp sản phẩm cần hiển thị
//Ở bài này sẽ hiển thi 4 sản phẩm trên 1 trang
//Nếu nhiều sản phẩm thì sẽ phân trang sang trang 2 3 ... 
//Ví dụ: hiển thị tên sản phẩm <span></span> -->

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
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
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
        
        
<%}%> 

<br>
</div> 
<div  class="pagination" style="margin-left: 38%">    
    <%                //Button Previous
        int back4 = 0;
        if (pages4 == 0 || pages4 == 1) {
            back4 = 1;//Luon la page 1
        } else {
            back4 = pages4 - 1;//Neu pages4 tu 2 tro len thi back4 tru 1
        }
    %>
    <a href="shop.jsp?pages=<%=back4%>">&laquo;</a>
                <%
                    //Button num4ber pages4
                    int loop4 = 0, num4 = 0;
                    if ((total4 / 4) % 2 == 0) {
                        num4 = total4 / 4;
                    } else {
                        num4 = (total4 + 1) / 4;
                    }
                    //Nếu total4 lẻ thêm 1
                    if (total4 % 2 != 0) {
                        loop4 = (total4 / 4) + 1;

                    } else {
                        //Nếu total4 chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                        if (total4 < (num4 * 4) + 4 && total4 != num4 * 4) {
                            loop4 = (total4 / 4) + 1;
                        } else {
                            //Nếu bằng fullPage thì không thêm
                            loop4 = (total4 / 4);
                        }
                    }
                    //Lap so pages4
                    for (int i = 1; i <= loop4; i++) {%>
                <% if (pages4 == i) {%> 

    <span><a class="active" href="shop.jsp?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="shop.jsp?pages=<%=i%>"><%=i%></a> 

        <%}
             }%>
        <%
            //Button next4
            int next4 = 0;
            //Nếu total4 lẻ
            if (total4 % 2 != 0) {
                if (pages4 == (total4 / 4) + 1) {
                    next4 = pages4;//Khong next4
                } else {
                    next4 = pages4 + 1;//Co next4
                }
            } else {
                //Nếu total4 chẵn nhỏ hơn fullpage
                //Và không fullPage thì thêm 1
                if (total4 < (num4 * 4) + 4 && total4 != num4 * 4) {
                    if (pages4 == (total4 / 4) + 1) {
                        next4 = pages4;//Khong next4
                    } else {
                        next4 = pages4 + 1;//Co next4
                    }
                } else {
                    //Nếu fullPage đến trang cuối dừng
                    //Chưa tới trang cuối thì được next4
                    if (pages4 == (total4 / 4)) {
                        next4 = pages4;//Khong next4
                    } else {
                        next4 = pages4 + 1;//Co next4
                    }
                }
            }
        %>
    <a href="shop.jsp?pages=<%=next4%>">&raquo;</a>
</div>
 
  
		<!-- </div>  -->
    </section>  
<!-- popular section ends -->'
<!-- categoryLanguage PRODUCT LIST ENDS -->
 
 


<!--  categoryLiterature PRODUCT LIST BEGIN-->

<!-- popular section starts  -->

    <section class="popular" id="popular6" style="margin-top:-8%; display: ${categoryLiterature}"> 

    <div class="heading">
        <span>All Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container" > 
    
    
  
<%
    int first5 = 0, last5 = 0, pages5 = 1;
     
    if (request.getParameter("pages") != null) {
        pages5 = (int) Integer.parseInt(request.getParameter("pages"));
    }
    //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
    // int total5 = new ShopDAO().getCount();
    BookDAOImpl dao12 = new BookDAOImpl(DBConnect.getConn());
	/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
	int total5 = dao12.getCount();
	
    if (total5 <= 8) {
        first5 = 0; 
        last5 = total5; 
    } else {
        first5 = (pages5 - 1 ) * 8;
        last5 = 8;
    }
    // Lấy ra danh sách sản phẩm
    // List<Shop> list = new ShopDAO().getShop(first5, last5); 
    // for (Shop item : list) { 
    	
    	List<BookDtls> list12 = dao12.getAllBooksfilterCate("Literature",first5, last5); 
		for (BookDtls b2 : list12) { 
%> 
		

<!-- //Ở đây là chỗ cần lặp sản phẩm cần hiển thị
//Ở bài này sẽ hiển thi 4 sản phẩm trên 1 trang
//Nếu nhiều sản phẩm thì sẽ phân trang sang trang 2 3 ... 
//Ví dụ: hiển thị tên sản phẩm <span></span> -->

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
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
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
        
        
<%}%> 

<br>
</div> 
<div  class="pagination" style="margin-left: 38%">    
    <%                //Button Previous
        int back5 = 0;
        if (pages5 == 0 || pages5 == 1) {
            back5 = 1;//Luon la page 1
        } else {
            back5 = pages5 - 1;//Neu pages5 tu 2 tro len thi back5 tru 1
        }
    %>
    <a href="shop.jsp?pages=<%=back5%>">&laquo;</a>
                <%
                    //Button num5ber pages5
                    int loop5 = 0, num5 = 0;
                    if ((total5 / 4) % 2 == 0) {
                        num5 = total5 / 4;
                    } else {
                        num5 = (total5 + 1) / 4;
                    }
                    //Nếu total5 lẻ thêm 1
                    if (total5 % 2 != 0) {
                        loop5 = (total5 / 4) + 1;

                    } else {
                        //Nếu total5 chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                        if (total5 < (num5 * 4) + 4 && total5 != num5 * 4) {
                            loop5 = (total5 / 4) + 1;
                        } else {
                            //Nếu bằng fullPage thì không thêm
                            loop5 = (total5 / 4);
                        }
                    }
                    //Lap so pages5
                    for (int i = 1; i <= loop5; i++) {%>
                <% if (pages5 == i) {%> 

    <span><a class="active" href="shop.jsp?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="shop.jsp?pages=<%=i%>"><%=i%></a> 

        <%}
             }%>
        <%
            //Button next5
            int next5 = 0;
            //Nếu total5 lẻ
            if (total5 % 2 != 0) {
                if (pages5 == (total5 / 4) + 1) {
                    next5 = pages5;//Khong next5
                } else {
                    next5 = pages5 + 1;//Co next5
                }
            } else {
                //Nếu total5 chẵn nhỏ hơn fullpage
                //Và không fullPage thì thêm 1
                if (total5 < (num5 * 4) + 4 && total5 != num5 * 4) {
                    if (pages5 == (total5 / 4) + 1) {
                        next5 = pages5;//Khong next5
                    } else {
                        next5 = pages5 + 1;//Co next5
                    }
                } else {
                    //Nếu fullPage đến trang cuối dừng
                    //Chưa tới trang cuối thì được next5
                    if (pages5 == (total5 / 4)) {
                        next5 = pages5;//Khong next5
                    } else {
                        next5 = pages5 + 1;//Co next5
                    }
                }
            }
        %>
    <a href="shop.jsp?pages=<%=next5%>">&raquo;</a>
</div>
 
  
		<!-- </div>  -->
    </section>  
<!-- popular section ends -->'
<!-- categoryLiterature PRODUCT LIST ENDS -->



<!--  categorySkills PRODUCT LIST BEGIN-->

<!-- popular section starts  -->

    <section class="popular" id="popular7" style="margin-top:-8%; display: ${categorySkills}"> 

    <div class="heading">
        <span>All Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container" > 
    
    
  
<%
    int first6 = 0, last6 = 0, pages6 = 1;
     
    if (request.getParameter("pages") != null) {
        pages6 = (int) Integer.parseInt(request.getParameter("pages"));
    }
    //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
    // int total6 = new ShopDAO().getCount();
    BookDAOImpl dao13 = new BookDAOImpl(DBConnect.getConn());
	/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
	int total6 = dao13.getCount();
	
    if (total6 <= 8) {
        first6 = 0; 
        last6 = total6; 
    } else {
        first6 = (pages6 - 1 ) * 8;
        last6 = 8;
    }
    // Lấy ra danh sách sản phẩm
    // List<Shop> list = new ShopDAO().getShop(first6, last6); 
    // for (Shop item : list) { 
    	
    	List<BookDtls> list13 = dao13.getAllBooksfilterCate("Life skills book",first6, last6); 
		for (BookDtls b2 : list13) { 
%> 
		

<!-- //Ở đây là chỗ cần lặp sản phẩm cần hiển thị
//Ở bài này sẽ hiển thi 4 sản phẩm trên 1 trang
//Nếu nhiều sản phẩm thì sẽ phân trang sang trang 2 3 ... 
//Ví dụ: hiển thị tên sản phẩm <span></span> -->

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
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
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
        
        
<%}%> 

<br>
</div> 
<div  class="pagination" style="margin-left: 38%">  
    <%                //Button Previous
        int back6 = 0;
        if (pages6 == 0 || pages6 == 1) {
            back6 = 1;//Luon la page 1
        } else {
            back6 = pages6 - 1;//Neu pages6 tu 2 tro len thi back6 tru 1
        }
    %>
    <a href="shop.jsp?pages=<%=back6%>">&laquo;</a>
                <%
                    //Button num6ber pages6
                    int loop6 = 0, num6 = 0;
                    if ((total6 / 4) % 2 == 0) {
                        num6 = total6 / 4;
                    } else {
                        num6 = (total6 + 1) / 4;
                    }
                    //Nếu total6 lẻ thêm 1
                    if (total6 % 2 != 0) {
                        loop6 = (total6 / 4) + 1;

                    } else {
                        //Nếu total6 chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                        if (total6 < (num6 * 4) + 4 && total6 != num6 * 4) {
                            loop6 = (total6 / 4) + 1;
                        } else {
                            //Nếu bằng fullPage thì không thêm
                            loop6 = (total6 / 4);
                        }
                    }
                    //Lap so pages6
                    for (int i = 1; i <= loop6; i++) {%>
                <% if (pages6 == i) {%> 

    <span><a class="active" href="shop.jsp?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="shop.jsp?pages=<%=i%>"><%=i%></a> 

        <%}
             }%>
        <%
            //Button next6
            int next6 = 0;
            //Nếu total6 lẻ
            if (total6 % 2 != 0) {
                if (pages6 == (total6 / 4) + 1) {
                    next6 = pages6;//Khong next6
                } else {
                    next6 = pages6 + 1;//Co next6
                }
            } else {
                //Nếu total6 chẵn nhỏ hơn fullpage
                //Và không fullPage thì thêm 1
                if (total6 < (num6 * 4) + 4 && total6 != num6 * 4) {
                    if (pages6 == (total6 / 4) + 1) {
                        next6 = pages6;//Khong next6
                    } else {
                        next6 = pages6 + 1;//Co next6
                    }
                } else {
                    //Nếu fullPage đến trang cuối dừng
                    //Chưa tới trang cuối thì được next6
                    if (pages6 == (total6 / 4)) {
                        next6 = pages6;//Khong next6
                    } else {
                        next6 = pages6 + 1;//Co next6
                    }
                }
            }
        %>
    <a href="shop.jsp?pages=<%=next6%>">&raquo;</a>
</div>
 
  
		<!-- </div>  -->
    </section>  
<!-- popular section ends -->'
<!-- categorySkills PRODUCT LIST ENDS -->
 




<!--  categoryArt PRODUCT LIST BEGIN-->

<!-- popular section starts  -->

    <section class="popular" id="popular8" style="margin-top:-8%; display: ${categoryArt}"> 

    <div class="heading">
        <span>All Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container" > 
    
    
  
<%
    int first7 = 0, last7 = 0, pages7 = 1;
     
    if (request.getParameter("pages") != null) {
        pages7 = (int) Integer.parseInt(request.getParameter("pages"));
    }
    //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
    // int total7 = new ShopDAO().getCount();
    BookDAOImpl dao14 = new BookDAOImpl(DBConnect.getConn());
	/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
	int total7 = dao14.getCount();
	
    if (total7 <= 8) {
        first7 = 0; 
        last7 = total7; 
    } else {
        first7 = (pages7 - 1 ) * 8;
        last7 = 8;
    }
    // Lấy ra danh sách sản phẩm
    // List<Shop> list = new ShopDAO().getShop(first7, last7); 
    // for (Shop item : list) { 
    	
    	List<BookDtls> list14 = dao14.getAllBooksfilterCate("Book of art - architecture",first7, last7); 
		for (BookDtls b2 : list14) { 
%> 
		

<!-- //Ở đây là chỗ cần lặp sản phẩm cần hiển thị
//Ở bài này sẽ hiển thi 4 sản phẩm trên 1 trang
//Nếu nhiều sản phẩm thì sẽ phân trang sang trang 2 3 ... 
//Ví dụ: hiển thị tên sản phẩm <span></span> -->

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
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
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
        
        
<%}%> 

<br>
</div> 
<div  class="pagination" style="margin-left: 38%">     
    <%                //Button Previous
        int back7 = 0;
        if (pages7 == 0 || pages7 == 1) {
            back7 = 1;//Luon la page 1
        } else {
            back7 = pages7 - 1;//Neu pages7 tu 2 tro len thi back7 tru 1
        }
    %>
    <a href="shop.jsp?pages=<%=back7%>">&laquo;</a>
                <%
                    //Button num7ber pages7
                    int loop7 = 0, num7 = 0;
                    if ((total7 / 4) % 2 == 0) {
                        num7 = total7 / 4;
                    } else {
                        num7 = (total7 + 1) / 4;
                    }
                    //Nếu total7 lẻ thêm 1
                    if (total7 % 2 != 0) {
                        loop7 = (total7 / 4) + 1;

                    } else {
                        //Nếu total7 chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                        if (total7 < (num7 * 4) + 4 && total7 != num7 * 4) {
                            loop7 = (total7 / 4) + 1;
                        } else {
                            //Nếu bằng fullPage thì không thêm
                            loop7 = (total7 / 4);
                        }
                    }
                    //Lap so pages7
                    for (int i = 1; i <= loop7; i++) {%>
                <% if (pages7 == i) {%> 

    <span><a class="active" href="shop.jsp?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="shop.jsp?pages=<%=i%>"><%=i%></a> 

        <%}
             }%>
        <%
            //Button next7
            int next7 = 0;
            //Nếu total7 lẻ
            if (total7 % 2 != 0) {
                if (pages7 == (total7 / 4) + 1) {
                    next7 = pages7;//Khong next7
                } else {
                    next7 = pages7 + 1;//Co next7
                }
            } else {
                //Nếu total7 chẵn nhỏ hơn fullpage
                //Và không fullPage thì thêm 1
                if (total7 < (num7 * 4) + 4 && total7 != num7 * 4) {
                    if (pages7 == (total7 / 4) + 1) {
                        next7 = pages7;//Khong next7
                    } else {
                        next7 = pages7 + 1;//Co next7
                    }
                } else {
                    //Nếu fullPage đến trang cuối dừng
                    //Chưa tới trang cuối thì được next7
                    if (pages7 == (total7 / 4)) {
                        next7 = pages7;//Khong next7
                    } else {
                        next7 = pages7 + 1;//Co next7
                    }
                }
            }
        %>
    <a href="shop.jsp?pages=<%=next7%>">&raquo;</a>
</div>
 
  
	<!-- 	</div>  -->
    </section>  
<!-- popular section ends -->'
<!-- categoryArt PRODUCT LIST ENDS -->


<!--  categorySport PRODUCT LIST BEGIN-->

<!-- popular section starts  -->

    <section class="popular" id="popular9" style="margin-top:-8%; display: ${categorySport}"> 

    <div class="heading">
        <span>All Book</span>
        <h3>Professional Bookcases</h3>
    </div>

    <div class="box-container" > 
    
    
  
<%
    int first8 = 0, last8 = 0, pages8 = 1;
     
    if (request.getParameter("pages") != null) {
        pages8 = (int) Integer.parseInt(request.getParameter("pages"));
    }
    //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
    // int total8 = new ShopDAO().getCount();
    BookDAOImpl dao15 = new BookDAOImpl(DBConnect.getConn());
	/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
	int total8 = dao15.getCount();
	
    if (total8 <= 8) {
        first8 = 0; 
        last8 = total8; 
    } else {
        first8 = (pages8 - 1 ) * 8;
        last8 = 8;
    }
    // Lấy ra danh sách sản phẩm
    // List<Shop> list = new ShopDAO().getShop(first8, last8); 
    // for (Shop item : list) { 
    	
    	List<BookDtls> list15 = dao15.getAllBooksfilterCate("Medicine & sport books",first8, last8); 
		for (BookDtls b2 : list15) { 
%> 
		

<!-- //Ở đây là chỗ cần lặp sản phẩm cần hiển thị
//Ở bài này sẽ hiển thi 4 sản phẩm trên 1 trang
//Nếu nhiều sản phẩm thì sẽ phân trang sang trang 2 3 ... 
//Ví dụ: hiển thị tên sản phẩm <span></span> -->

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
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
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
        
        
<%}%> 

<br>
</div> 
<div  class="pagination" style="margin-left: 38%">  
    <%                //Button Previous
        int back8 = 0;
        if (pages8 == 0 || pages8 == 1) {
            back8 = 1;//Luon la page 1
        } else {
            back8 = pages8 - 1;//Neu pages8 tu 2 tro len thi back8 tru 1
        }
    %>
    <a href="shop.jsp?pages=<%=back8%>">&laquo;</a>
                <%
                    //Button num8ber pages8
                    int loop8 = 0, num8 = 0;
                    if ((total8 / 4) % 2 == 0) {
                        num8 = total8 / 4;
                    } else {
                        num8 = (total8 + 1) / 4;
                    }
                    //Nếu total8 lẻ thêm 1
                    if (total8 % 2 != 0) {
                        loop8 = (total8 / 4) + 1;

                    } else {
                        //Nếu total8 chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                        if (total8 < (num8 * 4) + 4 && total8 != num8 * 4) {
                            loop8 = (total8 / 4) + 1;
                        } else {
                            //Nếu bằng fullPage thì không thêm
                            loop8 = (total8 / 4);
                        }
                    }
                    //Lap so pages8
                    for (int i = 1; i <= loop8; i++) {%>
                <% if (pages8 == i) {%> 

    <span><a class="active" href="shop.jsp?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="shop.jsp?pages=<%=i%>"><%=i%></a> 

        <%}
             }%>
        <%
            //Button next8
            int next8 = 0;
            //Nếu total8 lẻ
            if (total8 % 2 != 0) {
                if (pages8 == (total8 / 4) + 1) {
                    next8 = pages8;//Khong next8
                } else {
                    next8 = pages8 + 1;//Co next8
                }
            } else {
                //Nếu total8 chẵn nhỏ hơn fullpage
                //Và không fullPage thì thêm 1
                if (total8 < (num8 * 4) + 4 && total8 != num8 * 4) {
                    if (pages8 == (total8 / 4) + 1) {
                        next8 = pages8;//Khong next8
                    } else {
                        next8 = pages8 + 1;//Co next8
                    }
                } else {
                    //Nếu fullPage đến trang cuối dừng
                    //Chưa tới trang cuối thì được next8
                    if (pages8 == (total8 / 4)) {
                        next8 = pages8;//Khong next8
                    } else {
                        next8 = pages8 + 1;//Co next8
                    }
                }
            }
        %>
    <a href="shop.jsp?pages=<%=next8%>">&raquo;</a>
</div>
 
  
		<!-- </div>  -->
    </section>  
<!-- popular section ends -->'
<!-- categorySport PRODUCT LIST ENDS -->
 







<!--  END
	Foreign language books 
	Literature 
	Life skills book 
	Book of art - architecture 
	Medicine & sport books 
	categoryLanguage categoryLiterature categorySkills categoryArt categorySport
	-->
	

	<%@include file="all_component/footer.jsp"%>


	<!-- custom css file link  -->
	<script src="js/script.js"></script>


<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 -->

</body>
</html>