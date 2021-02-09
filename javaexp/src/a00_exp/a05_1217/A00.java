package a00_exp.a05_1217;

/*
 # 서술형 문제
 3. 예외의 계층 구조화의 목적을 기술하세요.
 	- 예외 처리시 메모리를 효과적으로 사용하려고 한다.
 	  상속 관계에서 최상위에 있는 예외가 가장 넓은 범위를 수해앟여 메모리를 활용한다.
 	  이렇게 되면 최하위에 있는 예외를 먼저 처리하고, 그 예외로 안잡히면 상위계층에 있는 예외를 잡는 것이 효과적이다.
 	  그래서, 아래의 형식으로 예외를 처리하고 있다.
 	  try {
 	
 	  } catch(최하위 예외) {
 	
 	  } catch(하위 예외) {
 	
 	  } catch(상위 예외) {
 	
 	  }
 
 4. 예외처리에서 throw, throws 키워드를 사용할 때, 차이점을 기술하세요.
 	throw는 강제 예외를 처리할 때 주로 사용되는 구문으로 "throw new 예외객체();"로 활용된다.
 	특정한 조건인 경우에 명시적으로 예외를 던져 catch블럭의 매개변수로 예외객체를 받아 처리하게 한다.
 	thorws는 메서드 단위로 예외를 위임하여, 위임한 곳에서 한꺼번에 예외를 처리할 때 사용하는 keyword로
 	"메서드명() throws 예외클래스1, 예외클래스2, ..."의 형식으로 사용된다.
 	
 5. 사용자 정의 예외의 멤버별 특징을 기술하세요.
 	생성자의 매개값이 getMessage와 연동 되어 있다든가,
 	overriding을 하는 메서드가 주로 어떤 것인지,
 	추가 메서드를 통해서 하는 내용.
 	그리고, 이렇게 정의한 사용자 정의 클래스를 통해서 예외 처리될 때,
 	각 멤버별로 어떻게 처리되는지를 설명하면 될 것 같습니다.
 	- class 사용자정의예외 extends Exception {
 			private 필드..: 사용자 정의에서 사용할 필드 선언
 			public 사용자정의예외생성자(매개변수){
 				super(매개변수); // super(매개변수)sms Exception 클래스의 매개변수가 있는 생성자를 호출하고,
 							   // 여기에 전달된 문자열은 Exception 클래스 하위에 있는 getMessage()의 리턴값으로 활용된다.
 			}
 			// Exception 클래스의 getMessage() 오버라이딩
 			@overriding
 			public String getMessage(){
 				// super.getMessage() : 상위 Exception의 해당 메서드 사용..
 				return "[사용자 정의 예외]"+super.getMessage();
 			}
 			// 사용자 정의 메서드에서 추가할 메서드 선언
 			public void showINfo(){
 				System.out.prinln("예외의 발생 ~~추가 메서드 구현..");
 			}
 	  }

 7. eclipse를 통한 웹서버 구축과정을 기술하고, 각 단계별로 주의 사항을 설명하세요.
 	1) 웹 어플리케이션 서버 다운로드
 		tomcat download
 	2) 버젼확인 다운로드 압축해제
 	3) eclipse 하단 servers 메뉴를 통해서 다운로드한 tomcat 버전 설정과 위치 지정
 	4) eclipse Dynamic Web Project 생성
 		jsp 사용을 위해서 lib 부분에 파일 copy
 		- C:\Users\lllll\javaywm\workspace\apache-tomcat-9.0.41 에 있는
 		  jsp-api.jar, servlet-api.jar
 		  C:\Users\lllll\javaywm\workspace\javaexp10\WebContent\WEB-INF\lib
 	5) 프로젝트와 tomcat 연동
 	6) tomcat 초기 port의 변경
 	7) web 프로젝트 하위 폴드에 WebContent 폴드에 index.html 이나 index.jsp 등 웹 관련 파일 생성
 	8) tomcat 시작 해당 파일을 통해 실행 처리
 
 8. javaexp10 프로젝트를 만들고, Webcontent밑에 show.html과 show.jsp를 통해 화면을 구현하고, port번호 3030으로 지정
 	웹서버와 연동하여 출력한 화면과 서버구축 내용을 캡쳐하여 전송하세요.
 */
public class A00 {

}
