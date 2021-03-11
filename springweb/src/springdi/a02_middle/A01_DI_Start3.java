package springdi.a02_middle;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.a02_middle.z02_vo.Bus;
import springdi.a02_middle.z02_vo.Passenger;

public class A01_DI_Start3 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a02_middle\\container3.xml");
		Passenger p01 = ctx.getBean("passenger", Passenger.class);
		p01.setName("김길동");
		p01.setAge(26);
		Bus bus = ctx.getBean("bus", Bus.class);
		bus.setNo(70);
		bus.goBus();
	}
}
