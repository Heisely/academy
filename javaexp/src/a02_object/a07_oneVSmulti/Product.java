package a02_object.a07_oneVSmulti;

public class Product {
	// 1. field명은 일반적으로 접근제어자가 private로 설정된다.
	private String name;
	private int price;
	private int cnt;

	// 2. 생성자는 외부에서 사용하기 때문에 public으로 사용된다.
	public Product(String name, int price, int cnt) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}

	// 3. 각각의 field에 데이터를 입력하는 메서드는 setXXX,
	///// 각각의 field의 데이터를 가져오는 메서드는 getXXX 로 설정된다.
	// 간접적으로 필드에 있는 데이터를 저장하고, 호출하는 메서드를 구현하고, 각 메서드의 접근제어자가 public이므로 외부패키지에서도 접근 및 처리 가능
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
