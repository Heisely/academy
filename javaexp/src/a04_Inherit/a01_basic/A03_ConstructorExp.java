package a04_Inherit.a01_basic;

/*
 * ex) Worker
 * 필드: 일의 종류, 생성자를 통해서 종류 설정
 * 메서드: working() - @@가 일을 합니다.
 * 하위 클래스: PoliceMan, FireMan
 */
/*
 # 오버라이딩
 자식 클래스가 상속 받은 부모 메소드를 재작성하는 것을 말한다.
 부모가 제공하는 기능을 후손이 일부 고쳐 사용하겠다는 의미로, 자식 객체를 통한 실행 시 후손 것이 우선권을 가진다. (동적 바인딩)
 부모메소드의 접근제어자 수정 가능하지만 부모의 것보다 같거나 넓은 범위로만 변경 가능하다.
 부모메소드의 예외처리 클래스 개수 수정 가능하지만 부모 메소드의 예외처리 클래스 개수보다 크거나 처리범위가 넓으면 안 된다.

 # 오버라이딩 성립요건
 부모 클래스의 메소드와 자식 클래스의 메소드 비교
	- 이름이 동일해야 한다.
	- 매개변수의 개수와 타입이 동일해야 한다.
	- 리턴 타입이 동일해야 한다.
	- 프라이빗 메소드의 오버라이딩은 불가하다.

 # 동적바인딩
 컴파일시 정적바인딩된 메소드를 실행할 당시의 객체 타입을 기준으로 바인딩 되는 것을 동적 바인딩이라고 한다.
 
 # 동적바인딩 성립 요건
 상속 관계로 이루어져 다형성이 적용된 경우에 메소드 오버라이딩이 되어 있으면
 정적으로 바인딩 된 메소드 코드보다 오버라이딩 된 메소드 코드를 우선적으로 수행하게 된다.
 
 */
class Worker {
	String kinds;

	Worker(String kinds) {
		this.kinds = kinds;
	}

	public void working() {
		System.out.println(kinds + "이 일을 합니다.");
	}
}

class PoliceMan extends Worker {
	PoliceMan() {
		super("경찰관");
	}

	// 상속된 내용을 하위 클래스가 동일한 working()메서드를 써서 내용을 각각 재정의 해서 사용할 수 있다.
	@Override
	public void working() {
		// TODO Auto-generated method stub
		super.working();
		System.out.println("치안을 담당한다.");
	}

}

class FireMan extends Worker {
	FireMan() {
		super("소방관");
	}

	@Override
	public void working() {
		// TODO Auto-generated method stub
		super.working();
		System.out.println("불을 끈다.");
	}

}

public class A03_ConstructorExp {
	public static void main(String[] args) {
		Car c1 = new Car();
		c1.show();
		Bus b1 = new Bus();
		b1.show();
		System.out.println();

		PoliceMan p1 = new PoliceMan();
		p1.working();
		FireMan f1 = new FireMan();
		f1.working();
	}
}
