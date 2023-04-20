package com.example.ebook.dao;

import java.util.List;

import com.example.ebook.entity.Favourite; 

public interface FavouriteDAO {

//  DANH SACH CAC SAN PHAM DUOC YEU THICH THEO MA NGUOI DUNG
	public List<Favourite> getBookByFavourite ( int uid);
	
//	PHUONG THUC THEM SAN PHAM DUOC YEU THICH VAO CSDL
	public boolean addFavourite(Favourite f);
	
//  KIEM TRA XEM SAN PHAM DA CO TRONG DANH MUC YEU THICH HAY CHUA
	public boolean checkFavourite (int bid, int uid );
	
//	XOA SAN PHAM YEU THICH THEO MA
	public boolean deleteFavourite(int bid, int uid);
}
