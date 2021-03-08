package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z01_vo.Restore;

public class A01_DI_Start6 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container6.xml");
		Restore restore1 = ctx.getBean("restore", Restore.class);
		System.out.println(restore1);
	}
}