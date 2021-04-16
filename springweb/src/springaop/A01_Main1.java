package springaop;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springaop.z01_vo.Message;

public class A01_Main1 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springaop\\container1.xml");
		Message msg = ctx.getBean("proxy",Message.class);
		msg.helloApp(); // Proxy안에 있는 대상 객체 Message의 helloApp()이 수행될 때 AOP 처리
		ctx.close();
	}
}
