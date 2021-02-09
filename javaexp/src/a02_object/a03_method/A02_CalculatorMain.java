package a02_object.a03_method;

public class A02_CalculatorMain {
	public static void main(String[] args) {
		// ex2) Calculator 클래스를 선언하고, 생성자에 의해 2개의 값을 받아 plus, minus, duplix, divide 메서드를
		// 통해 리턴처리하세요.
		Calculator c = new Calculator();
		System.out.println(c.plus(20, 67));
		System.out.println(c.minus(88, 61));
		System.out.println(c.duplix(3, 6));
		System.out.println(c.divide(81, 9));
	}
}

class Calculator2{
	int num1;
	int num2;
	Calculator2(int n1, int n2){
		this.num1 = n1;
		this.num2 = n2;
	}
	
	void plus() {
		System.out.println(num1+num2);
	}
	void minus() {
		System.out.println(num1-num2);
	}
	void multi() {
		System.out.println(num1*num2);
	}
	void divide() {
		System.out.println(num1/num2);
	}
}