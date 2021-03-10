package springdi.z05_vo;

public class Buyer {
	private String name;
	private Product product;

	public Buyer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Buyer(String name) {
		super();
		this.name = name;
	}

	public void setProd03(Product product) {
		this.product = product;
	}

	public void buy() {
		System.out.println(name + " 구매한 물건은 ");
		if (product != null) {
			product.show();
		} else {
			System.out.println("구매 물건이 없습니다.");
		}
	}
}
