package springdi.a02_middle;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.a02_middle.z01_vo.Buyer;


public class A01_DI_Start1 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a02_middle\\container1.xml");
		
		Buyer buyer01 = ctx.getBean("buyer01", Buyer.class);
		buyer01.buy();
	}
}
