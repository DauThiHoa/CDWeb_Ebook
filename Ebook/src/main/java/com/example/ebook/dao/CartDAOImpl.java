package com.example.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.ebook.entity.Cart; 

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

//	THEM SAN PHAM VAO GIO HANG
	@Override
	public boolean addCart(Cart c) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "insert into cart (bid, uid, bookName, image, author,quantity, price, total_price) values (?,?,?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getImage());
			ps.setString(5, c.getAuthor());
			ps.setInt(6, c.getQuantity());
			ps.setDouble(7, c.getPrice());
			ps.setDouble(8, c.getTotalPrice());

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

//	LAY THONG TIN SACH THEM THONG TIN => MA ID NGUOI DUNG THEM SAN PHAM
	@Override
	public List<Cart> getBookByUser(int userId) {
		// TODO Auto-generated method stub
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;

		try {

			String sql = "select * from cart where uid = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setImage(rs.getString(5));
				c.setAuthor(rs.getString(6));
				c.setQuantity(rs.getInt(7));
				c.setPrice(rs.getDouble(8));

//				totalPrice = totalPrice + rs.getDouble(9);

				c.setTotalPrice(rs.getDouble(9));

				list.add(c);
//				System.out.println("IMAGE");
//				System.out.println(c.getImage());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

//	XOA SAN PHAM TRONG GIO HANG
	@Override
	public boolean deleteBook(int bid, int uid, int cid) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "delete from cart where bid = ? and uid = ? and cid = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);

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

//	KIEM TRA XEM ID SACH DO NGUOI DUNG THEM VAO DA CO TRONG CSDL HAY CHUA 
	@Override
	public boolean checkBookCart(int idBook, int idUser) {
		// TODO Auto-generated method stub
		boolean f = false;

		try {

			String sql = "select * from cart where bid = ? and uid = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idBook);
			ps.setInt(2, idUser);

//			System.out.println(idBook + " - " + idUser);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

//	UPDATE SO LUONG VOI CUNG SAN PHAM VA CUNG NGUOI DUNG 
	@Override
	public boolean updateBookCart(int idBook, int idUser) {
		// TODO Auto-generated method stub
		boolean f = false;

		try {

			String sql = "update cart set quantity = quantity + 1  where bid = ? and uid = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idBook);
			ps.setInt(2, idUser);

			int i = ps.executeUpdate();
			if (i == 1) {

				String sql1 = "update cart set total_price = quantity * price  where bid = ? and uid = ?";
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setInt(1, idBook);
				ps1.setInt(2, idUser);

				int i1 = ps1.executeUpdate();
				if (i1 == 1) {

					f = true;
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	
//	UPDATE QUANTITY TRONG GIO HANG
	@Override
	public boolean updateQuantityCart(int quantity, int bid, int uid) {
		// TODO Auto-generated method stub
		boolean f = false;
		double total_price = getPriceBookCart(bid, uid) * quantity;
		try {

			String sql = "update cart set quantity = ? where bid = ? and uid = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, quantity);
			ps.setInt(2, bid);
			ps.setInt(3, uid); 

			int i = ps.executeUpdate();
			if (i == 1) {

				String sql1 = "update cart set total_price = ? where bid = ? and uid = ?";
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setDouble(1, total_price);
				ps1.setInt(2, bid);
				ps1.setInt(3, uid); 

				int i1 = ps1.executeUpdate();
				if (i1 == 1) {
					f = true;
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public double getPriceBookCart(int bid, int uid) {
		// TODO Auto-generated method stub
		double price = 0;

		try {

			String sql = "select * from cart where bid = ? and uid = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid); 

//			System.out.println(idBook + " - " + idUser);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				price = rs.getDouble(8);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return price;
	}

	@Override
	public boolean updateQuantityProductDetails(int quantity, int bid, int uid) {
		// TODO Auto-generated method stub
				boolean f = false;

				try {

					String sql = "update cart set quantity = quantity + ?  where bid = ? and uid = ?";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setInt(1, quantity);
					ps.setInt(2, bid);
					ps.setInt(3, uid);

					int i = ps.executeUpdate();
					if (i == 1) {

						String sql1 = "update cart set total_price = quantity * price  where bid = ? and uid = ?";
						PreparedStatement ps1 = conn.prepareStatement(sql1);
						ps1.setInt(1, bid);
						ps1.setInt(2, uid);

						int i1 = ps1.executeUpdate();
						if (i1 == 1) {

							f = true;
						}
					}

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return f;
	}

	
//	XOA GIO HANG 
	@Override
	public boolean deleteCart() {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "delete from cart";
			PreparedStatement ps = conn.prepareStatement(sql); 

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

}
