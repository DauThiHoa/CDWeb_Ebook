package com.example.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.ebook.entity.Favourite; 

public class FavouriteDAOImpl implements FavouriteDAO{

private Connection conn ;
	
	
	public FavouriteDAOImpl (Connection conn) {
		super();
		this.conn = conn;
	}
	
//  DANH SACH CAC SAN PHAM DUOC YEU THICH
	@Override
	public List<Favourite> getBookByFavourite(int uid) {
		// TODO Auto-generated method stub
				List<Favourite> list = new ArrayList<Favourite>();
				Favourite f = null ;
				
				try {
					String sql = "select * from favourite where uid = ?  ";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setInt(1, uid ); 
					
					ResultSet rs = ps.executeQuery();
//				 
					while (rs.next() ) { 
						
						f = new Favourite();
						 
						f.setId(rs.getInt(1));
						f.setUid(rs.getInt(2));
						f.setBid(rs.getInt(3));
						f.setBookName(rs.getString(4));
						f.setAuthor(rs.getString(5));
						f.setPrice(rs.getDouble(6));
						f.setBookCategory(rs.getString(7));
						f.setStatus(rs.getString(8));
						f.setPhotoName(rs.getString(9)); 
						
						list.add(f);
//					 
					}
//					System.out.println(list);
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return list;
	}
	
//	PHUONG THUC THEM SAN PHAM DUOC YEU THICH VAO CSDL
	@Override
	public boolean addFavourite(Favourite f) {
		// TODO Auto-generated method stub
		boolean result = false ;
		try {
			
			String sql = "insert into favourite (uid, bid, bookname, author,price, bookCategory, status, photo) values (?,?,?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, f.getUid() );
			ps.setInt(2, f.getBid());
			ps.setString(3, f.getBookName());
			ps.setString(4, f.getAuthor());
			ps.setDouble(5, f.getPrice());
			ps.setString(6, f.getBookCategory());
			ps.setString(7, f.getStatus());
			ps.setString(8, f.getPhotoName()); 
			 
			int i = ps.executeUpdate();
			
			if ( i == 1 ) {
				result = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean checkFavourite(int bid, int uid ) {
		// TODO Auto-generated method stub
				boolean f = false;
				try {
//					CAU TRUY VAN
					String sql = "select * from favourite where bid = ? and uid = ?";
				    PreparedStatement ps = conn.prepareStatement(sql);
				    ps.setInt(1, bid); 
				    ps.setInt(2, uid); 
				    
//				    NEU CO TRONG CSDL => TRA VE FALSE
				    ResultSet rs = ps.executeQuery();
				    while (rs.next()) {
				    	f = true;
				    }
		            
				}catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return f;
	}

//	XOA SAN PHAM YEU THICH THEO MA
	@Override
	public boolean deleteFavourite(int bid, int uid) {
		// TODO Auto-generated method stub
				boolean f = false;
				try {
					String sql = "delete from favourite where bid = ? and uid = ?";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setInt(1, bid); 
					ps.setInt(2, uid);
					    
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
	
}
