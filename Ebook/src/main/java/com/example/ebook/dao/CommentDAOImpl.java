package com.example.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.ebook.entity.CommentProduct; 

public class CommentDAOImpl implements CommentDAO {

private Connection conn ;
	 
	public CommentDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	// ADD COMMENT PRODUCT DETAILS
	@Override
	public boolean addCommentProduct(CommentProduct c) {
		// TODO Auto-generated method stub
				boolean f = false ;
				try {
					
					String sql = "insert into commentproduct (bid, uid, name, email, date, content ) values (?,?,?,?,?,?) ";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setInt(1, c.getBid());
					ps.setInt(2, c.getUid());
					ps.setString(3, c.getName() );
					ps.setString(4, c.getEmail() ); 
					ps.setString(5, c.getDate() );
					ps.setString(6, c.getContent() ); 
					
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

	
	// LIST COMMENT PRODUCT DETAILS
	@Override
	public List<CommentProduct> listCommentProduct(int bid) {
		// TODO Auto-generated method stub
		
				List<CommentProduct> list = new ArrayList<CommentProduct>();
				CommentProduct c = null ;
				
				try {
					
					String sql = "select * from commentproduct";
					PreparedStatement ps = conn.prepareStatement(sql);
					
					ResultSet rs = ps.executeQuery();
					while( rs.next() ) 
					{
						c = new CommentProduct(); 
						
						c.setId(rs.getInt(1));
						c.setBid(rs.getInt(2));
						c.setUid(rs.getInt(3));
						c.setName(rs.getString(4));
						c.setEmail(rs.getString(5));
						c.setDate(rs.getString(6));
						c.setContent(rs.getString(7)); 
						
						if (c.getBid() == bid) {
							list.add(c); 
						}
						 
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				return list;
	}

	
}
