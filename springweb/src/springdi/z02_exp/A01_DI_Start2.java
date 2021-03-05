package springdi.z02_exp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z01_vo.Computer;

public class A01_DI_Start2 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\z02_exp\\container2.xml");
		Computer com01 = ctx.getBean("com01", Computer.class);
		com01.showInfo();
	}
}
