package a00_exp.a01_1211;

/*
 11. Book 클래스를 만들고
 		* 생성자로 도서명을 입력받고
 		* buy(..,...)를 통해서 가격과 갯수를 입력하여 처리하고
 		* tot()을 통해서 총액을 계산하여 return 받아 처리한다.
 		* prn()을 통해서 현재 구매한 도서의 도서명, 가격, 갯수 출력하시오
 		* 도서를 3권으로 구매 처리하고, 총비용을 출력하세요.
 */
class Book {
	String title;
	int price;
	int cnt;
	int total;

	public Book(String title) {
		super();
		this.title = title;
	}

	void buy(int price, int cnt) {
		this.price = price;
		this.cnt = cnt;
	}

	int tot() {
		total = price * cnt;
		return total;
	}

	void prn() {
		System.out.println("도서명: " + title);
		System.out.println("'"+title +"'의 가격: " + price + "원");
		System.out.println("구매 권수: " + cnt + "권");
		System.out.println("구매 총액: " + total + "원");
	}
}

public class A11 {
	public static void main(String[] args) {
		Book b1 = new Book("Java의 정석");
		b1.buy(30000, 2);
		b1.tot();
		b1.prn();
	}
}
