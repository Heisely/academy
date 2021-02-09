package a00_exp.a01_1211;

import java.util.Scanner;

/*
 4. 조건문 활용예제(난이도 중) Scanner를 통해서 나이 입력 받아서 처리
 		* 나이에 따른 할인율 적용.
 		* 3세이하, 65세이상 무료
 		* 4~7: 50% 할인
 		* 8~13: 40% 할인
 		* 14~19: 20% 할인
 		* 그 외: 할인 없음
 		* 
 		* 1) 변수 나이에 따른 할인율을 출력하세요
 		* 2) 요금이 50000 일 때, 할인율 적용된 금액까지 출력하세요.
 */
public class A04 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.print("나이를 입력하세요.> ");
		int age = scan.nextInt();
		int price = 50000;
		if (age <= 3 && age >= 65) {
			System.out.println("입력하신 나이는 " + age + "입니다.");
			System.out.println(age + "살은 무료입니다.");
			System.out.println("요금: " + (int)(price * 0) + "원");
		} else if (4 <= age && age <= 7) {
			System.out.println("입력하신 나이는 " + age + "입니다.");
			System.out.println(age + "살은 50% 할인이 적용됩니다.");
			System.out.println("요금: " + (int)(price * 0.5) + "원");
		} else if (8 <= age && age <= 13) {
			System.out.println("입력하신 나이는 " + age + "입니다.");
			System.out.println(age + "살은 40% 할인이 적용됩니다.");
			System.out.println("요금: " + (int)(price * 0.6) + "원");
		} else if (14 <= age && age <= 19) {
			System.out.println("입력하신 나이는 " + age + "입니다.");
			System.out.println(age + "살은 20% 할인이 적용됩니다.");
			System.out.println("요금: " + (int)(price * 0.8) + "원");
		} else {
			System.out.println("입력하신 나이는 " + age + "입니다.");
			System.out.println(age + "살은 할인적용이 되지 않습니다.");
			System.out.println("요금: " + price + "원");
		}
	}
}
