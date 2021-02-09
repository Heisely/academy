package a04_Inherit.a03_interface;

public class Missile implements AttackWay {

	@Override
	public void attack() {
		System.out.println("미사일로 공격한다.");
	}

}
