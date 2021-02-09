package a02_object.a03_method;

public class Calculator {
	int num1;
	int num2;

	int plus(int num1, int num2) {
		System.out.println("# plus 메서드 호출 #");
		return num1 + num2;
	}
	int minus(int num1, int num2) {
		System.out.println("# minus 메서드 호출 #");
		return num1 - num2;
	}
	int duplix(int num1, int num2) {
		System.out.println("# duplix 메서드 호출 #");
		return num1 * num2;
	}
	int divide(int num1, int num2) {
		System.out.println("# divide 메서드 호출 #");
		return num1 / num2;
	}

}
