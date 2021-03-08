package springdi.z01_vo;

import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class Restore {
	private ArrayList<String> list;
	private Set<String> sets;
	private Properties props;
	private Map<String, String> maps;

	public Restore() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setList(ArrayList<String> list) {
		this.list = list;
	}

	public void setSets(Set<String> sets) {
		this.sets = sets;
	}

	public void setProps(Properties props) {
		this.props = props;
	}

	public void setMaps(Map<String, String> maps) {
		this.maps = maps;
	}

	@Override
	public String toString() {
		return "Restore\n[list=" + list + "],\n[sets=" + sets + "],\n[props=" + props + "],\n[maps=" + maps + "]";
	}

}
