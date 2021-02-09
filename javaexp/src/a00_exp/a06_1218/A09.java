package a00_exp.a06_1218;
/*
 9. 예외 처리에서 런타임시 예외와 필수 예외를 처리하는 방법을 기본예제를 통해 설명하세요.
 	1) 기본 예외 처리 - 개발자의 코딩에 의한 예외처리
 		예외 발생 가능성이 있으므로 api에 있는 예외 클래스를 적용하여 처리
 	2) 필수 예외 처리 - 자바프로그래밍에서 너무나 자주 발생하는 내용이라 반드시 예외하지 않으면 컴파일 자체가 되지 않게 처리해 놓은 것
 		ex) IO(데이터의 input/out이 일어나거나 파일전송, 네트웤을 통한 데이터 처리)
 			기타 클래스 메모리 로딩 처리시 등등..
 			ex) Scanner: 내부적으로 지원처리..
 			InputStream in = System.in;
 			in.read();
 	3) 런타임 예외 처리방법 : try-catch(-finally){} 이용
 		Exception: 모든 예외처리의 상위 api 클래스
 		try {
 			예외 발생할 가능성이 있는 코드1
 			예외 발생할 가능성이 있는 코드2
 			예외 발생할 가능성이 있는 코드3
 			...
 		} catch(Exception e){
 			예외 발생 시 매개변수에 의해 예외를 받아 Exception 하위에 있는 메서드로 처리
 			또는 예외가 발생했을 때 처리할 코드 기술
 		} finally {
 			// 예외가 발생 여부와 관계 없이 처리 할 코드
 		}
 		 	
 	try {
			in.read();// Stream에 의해 입력을 처리하는 메서드 호출.. IO 발생(필수예외처리)
		} catch (IOException e) {
			e.printStackTrace();
		} 
	try {
		System.out.println("수행1");
		System.out.println("수행2");
		System.out.println("수행:" + 1 / 0);
		System.out.println("수행3");
	} catch (ArithmeticException ae) {
		System.out.println("예외발생.." + ae.getMessage());
	} finally {
		System.out.println("예외 상관 없이 수행할 내용");
	}
	System.out.println("수행4"); // 에러발생(예외발생) 하더라도 처리될 내용
	System.out.println("수행5");
	System.out.println();
 */
public class A09 {

}
