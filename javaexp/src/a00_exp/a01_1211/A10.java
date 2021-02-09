package a00_exp.a01_1211;

import java.util.Scanner;

/*
 10. # 어서오세요 행복 반점 입니다 #
 		# 메뉴
 		1. 짜장면(5000원)
 		2. 짬뽕(6000원)
 		3. 탕수육(12000원)
 		# 주문번호를 입력하세요(1~3): @@
 		# 주문할 수량을 입력하세요(1~): @@
 		@@@를 @@개 주문했습니다.
 		계속 주문하시겠습니까?(Y/N): @@
 		---------------------------
 		총 비용은 @@@원 입니다.
 */
class Restaurant {
	int price;
	static int cnt;

	void showMenu() {
		System.out.println("# 메뉴");
		System.out.println("1. 짜장면(5000원)");
		System.out.println("2. 짬뽕(6000원)");
		System.out.println("3. 탕수육(12000원)");
		System.out.println();
	}

	void choice(int ch) {
		if (ch == 1) {
			System.out.println("짜장면");
		}
		if (ch == 2) {
			System.out.println("짬뽕");
		}
		if (ch == 3) {
			System.out.println("탕수육");
		}
	}

	int price(int ch) {
		int pt = 0;
		if (ch == 1) {
			pt = 5000;
		}
		if (ch == 2) {
			pt = 6000;
		}
		if (ch == 3) {
			pt = 12000;
		}
		return pt;
	}
}

public class A10 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Restaurant r1 = new Restaurant();
		r1.showMenu();
		int b;
		int tot = 0;

		outer: while (true) {
			System.out.print("# 주문할 번호를 입력하세요.(1~3).> ");
			int a = scan.nextInt();
			System.out.print("# 주문할 수량을 입력하세요.(1~).> ");
			b = scan.nextInt();
			r1.choice(a);
			System.out.println("을 " + b + "개 주문했습니다.");
			r1.price = r1.price(a) * b;
			tot += r1.price;
			System.out.print("계속 주문하시겠습니까?(Y/N).> ");
			for (;;) {
				String c = scan.nextLine();
				if (c.equals("Y") || c.equals("y")) {
					break;
				}
				if (c.equals("N") || c.equals("n")) {
					System.out.println("총 비용은 " + tot + "원 입니다.");
					break outer;
				}
			}
		}

	}
}
