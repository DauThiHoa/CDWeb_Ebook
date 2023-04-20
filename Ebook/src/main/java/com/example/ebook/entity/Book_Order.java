package com.example.ebook.entity;

public class Book_Order {

	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phno;
	private String fulladd; 
	private double price; 
	private String paymentType;
	
	
	public Book_Order() {
		super();
	}
	
	public Book_Order(int id, String orderId, String userName, String email, String phno, String fulladd, double price,
			String paymentType) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.userName = userName;
		this.email = email;
		this.phno = phno;
		this.fulladd = fulladd;
		this.price = price;
		this.paymentType = paymentType;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getFulladd() {
		return fulladd;
	}
	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", phno=" + phno + ", fulladd=" + fulladd + ", price=" + price + ", paymentType=" + paymentType + "]";
	}

	 
}
