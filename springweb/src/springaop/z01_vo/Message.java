package springaop.z01_vo;

// springaop.z01_vo.Message
// 대상 클래스 지정(Target class)
public class Message {
	private String name;

	public void setName(String name) {
		this.name = name;
	}
	
	// 처리할 내용
	public void helloApp() {
		// 5초 후 수행
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(name+"님 안녕하세요.");
	}
}
