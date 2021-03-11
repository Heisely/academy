package springdi.a02_middle.z02_vo;

import org.springframework.beans.factory.annotation.Autowired;

public class Bus {
	private int no;
	@Autowired
	private Passenger pass;

	public Bus() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Bus(int no) {
		super();
		this.no = no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void goBus() {
		System.out.print("버스번호: " + no);
		if (pass != null) pass.info();
	}
}
