package javaexp;

import java.util.Set;
import java.util.TreeSet;

/*
# Set Collection
1. 순서가 없으며, 중복되지 않는 객체를 저장하는 자료구조 지원
2. 추가된 메서드는 없지만 중복되는 요소는 배제
3. 인덱스가 없어서 저장 순서가 무시됨
 */
public class A08_Set {
	public static void main(String[] args) {
		Set<String> s01 = new TreeSet();
		s01.add("사과");
		s01.add("바나나");
		s01.add("바나나");
		s01.add("딸기");
		s01.add("딸기");
		s01.add("오렌지");
		s01.add("수박");
		s01.add("수박");
		// 순서가 확보되지 않고 중복된 데이터는 제외된다.
		System.out.println(s01);
		System.out.println();

		// ex) Integer로 된 서원번호 4자리를 set객체에 할당하고 출력
		Set<Integer> empnos = new TreeSet<Integer>();
		empnos.add(7780);
		empnos.add(7781);
		empnos.add(7782);
		empnos.add(7783);
		empnos.add(7783);
		empnos.add(7782);
		empnos.add(7781);
		System.out.println(empnos);
	}
}
