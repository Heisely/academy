package a02_object.a01_const;

/*
 * 생성자
 * 1. 클래스 명과 동일하다.
 * 2. 생성자를 선언하지 않으면 default 생성자가 내부적으로 생성되어 있다가 선언하는 순간 사라진다.
 * 	  public Car(){} - 내부적으로 만들어 진다. 
 * 3. 생성자를 overloading 규칙에 의해서 여러 개 선언할 수 있다.
 * 	  1) 개수가 다를 때
 *    2) type이 다를 때
 *    3) 개수와 type이 같더라도 순서만 다르게 선언하면 가능하다.
 */
public class Car {
	// 필드 default 처리
	String company; // 문자열(객체) 선언
	String model;
	int maxSpeed; // 숫자 primitive 데이터
	boolean isAuto; // boolean형 primitive 데이터

	// 1. & 2.
	Car() {
	}

	// 3.-1) 개수가 다를 때
	Car(String company) {
		this.company = company;
	}

	// 3.-2) type이 다를 때
	Car(int maxSpeed) {
		this.maxSpeed = maxSpeed;
	}

	// 3.-3) 개수와 type이 같지만 순서가 다를 때
	Car(String company, int maxSpeed) {
		this.company = company;
		this.maxSpeed = maxSpeed;
	}

	Car(int maxSpeed, String company) {
		this.company = company;
		this.maxSpeed = maxSpeed;
	}

	// 생성자는 일반적으로 return값이 없고, field를 초기화 한다.
	Car(String company, String model, int maxSpeed, boolean isAuto) {
		// this.XXX: 매개변수의 이름과 필드의 이름이 동일할 때, 구분해주기 위해서 사용된다.(in Java)
		this.company = company;
		this.model = model;
		this.maxSpeed = maxSpeed;
		this.isAuto = isAuto;
	}
}
