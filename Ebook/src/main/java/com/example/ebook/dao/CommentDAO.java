package com.example.ebook.dao;

import java.util.List;

import com.example.ebook.entity.CommentProduct;
 

public interface CommentDAO {

	// ADD COMMENT PRODUCT DETAILS
	public boolean addCommentProduct (CommentProduct c); 
	// LIST COMMENT PRODUCT DETAILS
	public List<CommentProduct> listCommentProduct (int bid);
	 
}
