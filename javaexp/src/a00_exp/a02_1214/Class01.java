package a00_exp.a02_1214;

import java.util.ArrayList;

public class Class01 { // ex05) class Class01
	private String cName;
	private ArrayList<Student> slist;

	public Class01(String cName) {
		super();
		this.cName = cName;
		slist = new ArrayList<Student>();
	}

	public void addName(Student s) {
		slist.add(s);
	}

	public void addScore() {
		for (Student s : slist) {
			s.score();
		}
	}

	public void studentRecod() {
		System.out.println("이름\t국어\t영어\t총합\t평균");
		for (Student s : slist) {
			s.showScore();
		}
	}
}
