package board.z01_vo;

import java.util.Date;

public class BoardFile {
	private int no;
	private String fname;
	private String pathname;
	private String content;
	private Date credte;

	public BoardFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardFile(String fname, String pathname, String content) {
		super();
		this.fname = fname;
		this.pathname = pathname;
		this.content = content;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getPathname() {
		return pathname;
	}

	public void setPathname(String pathname) {
		this.pathname = pathname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCredte() {
		return credte;
	}

	public void setCredte(Date credte) {
		this.credte = credte;
	}

}
