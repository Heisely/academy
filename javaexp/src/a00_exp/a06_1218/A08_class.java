package a00_exp.a06_1218;

import java.util.ArrayList;

abstract class Robot2 {
	private String kind; // 로봇의 종류
	private ArrayList<Weapon2> wlist; // 추가할 무기종류. 상위 = 하위에 list 형식으로 추가할 수 있도록선언

	public Robot2(String kind) {
		super();
		this.kind = kind;
		wlist = new ArrayList<Weapon2>();
	}

	// 무기를 추가할 수 있는 메서드 Weapon wp = 상속받는 하위 객체
	public void addWeapon(Weapon2 wp) {
		wlist.add(wp);
		System.out.println("무기 장착");
	}

	public void attack() {
		System.out.println("# " + kind + " 로봇 공격하다 #");
		if (wlist.size() >= 1) {
//			for(Weapon wp: wlist) { // 1. list 내에 객체를 바로 할당해서 활용할 때
			for (int i = 0; i < wlist.size(); i++) {
				// 2. numbering이나 index를 활용해서 데이터를 처리할 필요가 있을 때 활용
				Weapon2 wp = wlist.get(i);
				System.out.print("\t" + (i + 1) + "번째 무기! ");
				wp.attack();
			}
		} else {
			System.out.println("무기가 장착되지 않았습니다.");
		}
	}

	// 추상클래스를 상속받은 하위 클래스에서 재정의할 내용 (추상메서드 선언)
	public abstract void shapeAndColor();
}

class TV extends Robot2 { // 추상클래스를 상속받은 하위 클래스

	public TV() { // 상위 생성자 활용
		super("태권브이");
	}

	@Override
	public void shapeAndColor() {
		System.out.println("빨간색 V심볼과 철제 거대 로봇이다.");
	}

}

class MZ extends Robot2 {

	public MZ() {
		super("마징가Z");
	}

	@Override
	public void shapeAndColor() {
		System.out.println("왜놈들 로봇은 알 바 아니다,,,");
	}

}

class Dakan extends Robot2 {
	public Dakan() {
		super("다간");
	}

	@Override
	public void shapeAndColor() {
		System.out.println("변신을 해서 ,,,,,웅앵,,");
	}

}

interface Weapon2 {
	public void attack();
}

class Rocket2 implements Weapon2 {
	@Override
	public void attack() {
		System.out.println("로켓포로 공격");
	}
}

class Laser2 implements Weapon2 {
	@Override
	public void attack() {
		System.out.println("레이저빔으로 공격");
	}
}

class ChangeAttack implements Weapon2 {
	@Override
	public void attack() {
		System.out.println("변신 공격");
	}
}

public class A08_class {
	public static void main(String[] args) {
		TV tv = new TV();
		// 추상클래스에서 상속받으면 공통내용을 효과적으로 사용 및 재정의 할 수 있다.
		// 추상/인터페이스 이용시 추가되는 객체가 기존코드에 영향을 미치지 않는다.
		tv.attack();
		tv.addWeapon(new Rocket2());
		tv.addWeapon(new Laser2());
		tv.addWeapon(new ChangeAttack());
		tv.attack();
		tv.shapeAndColor();
	}
}
