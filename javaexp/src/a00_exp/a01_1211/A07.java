package a00_exp.a01_1211;

import java.util.*;

/*
 7. Math.random()을 이용해서 주사위가 1~6번호가 나오게 하고, 실행할때마다 해당 번호가 나온 확률을 표기하세요.(중급)
 	반복문으로 6회 실행하여
 	나온 번호: @@
 	1: @@%, 2: @@%, 3: @@%, 4: @@%, 5: @@%, 6: @@%
 */
public class A07 {
	public static void main(String[] args) {
		int num = 0;
		int cnt = 0;
		ArrayList<Integer> dice = new ArrayList<Integer>();

		do {
			cnt++;
			num = (int) ((Math.random() * 6) + 1);
			dice.add(num);
			System.out.println(cnt + "번째 주사위의 눈: " + num);
			System.out.println(cnt + "번째까지 나온 주사위의 눈: " + dice);
			System.out.println("주사위의 눈이 나온 횟수와 확률을 구합니다.");
			
			int[] c = new int[6];
			for (int i = 0; i < dice.size(); i++) {
				c[dice.get(i) - 1]++;
			}
			for (int i = 0; i < c.length; i++) {
				System.out.println(i + 1 + ": " + c[i] + "번 // 확률: "
						+ (double) (Math.round((double) c[i] / (double) dice.size() * 10000) / 100.0) + "%");
			}
			System.out.println();
		} while (cnt != 6);
	}
}
