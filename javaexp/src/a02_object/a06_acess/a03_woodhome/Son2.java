package a02_object.a06_acess.a03_woodhome;
/*
 # 상속해주는 WoodCutter의 필드에 대한 접근
 1. 상속이란? 상위에 있는 구성요소 멤버(필드, 생성자, 메서드)를 그대로 접근제어자 범위한계 내에서 사용할 수 있다는 의미.
 */
public class Son2 extends WoodCutter {
	
	void callFather() {
//		System.out.println("private: "+priv); // 접근 제어자가 private로 설정되어 있기 때문에 상속을 하더라도 사용할 수 없다.
		System.out.println("default: " + familyPlan); // 같은 패키지이므로 접근 가능
		System.out.println("protected: " + cacheInheritMoney);
		System.out.println("public: " + weddingDate);
	}
}
