package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z05_vo.Buyer;

public class A01_DI_Start12 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container12.xml");

		Buyer b01 = ctx.getBean("buyer", Buyer.class);
		b01.buy();
	}
}
