package com.example.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.ebook.entity.OrderDetails; 

public class OrderDetailsDAOImpl implements OrderDetailsDAO{
	
private Connection conn ;
	 
	public OrderDetailsDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	
	// ADD ORDER DETAILS VAO CSDL
	@Override
	public boolean addOrderDetails(OrderDetails o) {
		// TODO Auto-generated method stub
				boolean f = false ;
				try {
					
					String sql = "insert into orderdetails (order_id, cid, bid, uid, bookName, image, author,quantity,price,total_price) values (?,?,?,?,?,?,?,?,?,?)" ;
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, o.getOrder_id() );
					ps.setInt(2, o.getCid() );
					ps.setInt(3, o.getBid() );
					ps.setInt(4, o.getUid() );
					ps.setString(5, o.getBookName() );
					ps.setString(6, o.getImage() );
					ps.setString(7, o.getAuthor() );
					ps.setInt(8, o.getQuantity() );
					ps.setDouble(9, o.getPrice() );
					ps.setDouble(10, o.getTotal_price() );
					
					int i = ps.executeUpdate();
					
					if ( i == 1 ) {
						f = true;
					}
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return f;
	}
 
	
//	LAY DANH SACH DON HANG CHI TIET VOI THAM SO DUA VAO LA MA DON HANG
	@Override
	public ArrayList<OrderDetails> list(String order_Id) {
		// TODO Auto-generated method stub 
		ArrayList<OrderDetails> list = new ArrayList<OrderDetails>();
		OrderDetails orderDetails = null; 

				try {

					String sql = "select * from orderDetails where order_id like ?";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, order_Id);

					ResultSet rs = ps.executeQuery();
					
					while (rs.next()) {
						
						 orderDetails = new OrderDetails();
						 
						 orderDetails.setId(rs.getInt(1));
						 orderDetails.setOrder_id(rs.getString(2));
						 orderDetails.setCid(rs.getInt(3));
						 orderDetails.setBid(rs.getInt(4));
						 orderDetails.setUid(rs.getInt(5));
						 orderDetails.setBookName(rs.getString(6));
						 orderDetails.setImage(rs.getString(7));
						 orderDetails.setAuthor(rs.getString(8));
						 orderDetails.setQuantity(rs.getInt(9));
						 orderDetails.setPrice(rs.getDouble(10));
						 orderDetails.setTotal_price(rs.getDouble(11)); 

						 list.add(orderDetails); 
						
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return list;
	}

	 // LAY DON HANG CHI TIET THEO MA DON HANG
	@Override
	public OrderDetails getOrderDetailsById(String order_id) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub  
				OrderDetails orderDetails = null; 

						try {

							String sql = "select * from orderDetails where order_id like ?";
							PreparedStatement ps = conn.prepareStatement(sql);
							ps.setString(1, order_id);

							ResultSet rs = ps.executeQuery();
							
							while (rs.next()) {
								
								 orderDetails = new OrderDetails();
								 
								 orderDetails.setId(rs.getInt(1));
								 orderDetails.setOrder_id(rs.getString(2));
								 orderDetails.setCid(rs.getInt(3));
								 orderDetails.setBid(rs.getInt(4));
								 orderDetails.setUid(rs.getInt(5));
								 orderDetails.setBookName(rs.getString(6));
								 orderDetails.setImage(rs.getString(7));
								 orderDetails.setAuthor(rs.getString(8));
								 orderDetails.setQuantity(rs.getInt(9));
								 orderDetails.setPrice(rs.getDouble(10));
								 orderDetails.setTotal_price(rs.getDouble(11)); 
 
								
							}
						} catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
						}
						return orderDetails;
			}

	 
}
