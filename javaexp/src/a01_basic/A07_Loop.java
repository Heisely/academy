package a01_basic;

import java.util.Scanner;

/*
 * # 반복문
 * 1. 반복적인 처리를 위해 사용되는 구문을 말한다.
 * 2. 종류
 * 		1) for (초기값 설정; 반복조건; 증감연산자) {
 * 			반복할 코드: 선언한 연산자와 함께 증가/감소하는 처리를 하는 반복문
 *		   }
 *		2) 반복문에 사용되는 키워드
 *			break; continue; 조건문과 함께 효과적으로 반복처리를 해준다.
 *			break문: 반복을 중단시켜준다.
 *			continue문: 해당 단위 프로세스만 수행을 중지했다가 다음 프로세스는 반복수행을 계속해주는 처리를 한다.
 *
 * # for문의 index를 통한 배열 데이터 접근
 * 1. 배열은 index로 접근할 수 있기 때문에
 * 2. 배열명.length 형식으로 배열의 index 한계를 설정할 수 있고,
 * 3. 각 배열의 데이터는 index형식으로 접근하여 처리할 수 있다. ==> 배열명[index번호]
 * 
 * # for의 단위데이터 처리형식
 * 
 * # for(단위데이터: 배열형데이터)
 */
public class A07_Loop {
	public static void main(String[] args) {
		System.out.println("#1부터 10까지 반복#");
		for (int i = 1; i <= 10; i++) {
			System.out.println("카운트!!" + i);
		}
		System.out.println();

		// break문 사용: 5일때 중단 처리.
		System.out.println("break문 사용");
		for (int i = 1; i <= 10; i++) {
			if (i == 5) {
				break;
			}
			System.out.println("카운트!!" + i);
		}
		System.out.println();

		// continue문 사용: 5일때만 중단하고 계속 수행 처리
		System.out.println("continue문 사용");
		for (int i = 1; i <= 10; i++) {
			if (i == 5) {
				continue;
			}
			System.out.println("카운트!!" + i);
		}
		System.out.println();

		// ex1) break연습: 1부터 2씩 증가하면서 100까지 출력하되, 1~100중에 임의의 숫자에서 중단처리되게 하세요.
		// "중단합니다!!"표기
		System.out.println("ex1. break문 연습");
		for (int i = 1; i <= 100; i += 2) {
			if (i == (int) (Math.random() * 100 + 1)) {
				System.out.println("중단합니다!!");
				break;
			}
			System.out.print(i + ",");
		}
		System.out.println();

		// ex2) continue 50~100까지 출력하되, continue를 이용해서 짝수는 제외하여 출력하세요
		System.out.println("ex2. continue문 연습");
		for (int i = 50; i <= 100; i++) {
			if (i % 2 == 0) {
				continue;
			}
			System.out.print(i + ",");
		}
		System.out.println();

		// ex3) 1부터 시작하여 3,6,9게임 형식으로 해당 번호가 나왔을 때, 숫자가 아닌 짝이 표기되게 하세요.
		System.out.println("ex3. 369게임");
		for (int i = 1; i <= 100; i++) {
			if (i % 10 == 3 || i % 10 == 6 || i % 10 == 9) {
				System.out.print("짝,");
				continue;
			}
			System.out.print(i + ",");
		}
		System.out.println();
		System.out.println();

		String fruits[] = { "사과", "바나나", "딸기" };
		// fruits[index번호]: 각각의 개별 데이터 접근
		// fruits[0] fruits[1] fruits[2]
		// fruits.length: 배열의 길이, index번호는 배열의 길이보다 1 작다.
		// 위 데이터에서 배열의 길이는 3이지만, index번호는 2까지 있다.
		for (int idx = 0; idx < fruits.length; idx++) {
			System.out.println(idx + 1 + "번째 과일: ");
			System.out.println(fruits[idx]);
		}
		// ex) 과일의 가격을 정수 배열로 선언하고, 해당 과일명과 가격을 출력하세요.
		int[] price = { 1000, 2000, 5000 };
		for (int i = 0; i < price.length; i++) {
			System.out.println(fruits[i] + "의 가격: " + price[i] + "원");
		}
		System.out.println();

		System.out.println("# for의 두번째 형식");
		for (String f : fruits) {
			System.out.println(f);
		}
		System.out.println();

		// 객체형 배열 선언
		Fruit frus[] = { new Fruit("사과", 3000, 2), new Fruit("바나나", 4000, 3), new Fruit("딸기", 12000, 5) };
		for (Fruit f : frus) {
			System.out.print(f.name + "\t");
			System.out.print(f.price + "\t");
			System.out.print(f.cnt + "\t");
		}
		System.out.println();
		System.out.println();

		// ex) 학생 3명의 이름, 국어, 영어, 수학 점수를 각각의 배열로 만들어서 아래의 형식으로 출력하세요(형식생략)
		String[] name = { "홍길동", "김길동", "신길동" };
		int[] kor = { 70, 80, 60 };
		int[] eng = { 80, 90, 80 };
		int[] math = { 90, 95, 90 };
		int[] total = new int[3];
		double[] avg = new double[3];
		System.out.println("이름\t국어\t영어\t수학\t총점\t평균");
		for (int i = 0; i < name.length; i++) {
			total[i] = (kor[i] + eng[i] + math[i]);
			avg[i] = total[i] / 3.0;
			System.out.println(
					name[i] + "\t" + kor[i] + "\t" + eng[i] + "\t" + math[i] + "\t" + total[i] + "\t" + avg[i]);
		}
		System.out.println();
		
	}
}

class Fruit {
	String name;
	int price;
	int cnt;

	Fruit(String n, int p, int c) {
		this.name = n;
		this.price = p;
		this.cnt = c;
	}
}