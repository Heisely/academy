package javaexp;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/*
# Map Collection
1. 키와 값의 쌍으로 구성된 객체를 저장하는 자료구조
2. 맵이 사용되는 키와 값도 모두 객체이다.
3. 키는 중복되지 않고 하나의 값에만 매핑되어 있으므로 키가 있다면 대응하는 값을 얻을 수 있다.
4. 주요 메서드
	1) isEmpty(): 컬렉션이 비어 있는지 여부 반환
	2) get(key): 특정한 key에 해당하는 값을 반환
	3) put(key, value): 해당 객체에 key, value 입력
	4) values(): 모든 값을 collection 타입으로 반환
	5) getKey(): 원소에 해당하는 키를 반환
	6) getValue(): 원소에 해당하는 값을 반환
 */
public class A09_Map {
	public static void main(String[] args) {
		// key, value를 String으로 처리
		Map<String, String> hMap = new HashMap<String, String>();
		hMap.put("himan", "7777");
		hMap.put("himan2", "8888");
		hMap.put("himan", "9999"); // key값은 중복이 배제돼서 마지막에 저장된 것만 남는다
		hMap.put("higirl", "5555");
		hMap.put("goodMan", "3333");
		System.out.println(hMap);
		System.out.println();

		// 특정 키에 해당하는 값을 가져올 수 있다.
		System.out.println("goodMan의 키 값: " + hMap.get("goodMan"));
		System.out.println();

		// keySet()을 통해서 Set객체로 전환하여 key를 가져와서 get으로 데이터를 확인할 수 있다.
		Set<String> keys = hMap.keySet();
		for (String key : keys) {
			System.out.println("키: " + key + ", 값: " + hMap.get(key));
		}
		System.out.println();

		// ex) 학생 번호와 국어 점수 3세트를 Map을 통해서 할당하여 keySelt()을 통해 출력
		Map<Integer, Integer> scoreMap = new HashMap<Integer, Integer>();
		scoreMap.put(1, 80);
		scoreMap.put(2, 90);
		scoreMap.put(3, 85);
		Set<Integer> stdnums = scoreMap.keySet();
		for (int stdnum : stdnums) {
			System.out.println("번호: " + stdnum + ", 국어점수: " + scoreMap.get(stdnum));
		}
	}
}
