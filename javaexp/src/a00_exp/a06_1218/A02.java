package a00_exp.a06_1218;

import java.util.Scanner;

/*
 2. 완성도 있는 자판기 프로그램을 구현하세요.
 	1) 객체를 이용해서
 		생성자: 자판기명(음료/점심식사..)
 		메서드1: 금액 투입(총금액누적처리)
 		메서드2: 메뉴보이기
 		메서드3: 메뉴선택 - 투입한 금액과 함께 물건 리턴
 		메서드4: 잔액 리턴처리
 	2) 기본 자판기 예제를 활용하여 완성도 있게 만들어 보세요
 */

class RamyeonMachine {
	int totalMoney;

	void inputMoney(int money) {
		totalMoney += money;
		displayMoney();
	}

	void displayMoney() {
		System.out.println("현재 투입 금액: " + totalMoney);
	}

	void showMenu() {
		System.out.println("# 판매하는 라면 종류 #");
		System.out.println("1. 진라면 - 1500원");
		System.out.println("2. 오동통면 - 1700원");
		System.out.println("3. 짜장라면 - 1300원");
	}

	String choice(int ch) {
		String ret = "";
		if (ch == 1) {
			ret = "진라면";
		} else if (ch == 2) {
			ret = "오동통면";
		} else if (ch == 3) {
			ret = "짜장라면";
		}
		return ret;
	}

	int price(int ch) {
		int price = 0;
		if (ch == 1) {
			price = 1500;
		} else if (ch == 2) {
			price = 1700;
		} else if (ch == 3) {
			price = 1300;
		}
		return price;
	}
}

public class A02 {
	public static void main(String[] args) {
		RamyeonMachine rm = new RamyeonMachine();
		Scanner scan = new Scanner(System.in);
		rm.showMenu();

		outer: while (true) {
			System.out.print("금액을 투입하세요.> ");
			int im = scan.nextInt();
			rm.inputMoney(im);
			while (true) {
				System.out.println("원하는 메뉴의 번호를 입력하세요.> ");
				int ch = scan.nextInt();
				if (ch < 1 || ch > 3) {
					System.out.println("잘못 선택했습니다. 다시 선택해주세요.");
				} else {
					System.out.println(rm.choice(ch) + "을 선택했습니다.");
					if (rm.totalMoney >= rm.price(ch)) {
						rm.totalMoney -= rm.price(ch);
						System.out.println("구매가 완료되었습니다.");
						System.out.println("구매하신 " + rm.choice(ch) + "의 조리가 끝났습니다. 맛있게 드세요!");
						System.out.println("잔액: " + rm.totalMoney + "원");
						break outer;
					} else {
						System.out.println("잔액이 부족합니다.");
						System.out.println(rm.choice(ch) + "의 가격은 " + rm.price(ch) + "원 입니다. 금액을 더 넣어주세요.");
						break;
					}
				}
			}
		}
	}
}
