package com.example.ebook.dao;

import java.util.List;

import com.example.ebook.entity.Cart; 

public interface CartDAO {

//	THEM SAN PHAM VAO GIO HANG
	public boolean addCart ( Cart c );
	
//	XOA GIO HANG 
	public boolean deleteCart ();
	
//	KIEM TRA XEM ID SACH DO NGUOI DUNG THEM VAO DA CO TRONG CSDL HAY CHUA 
	public boolean checkBookCart (int idBook , int idUser);
//	UPDATE SO LUONG VOI CUNG SAN PHAM VA CUNG NGUOI DUNG 
	public boolean updateBookCart (int idBook , int idUser);
	
//	LAY THONG TIN SACH THEM THONG TIN => MA ID NGUOI DUNG THEM SAN PHAM
	public List<Cart> getBookByUser (int userId);
//	XOA SAN PHAM TRONG GIO HANG
	public boolean deleteBook (int bid , int uid , int cid);
//	UPDATE QUANTITY TRONG GIO HANG
	public boolean updateQuantityCart (int quantity, int bid , int uid);
	
//	LAY GIA CUA 1 SAN PHAM TRONG GIO HANG
	public double getPriceBookCart (int bid , int uid);
	
//	ADD QUANTITY TRONG PRODUCT DETAILS
	public boolean updateQuantityProductDetails (int quantity, int bid , int uid);
}
