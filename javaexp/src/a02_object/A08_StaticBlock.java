package a02_object;

/*
 # static 변수는 static block으로 변수를 변경할 때 사용할 수 있다.
 ex) Student 클래스를 선언하고 static 변수로 학년,반,번호,이름을 선언할당하고, stuinfo static변수 선언
 	 static block을 통해 위 정보를 할당하고 확인하는 코드를 작성하세요
 */
class Television {
	static String company = "삼성전자";
	static String model = "LED";
	static String info;
	static {
		info = company + " - " + model;
	}
}

class Student {
	static int grade = 2;
	static int part = 6;
	static int no = 30;
	static String name = "홍길동";
	static String stuinfo;

	static {
		stuinfo = grade + "학년 " + part + "반 " + no + "번 " + name;
	}
}

public class A08_StaticBlock {
	public static void main(String[] args) {
		System.out.println(Television.company);
		System.out.println(Television.model);
		System.out.println(Television.info);
		System.out.println();

		System.out.println(Student.grade + "학년");
		System.out.println(Student.part + "반");
		System.out.println(Student.no + "번");
		System.out.println(Student.name);
		System.out.println(Student.stuinfo);
	}
}
