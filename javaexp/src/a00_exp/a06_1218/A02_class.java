package a00_exp.a06_1218;

import java.util.ArrayList;
import java.util.Scanner;

class SellingMachine {
	private String title;
	private int tot; // 총금액
	private ArrayList<Menu> mlist;

	// 생성자를 통해 자판기 타이틀 할당
	// 어떤 타이틀이고, 어떤 메뉴가 있는지 초기 생성시 설정하는것이 비즈니스로직(업무 처리)상 합당하다.
	public SellingMachine(String title, ArrayList<Menu> mlist) {
		super();
		this.title = title;
		this.mlist = mlist;
	}

	// 금액 투입
	public void inputMoney(int addMoney) {
		this.tot += addMoney;
		System.out.print("금액 투입: " + addMoney + "원, ");
		displayMoney();
	}

	// 현재 금액 표기(공통)
	public void displayMoney() {
		System.out.println("현재 금액: " + tot + "원");
	}

	// 메뉴리스트 보이기(번호)
	public void menuList() {
		System.out.println("## " + title + "메뉴리스트 ##");
		System.out.println("번호\t메뉴\t가격");
		for (int i = 0; i < mlist.size(); i++) {
			System.out.print(i + 1 + "\t"); // index번호와 선택번호 차이 = 1
			mlist.get(i).show();
		}
	}

	// 기능 메서드(Scanner 활용하기)
	public int choiceNum() {
		Scanner sc = new Scanner(System.in);
		// 예외처리 - 번호가 선택되지 않았거나 입력이 잘못 되었을 때 예외처리
		int chNum = 0;
		int maxNum = mlist.size();
		// 번호가 정상 입력될 때까지 반복 수행
		while (true) {
			try {
				System.out.print("번호를 선택하세요.(1~" + maxNum + "): ");
				chNum = sc.nextInt();
				if (chNum < 1 || chNum > maxNum) {
					throw new Exception("입력범위는 1~" + maxNum + "입니다.");
				}
			} catch (Exception e) { // 강제예외 뿐만 아니라 일반 예외도 처리
				System.out.println("예외발생:" + e.getMessage());
				System.out.println("다시 입력해주세요.");
			} finally {
				// System.out.println("에러 상관없이 진행할 내용..");
			}
			if (chNum >= 0 && chNum <= maxNum) { // 반복 처리 만료(정상범위 입력)
				break;
			}
		}
		return chNum;
	}

	// 선택 물품을 선택
	public String choiceMenu(int chNum) {
		String chProd = "";
		// 메뉴 리스트 보이기

		// 번호 선택하기

		// 선택한 번호에 따라서 잔액 여부에 대한 처리
		Menu chMenu = mlist.get(chNum - 1); // 선택한 번호와 list index 차이 = 1

		// 총 금액에서 차감하고 최종 물건 리턴
		if (chMenu.getPrice() <= tot) { // 현재 입력된 금액이 가격보다 많아야 정상 처리
			chProd = chMenu.getName();
			tot -= chMenu.getPrice(); // 정상 처리 시 차감
		} else {
			System.out.println("잔액이 부족합니다.");
		}
		return chProd;
	}

	// 남은 잔액 리턴
	public int restMoney() {
		System.out.println("잔액: " + tot + "원 반환합니다.");
		return tot;
	}
}

class Menu {
	private String name;
	private int price;

	public Menu(String name, int price) {
		super();
		this.name = name;
		this.price = price;
	}

	public void show() {
		System.out.println(name + "\t" + price + "원");
	}

	public int getPrice() {
		return price;
	}

	public String getName() {
		return name;
	}

}

public class A02_class {
	public static void main(String[] args) {
		ArrayList<Menu> mlist = new ArrayList<Menu>();
		mlist.add(new Menu("콜라", 1200));
		mlist.add(new Menu("사이다", 1000));
		mlist.add(new Menu("캔커피", 800));
		SellingMachine sm = new SellingMachine("음료자판기", mlist);
		sm.menuList();
		sm.inputMoney(1000);

		// scanner를 통해서 번호 선택
		int chNum = sm.choiceNum();
		System.out.println("선택한 번호: " + chNum);
		String result = sm.choiceMenu(chNum);
		System.out.println("나온 음료: " + result);
		sm.inputMoney(1000);
		result = sm.choiceMenu(chNum);
		int rest = sm.restMoney();
		System.out.println("반환된 잔액: " + rest + "원");
	}
}
