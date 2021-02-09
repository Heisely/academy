package a00_exp.a06_1218;
/*
  6. 접근제어자의 종류와 범위를 기술하되, default, protected에 관련하여 기본 예제를 만들어 기술하세요.
  	private: 클래스 내부에서만 사용
  	default(X): 접근제어자를 붙이지 않을 때, 같은 패키지까지 접근 가능
  	protected: 상속 관계에 있을 때에만 외부패키지 클래스에서 호출 가능
  	public: 외부 패키지 포함, 모든 클래스에서 접근 가능
  	private < default < protected < public
  	범위가 넓어지는 것이기때문에 넓은 범위에 있는 내용은 전체적으로 포괄하고 있다.
  	
  	패키지1: WoodCutter, Son2, Daughter, Angel
  	패키지2: Son1(extends WoodCutter), Son1Wife
  	WoodCutter의 default 접근제어자가 붙은 Stirng homeEvent = "가족 저녁 외식";
  	=> 외부 패키지에 있는 Son1과 Son1Wife는 접근불가 및 호출불가
  	WoodCutter의 protected 접근제어자가 붙은 protected String inherit = "상속재산유언장";
  	=> 같은 패키지에 있는 모든 클래스(Son2, Daughter, Angel)뿐만 아니라,
  	   외부 패키지의 상속관계가 있는 클래스(Son1)까지 접근 가능
  	   단, 상속관계 없는 외부 패키지 클래스 Son1Wife는 접근 불가능
 */
public class A06_class {

}
