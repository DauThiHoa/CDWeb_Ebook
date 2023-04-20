<%@page import="com.example.ebook.entity.User"%>
<%@page import="com.example.ebook.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.example.ebook.dao.BookDAOImpl"%>
<%@page import="com.example.ebook.connect.DBConnect"%>
<%@page import="java.sql.Connection"%>

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

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/icon2.png" type="image/png" class="icon">
 
<title>Ebook: All New Book</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
/* .back-img {
	background: url("img/bak.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
} */
.crd-ho:hover {
	background-color: #fcf7f7;
}

/*
toast
*/
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadenIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom :0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {from { bottom :30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>


</head>
<body style="background-color: #f7f7f7;">


<%
	User u = (User) session.getAttribute("userobj");
	%>
	
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



	<%@include file="all_component/navbar.jsp"%> 
	<%-- <%@include file="navbar.jsp" %> --%>
	
	<div class="container-fluid">
		<div class="row p-5">
			<%BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
List<BookDtls> list = dao.getAllNewBook();
for (BookDtls b : list) {%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
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
							<a href="/Ebook/login" class="btn btn-danger btn-sm"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							<!--  NGUOC LAI NEU DA DANG NHAP VAO TAI KHOAN => DI CHUYEN DEN TRANG CARTSERVLET ( XU LY SU KIEN THEM SAN PHAM VAO GIO HANG )-->
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm"><i
								class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							}
							%>
							
							
							  <a
								href="view_books.jsp?id=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-0">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%}%>
		</div>
	</div>

</body>
</html>