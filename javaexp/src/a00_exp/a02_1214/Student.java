package a00_exp.a02_1214;

public class Student { // ex05) class Student
	private String name;
	private int kor;
	private int eng;

	public Student(String name) {
		super();
		this.name = name;
	}

	public void score() {
		kor = (int) (Math.random() * 101);
		eng = (int) (Math.random() * 101);
	}

	public void showScore() {
		System.out.print(name + "\t");
		System.out.print(kor + "\t");
		System.out.print(eng + "\t");
		System.out.print(kor + eng + "\t");
		System.out.print((kor + eng) / 2 + "\n");
	}
}
