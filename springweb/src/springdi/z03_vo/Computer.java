package springdi.z03_vo;
// springdi.z01_vo.Computer
import java.util.ArrayList;

import org.springframework.stereotype.Component;
@Component("computer")
public class Computer {
	private String company;
	private ArrayList<Compart> partList;

	public Computer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Computer(String company) {
		super();
		this.company = company;
		partList = new ArrayList<Compart>();
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	// 하나씩 추가하는 메서드 구현
	public void setPart(Compart compart) {
		this.partList.add(compart);
	}

	// 출력하는 메서드
	public void showInfo() {
		System.out.println(company + "컴퓨터!!");
		if (partList.size() > 0) {
			System.out.println("장착된 부품들");
			for (Compart part : partList) {
				System.out.print(part.getName() + "\t");
				System.out.print(part.getSpec() + "\n");
			}
		} else {
			System.out.println("부품을 장착하지 못 했습니다.");
		}
	}

	public ArrayList<Compart> getPartList() {
		return partList;
	}

	public void setPartList(ArrayList<Compart> partList) {
		this.partList = partList;
	}

}
