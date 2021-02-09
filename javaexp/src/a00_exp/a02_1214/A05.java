package a00_exp.a02_1214;

public class A05 {	// ex05) main()
	public static void main(String[] args) {
		Class01 c1 = new Class01("1학년 1반");
		c1.addName(new Student("홍길동"));
		c1.addName(new Student("고길동"));
		c1.addName(new Student("김철수"));
		c1.addName(new Student("이영희"));
		c1.addScore();
		c1.studentRecod();
	}
}
