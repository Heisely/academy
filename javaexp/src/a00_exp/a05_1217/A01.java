package a00_exp.a05_1217;

/*
 1. 예외 처리의 기본 형식을 기술하고, String 문자열이 null일 때, 발생할 예외를 코드화 하여 처리하세요.
 	try {
 		예외 가능성 있는 코드(실행예외), 반드시 처리할 예외 코드(필수예외)
 	} catch (예외처리객체 e) {
 		예외가 발생했을 때 처리할 코드
 		e.getMessage(): 예외의 내용을 문자열로 출력
 	} finally {
 		예외 발생과 상관 없이 처리할 내용을 코딩할 부분
 	}
 */
public class A01 {
	public static void main(String[] args) {
// 		1. 실행 예외일 경우, 실행할 내용을 코딩하여 실행 후 예외 내용을 확인한다.
		try {
			String name = null;
			System.out.println(name.toString());
// 		2. 예외 내용을 catch 매개변수로 설정한다.
		} catch (NullPointerException e) {
//		3. 예외 발생 시 처리할 코드를 기술한다.
			System.out.println("예외발생(NullPointerExeption): " + e.getMessage());
//		4. 그 외의 예외에 대한 선언
		} catch (Exception e) {
			System.out.println("# 기타 예외 발생 #");
			System.out.println("예외내용: " + e.getMessage());
//		5. finally{} 블럭에 예외 상관없이 처리할 코드를 입력한다.
		} finally {
			System.out.println("예외 상관없이 처리할 코드");
		}
	}
}
