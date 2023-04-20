package com.example.ebook.entity;

public class Cart {

	private int cid ;
	private int bid ;
	private int userId ;
	private String bookName ;
	private String image ;
	private String author ;
	private int quantity ;
	private Double price ;
	private Double totalPrice ;


	public Cart(int cid, int bid, int userId, String bookName, String image, String author, int quantity, Double price,
			Double totalPrice) {
		super();
		this.cid = cid;
		this.bid = bid;
		this.userId = userId;
		this.bookName = bookName;
		this.image = image;
		this.author = author;
		this.quantity = quantity;
		this.price = price;
		this.totalPrice = totalPrice;
	}


	public Cart() {
		// TODO Auto-generated constructor stub
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public int getBid() {
		return bid;
	}


	public void setBid(int bid) {
		this.bid = bid;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getBookName() {
		return bookName;
	}


	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public Double getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	@Override
	public String toString() {
		return "Cart [cid=" + cid + ", bid=" + bid + ", userId=" + userId + ", bookName=" + bookName + ", image="
				+ image + ", author=" + author + ", quantity=" + quantity + ", price=" + price + ", totalPrice="
				+ totalPrice + "]";
	}
 
	
}
