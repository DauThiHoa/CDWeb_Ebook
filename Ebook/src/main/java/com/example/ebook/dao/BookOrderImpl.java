package com.example.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.ebook.entity.Book_Order;
 

public class BookOrderImpl implements BookOrderDAO {

	private Connection conn;

	public BookOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

//	LAY SO DON HANG
	@Override
	public int getOrderNo() {
		// TODO Auto-generated method stub
		int i = 1;
		try {

			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}

//	LUU DON HANG 
	@Override
	public boolean saveOrder(Book_Order order) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			
			String sql = "insert into book_order (order_id, user_name, email, address, phone, total, payment) values (?,?,?,?,?,?,?) ";
		 
			PreparedStatement ps = conn.prepareStatement(sql);
			 
				ps.setString(1, order.getOrderId());
				ps.setString(2, order.getUserName());
				ps.setString(3, order.getEmail());
				ps.setString(4, order.getFulladd());
				ps.setString(5, order.getPhno()); 
				ps.setDouble(6, order.getPrice());
				ps.setString(7, order.getPaymentType());
				 
			int i = ps.executeUpdate();

				if (i == 1) {
					f = true;
				}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	
//	LAY DANH SACH CAC SAN PHAM TRONG DON HANG THEO EMAIL NGUOI DUNG
	@Override
	public List<Book_Order> getBook(String email) {
		// TODO Auto-generated method stub
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null;
		try {
			String sql = "select * from book_order where email = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				o = new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6)); 
				o.setPrice(rs.getDouble(7));
				o.setPaymentType(rs.getString(8));
				list.add(o);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	
//	LAY DANH SACH CAC SAN PHAM TRONG DON HANG => admin
	@Override
	public List<Book_Order> getAllOrder() {
		// TODO Auto-generated method stub
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				o = new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6)); 
				o.setPrice(rs.getDouble(7));
				o.setPaymentType(rs.getString(8));
				list.add(o);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

}
