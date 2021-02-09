package a00_exp.a05_1217;

/*
 6. 1에서 20까지 처리되는 내용에 있어서 3의 배수마다 사용자 정의 예외를 발생하게 한다.
  	(ExceptionTriple을 선언하여 재정의(getMessage)와 추가메서드를 처리하여 출력하도록 하세요.) 
 */
class ExceptionTriple extends Exception {
	private int num;

	public ExceptionTriple() {
		super("3의 배수 예외 발생"); // 기본 예외 내용
	}

	public ExceptionTriple(String msg, int num) {
		super(msg); // 지정한 메세지로 예외 처리
		this.num = num;
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return "[사용자정의예외]" + super.getMessage();
	}

	// 추가 메서드 정의
	public void showInfo() {
		System.out.println("3의 배수 메서드 처리: " + num + " 예외발생");
	}
}

public class A06 {
	public static void main(String[] args) {
		System.out.println("# 사용자 정의 예외 처리 예제 #");
		for (int i = 1; i <= 20; i++) {
			System.out.println("번호: " + i);
			try {
				if (i % 3 == 0) {
					throw new ExceptionTriple("3의 배수 예외", i);
				}
			} catch (ExceptionTriple e) {
				// 재정의한 메서드 호출
				System.out.println(e.getMessage());
				// 추가 정의한 메서드 호출
				e.showInfo();
			} catch (Exception e) {
				System.out.println("기타예외: " + e.getMessage());
			}
		}
	}
}
