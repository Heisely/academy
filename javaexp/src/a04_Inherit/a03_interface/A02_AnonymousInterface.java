package a04_Inherit.a03_interface;

/*
 # 익명 인터페이스 사용
 1. 인터페이스 사용은 "인터페이스 = 상속하는 실제 객체"가 일반적이다.
 2. 인터페이스에 실제 객체이름이 없는(익명) 인터페이스를 다형성에 의해서 사용할 수 있다.
 	익명 인터페이스 = 실제 객체 대신에 생성해서 재정의한 내용을 포함시킨 후 바로 할당하는 인터페이스
 	인터페이스 = new 인터페이스명(){};
 */
/*
 ex) AttackWay에서 바로 익명으로 무기를 만들어서 attack()를 호출하세요.
 	 태권도 발차기 공격
 */
public class A02_AnonymousInterface {
	public static void main(String[] args) {
		RemoteControl rc = new RemoteControl() {
			@Override
			public void setVolume(int volume) {
				System.out.println("볼륨: " + volume + "로 설정.");
			}
		};
		rc.setMute(false);
		rc.setVolume(5);
		System.out.println();
		
		AttackWay aw = new AttackWay() {
			@Override
			public void attack() {
				System.out.println("태권도 발차기 공격");
			}	
		};
		aw.attack();
	}
}
