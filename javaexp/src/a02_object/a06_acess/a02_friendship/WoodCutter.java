package a02_object.a06_acess.a02_friendship;

/*
 * WoodCutter의 멤버를 기준으로 다른 객체에서 접근이 가능한 지의 여부를 확인하는 내용이다.
 */

/* ex)
 * 접근 제어자 ??	변수명 cacheDeer;
 * 접근 제어자 ?? 	변수명 cacheDress;
 * 접근 제어자 ??	변수명 weddingDate;
 * 다른 외부 클래스에서 호출 가능한지 여부를 확인..
 */

public class WoodCutter {
	private String cacheDress = "천사 옷을 뒷동산 바위 밑에 숨김"; // 다른 어떤 클래스에서도 접근이 불가능
	String cacheDeer = "숲속에 사슴을 숨김"; // default 접근제어자
	public String weddingDate = "대보름날에 결혼함"; // 모든 클래스에서 접근이 가능함
}
