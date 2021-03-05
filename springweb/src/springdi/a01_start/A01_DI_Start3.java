package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z01_vo.Mart;

public class A01_DI_Start3 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container3.xml");
		Mart m01 = ctx.getBean("m01",Mart.class);
		m01.buy();
	}
}
