package a02_object.a03_method;

import java.util.Scanner;

public class A04_MartMain {
	public static void main(String[] args) {
		Mart m = new Mart();
		m.showProduct();
		System.out.println();

		System.out.print("장바구니에 담을 물품의 번호를 입력하세요.> ");
		Scanner scan = new Scanner(System.in);
		int ch = scan.nextInt();
		System.out.println(m.buy(ch));
	}
}