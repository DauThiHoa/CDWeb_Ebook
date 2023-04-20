package com.example.ebook.dao;

import java.util.List;

import com.example.ebook.entity.BookDtls;
 

public interface BookDAO {

//	PHUONG THUC THEM SACH VAO CSDL
	public boolean addBooks(BookDtls b);

//	PHUONG THUC LAY DANH SACH CAC SAN PHAM CO TRONG CSDL
	public List<BookDtls> getAllBooks();

//	LAY SACH THEO MA ID 
	public BookDtls getBookById(int id);

//	CHINH SUA NOI DUNG SACH
	public boolean updateEditBooks(BookDtls b);

//	XOA QUYEN SACH THEO MA
	public boolean deleteBooks(int id);

//	LAY DANH SACH CAC SACH MOI => GIOI HAN 4 QUYEN SACH
	public List<BookDtls> getNewBook();

//	LAY DANH SACH CAC SACH GAN DAY => GIOI HAN 4 QUYEN SACH
	public List<BookDtls> getRecentBooks();

//	LAY DANH SACH CAC SACH CU => GIOI HAN 4 QUYEN SACH
	public List<BookDtls> getOldBooks();

//	LAY DANH SACH TAT CA CAC LOAI SACH GAN DAY
	public List<BookDtls> getAllRecentBook();

//	LAY DANH SACH TAT CA CAC LOAI SACH MOI
	public List<BookDtls> getAllNewBook();

//	LAY DANH SACH TAT CA CAC LOAI SACH CU
	public List<BookDtls> getAllOldBook();

//	LAY DANH SACH CAC SACH CU VOI EMAIL NGUOI DUNG 
	public List<BookDtls> getBookByOld(String email, String cate);

//	XOA QUYEN SACH CU VOI EMAIL NGUOI DUNG 
	public boolean oldBookDelete(String email, String cate, int id);

//  TIM KIEM SAN PHAM THEO TEN 
	public List<BookDtls> getBookBySearch (String ch); 
	
//	PRODUCT LIST getAllBooksDescPrice - getAllBooksAscPrice - getAllBooksDescName - getAllBooksAscName
//	SAP XEP DANH SACH THEO GIA GIAM DAN 
	public List<BookDtls> getAllBooksDescPrice ();
//	SAP XEP DANH SACH THEO GIA TANG DAN 
	public List<BookDtls> getAllBooksAscPrice ();
//	SAP XEP DANH SACH THEO TEN GIAM DAN 
	public List<BookDtls> getAllBooksDescName ();
//	SAP XEP DANH SACH THEO TEN TANG DAN 
	public List<BookDtls> getAllBooksAscName ();


// TAO DANH SACH PHAN TRANG //Pages number 1->4 or 5->8 ..
	public List<BookDtls> getAllBooksAscName(int first, int last);
	public List<BookDtls> getAllBooksDescName(int first, int last);
	public List<BookDtls> getAllBooksAscPrice(int first, int last);
	public List<BookDtls> getAllBooksDescPrice(int first, int last);
	
//Total product number
	public int getCount() ;
	
	// LOC SACH THEO THE LOAI   //Pages number 1->4 or 5->8 ..
	public List<BookDtls> getAllBooksfilterCate(String category ,int first, int last);
}
