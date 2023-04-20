package com.example.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.ebook.entity.Contact;
 

public class ContactDAOImpl implements ContactDAO {

    private Connection conn ;
	
	
	public ContactDAOImpl (Connection conn) {
		super();
		this.conn = conn;
	}
	
	// THEM THONG TIN LIEN HE
	@Override
	public boolean addContact(Contact c) {
		// TODO Auto-generated method stub
				boolean f = false ;
				try {
					
					String sql = "insert into contact (name, email, number, subject, message) values (?,?,?,?,?) ";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, c.getName());
					ps.setString(2, c.getEmail());
					ps.setInt(3, c.getNumber());
					ps.setString(4, c.getSubject());
					ps.setString(5, c.getMessage());  
					
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
