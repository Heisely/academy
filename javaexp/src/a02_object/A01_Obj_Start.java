package a02_object;

/*
 * # reference 변수(객체의 메모리)
 * 1. 객체를 생성할 때, heap영역의 주소값으로 stack영역에 할당하는데,
 * 	  이 주소값을 할당하는 변수를 reference variables(참조 변수)라고 한다.
 * 2. default 데이터
 * 	  1) 데이터를 할당하지 않은 default로 할당되는 데이터를 말한다.
 * 	  2) primitive 데이터 타입: 정수:0 / 실수:0.0 / boolean:false;
 * 3. 객체지향프로그램이 아닌 경우 메모리에 관련된 코드를 처리해야 하지만,
 *    java는 jvm의 가비지 컬렉터에서 사용되지 않는 메모리는 자동으로 해제해주는 처리를 한다.
 */

class Test {
	int num1;
	double num2;
	boolean isTrue;
	String name;
}

public class A01_Obj_Start {
	public static void main(String[] args) {
		// default값 확인
		Test t1 = new Test();
		System.out.println(t1.num1);
		System.out.println(t1.num1 + 10);
		System.out.println(t1.num2);
		System.out.println(t1.isTrue);
		System.out.println(t1.name); // 객체는 null

		// 객체가 생성되지 않은 상황에서 객체가 생성되었을 때, 사용될 수 있는 필드나 메서드를 호출하면 NullPointerException이 발생
		// System.out.println(t1.name.toString());
	}
}
