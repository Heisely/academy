package a02_object.a03_method;

/*
 ex) Mart 클래스
 메서드 1: showProduct() 마트에서 판매하는 물건
 			1. 컵라면		2. 음료		3. 제과
 메서드 2: buy() 선택한 물건
 			번호로 선택해서 return값으로 선택한 물건이 나오게 처리
 
 */
public class Mart {
	void showProduct() {
		System.out.println("# 판매하는 물건 ");
		System.out.println("1. 컵라면");
		System.out.println("2. 음료");
		System.out.println("3. 제과");
	}

	String buy(int ch) {
		String product = "";
		if (ch == 1) {
			System.out.println("컵라면을 담았습니다.");
			product = "컵라면";
		} else if (ch == 2) {
			System.out.println("음료를 담았습니다.");
			product = "음료";
		} else if (ch == 3) {
			System.out.println("제과를 담았습니다.");
			product = "제과";
		} else {
			System.out.println("없는 물건을 선택했습니다.");
		}
		return product;
	}

}
