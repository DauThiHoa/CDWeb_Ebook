package com.example.ebook.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnect {

	private static Connection conn ;
	
//	public static Connection getConn ()
//	{
//		try {
////			com.mysql.cj.jdbc.Driver
////			Class.forName("com.mysql.jdbc.Driver");
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-web","root","H0345389984$");
//			
//		}catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		return conn;
//	}
	
	public static Connection getConn ()
	
	{
		String jdbcURL = "jdbc:h2:~/test";
		String username = "sa";
		String password = "1234";
		
		try { 
			Class.forName("org.h2.Driver");
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
//			Statement statement1 = conn.createStatement();
//			statement1.execute(drop);
			
//			DROP TABLE IF EXISTS BOOK_ORDER ;
//			DROP TABLE IF EXISTS BOOK_DTLS ;
//			DROP TABLE IF EXISTS CART ;
//			DROP TABLE IF EXISTS COMMENTPRODUCT ;
//			DROP TABLE IF EXISTS CONTACT ;
//			DROP TABLE IF EXISTS FAVOURITE ;
//			DROP TABLE IF EXISTS MYTABLE ;
//			DROP TABLE IF EXISTS ORDERDETAILS ;
//			DROP TABLE IF EXISTS USER1 ;
			
//			SELECT * FROM BOOKORDER ;
//			SELECT * FROM BOOK_DTLS ;
//			SELECT * FROM CART ;
//			SELECT * FROM COMMENTPRODUCT ;
//			SELECT * FROM CONTACT ;
//			SELECT * FROM FAVOURITE ; 
//			SELECT * FROM ORDERDETAILS ;
//			SELECT * FROM USER1 ;
			
			 
			boolean resultUser = false ;
			  
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
			  
//			System.out.println("USER1 : "+ resultUser);
			
			if ( resultUser == false ) { 
                Statement stmt = conn.createStatement();
             
                  String sql1 = "CREATE TABLE USER1 ( ID INT AUTO_INCREMENT PRIMARY KEY , NAME VARCHAR(45), EMAIL VARCHAR(45), PHNO VARCHAR(45), PASSWORD VARCHAR(500), ADDRESS VARCHAR(500) , LANDMARK VARCHAR(500), CITY VARCHAR(500), STATE VARCHAR(45), PINCODE VARCHAR(45) )";
//                String sql2 = "INSERT INTO USER1 ( NAME , EMAIL, PHNO , PASSWORD , ADDRESS , LANDMARK, CITY , STATE , PINCODE ) VALUES('Admin','admin@gmail.com','0123456789','admin','8 Nguyễn Trãi','TP','TP.HCM','Việt Nam', '12345')";
       
                  stmt.execute(sql1);
//				  int rowsInserted = statement.executeUpdate(sql2);  
				  
			}  
			 
			
//			DATABASE ORDERDETAILS
			 
	        boolean resultOrderDetails = false ;
			 
			    
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
			  
//			System.out.println("ORDERDETAILS : "+ resultOrderDetails);
			
			if ( resultOrderDetails == false ) { 
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE ORDERDETAILS ( ID INT AUTO_INCREMENT PRIMARY KEY , ORDER_ID VARCHAR(45) , CID INT ,BID INT,UID INT, BOOKNAME VARCHAR(45), IMAGE VARCHAR(100),AUTHOR VARCHAR(45), QUANTITY INT, PRICE DOUBLE, TOTAL_PRICE DOUBLE  )";
             
                  stmt.execute(sql1); 
			}  
			 

//			DATABASE FAVOURITE 
			 
	        boolean resultFavourite = false ;
			 
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
			  
//			System.out.println("FAVOURITE : "+ resultFavourite);
			
			if ( resultFavourite == false ) { 
                Statement stmt = conn.createStatement();
             
                  String sql1 = "CREATE TABLE FAVOURITE ( ID INT AUTO_INCREMENT PRIMARY KEY , UID INT , BID INT, BOOKNAME VARCHAR(45),  AUTHOR VARCHAR(45), PRICE DOUBLE, BOOKCATEGORY VARCHAR(45), STATUS VARCHAR(45),PHOTO VARCHAR(45)  )";
             
                  stmt.execute(sql1); 
			} 
			 
			  

//			DATABASE CONTACT 
			 
	        boolean resultContact = false ;
			 
			    
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
			  
//			System.out.println("CONTACT : "+ resultContact);
			
			if ( resultContact == false ) {
				System.out.println("HHHH");
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE CONTACT ( ID INT AUTO_INCREMENT PRIMARY KEY, NAME VARCHAR(45), EMAIL VARCHAR(45), NUMBER INT, SUBJECT VARCHAR(100) , MESSAGE VARCHAR(500))";
             
                  stmt.execute(sql1); 
			} 
			  
//			DATABASE COMMENTPRODUCT 
			 
	        boolean resultCommentProduct = false ;
			  
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
			  
//			System.out.println("COMMENTPRODUCT : "+ resultCommentProduct);
			
			if ( resultCommentProduct == false ) { 
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE COMMENTPRODUCT ( ID INT AUTO_INCREMENT PRIMARY KEY, BID INT, UID INT, NAME VARCHAR(100), EMAIL VARCHAR(100), DATE  VARCHAR(200) , CONTENT VARCHAR(500)  )";
             
                  stmt.execute(sql1); 
			}  

//			DATABASE CART
			 
	        boolean resultCart = false ; 
			    
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
			  
//			System.out.println("CART : "+ resultCart);
			
			if ( resultCart == false ) { 
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE CART ( CID INT AUTO_INCREMENT PRIMARY KEY , BID INT, UID INT, BOOKNAME VARCHAR(45) , IMAGE VARCHAR(100), AUTHOR VARCHAR(45), QUANTITY INT , PRICE DOUBLE, TOTAL_PRICE  DOUBLE)";
                  
                  stmt.execute(sql1); 
                   
			} 
			 

//			DATABASE BOOK_ORDER 
			 
	        boolean resultBookOrder = false ;
			 
			    
			 sql = "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'BOOK_ORDER')";
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
			  
//			System.out.println("BOOK_ORDER : "+ resultBookOrder);
			
			if ( resultBookOrder == false ) { 
                Statement stmt = conn.createStatement();
            
 
                  String sql1 = "CREATE TABLE BOOK_ORDER ( ID INT AUTO_INCREMENT PRIMARY KEY , ORDER_ID VARCHAR(45) , USER_NAME VARCHAR(45) , EMAIL VARCHAR(45), ADDRESS VARCHAR(500), PHONE  VARCHAR(45), TOTAL DOUBLE, PAYMENT VARCHAR(45))";
             
                  stmt.execute(sql1); 
			} 
			 

//			DATABASE BOOK_DTLS 
			 
	        boolean resultBookDtls = false ;
			  
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
			  
//			System.out.println("BOOK_DTLS : "+ resultBookDtls);
			
			if ( resultBookDtls == false ) { 
                Statement stmt = conn.createStatement();
             
                  String sql1 = "CREATE TABLE BOOK_DTLS ( BOOKID INT AUTO_INCREMENT PRIMARY KEY , BOOKNAME VARCHAR(450), AUTHOR VARCHAR(45), PRICE DOUBLE, BOOKCATEGORY VARCHAR(45), STATUS VARCHAR(45) , PHOTO VARCHAR(500), EMAIL VARCHAR(45) )";
                
                  String sql2 = "INSERT INTO BOOK_DTLS VALUES('1', 'The talented grandmother in the saga region ', 'Saburo Ishikawa', '45.760', 'New', 'Active', 'https://newshop.vn/public/uploads/products/52646/sach-nguoi-ba-tai-gioi-vung-saga-tap-11.jpg', 'admin')";
                  String sql3 = "INSERT INTO BOOK_DTLS VALUES('2', 'Tu thu - hard cover ', 'Quoc Trung', '200.000', 'New', 'Active', 'https://newshop.vn/public/uploads/products/52634/sach-tu-thu-bia-cung.jpg', 'admin')";
                  String sql4 = "INSERT INTO BOOK_DTLS VALUES('3', 'It is still fine even when you are alone ', 'Duong Hanh', '83.600', 'New', 'Inactive', 'https://newshop.vn/public/uploads/products/52635/sach-van-on-thoi-ke-ca-khi-ban-mot-minh.jpg', 'admin')"; 
                  String sql5 = "INSERT INTO BOOK_DTLS VALUES('4', 'I have to live fully every day ', 'EE SOEUN', '105.600', 'New', 'Active', 'https://newshop.vn/public/uploads/products/52636/minh-phai-song-that-tron-ven-moi-ngay.jpg', 'admin')";
                  String sql6 = "INSERT INTO BOOK_DTLS VALUES('5', 'Family scratching itch - collection when adults …… children ', 'Quang Nino', '110.000', 'Old', 'Active', 'https://newshop.vn/public/uploads/products/52625/kham-pha-va-chua-lanh-16-kieu-tinh-cach-qua-mbti.png', 'admin')"; 
                  String sql7 = "INSERT INTO BOOK_DTLS VALUES('6', 'You are what you click - click virtual experience', 'Brian A. Primack', '124.960', 'Old', 'Active', 'https://newshop.vn/public/uploads/products/52624/sach-buoc-vao-the-gioi-cam-xuc-be-nho-cua-tre_L.jpg', 'admin')"; 
                  String sql8 = "INSERT INTO BOOK_DTLS VALUES('7', 'Vba programming guide for excel ', 'Pham Quang Hien', '151.300', 'Old', 'Active', 'https://newshop.vn/public/uploads/products/52639/sach-huong-dan-lap-trinh-vba-cho-excel.jpg', 'admin')"; 
                  String sql9 = "INSERT INTO BOOK_DTLS VALUES('8', 'Autocad user manual with images ', 'Pham Quang Huy', '156.400', 'Old', 'Inactive', 'https://newshop.vn/public/uploads/products/52640/sach-huong-dan-su-dung-autocad-bang-hinh-anh.jpg', 'admin')"; 
                  String sql10 = "INSERT INTO BOOK_DTLS VALUES('9', 'How smart children learn', 'Chu Nhat Pham', '87.120', 'Old', 'Inactive', 'https://newshop.vn/public/uploads/products/52641/tre-thong-minh-hoc-tap-nhu-the-nao.jpg', 'admin')";
                  						 																																	 
                  String sql11 = "INSERT INTO BOOK_DTLS VALUES('11', '200+ sets of questions and interviews in english ', 'ARAN KIM', '236.720', 'Foreign language books', 'Active', 'https://newshop.vn/public/uploads/products/52284/sach-200-bo-cau-hoi-va-tra-loi-phong-van-tieng-anh.jpg', 'admin')"; 
                  String sql12 = "INSERT INTO BOOK_DTLS VALUES('12', '233 english sentence patterns conquer employers ', 'Juliana Jiyoon Lee', '210.320', 'Foreign language books', 'Active', 'https://newshop.vn/public/uploads/products/41911/sach-tu-hoc-ngu-phap-tieng-anh-bang-mindmap-tap-2.jpg', 'admin')"; 
                  String sql13 = "INSERT INTO BOOK_DTLS VALUES('13', 'Literature literature - grammaire francaise (with exercises and corrections) ', 'Nguyen Kinh Doc', '104.000', 'Foreign language books', 'Active', 'https://newshop.vn/public/uploads/products/41910/sach-tu-hoc-ngu-phap-tieng-anh-bang-mindmap-tap-1.jpg', 'admin')"; 
                  String sql14 = "INSERT INTO BOOK_DTLS VALUES('14', 'Combo mindmap english grammar - english grammar with mind map + mind map english vocabulary', 'Do Nhung', '310.400', 'Foreign language books', 'Active', 'https://newshop.vn/public/uploads/products/41071/sach-tieng-anh-genz.jpg', 'admin')"; 
                  String sql15 = "INSERT INTO BOOK_DTLS VALUES('15', 'Comprehensive supplementary exercises - english grammar (abb) ', 'Dong Nai', '75.650', 'Foreign language books', 'Active', '	https://newshop.vn/public/uploads/products/51933/sach-bai-tap-bo-tro-toan-dien-ngu-phap-tieng-anh.jpg', 'admin')"; 
                  String sql16 = "INSERT INTO BOOK_DTLS VALUES('16', 'Great technique to erase english blindness ', 'Mizuno Yuka', '118.150', 'Foreign language books', 'Active', '	https://newshop.vn/public/uploads/products/51852/sach-sach-tuyet-ky-xoa-mu-tieng-anh.jpg', 'admin')"; 
                  String sql17 = "INSERT INTO BOOK_DTLS VALUES('17', '999 letters sent to themselves - the most impressive letters (chinese -vietnamese bilingual version) ', 'Mizuno Yuka', '87.120', 'Foreign language books', 'Active', 'https://newshop.vn/public/uploads/products/51055/sach-cung-ban-truong-thanh_L.jpg', 'admin')"; 
                  String sql18 = "INSERT INTO BOOK_DTLS VALUES('18', 'Everyday english for grown -ups - self -study english for busy people ', 'Mizuno Yuka', ' 95.920', 'Foreign language books', 'Active', 'https://newshop.vn/public/uploads/products/50776/sach-nghien-ngu-phap-tieng-anh-hinh-que-tap-2-nang-cao_L.jpg', 'admin')"; 
                  String sql19 = "INSERT INTO BOOK_DTLS VALUES('19', 'Korean dictionary (cm)', 'Mizuno Yuka', '30.600', 'Foreign language books', 'Active', 'https://newshop.vn/public/uploads/products/51639/sach-tu-dien-han-viet-cao-minh.jpg', 'admin')"; 
                  String sql20 = "INSERT INTO BOOK_DTLS VALUES('20', 'Grinding english grammar shaped - episode 1: basic ', 'Mizuno Yuka', '15.600', 'Foreign language books', 'Active', 'https://newshop.vn/public/uploads/products/50775/sach-nghien-ngu-phap-tieng-anh-hinh-que-tap-1-co-ban_L.jpg', 'admin')"; 
                  
                  
                  String sql21 = "INSERT INTO BOOK_DTLS VALUES('21', 'Road to - see again in the morning sun ', 'Mac Bao Phi Bao', '130.240', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52615/duong-ve-gap-lai-duoi-nang-mai.jpg', 'admin')"; 
                  String sql22 = "INSERT INTO BOOK_DTLS VALUES('22', 'Is this place ','Jodi Picoult', '135.200', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52595/sach-co-phai-anh-noi-nay.jpg', 'admin')"; 
                  String sql23 = "INSERT INTO BOOK_DTLS VALUES('23', 'Emotional life also needs at the right time ', 'Chung Hue', '103.840', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52533/sach-song-cam-xuc-cung-can-dung-luc.jpg', 'admin')"; 
                  String sql24 = "INSERT INTO BOOK_DTLS VALUES('24', 'Youth lost ', 'Alpha Books', '113.520', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52513/sach-tuoi-tre-lac-loi.jpg', 'admin')";  
                  String sql25 = "INSERT INTO BOOK_DTLS VALUES('25', 'Bookcase read with children - folklore selected: childhood fairy garden - tam cam ', 'Dong Nai', '38.250', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52447/tu-sach-doc-cung-con-van-hoc-dan-gian-tuyen-chon-vuon-co-tich-tuoi-tho-tam-cam.jpg', 'admin')"; 
                  String sql26 = "INSERT INTO BOOK_DTLS VALUES('26', 'Reading bookcase with children - folklore selected: childhood fairy garden - bach tuyet and seven', 'Dong Nai', '38.250', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52445/tu-sach-doc-cung-con-van-hoc-dan-gian-tuyen-chon-vuon-co-tich-tuoi-tho-nang-bach-tuyet-va-bay-chu-lun.png', 'admin')"; 
                  String sql27 = "INSERT INTO BOOK_DTLS VALUES('27', 'Women shu - gender and development: nam phong magazine - women issue in our country ', 'Phu Nu Viet Nam', '159.280', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52443/khuyen-hoc-al.jpg', 'admin')"; 
                  String sql28 = "INSERT INTO BOOK_DTLS VALUES('28', 'Close eyelashes and love ', 'Summer Kat', '77.440', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52317/sach-khep-mi-lai-va-yeu.jpg', 'admin')"; 
                  String sql29 = "INSERT INTO BOOK_DTLS VALUES('29', 'Don peek anymore, i like you too', 'Summer Kat', '108.800', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52309/sach-dung-nhin-len-nua-anh-cung-thich-em.jpg', 'admin')"; 
                  String sql30 = "INSERT INTO BOOK_DTLS VALUES('30', 'Dandelion', 'Summer Kat', '100.300', 'Literature', 'Active', 'https://newshop.vn/public/uploads/products/52307/sach-bo-cong-anh.jpg', 'admin')"; 
                  
                  
                  String sql31 = "INSERT INTO BOOK_DTLS VALUES('31', 'Recovery after depression and anxiety ', 'Ahra Kim', '87.200', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/52629/phuc-hoi-sau-tram-cam-va-lo-au.jpg', 'admin')"; 
                  String sql32 = "INSERT INTO BOOK_DTLS VALUES('32', '5 minutes of self -discipline', 'Christine Li', '46.900', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/52628/sach-5-phut-ren-luyen-tinh-tu-ki-luat.jpg', 'admin')"; 
                  String sql33 = "INSERT INTO BOOK_DTLS VALUES('33', 'Discover and heal 16 styles through mbti', 'Kim So Na, Lee Se Jin', '136.400', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/52625/kham-pha-va-chua-lanh-16-kieu-tinh-cach-qua-mbti.png', 'admin')"; 
                  String sql34 = "INSERT INTO BOOK_DTLS VALUES('34', 'Psychology of personality disorders avoid ', 'OKADA TAKASHI', '113.520', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/47256/sach-tam-ly-hoc-ve-roi-loan-nhan-cach-tranh-ne.jpg', 'admin')"; 
                  String sql35 = "INSERT INTO BOOK_DTLS VALUES('35', 'Do not let fear stop your way ', 'Minh Long Book', '46.900', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/52603/sach-dung-de-noi-so-can-duong-ban.jpg', 'admin')"; 
                  String sql36 = "INSERT INTO BOOK_DTLS VALUES('36', 'Say everyone', 'Minh Long Book', '60.900', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/52602/sach-noi-ai-nay-phuc.jpg', 'admin')"; 
                  String sql37 = "INSERT INTO BOOK_DTLS VALUES('37', 'Steady life', 'Brad Stulberg', '147.840', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/52600/sach-nghe-thuat-song-vung-vang.jpg', 'admin')"; 
                  String sql38 = "INSERT INTO BOOK_DTLS VALUES('38', 'Delayed art ', 'John Perry', '71.200', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/52572/sach-nghe-thuat-tri-hoan.jpg', 'admin')"; 
                  String sql39 = "INSERT INTO BOOK_DTLS VALUES('39', 'Seed of the soul - symphony life - special edition ', 'First News', '191.840', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/52563/sach-hat-giong-tam-hon-ban-giao-huong-cuoc-song-an-ban-dac-biet.jpg', 'admin')"; 
                  String sql40 = "INSERT INTO BOOK_DTLS VALUES('40', 'Elegant handbook - 8 lessons from japanese people ', 'Toshie Igaki', '87.120', 'Life skills book', 'Active', 'https://newshop.vn/public/uploads/products/52543/sach-cam-nang-cung-cach-thanh-lich-8-bai-hoc-tu-nguoi-nhat.jpg', 'admin')"; 
                  
                  
                  String sql41 = "INSERT INTO BOOK_DTLS VALUES('41', 'Understand and enjoy a work of art ', 'Diep Thanh Truc', '149.600', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/48734/sach-hieu-va-thuong-thuc-mot-tac-pham-my-thuat.jpg', 'admin')"; 
                  String sql42 = "INSERT INTO BOOK_DTLS VALUES('42', '3 -volume basic piano mattress combo', 'Huy Hoang Book', '369.750', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/8660/combo-hoc-dem-piano-co-ban-3-quyen-kem-cd-1.jpg', 'admin')"; 
                  String sql43 = "INSERT INTO BOOK_DTLS VALUES('43', 'Bach khoa thu about art ', 'Alpha Books', '439.120', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/47362/sach-bach-khoa-thu-ve-nghe-thuat.jpg', 'admin')"; 
                  String sql44 = "INSERT INTO BOOK_DTLS VALUES('44', 'Trinh music, lyrical music for the piano - part 1', 'Huy Hoàng Book', '136.000', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/47331/sach-nhac-trinh-nhac-tru-tinh-soan-cho-piano-phan-1.jpg', 'admin')"; 
                  String sql45 = "INSERT INTO BOOK_DTLS VALUES('45', 'Vietnamese folk painting (cuu duc)', 'Marcus Durand', '861.360', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/43073/sach-tranh-dan-gian-viet-nam.jpg', 'admin')"; 
                  String sql46 = "INSERT INTO BOOK_DTLS VALUES('46', 'Road to photography art - skills and creativity', 'Bui Minh Son', '144.500', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/31090/sach-duong-vao-nghe-thuat-nhiep-anh-ky-nang-va-sang-tao.jpg', 'admin')"; 
                  String sql47 = "INSERT INTO BOOK_DTLS VALUES('47', 'Piano for children - collection of 220 famous skits - part 4 ', 'Le Dung', '72.250', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/21942/piano-cho-thieu-nhi-tuyen-tap-220-tieu-pham-noi-tieng-phan-4-kem-cd-rom.jpg', 'admin')"; 
                  String sql48 = "INSERT INTO BOOK_DTLS VALUES('48', 'Piano for children - collection of 220 famous skits - part 3 ', '', '72.250', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/21940/piano-cho-thieu-nhi-tuyen-tap-220-tieu-pham-noi-tieng-phan-3-kem-cd-rom.jpg', 'admin')"; 
                  String sql49 = "INSERT INTO BOOK_DTLS VALUES('49', 'Piano for children - collection of 220 famous skits - part 2', 'Le Dung', '72.250', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/21932/b_L.jpg', 'admin')"; 
                  String sql50 = "INSERT INTO BOOK_DTLS VALUES('50', 'Organ mattress practice - homeland love', 'Le Dung', '72.250', 'Book of art - architecture', 'Active', 'https://newshop.vn/public/uploads/products/11662/thuc-hanh-dem-organ-bia.gif', 'admin')"; 
                  
                  
                  String sql51 = "INSERT INTO BOOK_DTLS VALUES('51', 'Leaning hospital (streamlined thinking - key for hospital administration) ', 'Mark Graban', '499.000', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/52380/sach-benh-vien-tinh-gon-tu-duy-tinh-gon-chia-khoa-cho-quan-tri-benh-vien.jpg', 'admin')"; 
                  String sql52 = "INSERT INTO BOOK_DTLS VALUES('52', 'Medicine of enlightenment', 'Trinh Chung Linh', '228.000', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/52219/sach-y-hoc-tam-ngo.jpg', 'admin')"; 
                  String sql53 = "INSERT INTO BOOK_DTLS VALUES('53', 'Intermittent fasting - intermittent fasting ', 'Gin Stephens', '101.200', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/26731/nhin-an-gian-doan.jpg', 'admin')"; 
                  String sql54 = "INSERT INTO BOOK_DTLS VALUES('54', 'Juice - juice every day for a fresh life', 'Stephanie Leach', '148.720', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/51678/sach-juice-nuoc-ep-moi-ngay-cho-cuoc-song-tuoi-tre.jpg', 'admin')"; 
                  String sql55 = "INSERT INTO BOOK_DTLS VALUES('55', 'Juice - green juice for golden health ', 'ROCKRIDGE PRESS', '139.920', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/51673/sach-juice-nuoc-ep-xanh-cho-suc-khoe-vang.jpg', 'admin')"; 
                  String sql56 = "INSERT INTO BOOK_DTLS VALUES('56', 'Medical eastern and medical ', 'Nguyen Thien Quyen', '252.000', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/51494/sach-dong-y-noi-khoa-va-benh-an.jpg', 'admin')"; 
                  String sql57 = "INSERT INTO BOOK_DTLS VALUES('57', 'Nutrition medicine - what the doctor does not tell you', 'Ray D. Stand', '166.320', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/23674/y-hoc-dinh-duong-nhung-dieu-bac-si-khong-noi-voi-ban-bia.jpg', 'admin')"; 
                  String sql58 = "INSERT INTO BOOK_DTLS VALUES('58', 'Combo minh triet in eastern eat + the secret of the japanese longevity (set of 2 books) ', 'Shigeaki Hinokara', '228.800', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/46654/sach-combo-minh-triet-trong-an-uong-cua-phuong-dong-bi-quyet-truong-tho-cua-nguoi-nhat-bo-2-cuon.jpg', 'admin')"; 
                  String sql59 = "INSERT INTO BOOK_DTLS VALUES('59', 'Sincerely body - key away from cancer', 'Takashi Funato', '108.800', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/50186/sach-tran-trong-co-the-chia-khoa-tranh-xa-ung-thu.jpg', 'admin')"; 
                  String sql60 = "INSERT INTO BOOK_DTLS VALUES('60', 'Combo books more than medicine ', 'Katie Brindle', '396.950', 'Medicine & sport books', 'Active', 'https://newshop.vn/public/uploads/products/43051/sach-combo-sach-tam-hon-thuoc-minh-chung-khoa-hoc-ve-su-tu-chua-lanh-hello-habits-mot-chi-dan-song-tot-hon-yang-sheng-duong-lanh-co-the-lam-dep-tam-hon-bo-3-cuon.jpg', 'admin')"; 
                  
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
                  rowsInserted = statement.executeUpdate(sql22);
                  rowsInserted = statement.executeUpdate(sql23);
                  rowsInserted = statement.executeUpdate(sql24);
                  rowsInserted = statement.executeUpdate(sql25);
                  rowsInserted = statement.executeUpdate(sql26);
                  rowsInserted = statement.executeUpdate(sql27);
                  rowsInserted = statement.executeUpdate(sql28);
                  rowsInserted = statement.executeUpdate(sql29);
                  rowsInserted = statement.executeUpdate(sql30); 
                  
                  rowsInserted = statement.executeUpdate(sql31);
                  rowsInserted = statement.executeUpdate(sql32);
                  rowsInserted = statement.executeUpdate(sql33);
                  rowsInserted = statement.executeUpdate(sql34);
                  rowsInserted = statement.executeUpdate(sql35);
                  rowsInserted = statement.executeUpdate(sql36);
                  rowsInserted = statement.executeUpdate(sql37);
                  rowsInserted = statement.executeUpdate(sql38);
                  rowsInserted = statement.executeUpdate(sql39);
                  rowsInserted = statement.executeUpdate(sql40); 
                  
                  rowsInserted = statement.executeUpdate(sql41);
                  rowsInserted = statement.executeUpdate(sql42);
                  rowsInserted = statement.executeUpdate(sql43);
                  rowsInserted = statement.executeUpdate(sql44);
                  rowsInserted = statement.executeUpdate(sql45);
                  rowsInserted = statement.executeUpdate(sql46);
                  rowsInserted = statement.executeUpdate(sql47);
                  rowsInserted = statement.executeUpdate(sql48);
                  rowsInserted = statement.executeUpdate(sql49);
                  rowsInserted = statement.executeUpdate(sql50); 
                  
                  rowsInserted = statement.executeUpdate(sql51);
                  rowsInserted = statement.executeUpdate(sql52);
                  rowsInserted = statement.executeUpdate(sql53);
                  rowsInserted = statement.executeUpdate(sql54);
                  rowsInserted = statement.executeUpdate(sql55);
                  rowsInserted = statement.executeUpdate(sql56);
                  rowsInserted = statement.executeUpdate(sql57);
                  rowsInserted = statement.executeUpdate(sql58);
                  rowsInserted = statement.executeUpdate(sql59);
                  rowsInserted = statement.executeUpdate(sql60); 
//                  String text = "";
//                  for (int i = 3; i < 60; i++) {
//					  text = "sql" + i;
//					  rowsInserted = statement.executeUpdate(text);
//				  }
                 
			} 
			 
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}  
	  
	  
//	public static void main(String[] args) {
//		DBConnect db = new DBConnect();
//		System.out.println(db.getConn());
//		
//	}
}
