package com.example.ebook.entity;

public class Contact {

	private int idContact;
	private String name;
	private String email;
	private int number;
	private String subject;
	private String message;
	
	
	public Contact() {
		super();
	}
	public Contact(int idContact, String name, String email, int number, String subject, String message) {
		super();
		this.idContact = idContact;
		this.name = name;
		this.email = email;
		this.number = number;
		this.subject = subject;
		this.message = message;
	}
	public int getIdContact() {
		return idContact;
	}
	public void setIdContact(int idContact) {
		this.idContact = idContact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Contact [idContact=" + idContact + ", name=" + name + ", email=" + email + ", number=" + number
				+ ", subject=" + subject + ", message=" + message + "]";
	}  
	
	
}
