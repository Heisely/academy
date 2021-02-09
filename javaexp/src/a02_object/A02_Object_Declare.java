package a02_object;

/*
 1. 객체(Object)
 	1) 물리적으로 존재하는 것(자동차, 책, 사람 ...)
 	2) 추상적인 것(회사, 날짜 ...) 중에서 속성, 동작을 가지는 것 포함
 	3) 객체의 구성 요소
 		- 메모리: field
 		- 새로 만들어질 때, 기본처리: constructor(생성자)
 		- 동작/기능: method(메서드)
 		
 2. 클래스와 객체
    1) 클래스가 선언된 이후에 main()메서드를 통해서, 객체를 생성하고 해당 객체를 사용할 수 있다.
    2) 선언된 클래스를 객체로 생성.
    	- 클래스명 참조변수명; -- 선언...
    	- 참조변수 = new 생성자명(); -- 객체 생성과 메모리 할당
    	- 참조변수.필드;
    	- 참조변수.메서드명();
 */
// 클래스는 객체를 위한 설계도 역할
class Person {
	// 1. 필드 선언
	String name;
	int age;
	String loc;

	// 2. 생성자선언(필드 초기화)
	Person(String n, int a, String l) {
		// this: 현재 객체가 생성되었을 때, 해당 객체를 지칭
		// this.name: 현재 객체가 가지고 있는 필드의 name을 지칭
		this.name = n;
		this.age = a;
		this.loc = l;
	}

	// 3. 기능 메서드 선언
	void showInfo() {
		System.out.println("# Person 객체가 가지는 정보 출력 메서드 #");
		System.out.println("이름: " + name);
		System.out.println("나이: " + age);
		System.out.println("사는 곳: " + loc);
	}
}

class Product {
	String name;
	int price;
	int cnt;

	Product(String n, int p, int c) {
		this.name = n;
		this.price = p;
		this.cnt = c;
	}

	void buy() {
		System.out.println("# Product 객체가 가지는 정보 출력 메서드 #");
		System.out.println("물품 이름: " + name);
		System.out.println("물품 가격: " + price);
		System.out.println("물품 개수: " + cnt);
	}
}

public class A02_Object_Declare {
	public static void main(String[] args) {
		Person p1 = null;
		p1 = new Person("홍길동", 25, "서울 신림동");
		System.out.println("필드 확인 이름: " + p1.name);
		// 메서드 확인
		p1.showInfo();
		System.out.println();

		// ex1) class Product를 선언하고, 필드로 물건명/가격/개수 선언, 생성자를 통해서 할당.
		// buy()메서드를 통해서 구매정보를 출력처리하여, main()에서 호출처리하세요

		Product p2 = new Product("갈배사이다", 2000, 500);
		System.out.println("물품 이름 확인: " + p2.name);
		p2.buy();
	}
}
