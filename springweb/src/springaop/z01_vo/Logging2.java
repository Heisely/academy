package springaop.z01_vo;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// springaop.z01_vo.Logging2
public class Logging2 {
	// 로그 처리 기능 클래스 선언
	private static final Logger logger = LoggerFactory.getLogger(Logging2.class);

	// 1. 이전 시점
	public void logBefore(JoinPoint joinPoint) {
		logger.debug("logBefore()");
	}

	// 2. 이후 시점
	public void logAfter(JoinPoint joinPoint) {
		logger.debug("logAfter()");
	}

	// 3. 수행하는 중간에 처리할 내용
	public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
		// 1) jointPoint 객체 리턴(대상)
		Object thisObj = joinPoint.getTarget();

		// 2) 대상 객체의 이름, 메서드명, 매개변수
		String className = thisObj.getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();

		// 3) 시간 측정
		long currentTime = System.currentTimeMillis();
		logger.debug("######################");
		logger.debug("######## 시  작 ########");
		logger.debug("[class]: " + className);
		logger.debug("[methodName]: " + methodName + "()");

		// 4) 수행 - 예외 처리 throws Throwable
		Object returnObj = joinPoint.proceed();
		logger.debug("####### 수행 이후 #######");
		logger.debug("[class]: " + className);
		logger.debug("[methodName]: " + methodName + "()");
		logger.debug("소요시간: " + (System.currentTimeMillis() - currentTime) + "ms");

		// 5) 종료
		logger.debug("######## 종  료 ########");

		return returnObj;
	}
}
