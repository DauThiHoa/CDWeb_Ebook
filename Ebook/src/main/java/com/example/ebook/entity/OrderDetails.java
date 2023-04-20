package com.example.ebook.entity;

public class OrderDetails {

	private int id ;
	private String order_id ;
	private int cid ;
	private int bid ;
	private int uid ;
	private String bookName ;
	private String image ;
	private String author ;
	private int quantity ;
	private Double price ;
	private Double total_price ;
	
	
	public OrderDetails() {
		super();
	}
	
	public OrderDetails(int id, String order_id, int cid, int bid, int uid, String bookName, String image,
			String author, int quantity, Double price, Double total_price) {
		super();
		this.id = id;
		this.order_id = order_id;
		this.cid = cid;
		this.bid = bid;
		this.uid = uid;
		this.bookName = bookName;
		this.image = image;
		this.author = author;
		this.quantity = quantity;
		this.price = price;
		this.total_price = total_price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
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
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}
	@Override
	public String toString() {
		return "OrderDetails [id=" + id + ", order_id=" + order_id + ", cid=" + cid + ", bid=" + bid + ", uid=" + uid
				+ ", bookName=" + bookName + ", image=" + image + ", author=" + author + ", quantity=" + quantity
				+ ", price=" + price + ", total_price=" + total_price + "]";
	}
	 
}
