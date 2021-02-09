package a02_object;
/*
 # 접근제어자와 클래스, 생성자, 필드 간의 관계는 접근제어자 편에서 진행
 
 # 생성자
 1. 클래스와 동일한 객체의 기능구성요소이다.
 2. 기능: 객체를 생성하고, 필드 데이터를 초기화하는 역할을 한다.
 3. 메서드와의 차이는 return값이 없고, 하나의 객체에는 하나의 생성자만 사용할 수 있다.
 */

class Person01 {
	// 1. 선언하지 않으면, 내부적으로 보이지는 않지만, default생성자가 만들어져 있다.
	// public Person01(){}
	// 2. 하나라도 명시적으로 선언하는 순간, 보이지 않는 default 생성자는 사라진다.
	// 확인.. main()

	public Person01(String name) {
		System.out.println("매개변수가 있는 생성자 선언.");
	}

	// 3. overloading: 같은 이름으로 생성자나 메서드를 선언할 수 있는 규칙을 말한다.
	int age;

	// int age; // 변수는 동일한 이름을 선언할 수 없다.
	// 같은 이름 생성자와 메서드를 선언할 수 있는 이유는 이름만으로 식별하지 않기 때문이다.
	// 이름+생성자/메서드 매개변수의 type, 개수, type이 다른 순서로 식별한다.
	public Person01(int age) {
		System.out.println("매개변수가 있는 생성자 선언(정수매개)");
	}

	public Person01() {
		System.out.println("매개변수가 없는 생성자");
	}

	public Person01(String name, int age) {
		System.out.println(name + ":" + age);
	}
}

public class A03_Constructor {
	public static void main(String[] args) {
		// Person01 p1 = new Person01(); // 에러 없이 호출됨 -> 매개변수가 있는 생성자가 선언되는 순간 에러발생
		Person01 p1 = new Person01("문자열 호출"); // 매개변수가 있는 생성자를 선언하고 사용시 에러 발생X
		System.out.println(p1);

		Person01 p2 = new Person01(); // p2 참조변수는 매개변수가 없는 생성자를 선택해서 객체 생성
	}
}
