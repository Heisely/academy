package springdi.z03_vo;

// springdi.z01_vo.Sensor
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.springframework.stereotype.Component;
@Component("sensor")
public class Sensor {
	// 여러 가지 구조의 데이터 처리 객체
	// Set형태의 데이터. Collection 순서는 확보하지 못하지만, 중복을 제외 처리
	private Set<String> agentCodes;
	// 기본적인 key value의 데이터 처리
	private Properties addInfo;
	// 선언된 key값에 해당하는 객체를 할당하는 구조체
	private Map<String, Integer> config;

	public Sensor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Set<String> getAgentCodes() {
		return agentCodes;
	}

	public void setAgentCodes(Set<String> agentCodes) {
		this.agentCodes = agentCodes;
	}

	public Properties getAddInfo() {
		return addInfo;
	}

	public void setAddInfo(Properties addInfo) {
		this.addInfo = addInfo;
	}

	public Map<String, Integer> getConfig() {
		return config;
	}

	public void setConfig(Map<String, Integer> config) {
		this.config = config;
	}

	@Override
	public String toString() {
		return "Sensor\n[agentCodes=" + agentCodes + "],\n[addInfo=" + addInfo + "],\n[config=" + config + "]";
	}

}
