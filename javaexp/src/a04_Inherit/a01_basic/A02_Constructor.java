package a04_Inherit.a01_basic;
/*
 # 부모 생성자 호출
 1. 하위 객체는 부모 객체의 생성자와 함께 객체를 생성한다.
 	- default 생성자 활용시, default 생성자 안에 부모 생성자 호출 코드와 함께 처리
 	- 부모 생성자 호출 완료 후, 자식 생성자의 처리가 완료된다.
 2. 상위 클래스에 매개변수가 있는 생성자를 선언하고, 하위클래스에서 상속을 한다면?
 	- 반드시 상위 생성자를 호출해야 한다는 원칙에 의해서
 	  상위에 선언된 매개변수 type에 맞는 생성자를 호출해야 한다.
 	  
 # 메서드 재정의(overriding)이란?
 1. 부모 클래스의 상속 메서드를 자식 클래스에서 재정의하여
 	하위클래스의 동일한 메서드이지만 각 객체별로 특정한 처리를 하게 하는 것을 말한다.
 2. 메서드 재정의 규칙
 	1) 부모 클래스의 메서드명과 동일해야 한다.
 	2) 접근 제어자는 부모보다 더 넓어야 한다.
 		ex) default ==> default 이상인 default, protected, public 
 			public ==> default(X)
 */

class Mother01 {
	// 1. 선언하지 않을 때, default 생성자 호출..
	String name1 = "어머니 객체";

	// 2. 매개변수가 없는 생성자 호출
	Mother01() {
		System.out.println("상위 객체 생성자(어머니)");
	}
}

class Son01 extends Mother01 {
	// 1. 선언하지 않을 때, super()가 포함된 default 생성자 호출
	String name2 = "아들 객체";
}

class Mother02{
	Mother02(String name){
		
	}
}
class Son02 extends Mother02{

	Son02() {
		super("문자열 데이터");
		// 반드시 상위에 있는 생성자를 호출해야한다.
		// 상위 생성자는 가장 먼저 호출해야 한다.
		System.out.println("하위생성자");
		
	}
	
}
public class A02_Constructor {
	public static void main(String[] args) {
		// Q1) 왜? 하위 객체 생성을 호출했는데, 상위 객체의 매개변수 없는 생성자의 내용이 출력되는지?
		// => 하위 객체 생성시 반드시 부모객체의 생성자를 호출해야 한다.
		// => default 생성자 public Mother01(){}(상위), public Son01(){super();}
		// => 상위의 매개변수 없는 생성자 선언시,
		// 하위에는 위와 같이 default 생성자가 자동 호출되어 super()에 의해 매개변수가 없는 상위 생성자를 호출하게 된다.
		// => 그래서 매개변수 없는 생성자의 출력낸용이 출력된다.
		Son01 s1 = new Son01();
		System.out.println(s1.name1);
		System.out.println(s1.name2);
	}
}
