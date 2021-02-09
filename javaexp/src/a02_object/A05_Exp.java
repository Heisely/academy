package a02_object;

import java.util.Scanner;

/*
 # 전 날 복슴 내용.
 1. 조건문의 형식은 if, switch문이 있다. if문의 형식과 기본 예제를 기술하세요.
 	- if(조건식){
 		조건식이 ture일 때 처리할 프로세스
 		} else {
 		조건에 해당하지 않을 때 처리할 프로세스
 		}
 	- switch(특정데이터/변수){
 		case 1: 처리할 프로세스 break;
 		...
 		default: 위에 나열된 case가 아닐 때 처리할 프로세스}
 	- if문 기본예제 하단 코딩 완료
 
 2. 임의의 객관식 문제의 정답을 변수 corNum으로 할당하고 있다가 Scanner를 통해서 입력받은 변수 inputNum과 비교하여
 	같으면 정답, 다르면 오답을 처리하는 프로그램을 만드세요.
 	- 하단 코딩 완료
 	
 3. 반복문 for의 기본형식 2가지를 기술하세요.
 	- for(변수 초기화; 변수 범위; 증감식)
 	- for(단일변수 or 객체 : 배열명)
 
 4. 반복문에서 사용되는 continue와 break의 차이를 기술하세요.
 	- continue는 조건 부분을 제외하고 전부 실행
 	- break는 조건 충족 시 실행정지, 반복문에서 빠져나옴.
 
 5. for문을 활용하여 3의 배수를 1~100까지 출력하고, 5의 배수를 100부터 50으로 감소처리하는 구문을 만드세요.
 	- 하단 코딩 완료
 
 6.	실수형 배열로 3명의 키를 할당하고, for문을 이용하여 출력하세요.
 	- 하단 코딩 완료
 
 7. primitive data type의 default 데이터와 객체의 default 데이터에 대하여 기술하세요.
 	- 객체를 생성하면서 필드값으로 데이터를 할당하지 않아도 기본적으로 가지고 있는 데이터를 말한다.
 	- primitive data type의 defalt 데이터: 0
 	- 객체의 default 데이터: null
 
 8. 클래스의 구성요소 3가지를 Music(타이틀, 가수)라는 이름으로 선언하고 호출하세요.
 	- 하단 코딩 완료
 
 9. 생성자의 overloading은 무엇을 의미하는지 기술하세요.
 	- 생성자의 이름이 동일하여도 선언할 수 있는 조건으로 매개변수의 개수, type, type이 다른 경우에도 순서가 다르면 가능
 	
 // 7번 9번 다시 복습하기.
 */
class Music {
	String title;
	String name;

	Music(String t, String n) {
		this.title = t;
		this.name = n;
	}

	void musicInfo() {
		System.out.println("노래제목: " + title);
		System.out.println("가수이름: " + name);
	}
}

public class A05_Exp {
	public static void main(String[] args) {
		// ex1. if문 예제
		int a = 8000;
		if (a >= 10000) {
			System.out.println("1000원 쿠폰을 사용할 수 있습니다.");
		} else if (5000 <= a && a < 10000) {
			System.out.println("500원 쿠폰을 사용할 수 있습니다.");
		} else {
			System.out.println("사용할 수 있는 쿠폰이 없습니다.");
		}
		System.out.println();

		// ex2.
		System.out.print("1부터 30사이의 숫자를 하나 입력하세요.> ");
		Scanner scan = new Scanner(System.in);
		int corNum = (int) (Math.random() * 30 + 1);
		int inputNum = scan.nextInt();
		if (inputNum == corNum) {
			System.out.println("정답입니다.");
		} else {
			System.out.println("오답입니다. 정답은 " + corNum);
		}
		System.out.println();

		// ex5.
		for (int i = 1; i <= 100; i++) {
			if (i % 3 == 0)
				System.out.print(i + ",");
		}
		System.out.println();

		for (int i = 100; i >= 50; i--) {
			if (i % 5 == 0)
				System.out.print(i + ",");
		}
		System.out.println();
		System.out.println();

		// ex6.
		double[] arr = { 160.0, 170.4, 167.3 };
		for (int i = 0; i < arr.length; i++) {
			System.out.println("arr[i]= " + arr[i]);
		}
		for (double f : arr)
			System.out.print(f + ",");
		System.out.println();
		System.out.println();

		// ex8.
		Music m = new Music("별 바람 꽃 태양", "마마무(MAMAMOO)");
		m.musicInfo();

	}
}
