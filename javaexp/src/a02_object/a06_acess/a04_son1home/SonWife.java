package a02_object.a06_acess.a04_son1home;

import a02_object.a06_acess.a02_friendship.WoodCutter;

// 상속 관계에 있지 않은 외부 클래스
public class SonWife {
	void callFather() {
		WoodCutter w = new WoodCutter();
//		System.out.println("private: " + w.priv); // 클래스가 다르기에 접근 안됨
//		System.out.println("default: " + w.familyPlan); // 같은 package에 없으므로 접근 불가능
//		System.out.println("protected: " + w.cacheInheritMoney); // 상속을 하지 않았으므로 접근 불가능
		System.out.println("public: " + w.weddingDate);
	}
}
