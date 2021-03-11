package springdi.a02_middle.z01_vo;

import org.springframework.beans.factory.annotation.Autowired;

// springdi.a02_middle.z01_vo.Buyer
public class Buyer {
	private String name;
	@Autowired
	private Product product;

	public Buyer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Buyer(String name) {
		super();
		this.name = name;
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
