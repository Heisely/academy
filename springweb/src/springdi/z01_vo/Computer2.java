package springdi.z01_vo;
// springdi.z01_vo.Computer
import java.util.ArrayList;

public class Computer2 {
	private String company;
	private Compart part;

	public Computer2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Computer2(String company) {
		super();
		this.company = company;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	// 하나씩 추가하는 메서드 구현
	public void setPart(Compart compart) {
		part = compart;
	}

	// 출력하는 메서드
	public void showInfo() {
		System.out.println(company + "컴퓨터!!");
		if (part!=null) {
			System.out.println("장착된 부품들");
			System.out.print(part.getName() + "\t");
			System.out.print(part.getSpec() + "\n");
			
		} else {
			System.out.println("부품을 장착하지 못 했습니다.");
		}
	}
}
