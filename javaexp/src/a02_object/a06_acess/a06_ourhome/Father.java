package a02_object.a06_acess.a06_ourhome;

import a02_object.a06_acess.a05_grandhome.GrandFather;

public class Father extends GrandFather {
	void callGrandFather() {
		System.out.println("protected: " + earnMoney);
	}
}
