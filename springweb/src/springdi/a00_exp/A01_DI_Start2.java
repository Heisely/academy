package springdi.a00_exp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z01_vo.Computer_exp;

public class A01_DI_Start2 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\z02_exp\\container2.xml");
		Computer_exp com01 = ctx.getBean("com01", Computer_exp.class);
		com01.showInfo();
	}
}
