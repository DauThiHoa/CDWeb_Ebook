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
import com.example.ebook.dao.BookOrderImpl;
import com.example.ebook.dao.CartDAOImpl;
import com.example.ebook.dao.CommentDAO;
import com.example.ebook.dao.CommentDAOImpl;
import com.example.ebook.dao.ContactDAOImpl;
import com.example.ebook.dao.FavouriteDAOImpl;
import com.example.ebook.dao.OrderDetailsDAOImpl;
import com.example.ebook.dao.UserDAOImpl;
import com.example.ebook.entity.BookDtls;
import com.example.ebook.entity.Book_Order;
import com.example.ebook.entity.Cart;
import com.example.ebook.entity.CommentProduct;
import com.example.ebook.entity.Contact;
import com.example.ebook.entity.Favourite;
import com.example.ebook.entity.OrderDetails;
import com.example.ebook.entity.User;
import com.example.ebook.mail.RandomStringExmple;
import com.example.ebook.mail.SendMail;

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

		System.out.println(fileName);
		BookDtls b = new BookDtls(bname, author, priceDouble, categories, status, fileName, "admin");

		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		boolean f = dao.addBooks(b);

		if (f) {
//			resources\static\book
			String pathSource = request.getServletContext().getRealPath("");
			String pathNew = pathSource.substring(0, pathSource.length() - 7);
			String path = pathNew + "resources/static/book";

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
	
	@GetMapping("/Ebook/ajax") // LAY THONG TIN TRANG WEB LOGIN
	public String ajax(ModelMap model, HttpServletRequest request) {
		return "ajax";
	}

	@GetMapping("/Ebook/cart") // LAY THONG TIN TRANG WEB LOGIN
	public String CartServlet(ModelMap model, @RequestParam String bid, @RequestParam String uid,
			HttpServletRequest request) throws IOException {

//      LAY DU LIEU TU FORM
		int bidInt = Integer.parseInt(bid);
		int uidInt = Integer.parseInt(uid);

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

	@GetMapping("/Ebook/changePassword") // LAY THONG TIN TRANG WEB LOGIN
	public String ChangePassword(ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		return "changePassword";
	}

	@GetMapping("/Ebook/delete_old_book") // LAY THONG TIN TRANG WEB LOGIN
	public String DeleteOldBook(ModelMap model, @RequestParam String em, @RequestParam String id,
			HttpServletRequest request) {

		int idInt = Integer.parseInt(id);

		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		boolean f = dao.oldBookDelete(em, "Old", idInt);

		if (f) {
			model.put("succMsg", "Old Book Delete Sucessfully...");
			return "old_book";
		} else {
			model.put("failedMsg", "Something wrong on Server...");
			return "old_book";
		}

	}

	@GetMapping("/Ebook/addFavourite") // LAY THONG TIN TRANG WEB LOGIN
	public String FavouriteServlet(ModelMap model, @RequestParam String uid, @RequestParam String bid,
			HttpServletRequest request) { 
//  LAY DU LIEU TU FORM
		int uidInt = Integer.parseInt( uid );
		int bidInt = Integer.parseInt( bid );

//	LAY SACH VOI ID NHAN VAO
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		BookDtls b = dao.getBookById(bidInt);

//	THAY DOI GIA TRI TRONG GIO HANG
		Favourite favou = new Favourite();
		favou.setUid(uidInt);
		favou.setBid(bidInt);
		favou.setBookName(b.getBookName());
		favou.setAuthor(b.getAuthor());
		favou.setPrice(b.getPrice());
		favou.setBookCategory(b.getBookCategory());
		favou.setStatus(b.getStatus());
		favou.setPhotoName(b.getPhotoName());

//	THEM 1 SAN PHAM VAO DANH SACH
		FavouriteDAOImpl dao2 = new FavouriteDAOImpl(DBConnect.getConn());
//	KIEM TRA XEM SACH DA DUOC THEM VAO CSDL HAY CHUA 
		boolean checkExist = dao2.checkFavourite(bidInt , uidInt ); 

		if (checkExist) { // NEU TRUE => CO THEM SO LUONG SAN PHAM TRONG CSDL
			model.put("failedMsg", "The product has been added to favorites ");
			return "index";  
		} else {
			boolean f = dao2.addFavourite(favou);

//	KIEM TRA
			if (f) {
				model.put("succMsg", "Product added to favorites");
				return "favourite"; 
			} else {
				model.put("failedMsg", "Something Wrong On Server");
				return "index"; 
			}
		}

	}
	
	@GetMapping("/Ebook/remove_book") // LAY THONG TIN TRANG WEB LOGIN
	public String RemoveBookCart (ModelMap model, @RequestParam String bid, @RequestParam String uid,
			@RequestParam String cid, HttpServletRequest request) {
		  
//      LAY DU LIEU TU FORM
		int bidInt = Integer.parseInt( bid );
		int uidInt = Integer.parseInt( uid );
		int cidInt = Integer.parseInt( cid );
		
//		XOA SAN PHAM TRONG GIO HANG
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteBook(bidInt, uidInt, cidInt);
  
//		KIEM TRA
		if (f) {
			model.put("succMsg", "Book Removed from Cart");
			return "checkout"; 

		} else {
			model.put("failedMsg", "Something Wrong On Server");
			return "checkout"; 

		}
	}
	
	@GetMapping("/Ebook/remove_favourite") // LAY THONG TIN TRANG WEB LOGIN
	public String RemoveFavourite  (ModelMap model, @RequestParam String bid, @RequestParam String uid,  HttpServletRequest request) {
		  
//      LAY DU LIEU TU FORM
		int bidInt = Integer.parseInt( bid );
		int uidInt = Integer.parseInt( uid ); 
		
//		XOA SAN PHAM TRONG DANH SACH SAN PHAM YEU THICH
		FavouriteDAOImpl dao = new FavouriteDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteFavourite(bidInt, uidInt);
  
//		KIEM TRA
		if (f) {
			model.put("succMsg", "Favourite removed from list");
			return "favourite";  

		} else {
			model.put("failedMsg", "Something Wrong On Server");
			return "favourite";  

		}
	}
	
	@GetMapping("/Ebook/updateQuantity") // LAY THONG TIN TRANG WEB LOGIN
	public String UpdateQuantityCart  (ModelMap model, @RequestParam String quantity, @RequestParam String bid,
			@RequestParam String uid, @RequestParam String cid, HttpServletRequest request) {
		 
		int quantityInt = Integer.parseInt( quantity );
		int bidInt = Integer.parseInt( bid );
		int uidInt = Integer.parseInt( uid );
		int cidInt = Integer.parseInt( cid );
		
		System.out.println("quantity : " + quantity + " - " + bid  + " - " +uid + " - " +cid);
		
//		CAP NHAT SO LUONG CUA SAN PHAM TRONG GIO HANG
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.updateQuantityCart(quantityInt, bidInt , uidInt);
  
//		KIEM TRA
		if (f) {
			model.put("succMsg", "Book Update from Cart");
			return "checkout";   

		} else {
			model.put("failedMsg", "Something Wrong On Server");
			return "checkout";   

		}
	}
	
	
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

	@PostMapping("/Ebook/arrangeServlet") // LAY THONG TIN TRANG WEB LOGIN
	public String ArrangeServlet(ModelMap model, @RequestParam String descPrice, @RequestParam String ascPrice,
			@RequestParam String descName, @RequestParam String ascName, @RequestParam String categoryLanguage,
			@RequestParam String categoryLiterature, @RequestParam String categorySkills,
			@RequestParam String categoryArt, @RequestParam String categorySport, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

//		descPrice ascPrice descName ascName categoryLanguage categoryLiterature  categorySkills categoryArt categorySport
		System.out.println(descPrice + " - " + ascPrice + " - " + descName + " - " + ascName + " - " + categoryLanguage
				+ " - " + categoryLiterature + " - " + categorySkills + " - " + categoryArt + " - " + categorySport);

		if (descPrice.equals("descPrice")) {
			
			System.out.println(1);
			model.put("descPrice", "block");
			model.put("ascPrice", "none");
			model.put("descName", "none");
			model.put("ascName", "none");

			model.put("categoryLanguage", "none");
			model.put("categoryLiterature", "none");
			model.put("categorySkills", "none");
			model.put("categoryArt", "none");
			model.put("categorySport", "none");
			return "shop";
			
		} else if (ascPrice.equals("ascPrice")) {

			System.out.println(2);
			model.put("descPrice", "none");
			model.put("ascPrice", "block");
			model.put("descName", "none");
			model.put("ascName", "none");

			model.put("categoryLanguage", "none");
			model.put("categoryLiterature", "none");
			model.put("categorySkills", "none");
			model.put("categoryArt", "none");
			model.put("categorySport", "none");
			return "shop";

		} else if (descName.equals("descName")) {

			System.out.println(3);
			model.put("descPrice", "none");
			model.put("ascPrice", "none");
			model.put("descName", "block");
			model.put("ascName", "none");

			model.put("categoryLanguage", "none");
			model.put("categoryLiterature", "none");
			model.put("categorySkills", "none");
			model.put("categoryArt", "none");
			model.put("categorySport", "none");
			return "shop";

		} else if (ascName.equals("ascName")) {

			System.out.println(4);
			model.put("descPrice", "none");
			model.put("ascPrice", "none");
			model.put("descName", "none");
			model.put("ascName", "block");

			model.put("categoryLanguage", "none");
			model.put("categoryLiterature", "none");
			model.put("categorySkills", "none");
			model.put("categoryArt", "none");
			model.put("categorySport", "none");
			return "shop";

		} else if (categoryLanguage.equals("categoryLanguage")) {

			System.out.println(5);
			model.put("descPrice", "none");
			model.put("ascPrice", "none");
			model.put("descName", "none");
			model.put("ascName", "none");

			model.put("categoryLanguage", "block");
			model.put("categoryLiterature", "none");
			model.put("categorySkills", "none");
			model.put("categoryArt", "none");
			model.put("categorySport", "none");
			return "shop";

		} else if (categoryLiterature.equals("categoryLiterature")) {

			System.out.println(6);
			model.put("descPrice", "none");
			model.put("ascPrice", "none");
			model.put("descName", "none");
			model.put("ascName", "none");

			model.put("categoryLanguage", "none");
			model.put("categoryLiterature", "block");
			model.put("categorySkills", "none");
			model.put("categoryArt", "none");
			model.put("categorySport", "none");
			return "shop";

		} else if (categorySkills.equals("categorySkills")) {

			System.out.println(7);
			model.put("descPrice", "none");
			model.put("ascPrice", "none");
			model.put("descName", "none");
			model.put("ascName", "none");

			model.put("categoryLanguage", "none");
			model.put("categoryLiterature", "none");
			model.put("categorySkills", "block");
			model.put("categoryArt", "none");
			model.put("categorySport", "none");
			return "shop";

		} else if (categoryArt.equals("categoryArt")) {

			System.out.println(8);
			model.put("descPrice", "none");
			model.put("ascPrice", "none");
			model.put("descName", "none");
			model.put("ascName", "none");

			model.put("categoryLanguage", "none");
			model.put("categoryLiterature", "none");
			model.put("categorySkills", "none");
			model.put("categoryArt", "block");
			model.put("categorySport", "none");
			return "shop";

		} else if (categorySport.equals("categorySport")) {

			System.out.println(9);
			model.put("descPrice", "none");
			model.put("ascPrice", "none");
			model.put("descName", "none");
			model.put("ascName", "none");

			model.put("categoryLanguage", "none");
			model.put("categoryLiterature", "none");
			model.put("categorySkills", "none");
			model.put("categoryArt", "none");
			model.put("categorySport", "block");
			return "shop";

		}
		System.out.println(10);
		return "shop";

	}

	@PostMapping("/Ebook/addProductDetails") // LAY THONG TIN TRANG WEB LOGIN
	public String CartProductDetailsServlet(ModelMap model, @RequestParam String bid, @RequestParam String uid,
			@RequestParam String quantity, HttpServletRequest request) throws IOException {

//      LAY DU LIEU TU FORM
		int bidInt = Integer.parseInt(bid);
		int uidInt = Integer.parseInt(uid);
		int quantityInt = Integer.parseInt(quantity);

		System.out.println(bidInt + " " + uidInt + " " + quantityInt);
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

			boolean success = dao2.updateQuantityProductDetails(quantityInt, bidInt, uidInt);
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

		System.out.println(
				"POST : " + email + " -- " + currentPassword + " -- " + newPassword + " -- " + confirmPassword);

		String hash = BCrypt.hashpw(newPassword, BCrypt.gensalt(5));
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

		boolean us = dao.checkPasswordEmail(email, currentPassword);

		if (us == true && !(currentPassword.equals(newPassword)) && (confirmPassword.equals(newPassword))) {
			boolean checkPassEmail = dao.updateChangePass(email, hash);

			if (checkPassEmail) {
				model.put("succMsg", "Change Password Successfully ...");
				return "login";
			} else {
				model.put("failedMsg", "Change Password Error ...");
				return "changePassword";
			}

		} else {
			model.put("failedMsg", "Please check the information again ...");
			return "changePassword";
		}

	}

	@PostMapping("/Ebook/commentProduct") // LAY THONG TIN TRANG WEB LOGIN
	public String CommentServlet (ModelMap model, @RequestParam String bid, @RequestParam String uid,
			@RequestParam String name, @RequestParam String email, @RequestParam String content,
			HttpServletRequest request) {

		int bidInt = Integer.parseInt(bid);
		int uidInt = Integer.parseInt(uid);

		System.out.println(name + " - " + email + " - " + content);

		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		java.sql.Time time = new java.sql.Time(millis);

		String dateTime = date + " " + time;
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
//			return "view_books?id=" + bidInt;
			
//			==================== CHUYEN VE TRANG TRUOC DO ==================================
//			response.sendRedirect(request.getHeader("referer"));
			 String referer = request.getHeader("Referer");
			 return "redirect:" + referer; 
			 
		} else {
			model.put("failedComment", "Something Wrong On Server"); 
			
//			return "view_books?id=" + bidInt;
			String referer = request.getHeader("Referer");
			return "redirect:" + referer; 
		}

	}

	@PostMapping("/Ebook/contact") // LAY THONG TIN TRANG WEB LOGIN
	public String ContactServlet(ModelMap model, @RequestParam String name, @RequestParam String email,
			@RequestParam String number, @RequestParam String subject, @RequestParam String message,
			HttpServletRequest request) {

		int numberInt = Integer.parseInt(number);

		System.out.println(name + " - " + email + " - " + number + " - " + subject + " - " + message);

		Contact contact = new Contact();
		contact.setName(name);
		contact.setEmail(email);
		contact.setNumber(numberInt);
		contact.setSubject(subject);
		contact.setMessage(message);
		ContactDAOImpl dao = new ContactDAOImpl(DBConnect.getConn());
		boolean f = dao.addContact(contact);

		SendMail send = new SendMail();
		boolean sendMail = send.sendMail("webfurniture7@gmail.com", subject, message);

		if (sendMail && f) {
			model.put("succMsg", "Add Contact Successfully ... ");
			return "contact";
		} else {
			model.put("failedMsg", "Add Contact Error ...");
			return "contact";
		}

	}

	@PostMapping("/Ebook/login") // LAY THONG TIN TRANG WEB LOGIN
	public String LoginServlet(ModelMap model, @RequestParam String email, @RequestParam String password,
			HttpServletRequest request) {

//			KET NOI DU LIEU
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

		System.out.println("==================================");
//		System.out.println(dao.display());
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

	@PostMapping("/Ebook/order") // LAY THONG TIN TRANG WEB LOGIN
	public String OrderServlet (ModelMap model, @RequestParam String id, @RequestParam String username,  @RequestParam String email, @RequestParam String phno,
			@RequestParam String address, @RequestParam String landmark,@RequestParam String city, @RequestParam String state, @RequestParam String pincode,@RequestParam String payment,
			 @RequestParam String uid,@RequestParam String total ,HttpServletRequest request) { 
		  
		int idInt = Integer.parseInt( id ); 
		
		System.out.println("ORDER");
		System.out.println(address + ", " + landmark + ", " + city + ", " + state + ", " + pincode + ", " + payment); 
		String fullAdd = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;
		
		int uidInt = Integer.parseInt( uid );
		double totalDouble = Double.parseDouble( total );
		
		System.out.println("TONG TIEN : " + total);
		 
		
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn()); 
		List<Cart> blist = dao.getBookByUser(idInt);
		
		RandomStringExmple randomStr = new RandomStringExmple ();
		String orderId = randomStr.randomAlphaNumeric(10);
		
		if (blist.isEmpty()) {
			model.put("failedOrder", "Add Item");
			return "checkout"; 
		}else {
			 
			if ("noselect".equals(payment)) {
				model.put("failedOrder", "Please Choose Payment Method");
				return "checkout"; 
			}else {
				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
				int i = dao2.getOrderNo(); 
				 
					 Book_Order o = new Book_Order();
					 
					 o.setOrderId(orderId);
					 o.setUserName(username);
					 o.setEmail(email);
					 o.setPhno(phno);
					 o.setFulladd(fullAdd); 
					 o.setPrice(totalDouble);
					 o.setPaymentType(payment); 
					 
				boolean f = dao2.saveOrder(o); 

				
				CartDAOImpl dao1 = new CartDAOImpl(DBConnect.getConn());
				List<Cart> cart = dao1.getBookByUser(uidInt);
				
				boolean addOrderDetails = false ;
				
				for (Cart c : cart) { 
					
				 OrderDetailsDAOImpl dao3 = new OrderDetailsDAOImpl(DBConnect.getConn());
				 OrderDetails orderDetails = new OrderDetails();
				 
				 orderDetails.setOrder_id(orderId);
				 orderDetails.setCid(c.getCid());
				 orderDetails.setBid(c.getBid());
				 orderDetails.setUid(c.getUserId());
				 orderDetails.setBookName(c.getBookName());
				 orderDetails.setImage(c.getImage());
				 orderDetails.setAuthor(c.getAuthor());
				 orderDetails.setQuantity(c.getQuantity());
				 orderDetails.setPrice(c.getPrice());
				 orderDetails.setTotal_price(c.getTotalPrice());
				 
				 addOrderDetails = dao3.addOrderDetails(orderDetails) ; 
				 
				}
				 
				if (f && addOrderDetails) {
					boolean deleteCart = dao.deleteCart();
					model.put("succOrder", "Add Order Success ");
					return "order_success"; 
				}else {
					model.put("failedOrder", "Your Order Failed");
					return "checkout"; 
					  
				}
			}
			
		}
	}
	
	@PostMapping("/Ebook/register") // LAY THONG TIN TRANG WEB LOGIN
	public String RegisterServlet(ModelMap model, @RequestParam String fname, @RequestParam String email,
			@RequestParam String phno, @RequestParam String password, @RequestParam String check,
			HttpServletRequest request) {

//		System.out.println("MA HOA MAT KHAU : ");
		String hash = BCrypt.hashpw(password, BCrypt.gensalt(5));
//		System.out.println("BCrypt hash: " + hash);

		System.out.println(fname + " - " + email + " - " + phno + " - " + password + " - " + check);

		User us = new User();
		us.setName(fname);
		us.setEmail(email);
		us.setPhno(phno);
		us.setPassword(hash);

		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

		if (check != null) {

			boolean f2 = dao.checkUser(email);
			if (f2) {
				boolean f = dao.userRegister(us);

				if (f) {
					System.out.println("User Register Success ...");
					model.put("succMsg", "Registration Successfully ... ");
					return "login";

				} else {
					model.put("failedMsg", "Something wrong on server ...");
					return "register";

				}
			} else {
				model.put("failedMsg", "User Already Exist Try Another Email id");
				return "register";
			}

		} else {
			model.put("failedMsg", "Please Check Agree & Terms Condition");
			return "register";

		}
	}

	 
	@PostMapping("/Ebook/searchBook") // LAY THONG TIN TRANG WEB LOGIN
	public String SearchBookServlet (ModelMap model, @RequestParam String text, HttpServletRequest request) {
  
//		String search_box  = request.getParameter("text"); 
		
		System.out.println("search_box 2 : " + text);
		
		BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
		
		List<BookDtls> list2 = dao2.getBookBySearch(text);  
//		model.put("listBook", list2 );
		request.getSession().setAttribute("listBook", list2);
		
//		==================== CHUYEN VE TRANG TRUOC DO ==================================
//		response.sendRedirect(request.getHeader("referer"));
		 String referer = request.getHeader("Referer");
		 return "redirect:" + referer; 
		 
	}
	
	@PostMapping("/Ebook/subscribe") // LAY THONG TIN TRANG WEB LOGIN
	public String SubscribeServlet (ModelMap model, @RequestParam String email, HttpServletRequest request) {
	 
//		KET NOI DU LIEU
		 UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());  

		 System.out.println(email); 
		 SendMail send = new SendMail();
		 boolean sendMail = send.sendMail(email, "SIGN UP FOR NEWS", "You have successfully subscribed to the newsletter! Please check your email regularly to receive the latest news from our website.");
		 
		if ( sendMail ) { 
			model.put("succMsg", "Subscribe Success");
			return "index"; 
		}else {
			model.put("failedMsg", "Email Invalid");
			return "index"; 
		 }   

		 
	}
	
	@PostMapping("/Ebook/update_profile") // LAY THONG TIN TRANG WEB LOGIN
	public String UpdateProfileServlet (ModelMap model, @RequestParam String id, @RequestParam String fname, @RequestParam String email,
			 @RequestParam String phno, @RequestParam String password, HttpServletRequest request) {
	    
//		LAY THONG TIN FORM
		int idInt = Integer.parseInt( id );
//		String name = req.getParameter("fname");
//		String email = req.getParameter("email");
//		String phno = req.getParameter("phno");
//		String password = req.getParameter("password");

//		THAY DOI CAC GIA TRI TRONG THONG TIN NGUOI DUNG
		User us = new User();
		us.setId(idInt);
		us.setName(fname);
		us.setEmail(email);
		us.setPhno(phno);
 
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

//		KIEM TRA NGUOI DUNG CO NHAP MAT KHAU DUNG HAY KHONG
//		boolean f = dao.checkPassword(id, password);
		 
//		boolean checkPassEmail = dao.checkPasswordEmail(email, hash);
		boolean f = dao.checkPasswordEmail(email, password); 
		
		if (f) { // NEU DUNG THI CAP NHAT CAC THONG TIN

			boolean f2 = dao.updateProfile(us);
			
			if (f2) {
				model.put("succMsg", "Profile Update Successfully ... ");
				return "edit_profile";  
				
			} else {
				model.put("failedMsg", "Something wrong on server");
				return "edit_profile";  
			}

		} else { //
			model.put("failedMsg", "Your Password is Incorrect");
			return "edit_profile";  
		}

	}
	
	@PostMapping("/Ebook/AjaxController") // LAY THONG TIN TRANG WEB LOGIN
	public void AjaxController (ModelMap model, @RequestParam String action, @RequestParam String fullname, @RequestParam String number1, 
			@RequestParam String number2 , HttpServletRequest request, HttpServletResponse response) throws IOException {
		  
		 response.setContentType("text/plain");
		 PrintWriter out = response.getWriter();
		   System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkk");
		 if ( action.equals("demo1")) { 
		 System.out.println(fullname);
		 out.print("Hello: " + fullname);
		 
		 }
		 else  if ( action.equals("demo2")) {
			 int number1Int = Integer.parseInt( number1 );
			 int number2Int = Integer.parseInt( number2 );
			 out.print((int )number1Int + number2Int);
		 }
		 
	}
	 
	@PostMapping("/Ebook/sendMail") // LAY THONG TIN TRANG WEB LOGIN
	public String MailController (ModelMap model, @RequestParam String email, HttpServletRequest request, HttpServletResponse response) throws IOException {   
 
		System.out.println("email: " + email);

//		LAY CHUOI KI TU NGAU NHIEN
		RandomStringExmple random = new RandomStringExmple();
		String passwordNew = random.randomAlphaNumeric(8);
//		MA HOA KI TU
		String hash = BCrypt.hashpw(passwordNew, BCrypt.gensalt(5)); 
		
//		KIEM TRA MAIL CO TRONG CSDL HAY KO
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
		boolean f2 = dao.checkUser(email);
		
		if (!f2)
		{
			boolean f = dao.updateChangePass(email, hash);
			SendMail sendmail = new SendMail();
			
			boolean result = sendmail.sendMail(email, "Change Password Account",
					"Your new password is : "+ passwordNew + "\n\n" +
			        "Please login the site with the new password \n\n http://localhost:8080/Ebook/login" +"\n\n"+
			        "Or you can change your password" +"\n\n"+
					"http://localhost:8080/Ebook/changePassword");
			
			if (f && result) {
				System.out.println("Send Email And Update Password Success ...");
				model.put("succMsg", "Send Mail Successfully");
				return "login"; 

			} else {
				model.put("failedMsg", "Send Mail Error");
				return "reset"; 

			}
		}else {
			model.put("failedMsg", "User Already Exist Try Another Email id");
			return "register"; 
		}
		 
	}
		  
}