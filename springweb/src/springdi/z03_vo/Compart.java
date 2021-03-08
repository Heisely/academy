package springdi.z03_vo;

import org.springframework.stereotype.Component;

@Component("compart")
public class Compart {
	private String name;
	private String spec;

	public Compart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Compart(String name, String spec) {
		super();
		this.name = name;
		this.spec = spec;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

}
