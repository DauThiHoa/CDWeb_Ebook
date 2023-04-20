package com.example.ebook.entity;

public class Favourite {

	private int id ;
	private int uid ;
	private int bid ;
	private String bookName;
	private String author;
	private Double price;
	private String bookCategory;
	private String status;
	private String photoName;
	 
	
	public Favourite() {
		super();
	}
	public Favourite(int id, int uid, int bid, String bookName, String author, Double price, String bookCategory,
			String status, String photoName) {
		super();
		this.id = id;
		this.uid = uid;
		this.bid = bid;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photoName = photoName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
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
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	@Override
	public String toString() {
		return "Favourite [id=" + id + ", uid=" + uid + ", bid=" + bid + ", bookName=" + bookName + ", author=" + author
				+ ", price=" + price + ", bookCategory=" + bookCategory + ", status=" + status + ", photoName="
				+ photoName + "]";
	} 
	
	
	
}
