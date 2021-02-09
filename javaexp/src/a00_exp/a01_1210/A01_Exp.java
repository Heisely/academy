package a00_exp.a01_1210;

import java.util.Scanner;

/*
1. 생성자와 메서드의 차이점을 기술하세요.
	- 생성자는 리턴값이 없고, 객체 생성 시 한 번만 생성이 되어 사용된다.
	- 메서드는 매개변수 리턴값이 있고, 객체를 생성한 이후로 여러 번 참조변수를 이용해서 사용할 수 있다.

2. default 생성자와 매개변수가 없는 생성자의 차이점과 장단점을 기술하세요.
	- default 생성자란 클래스에서 생성자 선언이 없을 때, 내장되어 있는 public 클래스명(){}으로 선언되어 있는 것을 말한다.
	  이 생성자는 사용자 정의 생성자를 선언하는 순간 사라진다.
	- 매개변수가 없는 생성자를 선언한 경우, default 생성자와 차이는 다른 overloading되는 생성자와 함께 사용될 수 있다.
	- 장단점이라기보다는 필요할 시 위의 특성을 이용하여 해당하는 경우에 사용하면 된다.

3. '객체를 생성하면 생성자를 하나만 선택할 수 있다는 말!'라는 말을 클래스 내 생성자 선언과 관련하여 설명하세요.
	- 클래스 내 생성자는 종류가 다르다는 가정 하에 하나만 호출할 수 있다.
	- 객체를 생성했을 때 한 생성자를 선택하게 되면 그 생성자에 주소를 만들기 때문에 다른 생성자를 선택할 수 없다...
	=> 클래스에는 여러 생성자를 overloading 규칙에 의해 선언할 수 있다.
	   그러나 객체 생성 시 선택적으로 선언된 생성자를 new 생성자명() 으로 참조변수에 할당할 수 밖에 없기 때문에
	   메서드와 같이 같은 주소값이 같은 참조변수에 여러 개의 생성자를 사용할 수 없다.

4. 메서드의 구성요소 4가지를 메서드 예제 선언과 함께 설명하세요.
	- 리턴값, 매개변수, 프로세스, 메서드명
	- 리턴할 데이터type 메서드명(입력할 매개변수1, 매개변수 2, ...){
		프로세스 처리..
		return 결과데이터;
	  }
	- 	String rainbow() {
		if (ch == 1) {color = "빨";}
		else if (ch == 2) {color = "주";}
		else if (ch == 3) {color = "노";}
		else if (ch == 4) {color = "초";}
		else if (ch == 5) {color = "파";}
		else if (ch == 6) {color = "남";}
		else if (ch == 7) {color = "보";}
		else {System.out.println("잘못된 숫자를 입력했습니다.");}
		return color;
	}

5. 다음과 같은 메서드를 선언해보세요.
	1) 매개변수 정수형으로 1~7
	2) 리턴값 문자열로 된 색상
	3) 프로세스 처리..
		1 ~ 7번에 따라 무지개 색상 선택 빨/주/노/초/파/남/보
	- class Rainbow로 코딩 완료(사진 첨부)
	String chColor(int chNum){
		int idx = chNum>0 && chNum<8 ? chNum : 0;
		String[] colors = {"선택안됨", "빨", "주", "노", "초", "파", "남", "보"};
		return colors[idx];
	}
	
6. 메서드에서도 overloading이 사용된다. 예제를 만들어 설명하세요.
	- int add(int a, int b){...}
	- int add(int a, long b){...}
	- int add(float a, int b){...}
	- 이처럼 메서드 이름이 같지만 매개변수의 타입이 다른 경우 overloading이 사용된다..
	
7. final이 클래스의 구성요소에 쓰일 때, 각각의 형식과 차이점을 기술하세요.
	1) final class 클래스명{}: 필드명 앞에 쓰이면 - 초기값 할당 이후, 더이상 변경할 수 없는 값으로 설정된다.
 	2) final int NUM1 = 0;: 상수로 사용되면 일반적으로 상수를 표현할 때, 상수명을 전체 다 대문자로 사용한다.
 	3) final void method(){}: 상속받은 하위 클래스에서 더이상 재정의(overriding)하여 사용할 수 없다.

8. 위의 final 내용 중에 메서드에서 쓰일 때에 예제를 간단하게 코딩해 보세요.
	class FlyAnimal {
		final void fly(){
			System.out.println("훨훨 날아간다");
		}
		void eat(){
			System.out.println("벌레를 잡아 먹는다");
		}
	}
	class Bird extends FlyAnimal {
		@overriding
		void eat(){
			super.eat();
			System.out.println("애벌레를 먹는다");
		}
		// 클래스 FlyAnimal의 메서드 fly()는 overriding 할 수 없고, 수정도 할 수 없다. 따로 사용은 가능하다.
	}

9. static이란 무엇인가? 간단한 변수 앞에 쓰일 때, 어떻게 처리되는지 기술해 보세요.
	- 클래스 단위로 생성된 모든 객체가 동일한 데이터를 가질 수 있게 해준다..
 	   
10. 클래스 안에 static으로 메서드를 구현한 내용으로 가위/바위/보 3개 중에 하나가 임의로 나오는 메서드를 구현하여 main()에서 호출처리해보세요.
	- class RSP로 코딩 완료(사진 첨부)
	class Game{
		static String play(){
			int ranIdx = (int)(Math.random()*3);
			String[] arr = {"가위", "바위", "보"};
			return arr[ranIdx];
		}
	}
	//main()
	 	System.out.println(Game.play());
	 	// static으로 선언된 메서드는 클래스명.메서드명() 으로 호출할 수 있다.

11. 칫솔 클래스와 치약클래스를 1:1 관계로 설정하여 종속관계를 만들고 출력해보세요.
	- class ToothBrush, class ToothPase 로 코딩 완료(사진 첨부)

12. ## 만일 변수에 static과 final이 함께 쓰인다면 어떤 효과가 발생하는지 기술해보세요.
	static은 클래스 변수, final은 상수
	final만 붙으면 객체단위로 상수가 만들어 진다.
	클래스 단위로 하나의 상수만 쓰일 수 있게 된다.
*/

class Rainbow { // ex5.class
	String color;
	int ch;

	public Rainbow(int ch) {
		super();
		this.ch = ch;
	}

	String rainbow() {
		if (ch == 1) {
			color = "빨";
		} else if (ch == 2) {
			color = "주";
		} else if (ch == 3) {
			color = "노";
		} else if (ch == 4) {
			color = "초";
		} else if (ch == 5) {
			color = "파";
		} else if (ch == 6) {
			color = "남";
		} else if (ch == 7) {
			color = "보";
		} else {
			System.out.println("잘못된 숫자를 입력했습니다.");
		}
		return color;
	}
}

class RSP { // ex10.class
	static int a;

	void game(int a) {

		RSP.a = a;
		if (a == 1) {
			System.out.println("a=" + a);
			System.out.println("가위");
		} else if (a == 2) {
			System.out.println("a=" + a);
			System.out.println("바위");
		} else if (a == 3) {
			System.out.println("a=" + a);
			System.out.println("보");
		}
	}
}

class ToothBrush { // ex11.class(1)
	String kind;
	ToothPaste tp;

	public ToothBrush(String kind) {
		super();
		this.kind = kind;
	}

	void setToothPaste(ToothPaste tp) {
		this.tp = tp;
	}

	void clean() {
		System.out.println("# 양치를 하자 #");
		if (tp != null) {
			System.out.println(tp + "치약을 " + kind + "칫솔에 바르고 양치를 한다.");
		} else {
			System.out.println("치약이 없어서 양치를 할 수 없다..");
		}
	}
}

class ToothPaste { // ex11.class(2)
	String kind;

	public ToothPaste(String kind) {
		super();
		this.kind = kind;
	}

}

public class A01_Exp {
	public static void main(String[] args) {
		// ex5.main()
		Scanner scan = new Scanner(System.in);
		System.out.print("1~7 숫자를 입력하세요.> ");
		int ch = scan.nextInt();
		Rainbow r1 = new Rainbow(ch);
		System.out.println(r1.rainbow());
		System.out.println();

		// ex10.main()
		RSP rsp = new RSP();
		int a = (int) (Math.random() * 3 + 1);
		rsp.game(a);
		System.out.println();

		// ex11.main()
		ToothBrush tb = new ToothBrush("미세모");
		tb.clean();
		tb.setToothPaste(new ToothPaste("민트향"));
		tb.clean();

	}
}
