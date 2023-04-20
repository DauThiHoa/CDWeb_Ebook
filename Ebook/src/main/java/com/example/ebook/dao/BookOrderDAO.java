package com.example.ebook.dao;

import java.util.List;

import com.example.ebook.entity.Book_Order;
 

public interface BookOrderDAO {

//	LAY SO DON HANG
	public int getOrderNo ();
//	LUU DON HANG 
	public boolean saveOrder ( Book_Order order);
	
//	LAY DANH SACH CAC SAN PHAM TRONG DON HANG THEO EMAIL NGUOI DUNG
	public List<Book_Order> getBook (String email);
//	LAY DANH SACH CAC SAN PHAM TRONG DON HANG => admin
	public List<Book_Order> getAllOrder ();
}
