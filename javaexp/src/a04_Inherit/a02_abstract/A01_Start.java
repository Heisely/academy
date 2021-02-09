package a04_Inherit.a02_abstract;

/*
 # 추상클래스
 1. 추상
 	실체들 간의 공통되는 특징을 추출해서 그 특징에 맞는 실체를 만들기 위해 선언한다.
 	1) 새, 곤충, 물고기 ==> 동물(추상)
 	2) 삼성, 현대, LG ==> 회사(추상)
 2. 추상클래스
 	1) 실제 클래스의 공통 속성을 추출하여 필드와 메서드로 정의하여 사용하는 클래스
 	2) 목적이 실제 클래스를 공통적인 필드와 메서드를 사용하기 위한 것이기 때문에 단독 객체로 사용하지 않는다.
 3 추상클래스 사용목적
 	하위 실제 클래스의 공통되는 필드와 메서드를 정의하기 위해 사용
 	특히, 추상 클래스 안의 추상메서드는 상속받는 하위 클래스에서 반드시 정의하여야 하기 때문에, 메서드의 통일성을 유지할 수 있다.
 4. 기본 형식
   abstract class 추상 클래스 명 {
   		//반드시 한 개 이상의 추상 메서드가 선언되어야 한다.
      	-> 추상 메서드는 body{}가 없다
		abstract void call();
		public void show1(){} -> 공통되는 메서드 포함
		public void show2(){}
   }
 */
/*
 ex) 추상클래스 Phone
 		- 필드: 전화번호
 		- 추상메서드: specialFunc()
 		- 일반메서드: turnOn(), turnOff() 전원을 켜다/끄다
 	 상속클래스 SmartPhone
 	 	- 추상메서드 overriding 처리: 인터넷 검색
 	 상속클래스 CompanyPhone
 	 	- 추상메서드 overriding 처리: 다른 직원에게 전화를 걸다.
 */

abstract class Animal {
	public void move() {// 일반 공통 메서드
		System.out.println("이동을 한다.");
	}

	public abstract void sound(); // body({}) 없는 추상 메서드 선언
}

class Dog extends Animal {
	// 추상 클래스를 상속받은 하위 클래스에서는 추상메서드를 반드시 상속 받아야 한다.
	@Override
	public void sound() {
		System.out.println("멍멍");
	}
}

class Cat extends Animal {
	// 추상 클래스를 상속받은 하위 클래스에서는 추상메서드를 반드시 상속 받아야 한다.
	@Override
	public void sound() {
		System.out.println("야옹");
	}
}

abstract class Phone {
	String number;

	public Phone(String number) {
		super();
		this.number = number;
	}

	public void turnOn() {
		System.out.println(number+"번호 폰의 전원을 킵니다.");
	}

	public void turnOff() {
		System.out.println(number+"번호 폰의 전원을 끕니다.");
	}

	public abstract void specialFunc();
}

class SmartPhone extends Phone {

	public SmartPhone(String number) {
		super(number);
	}

	@Override
	public void specialFunc() {
		System.out.println("SmartPhone으로 인터넷 검색을 하다.");
	}

}

class CompanyPhone extends Phone {

	public CompanyPhone(String number) {
		super(number);
	}

	@Override
	public void specialFunc() {
		System.out.println("CompanyPhone으로 동료에게 전화를 걸다.");
	}

}

public class A01_Start {
	public static void main(String[] args) {
		// 1. 추상 클래스는 단독으로 생성하지 못한다.
		// Animal an = new Animal();(X)
		// 2. 주로 다형성 형태로 사용된다.
		Animal an1 = new Dog();
		Animal an2 = new Cat();
		an1.move();
		an1.sound();
		an2.sound();
		System.out.println();

		Phone ph1 = new SmartPhone("010-1234-5678");
		Phone ph2 = new CompanyPhone("010-3456-7890");
		ph1.turnOn();
		ph1.specialFunc();
		ph1.turnOff();
		System.out.println();
		ph2.turnOn();
		ph2.specialFunc();
		ph2.turnOff();

	}
}
