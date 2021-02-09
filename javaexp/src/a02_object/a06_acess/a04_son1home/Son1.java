package a02_object.a06_acess.a04_son1home;

import a02_object.a06_acess.a03_woodhome.*;
// 다른 package에 있는 상속 관계가 있는 클래스

public class Son1 extends WoodCutter {
	void callFather() {
//		System.out.println("private: " + priv); // 클래스가 다르므로 접근불가능
//		System.out.println("default: " + familyPlan); // 다른 패키지이므로 접근 불가능
		System.out.println("protected: " + cacheInheritMoney); // 상속관계에 있을 때에만 외부 패키지라도 접근 가능
		System.out.println("public: " + weddingDate); // 상속관계에 상관없이 모든 패키지에 접근이 가능
	}
}
