package a00_exp.a04_1216;

import java.util.ArrayList;

/*
  3. 추상클래스로 Starcraft의 Zerg종족의 초기 유닛 Larba를 선언하고
    필드 - 유닛명, 재정의할 메서드 - attack()으로 선언하여
    하위클래스로 Zerggling, Hydra, Mutal ... 계층 구조화된 내용으로 실제 객체를 선언하고,
    공격 방식에 따른 처리를 하세요.
 */
abstract class Larba {
	private String kind; // 상속받는 모든 객체에서 사용할 변수 지정

	public Larba(String kind) { // 상위에 생성자를 통해서 할당
		super();
		this.kind = kind;
		System.out.println("# " + kind + "유닛 생성 #");
	}

	abstract void attack(); // 추상메서드가 1개라도 포함되면 추상클래스가 된다.

	public void move() {
		System.out.println(kind + " 이동하다.");
	}
}

class Dron extends Larba {
	public Dron() {
		// 상위에 선언된 생성자(Larba(String kind))에 이 객체가 가지고 있는 이름을 매개변수로 전달하여 kind에 할당하기 위해 쓰임
		super("드론");
	}

	@Override
	void attack() {
		//
		System.out.println("자원 채집을 하고, 공격력은 미약하다.");
	}
}

class Zerggling extends Larba {
	public Zerggling() {
		super("저글링");
	}

	@Override
	void attack() {
		System.out.println("빠르게 근접 공격을 하다.");
	}
}

class Hydra extends Larba {
	public Hydra() {
		super("히드라");
	}

	public Hydra(String kind) {
		super(kind);
	}

	@Override
	void attack() {
		System.out.println("원거리 공격을 하다.");
	}
}

class Lurker extends Hydra {
	public Lurker() {
		super("럴커");
	}

	@Override
	void attack() {
		System.out.println("땅 밑에서 공격을 하다.");
	}
}

public class A03 {
	public static void main(String[] args) {
		Larba l1 = new Dron();
		l1.attack(); // 재정의한 메서드
		l1.move(); // 상위 공통 메서드
		System.out.println();

		ArrayList<Larba> list = new ArrayList<Larba>();
		list.add(new Dron());
		list.add(new Zerggling());
		list.add(new Hydra());
		list.add(new Lurker());
		for (Larba l : list) {
			l.move();
			l.attack();
			System.out.println();
		}
	}
}
