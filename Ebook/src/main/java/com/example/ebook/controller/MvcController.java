package com.example.ebook.controller;
 
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.ebook.entity.User;

// LOP HIEN THI CAC TRANG
@Controller
public class MvcController {
	
	@GetMapping("/login") // LAY THONG TIN TRANG WEB LOGIN 
	public String home() {
		System.out.println("Going home...");
		return "index"; // TRA VE TRANG LOGIN
	}
	@GetMapping("/loginAdmin" ) // LAY THONG TIN TRANG WEB LOGIN 
	public String homeAdmin(ModelMap model ) {
		System.out.println("Going home Admin...");
		
		User us = new User();
		us.setName("Admin");
		model.put("userobj", us); 
		
		return "admin/home"; // TRA VE TRANG LOGIN
	}
}