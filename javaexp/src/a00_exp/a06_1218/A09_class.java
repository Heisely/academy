package a00_exp.a06_1218;
/*
 9. 예외 처리에서 런타임시 예외와 필수 예외를 처리하는 방법을 기본예제를 통해 설명하세요.
 	1) 런타임예외: 실행 시 발생하는 예외
 			ex) 객체를 생성하지 않고 멤버 사용, 배열이 없는데 호출, /0으로 처리될 때 에러 등
 	2) 필수예외: 컴파일 전에 발생하는 예외
 		- java에서 api로 반드시 처이해야지 컴파일을 정상적으로 처리할 수 있는 예외
 			ex) 파일접근, io 발생, 네트워크 처리 등
 	필수 예외는 tool(eclipse) 등을 통해서 try-catch{} 블럭이 생성된다.
 	런타임예외는 일단 예외가 발생하는 코들르 입력하여 실행 후 예외내용을 확인하고, 그 예외를 catch블럭의 매개변수로 처리한다.
 		- 1단계
 			String s = null;
 			System.out.println(s.toString());
 		- 2단계: 수행 후 예외 내용 확인(NullPointerException 발생)
 			try {
 				String s = null;
 				System.out.println(s.toString());
 			} catch (NullPointerException e) {
 				System.out.println("예외발생: "+e.getMessage());
 			}
 */
public class A09_class {

}
