package a04_Inherit.a03_interface;

public class Mz {
	private String name;
	private Flyway flyway;
	private AttackWay attackway;

	public Mz() {
		super();
		name = "마징가Z";
	}

	// 날개 실제 객체가 들어올 수 있게 선언.
	// Flyway flyway = new Wing01();
	public void setFlyway(Flyway flyway) {
		this.flyway = flyway;
	}

	public void run() {
		System.out.println(name + " 뛰어다닌다.");
	}

	public void attack() {
		System.out.println(name + " 공격을 한다.");
	}

	public void fly() {
		// setFlyway()메서드에 의해 인터페이스에 실제 객체가 할당되었을 때

		if (flyway != null) {
			System.out.print(name + "는 ");
			flyway.flying();
		} else {
			System.out.println(name + "에는 날개가 아직 장착되지 않았습니다.");
		}
	}

	public void setAttackway(AttackWay attackway) {
		this.attackway = attackway;
	}

	public void attack2() {
		if (attackway != null) {
			System.out.print(name + "는 ");
			attackway.attack();
		} else {
			System.out.println(name + "에는 무기가 아직 장착되지 않았습니다.");
		}
	}
}
