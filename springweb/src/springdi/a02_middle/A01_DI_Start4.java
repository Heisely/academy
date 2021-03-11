package springdi.a02_middle;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.a02_middle.z01_vo.Bus;

public class A01_DI_Start4 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a02_middle\\container4.xml");
		
		Bus bus = ctx.getBean("bus", Bus.class);
		bus.goBus();
	}
}
