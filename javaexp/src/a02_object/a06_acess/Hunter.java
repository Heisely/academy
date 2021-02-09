package a02_object.a06_acess;

import a02_object.a06_acess.a02_friendship.WoodCutter;

public class Hunter {
	void callWoodCutter() {
		// public class WoodCutter이고, default 생성자이므로 객체 생성까지는 가능.
		WoodCutter c1 = new WoodCutter();
		// System.out.println(c1.cacheDress); // private이므로 같은 package에서도 접근 불가능
		// System.out.println("사슴이 숨은 곳: " + c1.cacheDeer); // 다른 package이므로 접근 불가능
		System.out.println(c1.weddingDate); // public은 접근 가능
	}

}
