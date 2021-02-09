package a02_object;

/*
 # static
 1. 어떤 기능일까요? 어떤 기능이 객체지향 프로그램에서 필요로 할까요?
 	ex) 하나의 클래스에 의해 만들어진 객체의 갯수를 카운팅하는 변수를 설정할 수 없을까?
 	ex) 하나의 클래스에 의해 만들어진 객체가 공유하는 변수를 사용할 수 없을까?
 		- 객체의 갯수, 공유할 수 있는 색상들, ...
 2. 이러한 필요성 때문에 생성된 것이 static 변수이다.
 3. static 변수는 객체의 소속도 되지만, 궁극적으로는 클래스 단위로 변수를 객체 간에 공유할 수 있게 한다.
 4. 개념정리
 	1) 자바의 객체는 클래스에서 생성되는 것이다.
 	2) 객체의 필드는 클래스에서 각각의 객체마다 다르게 사용할 수 있다.
 	3) 객체의 원본은 class단위로 변수를 설정할 필요가 생기면 static 키워드를 이용해서 선언할 수 있다.
 	4) 클래스 단위로 생성된 모든 객체가 동일한 데이트를 가질 수 있기 때문에, 객체 생성에 종속되지 않아서 "클래스변수"라고 하기도 한다.
 	   static 변수는 객체 생성 없이 "클래스명.static변수" 형식으로 주로 사용된다.
 */
class Puppy {
	String name;
	static int cnt; // 객체 공유 메모리
	int eatAppleCnt;

	Puppy(String name) {
		this.name = name;
		cnt++; // 객체가 생성될 때마다 cnt 증가 => class단위,,
		eatAppleCnt++; // 객체가 생성될 때 마다 eatAppleCnt가 증가 => 객체단위,,
	}
}

// # ex) 은행에서 만든 계좌.
// 1. 필드: 계좌명(이름), 입금액, 전 계좌의 총 금액(static변수)
// 2. 생성자: 매개변수 - 계좌명, 초기입금액
// main()에서 계좌별로 객체를 생성하고, 계좌별 입금액과 전계좌 입금액을 출력하세요.
class Account {
	String name;
	int inputMoney;
	static int totalMoney;

	Account(String name, int inputMoney) {
		this.name = name;
		this.inputMoney = inputMoney;
		totalMoney += inputMoney;
	}
}

public class A07_Static {
	public static void main(String[] args) {
		// static 변수는 객체의 종속이 아니기 때문에 객체 생성 없이 "클래스명.static변수"로 사용 가능하다.
		Puppy.cnt++;
		Puppy.cnt++;
		Puppy.cnt++;

		// heap 영역이 다르고, 클래스는 같지만 다른 멤버(클래스의 구성요소)를 가진 객체들이 생성된다.
		Puppy p1 = new Puppy("뽀삐");
		System.out.println("클래스 공유 메모리 cnt: " + p1.cnt);
		System.out.println("객체 메모리 eatAppleCnt: " + p1.eatAppleCnt);
		Puppy p2 = new Puppy("멈무");
		System.out.println("클래스 공유 메모리 cnt: " + p2.cnt);
		System.out.println("객체 메모리 eatAppleCnt: " + p2.eatAppleCnt);
		System.out.println(p1 + ":" + p1.name);
		System.out.println(p2 + ":" + p2.name);
		System.out.println();

		// ex)
		System.out.println("# Account #");
		Account a1 = new Account("생활비통장", 500000);
		Account a2 = new Account("비상금통장", 100000);
		Account a3 = new Account("적금통장", 200000);
		System.out.println(a1.name + "잔액: " + a1.inputMoney + "원");
		System.out.println(a2.name + "잔액: " + a1.inputMoney + "원");
		System.out.println(a3.name + "잔액: " + a3.inputMoney + "원");
		System.out.println("--------------------");
		System.out.println("전 계좌 잔액: " + Account.totalMoney + "원");
	}
}
