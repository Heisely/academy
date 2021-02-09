package a02_object;

import java.util.Scanner;

/*
 # 객체의 구성요소를 통한 연습예제
 1. Friend 클래스를 선언하고, 필드: 이름, 친구가 된 시기, 생성자를 통해 초기화, 메서드 show() 출력처리.
 2. Member 클래스 선언 필드: id, pw, name, 생성자를 통해서 id, pw, name 할당, 
 	메서드 logIn()을 통해서 @@@님 패스워드 @@@를 통해서 로그인 성공 출력
 3. Entertainer 클래스 선언 필드: 이름, 나이, 성별, 생성자 초기화, 메서드 showMyEnter()를 통해서 정보 출력
 4. 위 2번에서 logIn() 메서드에 매개변수로 id, pw를 입력하게 하여, 기존 필드의 id,pw와 동일하면 "로그인 성공" 아니면 "로그인 실패" 출력.
 */

class Friend {
	String name;
	int year;
	int month;

	public Friend() {
	}

	void show(String name, int year, int month) {
		System.out.println(name + "과 친구가 된 시기는 " + year + "년 " + month + "월 입니다.");
	}

}

class Member {
	String id;
	String pw;
	String name;

	public Member() {}

	Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	void logIn(String id, String pw, String name) {
		System.out.println(name + "님, 암호 " + pw + "를 통해 로그인 성공");
	}
}

class Entertainer {
	String name;
	String age;
	String sex;

	public Entertainer() {
	}

	void showMyEnter(String name, String age, String sex) {
		System.out.println("이름: " + name);
		System.out.println("나이: " + age);
		System.out.println("성별: " + sex);
	}
}

public class A04_Exp {
	public static void main(String[] args) {
		Friend f = new Friend();
		f.show("쌍용교육센터", 2020, 11);
		Member m = new Member();
		m.logIn("phs9336", "1234", "박혜선");
		Entertainer e = new Entertainer();
		e.showMyEnter("박혜선", "28", "여자");
		System.out.println();

		Member m2 = new Member("phs9336", "3456");
		Scanner scan = new Scanner(System.in);
		System.out.print("ID를 입력하세요: ");
		String id = scan.nextLine();
		System.out.print("PW를 입력하세요: ");
		String pw = scan.nextLine();
		if (m2.id.equals(id) && m2.pw.equals(pw)) {
			System.out.println("로그인 성공");
		} else {
			System.out.println("로그인 실패");
		}

	}
}
