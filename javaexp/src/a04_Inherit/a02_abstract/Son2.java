package a04_Inherit.a02_abstract;

import a04_Inherit.a01_basic.Father;

/*
 	String charac = "성격이 원만하다.";
 	private int age = 55;
 	protected String favFood = "짜장면";
 	public String announce = "아들/딸 자랑";
 */
public class Son2 extends Father {
	public void callMember() {
		//System.out.println(age); // private이므로 접근 불가
		//System.out.println(charac); // default는 같은 패키지에서만 접근 가능
		System.out.println(favFood); // 상속관계있는 다른 패키지까지 모두 가능
		System.out.println(announce);
	}
}
