<%@page import="com.example.ebook.dao.CommentDAOImpl"%>
<%@page import="com.example.ebook.entity.CommentProduct"%>
<%@page import="com.example.ebook.dao.CommentDAO"%>
<%@page import="com.example.ebook.entity.User"%>
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
<%@include file="all_component/allCss.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/icon2.png" type="image/png" class="icon">
  
<!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
 
<title>Ebook: View Product</title>

 
 	 <script src="fontend/js/jquery-3.3.1.js"></script>
     <script src="fontend/js/bootstrap.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <link rel="stylesheet" href="fontend/css/bootstrap.min.css">
     <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0.500;0,700;1,300;1,400;1,500&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="fontend/fonts/fontawesome/css/all.min.css">
     <link rel="stylesheet" href="fontend/css/style.css">
     <link rel="stylesheet" href="fontend/css/product.css">
     <link rel="stylesheet" href="fontend/css/cart.css">
     
     
<%@include file="all_component/allCss.jsp"%>
 
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	 
	
	<c:if test="${not empty failed }">

		<!-- begin toast -->
		<!-- ------------------- -->
		<div id="toast">${failed}</div>
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

		<c:remove var="failed"
			scope="session"/>

	</c:if>
	
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(id);
	%>


 
<button onclick="topFunction()" id="myBtn-scroll" title="Go to top"><i class="fas fa-chevron-up"></i></button>
     <!-- product -->
     <section class="product" style="background: #f0f1f2" >
         <div class="container" style="margin-top: 8%">
             <div class="row bg-white pt-4 pb-4 border-bt pc">
              

              <article class="product__main col-lg-9 col-md-12 col-sm-12">
                    <div class="row">
                    
                        <div class="product__main-img col-lg-4 col-md-4 col-sm-12">
                        
                            <div class="product__main-img-primary">
                                <img src="book/<%=b.getPhotoName()%>">
                            </div>

                            <div class="product__main-img-list">
                                <img src="book/<%=b.getPhotoName()%>">
                                <img src="fontend/images1/product/hoc-tap-qua-du-an-2-01-1 1.jpg">
                                <img src="fontend/images1/product/hoc-tap-qua-du-an-2-01-1 2.jpg">
                                <!-- <img src="fontend/images1/product/23f849a0617301e63159067164aecfd2.png"> -->
                            </div>
                        </div>

                        <div class="product__main-info col-lg-8 col-md-8 col-sm-12">
                            <div class="product__main-info-breadcrumb text-success">
                               <a class="product__main-info-breadcrumb text-success" style="font-weight: bold;" href="Ebook">Home</a> /<a style="font-weight: bold;" class="product__main-info-breadcrumb text-success" href="#">Products</a>  
                            </div>
                            
                            <a href="#" class="product__main-info-title">
                                <h1 class="product__main-info-heading" style="font-weight: bold;">
                                     <%=b.getBookName()%>
                                </h1>
                            </a>

                            <div class="product__main-info-rate-wrap">
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>  
                  
                           </div> 
                          <!--  <br><br><br><br><br><br><br><br><br><br><br><br>
                           -->  
                             <div class="product__main-info-price">
                                <span class="product__main-info-price-current" style="font-weight: bold;">
                                   <%=b.getPrice()%>$
                                </span>
                          </div>
				
                            <div class="product__main-info-price">
                                <span class="product__main-info-price-current text-success" style="font-weight: bold;">
									<h4>
										Author Name : <span class="text-success" style="font-size: 100%"> <%=b.getAuthor()%></span>
									</h4>
								</span>
                            </div>
                            <div class="product__main-info-price">
                                <span class="product__main-info-price-current text-success" style="font-weight: bold;">
									<h4>
										Category : <span class="text-success" style="font-size: 100%"> <%=b.getBookCategory()%></span>
									</h4>
								</span>
                            </div>
                            
                            <div class="product__main-info-description">
                                For nearly a century, many educators have researched and documented the benefits of experiential, hands-on, and learner-centered learning. The scientist Albert Einstein...
                            </div> 


                            <%-- <div class="product__main-info-cart"> 
                                
                                <div class="product__main-info-cart-btn-wrap">
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>">
                                    <button class="product__main-info-cart-btn" style="background: green;">
                                    <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>">
                                       <i style="font-size: 100%; margin-right: 5%" class="fas fa-cart-plus"></i>
                                       Add to cart
                                    <!--  </a> -->
                                    </button>
                                <!-- </a>   -->  
                                </div>
                            </div>  --%>

                        <form action="addProductDetails" method="post" class="product__main-info-cart">
							<!-- <article class="row cart__body">  -->
  
							<!-- </article>  -->
                                <div class="product__main-info-cart-btn-wrap"> 
                                 <article class="row cart__body"> 
                                 <div class="col-3 cart__body-quantity">
                                 
									<!-- <input type="hidden" style="display: none"  value="1" name="bid" class="cart__body-quantity-minus">  
									 -->	
									 
									 <input style="width: 500%; border: 1px solid black;"
										type="number" step="1" min="1" max="999" value="1" name="quantity"
										class="cart__body-quantity-total"> 
										
										<!-- <input
										type="hidden" value="1" name="uid" class="cart__body-quantity-plus"> 
									  --> 
								</div>  
								 </article>   
										
										 
									 
						   <%
							if (u == null) {
							%>
							     <a href="/Ebook/login" class="btn btn-danger btn-sm">
							     <i style="font-size: 100%; margin-right: 5%"  class="fas fa-cart-plus"></i>
							     Add To Cart</a>
							<%
							} else {
							%>
							
							         <input type="hidden" style="display: none" value="<%=b.getBookId()%>" name="bid" > 
									 <input type="hidden" style="display: none" value="<%=u.getId()%>" name="uid"  >  
									 
									 <button type="submit" class="btn btn-danger btn-sm" style=" "> 
                                       <i style="font-size: 100%; margin-right: 5%" class="fas fa-cart-plus"></i>
                                       Add to cart 
                                    </button>   
							<%
							}
							%>   
                                    
                                </div>
                                
                                
                            </form> 
                             
                            
                         <div class="product__main-info-contact">
                                <a href="#" class="product__main-info-contact-fb">
                                    <i class="fab fa-facebook-f"></i>
                                    Chat FaceBook
                                </a>
                                <div class="product__main-info-contact-phone-wrap">
                                    <div class="product__main-info-contact-phone-icon">
                                        <i class="fas fa-phone-alt "></i>
                                    </div>
                                    
                                    <div class="product__main-info-contact-phone">
                                        <div class="product__main-info-contact-phone-title">
                                            Call for advice
                                        </div>
                                        <div class="product__main-info-contact-phone-number">
                                            ( 0352.860.701)
                                        </div>
                                    </div>

                                </div>

                            </div> 
                        </div>
                    </div>

                    <div class="row bg-white">
                        <div class="col-12 product__main-tab">
                            <a href="#" class="product__main-tab-link product__main-tab-link--active">
                              Describe
                            </a>
                            <a href="#" class="product__main-tab-link">
                               Evaluate
                            </a>
                        </div>

                        <div class="col-12 product__main-content-wrap">
                            <h2 class="product__main-content-heading">
                                Learning through projects
                            </h2>

                            <p>
                                <span>For nearly a century,</span> Many educators have conducted research and documented the benefits of experiential, hands-on, and learner-centered learning. Albert Einstein once said: “Example is not another way to teach; example is the only way to teach.” Almost every teacher understands the appeal of real-world learning compared to a purely theoretical classroom.
                            </p>

                            <p>
                                <span> Authors Hoang Anh Duc and To Thuy Diem Quyen </span> wants to offer a light and intuitive approach for both teachers and students to Project Learning; using projects to make the most diverse, multi-dimensional and real-life examples, thereby helping readers build their own treasures of knowledge and skills.
                            </p>

                            <p>
                                <span>Project-Based Learning (PBL)</span> is a model of classroom organization to energize the traditional classroom, which is lesson-centered and teacher-centered. Project-based learning is long-term, learner-centered, inter-content, and integrates real-world problems. By taking a step back, taking on leadership roles and empowering students to take control of the learning process, students form a sense of responsibility for learning, thereby creating a more proactive learning environment.
                            </p>
                            <p> <span>The book consists of four main parts:</span></p>
                            <p>
                                <span>Part I: Introduction to project-based learning</span> <br>
                                This section consists of 3 chapters, giving an overview of project-based learning, 6 learning characteristics of learning projects, and 8 steps of implementing project-based learning in high schools.
                            </p>
                            <p>
                                <span>Part II: Project implementation </span> <br>
                               This section consists of 8 chapters to help teachers and students know how to put projects in a suitable space, know how to implement projects from an existing space.
                            </p>
                            <p>
                                <span>Part III: Introduction to project-based learning</span> <br>
                               This section provides a background on the different measures for assessing the Learning Project, as well as the different levels for assessing learning activities.
                            </p>
                            <p>
                                <span>Part IV: Appendix </span> <br>
                                This section expands on some issues such as: STEM thinking in project-based learning, common problems and suggestions for handling….

                                The book integrates with QR codes so that teachers and students can see illustrations of projects that have been implemented and won prizes in Creative Teacher competitions.
                                </p> 
                            
                            <h2 class="thongtin">    <span>Details</span> 
                             </h2>
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <tbody>
                                            <tr>
                                                <th>Issuing company</th>
                                                <td>Vietnam Education Publishing House</td>
                                            </tr>
                                            <tr><th>Publication date</th><td>2019-03-15 11:47:36</td></tr>
                                            <tr><th>Size</th><td>19 x 27 cm</td></tr>
                                            <tr><th>Cover Type</th><td>Folding cover</td></tr>
                                            <tr><th>Number of pages</th><td>168</td></tr>
                                            <tr><th>SKU</th><td>4119626029817</td></tr>
                                        </tbody>
                                    </table>
                                </div>
                              
                        
                        </div>
                        
                    </div> 
                </article>  

                <aside class="product__aside col-lg-3 col-md-0 col-sm-0">
                    <div class="product__aside-top">
                        <div class="product__aside-top-item">
                            <img src="fontend/images/shipper.png">
                            <div class="product__aside-top-item-text">
                                <p>
                                    Fast shipping
                                </p>
                                <span>
                                   In just 24 hours
                                </span>
                            </div>
                        </div>
                        <div class="product__aside-top-item">
                            <img src="fontend/images/brand.png">
                            <div class="product__aside-top-item-text">
                                <p>
                                    Genuine product
                                </p>
                                <span>
                                   100% imported products
                                </span>
                            </div>
                        </div>
                        <div class="product__aside-top-item">
                            <img src="fontend/images/less.png">
                            <div class="product__aside-top-item-text">
                                <p>
                                    Buy savings
                                </p>
                                <span>
                                    10% to 30% cheaper
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="product__aside-bottom">
                        <h3 class="product__aside-heading">
                            Maybe you like
                        </h3>

                    <div class="product__aside-list">

							<%
			               	BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
							List<BookDtls> list1 = dao1.getNewBook();
								for (BookDtls b1 : list1) {
							%>
 
							<div class="product__aside-item product__aside-item--border">
                                <div class="product__aside-img-wrap">
                               		 <a href="/Ebook/view_books?id=<%=b1.getBookId()%>"> 
                                    <img src="book/<%=b1.getPhotoName()%>" class="product__aside-img">
                                    </a>
                                </div>
                                <div class="product__aside-title">
                                    <a href="/Ebook/view_books?id=<%=b1.getBookId()%>"  class="product__aside-link">
                                        <h4 class="product__aside-link-heading"><%=b1.getBookName()%></h4>
                                    </a>
 
 							<div class="product__main-info-rate-wrap">
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>
                                <i class="fas fa-star product__main-info-rate" style="color: yellow;"></i>  
                  
                           </div> 
                           
                                    <div class="product__aside-price">
                                        <span class="product__aside-price-current text-success" style="font-weight: bold;">
                                            $<%=b1.getPrice()%>
                                        </span>
                                    </div>
                                    
                                </div>
                            </div> 

 							<%
							}
							%>
                         
          
                        </div>
                    </div>
                </aside>  

            </div>
            
          <div class="customer-reviews row pb-4 pb-4  py-4 pb-4 py-4 py-4">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <h3 class="text-success" style="font-weight: bold;" >Product Comments</h3>
                
                <form id ="formgroupcomment" action="commentProduct" method="post">
                    <div class="form-group">
                        <label>Name:</label>
                        	 <%
							if (u == null) {
							%> 
							 <input name="name"  required type="text" id ='form-name' class="form-control">
							 <%
							} else {
							%> 
							<input name="name"  required type="text" id ='form-name' class="form-control" value="<%=u.getName()%>">
							<%
							}
							%>
                      
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        
                           <%
							if (u == null) {
							%>  
							  <input name="email" required  type="email"  class="form-control" id="pwd" >
							 <%
							} else {
							%>  
							 <input name="email" required  type="email"  class="form-control" id="pwd"   value="<%=u.getEmail()%>" >
							<%
							}
							%>
                    </div>
                    <div class="form-group">
                        <label>Content:</label>
                        
                       		 <%
							if (u != null) {
							%> 
                        <input type="hidden" name="bid" value="<%=b.getBookId()%>">
                        <input type="hidden" name="uid" value="<%=u.getId()%>">
                       		 <%
							}
							%>
							
                        <textarea name="content" required  rows="8" id ='formcontent' class="form-control"></textarea>     
                    </div>
                    
                     		<%
							if (u == null) {
							%> 
							        <a href="/Ebook/login"  type="submit" name="sbm" id= "submitcomment" class="btn btn-primary" style="width: 10%;font-weight: bold;">Send</a>
							<%
							} else {
							%>  
                                    <button type="submit" name="sbm" id= "submitcomment" class="btn btn-primary" style="width: 10%;font-weight: bold;">Send</button>
							<%
							}
							%>   
							
                </form> 
            </div>
           </div>


			     <% 
			     CommentDAO dao2 = new CommentDAOImpl(DBConnect.getConn()); 
			      List<CommentProduct> list2 = dao2.listCommentProduct(b.getBookId());
								 
				 for (CommentProduct c : list2) { 
				 %>

			<div class="product-comment row pb-4 pb-4  py-4 pb-4 py-4 py-4">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="comment-item">
						<ul class=item-reviewer>
							<div class="comment-item-user">
								<img src="fontend/images/img/1.png" alt=""
									class="comment-item-user-img">

								<li><b><%=c.getName()%></b></li>
							</div>

							<br>
							<li><%=c.getDate()%></li>
							<li>
								<h4><%=c.getContent()%></h4>
							</li>
						</ul>
					</div>

				</div>
			</div>

			<%
			}
			%>   
            
           
         </div>
              </div>
    </section> 
    <!--product -->




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

 <section class="popular" id="popular5" style="display: block; margin-top: -8%">  

    <div class="heading">
        <span>Similar Product</span>
       <!--  <h3>Professional Bookcases</h3> -->
    </div>

    <div class="box-container" style=" background: while" > 
    
    
  
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
	
    if (total4 <= 4) {
        first4 = 0; 
        last4 = total4; 
    } else {
        first4 = (pages4 - 1 ) * 4;
        last4 = 4;
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

 <div class="box" style=" background: while">
        
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
                    <i style="font-size: 100%;" class="fas fa-star"></i>
                    <i style="font-size: 100%;" class="fas fa-star"></i>
                    <i style="font-size: 100%;" class="fas fa-star"></i>
                    <i style="font-size: 100%;" class="fas fa-star"></i>
                    <i style="font-size: 100%;" class="fas fa-star-half-alt"></i>
                    <span> (50) </span>
                </div>
                <div class="price" style="font-weight: bold;">$<%=b2.getPrice()%><span>  $50.00</span></div>
                <!-- <a href="#" class="btn">add to cart</a>  -->
               
						 
			<!-- <h5> -->

						<%
						if (b2.getBookCategory().equals("Old")) {
						%>

							Categories: <%=b2.getBookCategory()%></h5>
						<div class="row" style="margin-left: 25%">
							<a href="/Ebook/view_books?id=<%=b2.getBookId()%>" class="btn btn-success btn-sm ml-5"><i style="font-size: 100%;"  class="fas fa-eye"></i></a>  
						</div>
						
						<%
						} else {
						%>
						
						    Categories: <%=b2.getBookCategory()%></h5>
						<div style="text-align: center; margin-left: 17%" class="row" >


							<!-- NEU CHUA DANG NHAP VAO WEBSITE => KHONG CHO PHEP THEM VAO GIO HANG => DI CHUYEN VE TRANG LOGIN -->
							<%
							if (u == null) {
							%>
							     <a href="/Ebook/login" class="btn btn-danger btn-sm"><i style="font-size: 100%;"  class="fas fa-cart-plus"></i></a>
							<%
							} else {
							%>
							
					<!--  NGUOC LAI NEU DA DANG NHAP VAO TAI KHOAN => DI CHUYEN DEN TRANG CARTSERVLET ( XU LY SU KIEN THEM SAN PHAM VAO GIO HANG )-->
							<a href="cart?bid=<%=b2.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm"><i style="font-size: 100%;"  class="fas fa-cart-plus"></i></a>

							<%
							}
							%>

							<a style="margin-left: 5%" href="/Ebook/view_books?id=<%=b2.getBookId()%>" class="btn btn-success btn-sm"><i style="font-size: 100%;"  class="fas fa-eye"></i></a> 
						</div>
						
						<%
						}
						%> 
            </div>
        </div>
        
        
<%}%> 

<br>
<div  class="pagination">    
    <%                //Button Previous
        int back4 = 0;
        if (pages4 == 0 || pages4 == 1) {
            back4 = 1;//Luon la page 1
        } else {
            back4 = pages4 - 1;//Neu pages4 tu 2 tro len thi back4 tru 1
        }
    %>
    <a href="/Ebook/shop?pages=<%=back4%>">&laquo;</a>
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

    <span><a class="active" href="/Ebook/shop?pages=<%=i%>"><%=i%></a></span>
                <%} else {%>
   <a href="/Ebook/shop?pages=<%=i%>"><%=i%></a> 

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
    <a href="/Ebook/shop?pages=<%=next4%>">&raquo;</a>
</div>
 
  
		</div> 
    </section>   
<!-- popular section ends -->'
<!-- categoryLanguage PRODUCT LIST ENDS -->
 
 
 
 

<!-- footer section starts  -->

	<%@include file="all_component/footer.jsp"%>
<!-- footer section ends -->
 
 
 <!-- end footer -->
    <script src="fontend/js/jq.js"></script>
</body>
</html>