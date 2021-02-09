package a00_exp.a06_1218;
/*
 5. final, static의 개념을 기본 예제를 통해 설명하세요.
 # final
 - final은 클래스의 구성요소와 클래스 자체에 키워드로 사용된다.
 	1) 필드명 앞에 쓰이면 - 초기값 할당 이후, 더이상 변경할 수 없는 값으로 설정된다.
 	   상수로 사용되면 일반적으로 상수를 표현할 때, 상수명을 전체 다 대문자로 사용한다.
 	2) 클래스명 앞에 쓰이면 - final 클래스명으로 선언되면 더이상 상속을 할 수 없다.
 	3) 메서드명 앞에 붙으면 - 상속받은 하위 클래스에서 더이상 재정의(overriding)하여 사용할 수 없다.
 	
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
 	
 # static
 - static 변수는 객체의 소속도 되지만, 궁극적으로는 클래스 단위로 변수를 객체 간에 공유할 수 있게 한다.
 	1) 자바의 객체는 클래스에서 생성되는 것이다.
 	2) 객체의 필드는 클래스에서 각각의 객체마다 다르게 사용할 수 있다.
 	3) 객체의 원본은 class단위로 변수를 설정할 필요가 생기면 static 키워드를 이용해서 선언할 수 있다.
 	4) 클래스 단위로 생성된 모든 객체가 동일한 데이트를 가질 수 있기 때문에, 객체 생성에 종속되지 않아서 "클래스변수"라고 하기도 한다.
 	   static 변수는 객체 생성 없이 "클래스명.static변수" 형식으로 주로 사용된다.
 	
 	class Puppy {
		String name;
		static int cnt; // 객체 공유 메모리
		int eatAppleCnt;
		Puppy(String name) {
			this.name = name;
			cnt++; // 객체가 생성될 때마다 cnt 증가 => class단위,,
			eatAppleCnt++; // 객체가 생성될 때 마다 eatAppleCnt가 증가 => 객체단위,,
		}
	}
 */
public class A05 {

}
