package a02_object.a05_oneVSone;

public class A01_Man {
	String name;
	A02_Woman woman;	// Man안에 Woman이 할당 될 수 있는 메모리를 선언.

	A01_Man(String name) {
		this.name = "남자: " + name; // 생성자를 통해서 이름 할당
	}
}
