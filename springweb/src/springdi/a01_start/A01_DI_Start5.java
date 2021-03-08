package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z01_vo.Mart;
import springdi.z01_vo.MyMusic;
import springdi.z01_vo.Sensor;

public class A01_DI_Start5 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container5.xml");
		Mart fMart = ctx.getBean("fMart", Mart.class);
		fMart.buyStrList();

		// MyMusic
		MyMusic music = ctx.getBean("music", MyMusic.class);
		music.musicList();
		
		Sensor sensor1 = ctx.getBean("sensor1", Sensor.class);
		// sensor1 참조변수만 호출하면 기본적으로 toString()으로 선언된 부분이 호출된다.
		System.out.println(sensor1);
	}
}
