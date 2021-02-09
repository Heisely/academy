package a02_object.a03_method;

public class MainExp {
	public static void main(String[] args) {
		Member m1 = new Member("himan", "7777", "홍길동");
		m1.showInfo();
		System.out.println();

		System.out.println("# 기능 입력 메서드1 처리.. #");
		System.out.println("현재 입력된 id: " + m1.id);
		m1.setId("hiwoman");
		System.out.println("변경 입력된 id: " + m1.id);
		System.out.println();

		System.out.println("# 기능 입력 메서드2 처리(id, pw 입력).. #");
		m1.setIdPass("goodman", "9999");
		System.out.println("변경 입력된 id: " + m1.id);
		System.out.println("변경 입력된 pw: " + m1.pw);
		System.out.println();

		// ex1) name값을 저장하는 메서드를 선언하고 변경된 name을 출력하세요.
		System.out.println("# 기능 입력 메서드3 처리(이름변경).. #");
		System.out.println("현재 입력된 이름: " + m1.name);
		m1.setName("이자바");
		System.out.println("변경 입력된 이름: " + m1.name);
		System.out.println();

		// ex2) 필드에 auth(권한)을 추가하여, 메서드로 auth권한 변경하는 처리를 하세요.
		System.out.println("# 기능 입력 메서드4 처리(auth변경).. #");
		System.out.println("현재 권한: " + m1.auth);
		m1.setAuth("FAIL");
		System.out.println("변경된 권한: " + m1.auth);
		System.out.println();

		// ex3) 필드에 point(정수)를 추가하여, auth와 point를 같이 변경할 수 있게 하세요.
		System.out.println("# 기능 입력 메서드5 처리(auth, point 변경).. #");
		System.out.println("현재 입력된 권한: " + m1.auth + ", 현재 입력된 점수: " + m1.point);
		m1.setInfo("PASS", 80);
		System.out.println("변경 입력된 권한: " + m1.auth + ", 변경 입력된 점수: " + m1.point);
	}
}
