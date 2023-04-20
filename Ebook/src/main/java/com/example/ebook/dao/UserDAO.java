package com.example.ebook.dao;

import com.example.ebook.entity.User;

public interface UserDAO {

//	DANG KI TAI KHOAN NGUOI DUNG
	public boolean userRegister (User us);
//	LOGIN 
	public User login (String email, String password);
	
//	KIEM TRA MAT KHAU CO DUNG HAY KHONG?
	public boolean checkPassword (int id , String ps);
//	CAP NHAT THONG TIN NGUOI DUNG
	public boolean updateProfile (User us);
	
//  KIEM TRA XEM EMAIL DANG KI TAI KHOAN DA CO TRONG CSDL HAY CHUA
	public boolean checkUser (String em);
	
//	KIEM TRA XEM MAT KHAU NHAP VAO CO DUNG HAY KHONG
	public boolean checkPasswordEmail (String email, String password);
//	THAY DOI MAT KHAU USER
	public boolean updateChangePass (String email, String password);
	

}
