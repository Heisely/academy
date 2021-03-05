package jspexp.z01_vo;

public class Book {
	private String name;
	private int price;
	private String writer;
	private String publisher;

	public Book(String name, int price, String writer, String publisher) {
		super();
		this.name = name;
		this.price = price;
		this.writer = writer;
		this.publisher = publisher;
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

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

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

}
