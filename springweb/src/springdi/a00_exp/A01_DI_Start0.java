package springdi.a00_exp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import jspexp.z01_vo.Person;

public class A01_DI_Start0 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a00_exp\\container1.xml");
	}
}
