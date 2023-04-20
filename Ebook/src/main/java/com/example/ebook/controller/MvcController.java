package com.example.ebook.controller;
 
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// LOP HIEN THI CAC TRANG
@Controller
public class MvcController {
	
	@RequestMapping("/login") // LAY THONG TIN TRANG WEB LOGIN 
	public String home() {
		System.out.println("Going home...");
		return "index"; // TRA VE TRANG LOGIN
	}
	    
}