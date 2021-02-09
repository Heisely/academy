package a02_object.a06_acess.a01_acc02;

public class Father {
	private String sec01 = "비밀1";
	String familyTravel = "가족여행계획";
	// private Father() {} // 생성자를 private로 선언

	public void callMother() {
		Mother m1 = new Mother();
		System.out.println(m1.dinnerFood); // default
		System.out.println(m1.announce); // public은 가능하다
	}
}
