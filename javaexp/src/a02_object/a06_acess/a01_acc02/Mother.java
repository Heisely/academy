package a02_object.a06_acess.a01_acc02;

public class Mother {
	private String sec01 = "비밀1";	// 현재 클래스에서만 사용 가능
	String dinnerFood="김치찌개"; // 
	public String announce = "친구 아들 결혼식";	// 호출 시 사용 가능
	void sayFather() {
		Father f = null;
		f = new Father();
		// default 생성자가 public fater(){}
		// 사용자 정의 생성자로 접근제어자를 private로 선언하는 순간 접근이 불가능하다.
	}
}
