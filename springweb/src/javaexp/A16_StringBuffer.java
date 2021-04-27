package javaexp;

/*
# StringBuffer API
1. String 객체의 concat 처리 시, 메모리 비효율에 대비하여 하나의 메모리 안에 추가적인 문자열을 처리하는 객체
	ex) String s = "사과"; // heap영역 메모리 1
		s += "바나나"; // heap영역 메모리 2
		overflow의 원인
2. StringBuffer를 활용하면 append()라는 메서드를 통해서 문자열을 추가하더라도 같은 heap영역에서 데이터를 누적 할당하여 String보다 효과적으로 메모리를 관리할 수 있다.

 */
public class A16_StringBuffer {
	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer("Hello");
		// append("추가 문자열")
		sb.append(" World");
		System.out.println(sb);
		// insert(인덱스, "추가문자열"): 해당 인덱스위치에 문자열 추가
		sb.insert(5, "!!!!");
		System.out.println(sb);
		// delete(시작index, 마지막index): 해당 위치의 문자열을 삭제
		sb.delete(0, 5);
		System.out.println(sb);
		// ex1) 초기: "Good " / 문자열 추가: bye!! / 특정 위치 추가: My friend Good bye!! / 삭제 후 추가
		// Welcome my friend
		StringBuffer say = new StringBuffer("Good");
		System.out.println("초기: " + say);
		say.append(" bye!!");
		System.out.println("문자열 추가: " + say);
		say.insert(0, "My friend ");
		System.out.println("특정 위치 추가: " + say);
		say.delete(9, say.length());
		System.out.println("삭제: " + say);
		say.insert(0, "Welcome ");
		System.out.println("삭제 후 추가: " + say);
	}

}
