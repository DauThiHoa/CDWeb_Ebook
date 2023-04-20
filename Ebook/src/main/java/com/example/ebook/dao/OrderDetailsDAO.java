package com.example.ebook.dao;

import java.util.ArrayList;

import com.example.ebook.entity.OrderDetails; 

public interface OrderDetailsDAO {
	
	   // ADD ORDER DETAILS VAO CSDL
		public boolean addOrderDetails (OrderDetails o);
		
		 // LAY DON HANG CHI TIET THEO MA DON HANG
		public OrderDetails getOrderDetailsById (String order_id);
		
//		LAY DANH SACH DON HANG CHI TIET VOI THAM SO DUA VAO LA MA DON HANG
		public ArrayList<OrderDetails> list (String order_Id);
		
		
}
