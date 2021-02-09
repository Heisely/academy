package a02_object.a03_method;

/*
# 메서드란?
1. 객체의 구성요소로, 객체가 필요로 하는 기능처리를 위해 사용한다.
2. 기능 처리란?
	1) 데이터를 저장처리(매개변수로 받아 필드값에 저장 처리)
	2) 특정한 데이터를 조건이나 반복에 의해서 return 해준다.
	3) 출력처리(현재 가지고 있는 데이터에 대한 화면 표시)
	ex) 자판기에서 돈을 입력하고, 화면에 입력된 돈을 표기, 선택한 버튼에 의해서 음료와 잔돈이 나온다.
*/
public class Member {
	// 필드 선언
	String id;
	String pw;
	String name;
	String auth;
	int point;

	// 생성자 선언
	Member(String id, String pw, String name) {
		this.id = id;
		this.pw = pw;
		this.name = name;
	}

	// 출력을 처리하는 기능 메서드
	void showInfo() {
		System.out.println("# 회원정보 #");
		System.out.println("아이디: " + id);
		System.out.println("비밀번호: " + pw);
		System.out.println("이름: " + name);
	}

	// 1. 데이터를 저장하는 메서드 선언.
	void setId(String id) {
		// 외부에서 id값을 문자열로 입력받으면 입력된 id가 필드에 할당된다.
		this.id = id;
	}

	// 2. 두 개의 값을 받아서 저장하는 메서드 처리
	void setIdPass(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	// ex1)
	// 3. 이름 변경 메서드 처리
	void setName(String name) {
		this.name = name;
	}

	// ex2)
	// 4. auth 변경 메서드 처리
	void setAuth(String auth) {
		this.auth = auth;
	}

	// ex3)
	// 5. auth, point 변경 메서드 처리
	void setInfo(String auth, int point) {
		this.auth = auth;
		this.point = point;
	}
}
