package jspexp.z01_vo;

public class Book {
	private String name;
	private int price;
	private String writer;
	public Book(String name, int price, String writer) {
		super();
		this.name = name;
		this.price = price;
		this.writer = writer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
}
