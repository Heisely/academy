package a00_exp.a06_1218;

/*
 6. 접근제어자의 종류와 범위를 기술하되, default, protected에 관련하여 기본 예제를 만들어 기술하세요.
 	private(클래스만), X(default, 패키지만), protected(상속관계), public(공용)
 	1) private: 현재 정의된 클래스 내에서만 사용하는 구성요소를 접근제어자 설정..
 	2) X(default): 접근제어자가 선언되어 있지 않은 것을 말한다.패키지 내에서만 접근이 가능.
 	3) protected: 동일 패키지 여부와 관계 없이 상속관계에서만 접근이 가능
 	4) public: 다른 패키지에서도 접근 가능
 	
 	Package01 이라고 가정
 	public class WoodCutter {
		private String priv = "나무꾼의 비밀";
		String familyPlan = "내년 가족 해외여행 계획";
		protected String cacheInheritMoney = "상속재산";
		public String weddingDate = "막내딸 결혼식"; 
	}
 	public class Son1 extends WoodCutter {
		void callFather() {
//			System.out.println("private: "+priv); // (X) 접근 제어자가 private로 설정되어 있기 때문에 상속을 하더라도 사용할 수 없다.
			System.out.println("default: " + familyPlan); // 같은 패키지이므로 접근 가능
			System.out.println("protected: " + cacheInheritMoney); // Son1과 WoodCutter는 상속관계이므로 가능
			System.out.println("public: " + weddingDate);
		}
	}
	
	Package02 이라고 가정
	import Package01.*; // 다른 package에 있는 상속 관계가 있는 클래스	
	public class Son2 extends WoodCutter {
		void callFather() {
//			System.out.println("private: " + priv); // (X) 클래스가 다르므로 접근불가능
//			System.out.println("default: " + familyPlan); // (X) 다른 패키지이므로 접근 불가능
			System.out.println("protected: " + cacheInheritMoney); // 상속관계이므로 외부 패키지라도 접근 가능
			System.out.println("public: " + weddingDate); // 상속관계에 상관없이 모든 패키지에 접근이 가능
		}
	}
 */
public class A06 {

}
