package springweb.z03_vo;

//springweb.z03_vo.FileVo
public class FileVo {
	private String content;
	private String fname;

	public FileVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FileVo(String content, String fname) {
		super();
		this.content = content;
		this.fname = fname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

}
