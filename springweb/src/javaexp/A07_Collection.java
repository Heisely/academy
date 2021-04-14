package javaexp;

import java.util.ArrayList;
import java.util.List;

import jspexp.z01_vo.Person;
import jspexp.z01_vo.Product;

/*
# Collection 프레임워크
1. 인터페이스와 클래스로 구성되어 있따.
2. 인터페이스는 컬렉션에서 수행할 수 있는 각종 연산을 제네릭 타입으로 정의해 유사한 클래스에 일관성 있게 접근할 수 있게 한다.
3. 인터페이스와 구현 클래스
	1) List: 객체의 순서가 있고, 원소가 중복될 수 있다.
		ArrayLIst, Stack, Vector, LinkedList
	2) Queue: 객체를 입력한 순서대로 저장하여 원소가 중복될 수 있다.
		DelayQueue, PriorityQueue, LinkedList
	3) Set: 객체의 순서가 없으며, 동일한 원소가 중복될 수 없다.
		HashSet, TreeSet, EnumSet
4. 주요 메서드
	add: 객체 맨 끝에 추가한다.
	clear(): 저장된 모든 객체를 제거한다.
	contains(): 명시한 객체의 저장 여부를 조사한다.
	isEmpty(): 리스트가 비어 있는지 조사한다.
	iterator(): iterator를 반환한다.
	remove(): 명시한 첫 번째 객체를 제거하고, 저장 여부를 반환한다.
	size(): 저장된 전체 객체의 갯수를 반환한다.
	toArray: 리스트 배열로 반환한다.
	
# List 컬렉션
1. 순서가 있는 객체를 중복 여부와 관계없이 저장하는 리스트 자료 구조를 지원한다.
2. 배열과 매우 유사하지만 크기가 가변적이고 원소의 순서가 있으므로 원소를 저장하거나 읽어올 때 인덱스를 사용한다.
3. 주요메서드
	get(index): 인덱스로 가져온다.
	indexOf(Object): 명시한 객체가 있는 첫 번째 인덱스를 반환한다.
	remove(index): 해당 인덱스에 있는 객체를 제거한다.
	set(idx, 요소객체): 해당 인덱스에 있는 객체를 대체한다.
	subList(from, to): 범위에 해당하는 객체를 리스트로 반환한다.	
 */
public class A07_Collection {
	public static void main(String[] args) {
		// 1. 기본 ArrayList 객체 선언(List(상위) = 하위 ArrayList)
		// 인터페이스 = 실제 객체
		// List<객체>: 선언하지 않거나 <Object>로 선언하면, 기본적으로 모든 객체를 할당하여 사용할 수 있다.
		List<Object> list = new ArrayList<>();
		list.add("안녕하세요");
		list.add(null);
		list.add(new Integer(25));
		list.add(new Person());
		// .add(위치, 추가할 객체): 특정 위치에 객체 추가
		list.add(1, "반가워요");
		// 해당 위치에 객체가 추가되면, 그 자동으로 그 위치 이후의 모든객체의 index가 증가하는것을 볼 수 있다.
		// .size(): 크기
		// .get(index): 특정 위치의 객체
		System.out.println("# list #");
		for (int idx = 0; idx < list.size(); idx++) {
			Object o = list.get(idx);
			System.out.println(idx + ": " + o);
		}

		// ex) list2로 ArrayList객체를 선언하고, 이름(문자열) / 배열객체 / Double / Product 객체를 할당하고 출력
		List<Object> list2 = new ArrayList<>();
		list2.add("홍길동");
		list2.add(new int[] { 25, 30, 40, 70 });
//		list2.add(list);
		list2.add(new Double(12.345));
		list2.add(new Product("사과", 3000, 2));
		System.out.println("# list2 #");
		for (int idx = 0; idx < list2.size(); idx++) {
			Object o = list2.get(idx);
			System.out.println(idx + ": " + o);
		}

		// 위와 같이 List<Object>는 선형으로 모든 객체를 할당할 수 있다.
		// 그렇지만, 해당 객체의 고ㅗ유한 특징을 사용하기 위해 아래와 같이 typeCasting이 필요하다.
		int[] arry = (int[]) list2.get(1);
		for (int num : arry) {
			System.out.println("번호: " + num);
		}

		Product p01 = (Product) list2.get(3);
		System.out.println(p01.getName());
		System.out.println(p01.getPrice());
		System.out.println(p01.getCnt());
		
		// ex) list객체의 내용을 typeCasting하여 해당 속성값을 출력
		list.add(new Person("홍길동",25,"서울 강남"));
		Person p = (Person) list.get(5);
		System.out.println(p.getName());
		System.out.println(p.getAge());
		System.out.println(p.getLoc());
	}
}
