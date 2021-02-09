package a02_object;
/*
 # final
 1. final은 클래스의 구성요소와 클래스 자체에 키워드로 사용된다.
 2. 적용 대상별로 기능 내용
 	1) 필드명 앞에 쓰이면 - 초기값 할당 이후, 더이상 변경할 수 없는 값으로 설정된다.
 	   상수로 사용되면 일반적으로 상수를 표현할 때, 상수명을 전체 다 대문자로 사용한다.
 	2) 클래스명 앞에 쓰이면 - final 클래스명으로 선언되면 더이상 상속을 할 수 없다.
 	3) 메서드명 앞에 붙으면 - 상속받은 하위 클래스에서 더이상 재정의(overriding)하여 사용할 수 없다.
 */

class MathExp {
	int num1 = 25; // 초기값 할당
	final double PI = 3.14;
	final double PI2;

	MathExp() {
		PI2 = 0.0; // 포함된 필드가 초기화되지 않으면 에러 발생. 반드시 상수값은 초기화값을 할당해야 한다.
	}

	MathExp(int pi) { // 생성자를 통한 초기화 처리
		PI2 = pi;
	}
}

final class Dragon {
	Dragon() {
		System.out.println("용 객체 생성");
	}

	void fly() {
		System.out.println("용이 날아다닌다......");
	}
}

// class DragonSon extends Dragon{	}	// Dragon이 final class이기 때문에 상속할 수 없다.

class Horse {
	void sound() {
		System.out.println("말이 소리 내다");
	}

	final void stop() {
		// 특정한 메서드를 상속 하위클래스에서 변경해서 사용하지 못하게 할 때 final을 붙인다.
		System.out.println("정지하다.");
	}

	void run() {
		System.out.println("빠르게 달린다.");
	}
}

class RobotHorse extends Horse {

	@Override
	void sound() {
		// TODO Auto-generated method stub
		super.sound(); // 상위에 정의된 메서드 사용
		System.out.println("경쾌한 음악소리를 포함해서 소리가 난다.");
	}

	@Override
	void run() {
		// TODO Auto-generated method stub
		super.run();
		System.out.println("로켓을 장착해서 공중 부양해서 달린다.");
	}

}

// ex2) final 메서드 확인 예제
// class Duck 메서드 sound(), fly(), swim(), swim은 final로 처리하고,
// 상속받은 하위클래스 class RobotDuck/ class RubberDuck 재정의하고, swim에 대한 내용을 확인하세요.

class Duck {

	Duck() {
		System.out.println("# class Duck #");
	}

	void sound() {
		System.out.println("꽥꽥");
	}

	void fly() {
		System.out.println("푸드덕");
	}

	final void swim() {
		System.out.println("첨벙첨벙");
	}
}

class RubberDuck extends Duck {
	RubberDuck() {
		System.out.println("# class RubberDuck #");
	}

	@Override
	void sound() {
		System.out.println("꾸에엑");
	}

	@Override
	void fly() {
		System.out.println("날고 싶지만 못 난다.");
	}

	// private void swim() {} //error
}

class RobotDuck extends Duck {
	RobotDuck() {
		System.out.println("# class RobotDuck #");
	}

	@Override
	void sound() {
		System.out.println("끼익");
	}

	@Override
	void fly() {
		System.out.println("무거워서 못 난다.");
	}

	// private void swim() {} //error
}

public class A06_Final {
	public static void main(String[] args) {
		MathExp m1 = new MathExp();
		System.out.println("변수1: " + m1.num1);
		System.out.println("상수1: " + m1.PI);
		m1.num1 = 75; // 다른 값 할당 가능
		// m1.PI = 3.75 // 다른 값 할당 시 error 발생
		System.out.println();

		// ex1) 상수의 사용 예제
		// Calculator2 num01, num02는 변수,
		// 연산자(=,-,*,/)는 상수로 생성자에 의해 초기화 될 수 있게 처리하고, show()를 통해 출력
		Calculator2 c1 = new Calculator2(25, "X", 5);
		c1.show();
		System.out.println();

		Dragon d = new Dragon();
		d.fly();
		System.out.println();

		RobotHorse rh = new RobotHorse();
		rh.sound();
		rh.run();
		rh.stop();
		System.out.println();

		Duck d1 = new Duck();
		d1.sound();
		d1.fly();
		d1.swim();
		RubberDuck d2 = new RubberDuck();
		d2.sound();
		d2.fly();
		d2.swim(); // class Duck을 상속했기 때문에 호출은 되지만, 따로 수정은 불가능하다.
		RobotDuck d3 = new RobotDuck();
		d3.sound();
		d3.fly();
		d3.swim();
	}
}

class Calculator2 {
	int num01;
	int num02;
	final String CAL;

	Calculator2(int num01, String cal, int num02) {
		this.num01 = num01;
		this.CAL = cal;
		this.num02 = num02;
	}

	void show() {
		System.out.println(num01 + CAL + num02);
	}
}