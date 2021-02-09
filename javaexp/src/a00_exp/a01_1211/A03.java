package a00_exp.a01_1211;

import java.util.Scanner;

/*
 3. Scanner를 통해서 id와 pass를 입력하고, "himan/7777"일 때 로그인 성공, 그렇지 않을 때 로그인 실패를 처리하는 프로그램을 만들어보세요.
 */
public class A03 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.print("아이디를 입력하세요.> ");
		String id = scan.nextLine();
		if (id.equals("himan")) {
			System.out.print("비밀번호를 입력하세요.> ");
			int pw = scan.nextInt();
			if (pw == 7777) {
				System.out.println("로그인 성공");
			} else {
				System.out.println("비밀번호가 틀립니다. 로그인 실패.");
			}
		} else {
			System.out.println("아이디가 틀립니다. 로그인 실패.");
		}
		System.out.println();
	}
}
