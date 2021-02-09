package a00_exp.a01_1211;

/*
 8. 상위는 학년 하위는 반을 출력하세요 (학년은 1~3) (반은 1~10)
 		1학년 1반 ~~ 1학년 10반
 		2학년 1반 ~~ 2학년 10반
 		3학년 1반 ~~ 3학년 10반
 */
public class A08 {
	public static void main(String[] args) {
		for (int i = 1; i <= 3; i++) {
			for (int j = 1; j <= 10; j++) {
				System.out.print(i + "학년" + j + "반\t");
			}
			System.out.println();
		}
	}
}
