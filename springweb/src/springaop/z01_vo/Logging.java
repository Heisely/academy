package springaop.z01_vo;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.util.StopWatch;

// springaop.z01_vo.Logging
// AOP를 처리할 메서드 선언
public class Logging implements MethodInterceptor {
	@Override
	public Object invoke(MethodInvocation invoke) throws Throwable {
		// TODO Auto-generated method stub
		/* MethodInterceptor: 대상 객체에 대한 정보를 가지고 올 수 있음 */
		// 1. getMethod.getName(): 대상 객체의 메서드 이름을 가져옴
		// 2. proceed(): 수행되는 대상 객체
		// 처리할 내용: 해당 기능 객체의 메서드가 수행하는 시간을 처리
		// 1. 시간 측정을 위한 StopWatch 클래스 선언
		// .start(): 스탑워치의 시작시간 설정
		// .stop(): 스탑원치의 종료시간 설정
		// .getTotalTimeMillis(): 위에 수행한 시작메서드와 종료메서드를 통해 수행한 시간을 1/1000초 단위로 가져옴

		String methodName = invoke.getMethod().getName();
		System.out.println("대상 객체의 수행 메서드(시작): " + methodName);
		StopWatch sw = new StopWatch();
		sw.start(); // 시작시간 check

		Object obj = invoke.proceed(); // 대상 객체의 수행 처리 process
		sw.stop(); // 종료 시간 check
		System.out.println("대상 객체의 수행 메서드(종료): " + methodName);
		System.out.println("대상 객체의 수행 시간: " + (sw.getTotalTimeMillis() / 1000.0) + "초");
		return obj;
	}
}
