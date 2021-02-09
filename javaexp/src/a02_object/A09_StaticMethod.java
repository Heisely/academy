package a02_object;

/*
 # static 메서드도 객체 생성없이 바로 사용할 수 있다.
 */
class Calculator {
	static int plus(int num1, int num2) {
		return num1 + num2;
	}
}

// ex) ShopMember 클래스를 만들고 static 메서드로 login 선언하고, 매개변수로 id, pw를 입력하게 하여, himan/7777 일 때, 로그인 성공 그 외에는 로그인 실패 리턴
class ShopMember {
	static String login(String id, String pw) {
		/*
		 * if (id == "himan" && pw == "7777") { return "로그인 성공"; } else { return
		 * "로그인 실패"; }
		 */
		// 1. 삼항 연산자 활용 조건?true:false
		// 2. 문자열 비교는 .equals(문자열)
		return id.equals("himan") && pw.equals("7777") ? "로그인 성공" : "로그인 실패";
	}
}

public class A09_StaticMethod {
	static int minus(int num1, int num2) {
		return num1 - num2;
	}

	public static void main(String[] args) {
		System.out.println("static method 활용1: " + Calculator.plus(25, 30));
		System.out.println("static method 활용2: " + minus(25, 30));
		System.out.println();

		System.out.println("static method 예제(himan,3456)   : " + ShopMember.login("himan", "3456"));
		System.out.println("static method 예제(helloman,7777): " + ShopMember.login("helloman", "7777"));
		System.out.println("static method 예제(himan,7777)   : " + ShopMember.login("himan", "7777"));
	}
}
