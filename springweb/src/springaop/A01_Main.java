package springaop;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class A01_Main {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springaop\\container0.xml");
		ctx.close();
	}
}
