package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import springdi.z01_vo.Person;

public class A01_DI_Start1 {
	public static void main(String[] args) {
// 가상의 컨테이너 xml 파일 호출하기
/*
# DI 연습을 위한 환경 구성 1. xml파일(가상의 컨테이너)에 객체 메모리 올리는 순서 
1) 가상의 컨테이너 xml파일에 선언된 class를 di 형식에 맞게 정의 
2) xml에 있는 객체를 main에서 호출해 사용할 수 있도록 
	xml파일을 GenericXmlApplicationContext의 생성자로 정의하여 AbstractApplicationContext에 할당한다. 
3) 참조변수를 이용해서 ctx.getBen("xml에서 bean에 선언한 id", 클래스type.class)로 호출하여 
	해당 객체를 main()메서드에서 사용할 수 있게 한다. 
4) 해당 형식으로 객체명 참조변수로 할당하면 xml에서 선언된 객체를 메모리를 사용할 수 있게 된다.
 */
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container1.xml");
		Person p01 = ctx.getBean("p01", Person.class);
		System.out.println(p01.getName());
		System.out.println(p01.getAge());
		System.out.println(p01.getLoc());
		
		Person p02 = ctx.getBean("p02", Person.class);
		System.out.println(p02.getName());
		System.out.println(p02.getAge());
		System.out.println(p02.getLoc());
	}
}
