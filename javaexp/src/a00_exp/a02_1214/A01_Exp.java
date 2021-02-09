package a00_exp.a02_1214;

import java.util.ArrayList;

/*
 # 월요일 과제
 1. 동적 배열이 무엇인가 기술하세요.
 	- 배열은 일반적으로 초기에 크기가 정해지면 그 크기를 추가하거나 축소할 수 없다.
 	  그래서 동적인 배열에 대한 필요성이 증가하여 선형구조 객체인 ArrayList가 사용됐다.
 	  즉 동적배열이란, 배열이 동적으로 변경이 가능한 것을 뜻한다.
 	  
 2. ArrayList에 지원하는 기능메서드를 예제와 함께 기술하세요.
 	- .add(객체): 해당 객체를 추가할 때, 쓰인다.
 	- .get(index): 객체가 추가되면 index로 저장이 된다. // 선형구조 0, 1, 2, ...
 	- .set(index, 변경할 객체): 특정한 위치에 있는 객체를 변경 처리한다.
 	- .remove(index): 특정한 위치에 있는 객체를 삭제처리한다. 삭제처리되는 순간, 크기가 하나씩 줄어든다.
 	- .size(): ArrayList의 전체 크기를 가져올 수 있다.
 	
 3. ArrayList의 할당 시, default 데이터 유형과 generic 이용시의  장/단점을 기술하세요.
 	- ArrayList의 default 데이터 유형은 Object로, 다른 데이터 유형을 할당할 수 있다.(String 포함)
 	  또한 외부 객체를 할당할 수 있다.
 	  그러나 Object로 할당된 객체는 그대로 사용할 수 없는 단점이 있다.
 	  이를 사용하려면 1) type casting을 통해서 필요로 하는 객체로 만들어서 사용하는 방법이 있고,
 	  2) 초창기에 ArrayList에 default 데이터유형인 Object가 아니라 generic으로 선언하고 호출하여 사용하는 방법이 있다.
 	  일반 ArrayList는 default 데이터 유형이 Object이므로 type casting이 필요하지만,
 	  generic으로 선언하게 되면 ArrayList 생성 시에 해당 type으로 선언하기때문에 바로 사용이 가능하다는 장점이 있다.
 	  사용방법: ArrayList<만들 타입>~ 
 	  
 4. ArrayList의 generic Type으로 String과 Food(음식명, 선호도-5점만점)으로 선언하고 활용 예제를 작성하세요.
 
 5. 1:多 관계 처리로 학교의 반(class01) 1-1반 객체에 Student(이름, 국어, 영어)로 설정하여 학생등록과 성적리스트를 출력하는 기능 메서드를 구현하세요.
 	1) 1:다 관계의 클래스를 설정
 		- 여러 개의 객체 단위 클래스를 선언
 		- 여러 단위 클래스를 ArrayList<객체>로 해서 포함하는 클래스 선언
 
 */

class Food {
	String name;
	int likePt;
}

public class A01_Exp {
	public static void main(String[] args) {

	}
}
