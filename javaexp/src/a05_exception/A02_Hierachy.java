package a05_exception;

/*
 # 예외의 계층 구조
 1. 예외는 Exception을 상위로 해서 상속 받는 하위의 여러가지 예외클래스로 계층 구조화 될 수 있다.
 	예외에 대한 메모리 처리를 효과적으로 하기 위해 계층화한다.
 2. 이런 계층 구조화된 예외는
 	try {
 	
 	} catch(최하위 예외) {
 	
 	} catch(하위 예외) {
 	
 	} catch(상위 예외) {
 	
 	} // 형식으로 계층화된 예외를 처리해야 한다.
 */
public class A02_Hierachy {
	public static void main(String[] args) {
		System.out.println("# 입력한 과일 #");
		try {
			for (int i = 0; i < 3; i++) {
				System.out.println(i + 1 + "번째 과일: " + args[i]);
			}
			System.out.println(4 / 0);
		} catch (ArrayIndexOutOfBoundsException e) { // 하위 예외
			System.out.println("예외처리1: " + e.getMessage());
		} catch (Exception e) { // 상위예외
			System.out.println("예외처리2: " + e.getMessage());
		} finally {
			System.out.println("예외 상관 없이 처리할 내용");
		}
	}
}
