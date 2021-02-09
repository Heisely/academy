package a02_object.a01_const;
/*
 * ex) package a02_object.a01_const 안에 BaseBallPlayer.java 클래스를 선언하고
 * 1. 필드: 소속사,이름, 성적
 * 2. 생성자: 입력값 없는 생성자, 이름만 할당된 생성자, 소속사&이름&성적 할당된 생성자 구현하기
 * 3. main()에서 호출하여 필드값을 출력처리하세요.
 */

public class MainClass {
	public static void main(String[] args) {
		// 필드의 default 확인
		Car c1 = new Car(); // default 생성자 호출
		// default 값: 객체는 null, 숫자형 데이터는 0, boolean형 데이터는 false
		System.out.println(c1.company);
		System.out.println(c1.model);
		System.out.println(c1.maxSpeed);
		System.out.println(c1.isAuto);
		System.out.println();

		// 메인 메서드에서는 class에서 선언한 생성자 중에 하나를 선택해서 객체로 생성한다: 한 객체는 한 생성자를 사용한다.
		Car c2 = new Car("현대자동차", "에쿠스", 250, true);
		System.out.println("# c2: " + c2 + "#");
		System.out.println("c2.company: " + c2.company);
		System.out.println();
	}
}
