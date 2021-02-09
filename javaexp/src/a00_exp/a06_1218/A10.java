package a00_exp.a06_1218;

import java.util.Scanner;

/*
 10. 사용자정의예외를 구성하되, Scanner로 입력한 값이 id, pw가 맞지 않을 때,
 	 정의된 예외 클래스를 통해서 처리되는 프로그램을 구현하세요. 
 */
class IdException extends Exception {
	public IdException(String id) {
		super(id);
	}

	@Override
	public String getMessage() {
		return "ID를 잘못 입력했습니다.";
	}

	public void call1() {
		System.out.println("처음부터 다시 시도하세요.");
	}
}

class PwException extends Exception {
	public PwException(String pw) {
		super(pw);
	}

	@Override
	public String getMessage() {
		return "PW를 잘못 입력했습니다.";
	}

	public void call2() {
		System.out.println("처음부터 다시 시도하세요.");
	}
}

public class A10 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		try {
			System.out.print("ID를 입력하세요: ");
			String id = scan.nextLine();
			if (id.equals("system")) {
				System.out.print("PW를 입력하세요: ");
				int pw = scan.nextInt();
				if (pw == 1111) {
					System.out.println("로그인 성공");
				} else {
					throw new PwException("비밀번호 오류");
				}
			} else {
				throw new IdException("아이디 오류");
			}
		} catch (PwException pe) {
			System.out.println(pe.getMessage());
			pe.call2();
		} catch (IdException ie) {
			System.out.println(ie.getMessage());
			ie.call1();
		}
	}
}
