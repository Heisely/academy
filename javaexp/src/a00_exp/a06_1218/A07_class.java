package a00_exp.a06_1218;
/*
 7. 상속의 멤버(생성자, 필드, 메서드)별로 접근제어와 재정의에 대하여 기능별로 기술하세요.
 	class Father {
 		private String name; // 멤버
 		Father(String name){
 			this.name = name;
 		}
 		public void call(){
 			System.out.println("이름: "+name);
 		}
 	}
 	class Son extends Father {
 		// 상위 클래스 접근제어자 private는 직접적으로 접근이 불가능
 		Son(){
 			// 상위 클래스의 생성자는 반드시 호출해야 한다.
 			super("아들이름 default");	// 이렇게 함으로써 간접적으로 name을 할당
 		}
 		public void call() { // 메서드는 동일한 매개변수와 이름으로 재정의가 가능하다.(오버라이딩)
 			super.call(); // 상위 메서드를 super.로 재 호출 가능
 			System.out.println("추가 내용 처리"); // 오바라이딩의 핵심인 추가내용 처리 가능
 		}
 		public void call(String n) { // 메서드는 동일한 매개변수가 아니면 메서드 오버로딩이다.
 			
 		}
 	}
 */
public class A07_class {

}
