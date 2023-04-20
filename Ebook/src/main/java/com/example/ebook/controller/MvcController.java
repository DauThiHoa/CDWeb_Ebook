package com.example.ebook.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;

import com.example.ebook.connect.DBConnect;
import com.example.ebook.dao.BookDAOImpl;
import com.example.ebook.dao.CartDAOImpl;
import com.example.ebook.dao.CommentDAO;
import com.example.ebook.dao.CommentDAOImpl;
import com.example.ebook.dao.UserDAOImpl;
import com.example.ebook.entity.BookDtls;
import com.example.ebook.entity.Cart;
import com.example.ebook.entity.CommentProduct;
import com.example.ebook.entity.User;

// LOP HIEN THI CAC TRANG
@Controller
public class MvcController {

	@GetMapping("/Ebook") // LAY THONG TIN TRANG WEB LOGIN
	public String home(ModelMap model) {
		System.out.println("Going Home ...");
		return "index";
	}

	@GetMapping("/Ebook/login") // LAY THONG TIN TRANG WEB LOGIN
	public String loginUser(ModelMap model) {
		System.out.println("Going login...");
		return "login";
	}

// ==================== GET MAPPING ADMIN ========================

	@GetMapping("/Ebook/add_books") // LAY THONG TIN TRANG WEB LOGIN
	public String view_add_books(ModelMap model) {
		return "admin/add_books";
	}

	@GetMapping("/Ebook/all_books") // LAY THONG TIN TRANG WEB LOGIN
	public String view_all_books(ModelMap model) {
		return "admin/all_books";
	}

	@GetMapping("/Ebook/orders") // LAY THONG TIN TRANG WEB LOGIN
	public String view_orders(ModelMap model) {
		return "admin/orders";
	}

	@GetMapping("/Ebook/home") // LAY THONG TIN TRANG WEB LOGIN
	public String view_home(ModelMap model) {
		return "admin/home";
	}

	@GetMapping("/Ebook/editbooks") // LAY THONG TIN TRANG WEB LOGIN
	public String view_edit_books(ModelMap model) {
		return "admin/edit_books";
	}

	@GetMapping("/Ebook/delete") // LAY THONG TIN TRANG WEB LOGIN
	public String BooksDeleteServlet(ModelMap model, @RequestParam String id) {

		int idInteger = Integer.parseInt(id);

		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteBooks(idInteger);

		if (f) {
			model.put("succMsg", "Book Delete Sucessfully...");
			return "admin/all_books";
		} else {
			model.put("failedMsg", "Something wrong on Server...");
			return "admin/all_books";
		}
	}

	// ==================== POST MAPPING ADMIN ========================

	@PostMapping("/Ebook/add_books") // LAY THONG TIN TRANG WEB LOGIN
	public String BooksAdd(ModelMap model, @RequestParam String bname, @RequestParam String author,
			@RequestParam String price, @RequestParam String categories, @RequestParam String status,
			@RequestPart Part bimg, HttpServletRequest request) throws IOException, ServletException {

		Double priceDouble = Double.parseDouble(price);
//		Part part = request.getPart("bimg"); 

		String fileName = bimg.getSubmittedFileName();

		BookDtls b = new BookDtls(bname, author, priceDouble, categories, status, fileName, "admin");

		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		boolean f = dao.addBooks(b);

		if (f) {
			String path = request.getServletContext().getRealPath("") + "/WEB-INF/views/book";

			File file = new File(path);
			bimg.write(path + File.separator + fileName);

			model.put("succMsg", "Book Add Sucessfully");
			return "admin/add_books";
		} else {

			model.put("failedMsg", "Something wrong on Server");
			return "admin/add_books";
		}
	}

	@PostMapping("/Ebook/editbooks") // LAY THONG TIN TRANG WEB LOGIN
	public String EditBooksServlet(ModelMap model, @RequestParam String id, @RequestParam String bname,
			@RequestParam String author, @RequestParam String price, @RequestParam String status,
			HttpServletRequest request) throws IOException, ServletException {

		int idInteger = Integer.parseInt(id);
		Double priceDouble = Double.parseDouble(price);

		System.out.println(id + " - " + bname + " - " + author + " - " + price + " - " + status);

		BookDtls b = new BookDtls();
		b.setBookId(idInteger);
		b.setBookName(bname);
		b.setAuthor(author);
		b.setPrice(priceDouble);
		b.setStatus(status);

		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		boolean f = dao.updateEditBooks(b);

		if (f) {
			model.put("succMsg", "Book Update Sucessfully...");
			return "admin/all_books";
		} else {
			model.put("failedMsg", "Something wrong on Server...");
			return "admin/all_books";
		}

	}

	// ==================== GET MAPPING USER ========================

	@GetMapping("/Ebook/logout") // LAY THONG TIN TRANG WEB LOGIN
	public String LogoutServlet(ModelMap model, HttpServletRequest request) {

		request.getSession().removeAttribute("userobj");
		model.put("succMsg", "Logout Sucessfully");
		return "login";
	}

	@GetMapping("/Ebook/shop") // LAY THONG TIN TRANG WEB LOGIN
	public String shop(ModelMap model, HttpServletRequest request) {
		return "shop";
	}

	@GetMapping("/Ebook/about") // LAY THONG TIN TRANG WEB LOGIN
	public String about(ModelMap model, HttpServletRequest request) {
		return "about";
	}

	@GetMapping("/Ebook/review") // LAY THONG TIN TRANG WEB LOGIN
	public String review(ModelMap model, HttpServletRequest request) {
		return "review";
	}

	@GetMapping("/Ebook/blog") // LAY THONG TIN TRANG WEB LOGIN
	public String blog(ModelMap model, HttpServletRequest request) {
		return "blog";
	}

	@GetMapping("/Ebook/contact") // LAY THONG TIN TRANG WEB LOGIN
	public String contact(ModelMap model, HttpServletRequest request) {
		return "contact";
	}

	@GetMapping("/Ebook/checkout") // LAY THONG TIN TRANG WEB LOGIN
	public String checkout(ModelMap model, HttpServletRequest request) {
		return "checkout";
	}

	@GetMapping("/Ebook/favourite") // LAY THONG TIN TRANG WEB LOGIN
	public String favourite(ModelMap model, HttpServletRequest request) {
		return "favourite";
	}

	@GetMapping("/Ebook/setting") // LAY THONG TIN TRANG WEB LOGIN
	public String setting(ModelMap model, HttpServletRequest request) {
		return "setting";
	}

	@GetMapping("/Ebook/register") // LAY THONG TIN TRANG WEB LOGIN
	public String register(ModelMap model, HttpServletRequest request) {
		return "register";
	}

	@GetMapping("/Ebook/reset") // LAY THONG TIN TRANG WEB LOGIN
	public String reset(ModelMap model, HttpServletRequest request) {
		return "reset";
	}

	@GetMapping("/Ebook/view_books") // LAY THONG TIN TRANG WEB LOGIN
	public String view_books(ModelMap model, HttpServletRequest request) {
		return "view_books";
	}

	@GetMapping("/Ebook/all_old_book") // LAY THONG TIN TRANG WEB LOGIN
	public String all_old_book(ModelMap model, HttpServletRequest request) {
		return "all_old_book";
	}

	@GetMapping("/Ebook/all_recent_book") // LAY THONG TIN TRANG WEB LOGIN
	public String all_recent_book(ModelMap model, HttpServletRequest request) {
		return "all_recent_book";
	}

	@GetMapping("/Ebook/all_new_book") // LAY THONG TIN TRANG WEB LOGIN
	public String all_new_book(ModelMap model, HttpServletRequest request) {
		return "all_new_book";
	}

	@GetMapping("/Ebook/order") // LAY THONG TIN TRANG WEB LOGIN
	public String order(ModelMap model, HttpServletRequest request) {
		return "order";
	}

	@GetMapping("/Ebook/helpline") // LAY THONG TIN TRANG WEB LOGIN
	public String helpline(ModelMap model, HttpServletRequest request) {
		return "helpline";
	}

	@GetMapping("/Ebook/sell_book") // LAY THONG TIN TRANG WEB LOGIN
	public String sell_book(ModelMap model, HttpServletRequest request) {
		return "sell_book";
	}

	@GetMapping("/Ebook/old_book") // LAY THONG TIN TRANG WEB LOGIN
	public String old_book(ModelMap model, HttpServletRequest request) {
		return "old_book";
	}

	@GetMapping("/Ebook/edit_profile") // LAY THONG TIN TRANG WEB LOGIN
	public String edit_profile(ModelMap model, HttpServletRequest request) {
		return "edit_profile";
	}
	
	@GetMapping("/Ebook/cart") // LAY THONG TIN TRANG WEB LOGIN
	public String CartServlet(ModelMap model, @RequestParam String bid, @RequestParam String uid, HttpServletRequest request)
			throws IOException {
		  
//      LAY DU LIEU TU FORM
		int bidInt = Integer.parseInt( bid );
		int uidInt = Integer.parseInt( uid );

//		LAY SACH VOI ID NHAN VAO
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		BookDtls b = dao.getBookById(bidInt);

//		THAY DOI GIA TRI TRONG GIO HANG
		Cart c = new Cart();
		c.setBid(bidInt);
		c.setUserId(uidInt);
		c.setBookName(b.getBookName());
		c.setImage(b.getPhotoName());
		c.setAuthor(b.getAuthor());  
		c.setQuantity(1);  
		c.setPrice(b.getPrice()); 
		c.setTotalPrice(b.getPrice());

//		THEM 1 SAN PHAM VAO DANH SACH
		CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
//		KIEM TRA XEM SACH DA DUOC THEM VAO CSDL HAY CHUA 
		boolean checkIdBook = dao2.checkBookCart(bidInt, uidInt); 
		
		if (checkIdBook) { // NEU TRUE => CO THEM SO LUONG SAN PHAM TRONG CSDL 
			 
			
			boolean success = dao2.updateBookCart(bidInt, uidInt);
//			KIEM TRA
				if (success) {
					model.put("addCart", "Book Update To Cart");
					return "checkout"; 
				} else {
					model.put("failed", "Something Wrong On Server");
					return "index"; 
				}
			 
		} else {
			boolean f = dao2.addCart(c);

//		KIEM TRA
			if (f) {
				model.put("addCart", "Book Added To Cart");
				return "checkout"; 
			} else {
				model.put("failed", "Something Wrong On Server");
				return "index"; 
			}
		}
	}
	
//	@GetMapping("/Ebook/changePassword") // LAY THONG TIN TRANG WEB LOGIN
//	public String ChangePassword(ModelMap model, @RequestParam String email, @RequestParam String currentPassword
//			, @RequestParam String newPassword, @RequestParam String confirmPassword , HttpServletRequest request , HttpServletResponse response)
//			throws IOException {
//  
//		response.setContentType("text/plain");
//		PrintWriter out = response.getWriter(); 
//		
////		String hash = BCrypt.hashpw(currentPassword, BCrypt.gensalt(5));
//		
////		System.out.println(email + "  -----  " + currentPassword);
////			KET NOI DU LIEU
////		$2a$05$ugAb0E9Pdy5Kk1xumjJ.dezc1jLpBY/pqszBjH/stHx6JOC9O1Weq
////		System.out.println(hash);
//		
//		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
////		boolean checkPassEmail = dao.checkPasswordEmail(email, hash);
//		boolean us = dao.checkPasswordEmail(email, currentPassword);
//		
////		System.out.println(checkPassEmail + "=> checkPassEmail ");
//		
//		if (!us) {
//			out.print("Email & Password Invalid");
//			return "changePassword";
//		}else
//		if (currentPassword.equals(newPassword)) {
//			out.print("Password is same old password");
//			return "changePassword";
//		}else
//		if (!confirmPassword.equals(newPassword)) {
//			out.print("Password incorrect");
//			return "changePassword";
//		}
//		return "login";
//		
//
//	}
	
	
	// ==================== POST MAPPING USER ========================

	@PostMapping("/Ebook/add_old_book") // LAY THONG TIN TRANG WEB LOGIN
	public String AddOldBook(ModelMap model, @RequestParam String bname, @RequestParam String author,
			@RequestParam String price, @RequestPart Part bimg, @RequestParam String user, HttpServletRequest request)
			throws IOException {

		Double priceDouble = Double.parseDouble(price);
		String categories = "Old";
		String status = "Active";
		String fileName = bimg.getSubmittedFileName();

		BookDtls b = new BookDtls(bname, author, priceDouble, categories, status, fileName, user);

		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

		boolean f = dao.addBooks(b);

		if (f) {
			String path = request.getServletContext().getRealPath("") + "/WEB-INF/views/book";
//			System.out.println(path);

			File file = new File(path);

			bimg.write(path + File.separator + fileName);

			model.put("succMsg", "Book Add Sucessfully");
			return "sell_book";
		} else {
			model.put("failedMsg", "Something wrong on Server");
			return "sell_book";
		}
	}

//	@PostMapping("/Ebook/arrangeServlet") // LAY THONG TIN TRANG WEB LOGIN
//	public String ArrangeServlet(ModelMap model, @RequestParam String descPrice, @RequestParam String ascPrice,
//			@RequestParam String descName, @RequestParam String ascName, @RequestParam String categoryLanguage,
//			@RequestParam String categoryLiterature, @RequestParam String categorySkills,
//			@RequestParam String categoryArt, @RequestParam String categorySport, HttpServletRequest request,
//			HttpServletResponse response) throws IOException {
//
//		if (descPrice != null) {
//
//			model.put("descPrice", "block");
//			model.put("ascPrice", "none");
//			model.put("descName", "none");
//			model.put("ascName", "none");
//
//			model.put("categoryLanguage", "none");
//			model.put("categoryLiterature", "none");
//			model.put("categorySkills", "none");
//			model.put("categoryArt", "none");
//			model.put("categorySport", "none");
//			return "shop";
//		} 
//		else if (ascPrice != null) {
//
//			model.put("descPrice", "none");
//			model.put("ascPrice", "block");
//			model.put("descName", "none");
//			model.put("ascName", "none");
//
//			model.put("categoryLanguage", "none");
//			model.put("categoryLiterature", "none");
//			model.put("categorySkills", "none");
//			model.put("categoryArt", "none");
//			model.put("categorySport", "none");
//			return "shop";
//
//		} else if (descName != null) {
//
//			model.put("descPrice", "none");
//			model.put("ascPrice", "none");
//			model.put("descName", "block");
//			model.put("ascName", "none");
//
//			model.put("categoryLanguage", "none");
//			model.put("categoryLiterature", "none");
//			model.put("categorySkills", "none");
//			model.put("categoryArt", "none");
//			model.put("categorySport", "none");
//			return "shop";
//
//		} else if (ascName != null) {
//
//			model.put("descPrice", "none");
//			model.put("ascPrice", "none");
//			model.put("descName", "none");
//			model.put("ascName", "block");
//
//			model.put("categoryLanguage", "none");
//			model.put("categoryLiterature", "none");
//			model.put("categorySkills", "none");
//			model.put("categoryArt", "none");
//			model.put("categorySport", "none");
//			return "shop";
//
//		} else if (categoryLanguage != null) {
//
//			model.put("descPrice", "none");
//			model.put("ascPrice", "none");
//			model.put("descName", "none");
//			model.put("ascName", "none");
//
//			model.put("categoryLanguage", "block");
//			model.put("categoryLiterature", "none");
//			model.put("categorySkills", "none");
//			model.put("categoryArt", "none");
//			model.put("categorySport", "none");
//			return "shop";
//
//		} else if (categoryLiterature != null) {
//
//			model.put("descPrice", "none");
//			model.put("ascPrice", "none");
//			model.put("descName", "none");
//			model.put("ascName", "none");
//
//			model.put("categoryLanguage", "none");
//			model.put("categoryLiterature", "block");
//			model.put("categorySkills", "none");
//			model.put("categoryArt", "none");
//			model.put("categorySport", "none");
//			return "shop";
//
//		} else if (categorySkills != null) {
//
//			model.put("descPrice", "none");
//			model.put("ascPrice", "none");
//			model.put("descName", "none");
//			model.put("ascName", "none");
//
//			model.put("categoryLanguage", "none");
//			model.put("categoryLiterature", "none");
//			model.put("categorySkills", "block");
//			model.put("categoryArt", "none");
//			model.put("categorySport", "none");
//			return "shop";
//
//		} else if (categoryArt != null) {
//
//			model.put("descPrice", "none");
//			model.put("ascPrice", "none");
//			model.put("descName", "none");
//			model.put("ascName", "none");
//
//			model.put("categoryLanguage", "none");
//			model.put("categoryLiterature", "none");
//			model.put("categorySkills", "none");
//			model.put("categoryArt", "block");
//			model.put("categorySport", "none");
//			return "shop";
//
//		} else if (categorySport != null) {
//
//			model.put("descPrice", "none");
//			model.put("ascPrice", "none");
//			model.put("descName", "none");
//			model.put("ascName", "none");
//
//			model.put("categoryLanguage", "none");
//			model.put("categoryLiterature", "none");
//			model.put("categorySkills", "none");
//			model.put("categoryArt", "none");
//			model.put("categorySport", "block");
//			return "shop";
//
//		}
//		return "shop";
//
//	}

	@PostMapping("/Ebook/addProductDetails") // LAY THONG TIN TRANG WEB LOGIN
	public String CartProductDetailsServlet(ModelMap model, @RequestParam String bid, @RequestParam String uid,
			@RequestParam String quantity, HttpServletRequest request)
			throws IOException {
  
//      LAY DU LIEU TU FORM
		int bidInt = Integer.parseInt(bid);
		int uidInt = Integer.parseInt(uid);
		int quantityInt = Integer.parseInt(quantity);
		
		System.out.println(bidInt +" " + uidInt +" " + quantityInt);
//		LAY SACH VOI ID NHAN VAO
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		BookDtls b = dao.getBookById(bidInt);

//		THAY DOI GIA TRI TRONG GIO HANG
		Cart c = new Cart();
		c.setBid(bidInt);
		c.setUserId(uidInt);
		c.setBookName(b.getBookName());
		c.setImage(b.getPhotoName());
		c.setAuthor(b.getAuthor()); 
		c.setQuantity(quantityInt); 
		c.setPrice(b.getPrice()); 
		c.setTotalPrice(b.getPrice() * quantityInt);

//		THEM 1 SAN PHAM VAO DANH SACH
		CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
//		KIEM TRA XEM SACH DA DUOC THEM VAO CSDL HAY CHUA 
		boolean checkIdBook = dao2.checkBookCart(bidInt, uidInt); 
		
		if (checkIdBook) { // NEU TRUE => CO THEM SO LUONG SAN PHAM TRONG CSDL 
			 
			boolean success = dao2.updateQuantityProductDetails (quantityInt, bidInt , uidInt );
//			KIEM TRA
				if (success) {
					model.put("addCart", "Book Update To Cart");
					return "checkout"; 
				} else {
					model.put("failed", "Something Wrong On Server");
					return "view_books"; 
				}
			 
		} else {
			boolean f = dao2.addCart(c);

//		KIEM TRA
			if (f) {
				model.put("addCart", "Book Added To Cart");
				return "checkout"; 
			} else {
				model.put("failed", "Something Wrong On Server");
				return "view_books"; 
			}
		}
	}
	
	@PostMapping("/Ebook/changePassword") // LAY THONG TIN TRANG WEB LOGIN
	public String ChangePassword(ModelMap model, @RequestParam String email, @RequestParam String currentPassword,
			@RequestParam String newPassword, @RequestParam String confirmPassword, HttpServletRequest request)
			throws IOException { 
		 
		
		System.out.println("POST : " + email +" -- " + currentPassword  +" -- " + newPassword  +" -- " + confirmPassword);

		String hash = BCrypt.hashpw(newPassword, BCrypt.gensalt(5));
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn()); 
		
		boolean us = dao.checkPasswordEmail(email, currentPassword); 
		
		if (us == true && !(currentPassword.equals(newPassword)) && (confirmPassword.equals(newPassword)) ) {
		   boolean checkPassEmail = dao.updateChangePass (email,hash);
		
		if ( checkPassEmail ) {
			model.put("succMsg", "Change Password Successfully ...");
			return "login"; 
		}else {
			model.put("failedMsg", "Change Password Error ...");
			return "changePassword"; 
		  }
		
		}else {
			model.put("failedMsg", "Please check the information again ...");
			return "changePassword"; 
		}
		
	}
	 
	@PostMapping("/Ebook/commentProduct") // LAY THONG TIN TRANG WEB LOGIN
	public String CommentServlet(ModelMap model, @RequestParam String bid, @RequestParam String uid, @RequestParam String name, @RequestParam String email,
			@RequestParam String content ,HttpServletRequest request) { 
		
		int bidInt = Integer.parseInt(  bid  );
		int uidInt = Integer.parseInt(  uid ); 
	
	System.out.println(name +" - "+ email +" - "+ content); 
	
	long millis=System.currentTimeMillis();   
	java.sql.Date date=new java.sql.Date(millis);   
	java.sql.Time time=new java.sql.Time(millis);  
	
	String dateTime = date + " " + time ;
	System.out.println(date + " - " + time); 
	
//	THAY DOI GIA TRI TRONG DOI TUONG COMMENT
	CommentProduct c = new CommentProduct();
	c.setBid(bidInt);
	c.setUid(uidInt);
	c.setName(name);
	c.setEmail(email);
	c.setDate(dateTime);
	c.setContent(content);
	
	CommentDAO dao = new CommentDAOImpl(DBConnect.getConn());
	boolean check = dao.addCommentProduct(c);   
	 
	if (check) {
		model.put("succComment", "Comment Product Details Successfully ...");
		return "view_books?id=" + bid; 

	} else {
		model.put("failedComment", "Something Wrong On Server");
		return "view_books?id=" + bid; 

	}
		
	}
	
	
	@PostMapping("/Ebook/login") // LAY THONG TIN TRANG WEB LOGIN
	public String LoginServlet(ModelMap model, @RequestParam String email, @RequestParam String password,
			HttpServletRequest request) {

//			KET NOI DU LIEU
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

		System.out.println("==================================");
		System.out.println(dao.display());
		System.out.println("==================================");

		System.out.println(email + " - " + password);

//			System.out.println("MA HOA MAT KHAU : ");
//			String hash = BCrypt.hashpw(password, BCrypt.gensalt(5));
//			System.out.println("BCrypt hash: " + hash);

//			System.out.println("GIAI MA : ");
//			boolean valuate = BCrypt.checkpw(password, hash); 
//			System.out.println(valuate);

//			NEU LA LOGIN BANG TAI KHOAN ADMIN
		if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
			User us = new User();
			us.setName("Admin");
			model.put("userobj", us);
			request.getSession().setAttribute("userobj", us);
			return "admin/home";
		} else {

//				LOGIN PHAN NGUOI DUNG
			User us = dao.login(email, password);
			if (us != null) {
				model.put("userobj", us);
				request.getSession().setAttribute("userobj", us);
				return "index";
			} else {
				model.put("failedMsg", "Email & Password Invalid");
				return "login";
			}
		}
	}

}