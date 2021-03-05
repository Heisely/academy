package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import jspexp.z01_vo.Person;
import springdi.z01_vo.Product;

public class A01_DI_Start2 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container2.xml");
		// ex) Product.java 물건명 가격 개수를 container2.xml에 선언하고 해당 객체를 호출하여 출력
		Product prod = ctx.getBean("prod", Product.class);
		System.out.println("물건명: " + prod.getName());
		System.out.println("가격: " + prod.getPrice());
		System.out.println("개수: " + prod.getCnt());
	}
}
