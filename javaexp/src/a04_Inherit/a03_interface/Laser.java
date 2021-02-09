package a04_Inherit.a03_interface;

public class Laser implements AttackWay {

	@Override
	public void attack() {
		System.out.println("레이저 빔으로 공격한다.");
	}

}
