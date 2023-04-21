package com.example.ebook.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
public class H2EmbeddedExample {
	
	private static Connection conn ;
	 
	public static Connection getConn ()
	{
		String jdbcURL = "jdbc:h2:~/test";
		String username = "sa";
		String password = "1234";
		
		try { 
			
			conn = DriverManager.getConnection(jdbcURL, username, password); 
			System.out.println("CONNECTED TO H2 IN-MEMORY DATABASE");
		
//			String drop = "drop table USER1"; 
//			drop = "drop table orderdetails"; 
//			drop = "drop table favourite"; 
//			drop = "drop table contact"; 
//			drop = "drop table commentproduct"; 
//			drop = "drop table cart"; 
//			drop = "drop table book_order"; 
//			drop = "drop table book_dtls";  
//			
//			
//			Statement statement1 = conn.createStatement();
//			statement1.execute(drop);
			
//			CREATE TABLE EMPLOYEE(EMP_ID CHAR(4) PRIMARY KEY, NAME VARCHAR(30), MALE BIT, BIRTHDAY DATE, ADDRESS VARCHAR(30), PHONE VARCHAR(10), DEPARTMENT VARCHAR(30), TITLE VARCHAR(3), WAGE_RATE BIGINT);
			
			boolean resultUser = false ;
			
			System.out.println("CREATING USER1 DATABASE...");
			    
			String sql = "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'USER1')";
			Statement statement = conn.createStatement();  
			ResultSet resultSet = statement.executeQuery(sql);
			if (resultSet.next()) {
			    boolean exists = resultSet.getBoolean(1);
			    if (exists) {
			    	resultUser = true;
			    } else {
			    	resultUser = false;
			    }
			} 
			  
			System.out.println("EXIST : "+ resultUser);
			
			if ( resultUser == false ) {
				System.out.println("HHHH");
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE USER1 ( ID INT AUTO_INCREMENT PRIMARY KEY , NAME VARCHAR(45), EMAIL VARCHAR(45), PHNO VARCHAR(45), PASSWORD VARCHAR(500), ADDRESS VARCHAR(500) , LANDMARK VARCHAR(500), CITY VARCHAR(500), STATE VARCHAR(45), PINCODE VARCHAR(45) )";
                  String sql2 = "INSERT INTO USER1 VALUES('1','Admin','admin@gmail.com','0123456789','admin','8 Nguyễn Trãi','TP','TP.HCM','Việt Nam', '12345')";
//                String sql3 = "INSERT INTO USER VALUES('Admin','admin@gmail.com','0123456789','admin','8 Nguyễn Trãi','TP','TP.HCM','Việt Nam', '12345')";
                 
                  stmt.execute(sql1);
                  int rowsInserted = statement.executeUpdate(sql2); 
//           	 rowsInserted = statement.executeUpdate(sql3);  
			} 

			System.out.println("DATABASE USERS CREATED SUCCESSFULLY...");
			 
			
//			DATABASE ORDERDETAILS
			 
	        boolean resultOrderDetails = false ;
			
			 System.out.println("CREATING ORDERDETAILS DATABASE...");
			    
			 sql = "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'ORDERDETAILS')";
			 statement = conn.createStatement();  
			 resultSet = statement.executeQuery(sql);
			 
			if (resultSet.next()) {
			    boolean exists = resultSet.getBoolean(1);
			    if (exists) {
			    	resultOrderDetails = true;
			    } else {
			    	resultOrderDetails = false;
			    }
			} 
			  
			System.out.println("EXIST : "+ resultOrderDetails);
			
			if ( resultOrderDetails == false ) {
				System.out.println("HHHH");
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE ORDERDETAILS ( ID INT AUTO_INCREMENT PRIMARY KEY , ORDER_ID VARCHAR(45) , CID INT ,BID INT,UID INT, BOOKNAME VARCHAR(45), IMAGE VARCHAR(100),AUTHOR VARCHAR(45), QUANTITY INT, PRICE DOUBLE, TOTAL_PRICE DOUBLE  )";
             
                  stmt.execute(sql1); 
			} 
			
			System.out.println("DATABASE ORDERDETAILS CREATED SUCCESSFULLY...");
			 

//			DATABASE FAVOURITE 
			 
	        boolean resultFavourite = false ;
			
			 System.out.println("CREATING FAVOURITE DATABASE...");
			    
			 sql = "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'FAVOURITE')";
			 statement = conn.createStatement();  
			 resultSet = statement.executeQuery(sql);
			 
			if (resultSet.next()) {
			    boolean exists = resultSet.getBoolean(1);
			    if (exists) {
			    	resultFavourite = true;
			    } else {
			    	resultFavourite = false;
			    }
			} 
			  
			System.out.println("EXIST : "+ resultFavourite);
			
			if ( resultFavourite == false ) {
				System.out.println("HHHH");
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE FAVOURITE ( ID INT AUTO_INCREMENT PRIMARY KEY , UID INT , BID INT, BOOKNAME VARCHAR(45),  AUTHOR VARCHAR(45), PRICE DOUBLE, BOOKCATEGORY VARCHAR(45), STATUS VARCHAR(45),PHOTO VARCHAR(45)  )";
             
                  stmt.execute(sql1); 
			} 
			
			System.out.println("DATABASE FAVOURITE CREATED SUCCESSFULLY...");
			 
			

//			DATABASE CONTACT 
			 
	        boolean resultContact = false ;
			
			 System.out.println("CREATING CONTACT DATABASE...");
			    
			 sql = "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'CONTACT')";
			 statement = conn.createStatement();  
			 resultSet = statement.executeQuery(sql);
			 
			if (resultSet.next()) {
			    boolean exists = resultSet.getBoolean(1);
			    if (exists) {
			    	resultContact = true;
			    } else {
			    	resultContact = false;
			    }
			} 
			  
			System.out.println("EXIST : "+ resultContact);
			
			if ( resultContact == false ) {
				System.out.println("HHHH");
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE CONTACT ( ID INT AUTO_INCREMENT PRIMARY KEY, NAME VARCHAR(45), EMAIL VARCHAR(45), NUMBER INT, SUBJECT VARCHAR(100) , MESSAGE VARCHAR(500))";
             
                  stmt.execute(sql1); 
			} 
			
			System.out.println("DATABASE CONTACT CREATED SUCCESSFULLY...");
			 
			

//			DATABASE COMMENTPRODUCT 
			 
	        boolean resultCommentProduct = false ;
			
			 System.out.println("CREATING COMMENTPRODUCT DATABASE...");
			    
			 sql = "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'COMMENTPRODUCT')";
			 statement = conn.createStatement();  
			 resultSet = statement.executeQuery(sql);
			 
			if (resultSet.next()) {
			    boolean exists = resultSet.getBoolean(1);
			    if (exists) {
			    	resultCommentProduct = true;
			    } else {
			    	resultCommentProduct = false;
			    }
			} 
			  
			System.out.println("EXIST : "+ resultCommentProduct);
			
			if ( resultCommentProduct == false ) {
				System.out.println("HHHH");
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE COMMENTPRODUCT ( ID INT AUTO_INCREMENT PRIMARY KEY, BID INT, UID INT, NAME VARCHAR(100), EMAIL VARCHAR(100), DATE  VARCHAR(200) , CONTENT VARCHAR(500)  )";
             
                  stmt.execute(sql1); 
			} 
			
			System.out.println("DATABASE COMMENTPRODUCT CREATED SUCCESSFULLY...");
			 
			


//			DATABASE CART
			 
	        boolean resultCart = false ;
			
			 System.out.println("CREATING CART DATABASE...");
			    
			 sql = "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'CART')";
			 statement = conn.createStatement();  
			 resultSet = statement.executeQuery(sql);
			 
			if (resultSet.next()) {
			    boolean exists = resultSet.getBoolean(1);
			    if (exists) {
			    	resultCart = true;
			    } else {
			    	resultCart = false;
			    }
			} 
			  
			System.out.println("EXIST : "+ resultCart);
			
			if ( resultCart == false ) {
				System.out.println("HHHH");
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE CART ( CID INT AUTO_INCREMENT PRIMARY KEY , BID INT, UID INT, BOOKNAME VARCHAR(45) , IMAGE VARCHAR(100), AUTHOR VARCHAR(45), QUANTITY INT , PRICE DOUBLE, TOTAL_PRICE  DOUBLE)";
                  
                  stmt.execute(sql1); 
                   
			} 
			
			System.out.println("DATABASE CART CREATED SUCCESSFULLY...");
			 
			


//			DATABASE BOOKORDER 
			 
	        boolean resultBookOrder = false ;
			
			 System.out.println("CREATING BOOKORDER DATABASE...");
			    
			 sql = "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'BOOKORDER')";
			 statement = conn.createStatement();  
			 resultSet = statement.executeQuery(sql);
			 
			if (resultSet.next()) {
			    boolean exists = resultSet.getBoolean(1);
			    if (exists) {
			    	resultBookOrder = true;
			    } else {
			    	resultBookOrder = false;
			    }
			} 
			  
			System.out.println("EXIST : "+ resultBookOrder);
			
			if ( resultBookOrder == false ) {
				System.out.println("HHHH");
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE BOOKORDER ( ID INT AUTO_INCREMENT PRIMARY KEY , ORDER_ID VARCHAR(45) , USER_NAME VARCHAR(45) , EMAIL VARCHAR(45), ADDRESS VARCHAR(500), PHONE  VARCHAR(45), TOTAL DOUBLE, PAYMENT VARCHAR(45))";
             
                  stmt.execute(sql1); 
			} 
			
			System.out.println("DATABASE BOOKORDER CREATED SUCCESSFULLY...");
			 
			 

//			DATABASE BOOK_DTLS 
			 
	        boolean resultBookDtls = false ;
			
			 System.out.println("CREATING BOOK_DTLS DATABASE...");
			    
			 sql = "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'BOOK_DTLS')";
			 statement = conn.createStatement();  
			 resultSet = statement.executeQuery(sql);
			 
			if (resultSet.next()) {
			    boolean exists = resultSet.getBoolean(1);
			    if (exists) {
			    	resultBookDtls = true;
			    } else {
			    	resultBookDtls = false;
			    }
			} 
			  
			System.out.println("EXIST : "+ resultBookDtls);
			
			if ( resultBookDtls == false ) {
				System.out.println("HHHH");
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE BOOK_DTLS ( BOOKID INT AUTO_INCREMENT PRIMARY KEY , BOOKNAME VARCHAR(45), AUTHOR VARCHAR(45), PRICE DOUBLE, BOOKCATEGORY VARCHAR(45), STATUS VARCHAR(45) , PHOTO VARCHAR(45), EMAIL VARCHAR(45) )";
                  String sql2 = "INSERT INTO BOOK_DTLS VALUES('1', 'hhh ', 'kkkk ', '4', 'New', 'Active', 'th.jpg', 'admin')";
                  String sql3 = "INSERT INTO BOOK_DTLS VALUES('2', 'Linux', 'Author linux', '100', 'New', 'Active', 'th (1).jpg', 'admin')";
                  String sql4 = "INSERT INTO BOOK_DTLS VALUES('3', 'Linux', 'Author linux', '4.02', 'New', 'Inactive', 'th (2).jpg', 'admin')";
                  String sql5 = "INSERT INTO BOOK_DTLS VALUES('4', 'xxxx', 'kkkk', '4.02', 'Old', 'Active', 'th (3).jpg', 'admin')";
                  String sql6 = "INSERT INTO BOOK_DTLS VALUES('5', 'hhh2', 'Author linux', '4', 'Old', 'Active', 'th (4).jpg', 'admin')";
                  String sql7 = "INSERT INTO BOOK_DTLS VALUES('6', 'hhh1', 'Author', '4', 'New', 'Active', 'th (4).jpg', 'admin')";
                  String sql8 = "INSERT INTO BOOK_DTLS VALUES('7', 'Ssc Constable Gd 2', 'kkkk', '4.02', 'Old', 'Active', 'th (5).jpg', '19130075@st.hcmuaf.edu.vn')";
                  String sql9 = "INSERT INTO BOOK_DTLS VALUES('8', 'Ssc Constable Gd 3', 'Rakesh Tiwary 3', '345', 'New', 'Active', 'cute.jpg', 'admin')";
                  String sql10 = "INSERT INTO BOOK_DTLS VALUES('9', 'Ssc Constable Gd 2', 'Author linux', '4.02', 'New', 'Active', 'sachsuckhoe.jpg', 'admin')";
                  String sql11 = "INSERT INTO BOOK_DTLS VALUES('10', 'COMBO TO THE Dawn + SHORT LAMPS', 'SHORT LAMPS', '345', 'Literature', 'Active', 'cat-2.png', 'admin')";
                  String sql12 = "INSERT INTO BOOK_DTLS VALUES('11', 'Firefly Forest', 'Forest', '12', 'Foreign language books', 'Active', 'cat-1.png', 'admin')";
                  String sql13 = "INSERT INTO BOOK_DTLS VALUES('12', 'SUPERMARKET CASE', 'CASE', '43', 'Life skills book', 'Active', 'banner-2.png', 'admin')";
                  String sql14 = "INSERT INTO BOOK_DTLS VALUES('13', 'STORY OF MY VILLAGE', 'VILLAGE', '87', 'Book of art - architecture', 'Active', 'banner-1.png', 'admin')";
                  String sql15 = "INSERT INTO BOOK_DTLS VALUES('14', 'NGUYEN THU PHOTOS', 'PHOTOS', '43', 'Medicine & sport books', 'Active', 'banner-3.png', 'admin')";
                  String sql16 = "INSERT INTO BOOK_DTLS VALUES('15', 'SUPERMARKET CASE', 'CASE', '23', 'Life skills book', 'Active', 'cat-1.png', 'admin')";
                  String sql17 = "INSERT INTO BOOK_DTLS VALUES('16', 'Ssc Constable Gf', 'Author linux', '43', 'Old', 'Active', 'about-img.jpg', 'daudiep2003@gmail.com')";
                  String sql18 = "INSERT INTO BOOK_DTLS VALUES('17', 'Ssc Constable Gd 2', 'Author linux', '4.02', 'Foreign language books', 'Active', 'cat-2.png', 'admin')";
                  String sql19 = "INSERT INTO BOOK_DTLS VALUES('18', 'Ssc Constable Gd 2', 'kkkk', '4.02', 'Foreign language books', 'Active', 'cat-3.png', 'admin')";
                  String sql20 = "INSERT INTO BOOK_DTLS VALUES('19', 'hhh2', 'CASE', '4.02', 'Foreign language books', 'Active', 'cat-4.png', 'admin')";
                  String sql21 = "INSERT INTO BOOK_DTLS VALUES('20', 'xxxx', 'Author linux', '43', 'Foreign language books', 'Active', 'cat-5.png', 'admin')";
                 
                  stmt.execute(sql1); 
                  int rowsInserted = statement.executeUpdate(sql2);
                  rowsInserted = statement.executeUpdate(sql3);
                  rowsInserted = statement.executeUpdate(sql4);
                  rowsInserted = statement.executeUpdate(sql5);
                  rowsInserted = statement.executeUpdate(sql6);
                  rowsInserted = statement.executeUpdate(sql7);
                  rowsInserted = statement.executeUpdate(sql8);
                  rowsInserted = statement.executeUpdate(sql9);
                  rowsInserted = statement.executeUpdate(sql10);
                  rowsInserted = statement.executeUpdate(sql11);
                  rowsInserted = statement.executeUpdate(sql12);
                  rowsInserted = statement.executeUpdate(sql13);
                  rowsInserted = statement.executeUpdate(sql14);
                  rowsInserted = statement.executeUpdate(sql15);
                  rowsInserted = statement.executeUpdate(sql16);
                  rowsInserted = statement.executeUpdate(sql17);
                  rowsInserted = statement.executeUpdate(sql18);
                  rowsInserted = statement.executeUpdate(sql19);
                  rowsInserted = statement.executeUpdate(sql20);
                  rowsInserted = statement.executeUpdate(sql21); 
			} 
			
			System.out.println("DATABASE BOOK_DTLS CREATED SUCCESSFULLY...");
			 
			  
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}  
	  
	  
	
//	public static void main(String[] args) {
////		UserDAOImpl u = new UserDAOImpl(conn);
////		u.display();
//		
//		H2EmbeddedExample example = new H2EmbeddedExample();   
//		
//		try {
//			Connection connection = example.getConn();
//		  
//			Statement statement = connection.createStatement(); 
//			
//			String sql = "SELECT * FROM USER1"; 
//			
//			ResultSet resultSet = statement.executeQuery(sql);  
//			
//			while (resultSet.next()) { 
//				 
//				int id = resultSet.getInt("ID");
//				String name = resultSet.getString("name"); 
//				
//				System.out.println(id + " - " + name);
//			}
//			
//			connection.close();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	}
	
}
