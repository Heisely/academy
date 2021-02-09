package a02_object.a04_methodExp;

/*
Member
	필드: id, pw, name, point
	생성자: 필드값 할당
	기능메서드 1: 회원정보변경 ==> 매개변수 3(id, pw, name) 변경된 내용 출력
	기능메서드 2: 패스워드변경 ==> 매개변수 1, 변경된 패스워드내용 출력
	기능메서드 3: 포인트 추가(매개변수 만큼 포인트 추가)
		추가된 포인트: @@@
		현재 포인트: @@@
	기능메서드 4: 구매처리 (구매할 물건, 차감할 point 매개변수)
		@@@를 @@pt에 구매하여 현재 포인트 @@
		return 차감 후 포인트
*/
import java.util.Scanner;

class Member {
	String id;
	String pw;
	String name;
	int point;

	Member(String id, String pw, String name, int point) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.point = point;
	}

	void changeInfo(String id, String pw, String name) {
		System.out.println("변경 전 회원정보: ID=" + this.id + ", PW=" + this.pw + ", 이름=" + this.name);
		this.id = id;
		this.pw = pw;
		this.name = name;
		System.out.println("변경 된 회원정보: ID=" + id + ", PW=" + pw + ", 이름=" + name);
	}

	void changePw(String pw) {
		System.out.println("변경 전 패스워드: " + this.pw);
		this.pw = pw;
		System.out.println("변경 된 패스워드: " + pw);
	}

	void plusPoint(int point) {
		System.out.println("적립 전 포인트: " + this.point);
		this.point += point;
		System.out.println("추가 된 포인트: " + point);
		System.out.println("적립 후 포인트: " + this.point);
	}

	void showProduct() {
		System.out.println("# 판매하는 물건(포인트) #");
		System.out.println("1. 아메리카노(3000pt)");
		System.out.println("2. 카페라떼(3500pt)");
		System.out.println("3. 카푸치노(3500pt)");
	}

	String buy(int ch) {
		int pt = 0;
		String retBev = "";
		if (ch == 1) {
			System.out.println("아메리카노 한 잔 나왔습니다.");
			pt = 3000;
			retBev = "아메리카노";
		} else if (ch == 2) {
			System.out.println("카페라떼 한 잔 나왔습니다.");
			pt = 3500;
			retBev = "카페라떼";
		} else if (ch == 3) {
			System.out.println("카푸치노 한 잔 나왔습니다.");
			pt = 3500;
			retBev = "카푸치노";
		} else {
			System.out.println("메뉴 선택은 1~3만 가능합니다.");
		}

		if (pt > 0) {
			point -= pt;
			if (point < 0) {
				System.out.println("포인트가 부족합니다.");
			} else {
				System.out.println(retBev + "를 " + pt + "pt에 구매하여 현재 잔여 포인트는 " + point + "입니다.");
			}
		}
		return ("현재 포인트: " + point);
	}
}

public class A01_MethodExp {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Member m = new Member("hong123", "2345", "홍길동", 2000);
		m.changeInfo("hong567", "6789", "홍길덕");
		System.out.println();
		m.changePw("4567");
		System.out.println();
		m.plusPoint(5200);
		System.out.println();
		m.showProduct();
		System.out.println();
		System.out.print("메뉴를 선택하세요(1~3).> ");
		int ch = scan.nextInt();
		System.out.println(m.buy(ch));
	}
}
