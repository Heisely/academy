package springweb.z04_util;

import org.aspectj.lang.ProceedingJoinPoint;

// springweb.z04_util.Profiler
// 수행할 내용 처리 advice 클래스
public class Profiler {
	// 특정한 시점에서 해당 프로그램 내용이 진행되게 처리
	public Object tarce(ProceedingJoinPoint joinPoint) {
		Object result = null;
		// 해당 객체의 특정 메서드의 수행 시간 check
		// 1. 시작 시간
		String sign = joinPoint.getSignature().toShortString();
		System.out.println(sign+" 시작.");
		long start = System.currentTimeMillis();
		// 2. 수행
		try {
			result = joinPoint.proceed();
		} catch (Throwable e) {
			System.out.println("수행 처리 에러: "+e.getMessage());
		} finally {
			// 3. 완료 시간
			long finish = System.currentTimeMillis();
			System.out.println(sign+" 종료.");
			System.out.println("수행시간: "+(finish-start)+"MS");
		}
		
		
		return result;
	}
}
