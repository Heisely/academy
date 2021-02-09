package a00_exp.a01_1211;

import java.util.Scanner;

/*
  9. 컴퓨터와 하는 가위바위보
	가위! 바위! 보! (1,2,3)을 입력하세요!!
	컴퓨터 vs 나
	 @@  : @@
	결과: 승/무/패
 */
class Game {
	void result(int ch) {
		if (ch == 1) {
			System.out.print("가위");
		} else if (ch == 2) {
			System.out.print("바위");
		} else if (ch == 3) {
			System.out.print("보");
		}
	}
}

public class A09 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.print("가위(1)! 바위(2)! 보(3)!, 1~3 중 하나를 입력하세요.> ");
		int user = scan.nextInt();
		int com = (int) (Math.random() * 3 + 1);
		Game g1 = new Game();

		System.out.println("컴퓨터 : 나");
		g1.result(com);
		System.out.print(" : ");
		g1.result(user);
		System.out.println();

		switch (user - com) {
		case 2:
		case -1:
			System.out.println("결과: 패");
			break;
		case 1:
		case -2:
			System.out.println("결과: 승");
			break;
		case 0:
			System.out.println("결과: 무");
			break;
		}
	}
}
