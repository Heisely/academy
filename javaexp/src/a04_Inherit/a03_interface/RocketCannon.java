package a04_Inherit.a03_interface;

public class RocketCannon implements AttackWay {

	@Override
	public void attack() {
		System.out.println("로켓포로 공격한다.");
	}

}
