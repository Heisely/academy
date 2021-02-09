package a02_object.a06_acess.a01_acc02;

public class Sister {
	void callMother() {
		Mother m1 = new Mother();
		// System.out.println(m1.sec01); // private는 접근 불가능
		System.out.println(m1.dinnerFood);
	}
}
