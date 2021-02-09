package a00_exp.a05_1217;

/*
 2. 반복문을 통해서 10을 5부터 -5까지 나누어 처리 결과를 출력하되,
 	/0으로 나눌 때, 정상적으로 작동하도록 예외 처리를 하여 출력하세요.
 	ex) 10/5, 10/4, 10/3, ... , 10/0, ... , 10/-5
 */
public class A02 {
	public static void main(String[] args) {
		for (int i = 5; i >= -5; i--) {
			try {
				System.out.println("10/" + i + "=" + 10 / i);
			} catch (ArithmeticException e) {
				System.out.println();
				System.out.println("# 수학적 계산 관련 예외 발생 #");
				System.out.println("예외발생(ArithmeticExcption): " + e.getMessage());
				System.out.println("10 / " + i + " = 0");
				System.out.println();
			} catch (Exception e) {
				System.out.println("# 기타 예외 발생 #");
				System.out.println("예외: " + e.getMessage());
			} finally {
				// 예외 발생 여부에 관련 없이 수행할 내용이 있으면 코딩..
			}
			continue;
		}
	}
}
