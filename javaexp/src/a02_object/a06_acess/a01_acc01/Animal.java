package a02_object.a06_acess.a01_acc01;

public class Animal {
	void call() {
		// 객체 생성..
		// 1. 접근제어자 확인: public class Person{}
		// 클래스 선언 부분(Person p1) - 외부의 모든 클래스에서 접근 가능
		// 2. new Person(): 생성자에 대한 접근이 가능할 때 처리될 수 있다.
		Person p1 = new Person();
		// System.out.println(p1.name); // error. 같은 package에 있지만 name이 private이기 때문에 접근 불가능
		System.out.println(p1.age);

	}
}
