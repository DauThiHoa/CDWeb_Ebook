package com.example.ebook.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

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
import com.example.ebook.dao.UserDAOImpl;
import com.example.ebook.entity.BookDtls;
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
	// ==================== POST MAPPING USER ========================

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