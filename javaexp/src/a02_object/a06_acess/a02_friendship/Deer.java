package a02_object.a06_acess.a02_friendship;

public class Deer {
	void callWoodCutter() {
		WoodCutter c1 = new WoodCutter();
		// System.out.println(c1.cacheDress); // private이므로 같은 package에서도 접근 불가능
		// 접근이 가능하다 = 외부의 다른 객체에서 해당 멤버를 "참조변수.멤버"를 이용해 호출하거나 할당하는 것이 가능하다
		System.out.println("사슴이 숨은 곳: " + c1.cacheDeer); // 같은 package이므로 접근 가능
		System.out.println(c1.weddingDate); // public은 같은 package 뿐만 아니라 외부 package에서도 접근 가능
	}
}
