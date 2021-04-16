package springaop;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springaop.z01_vo.Message;

public class A01_Main2 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springaop\\container2.xml");
		Message msg = ctx.getBean("target", Message.class);
		msg.helloApp();
		ctx.close();
	}
}
