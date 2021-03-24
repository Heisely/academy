package board.z01_vo;

// board.z01_vo.Board
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int no; // 번호
	private int refno; // 상위번호
	private String subject; // 제목
	private String content; // 내용
	private String writer; // 작성자
	private int readcnt; // 조회수
	private Date regdte; // 등록일
	private Date uptdte; // 수정일
	private MultipartFile[] report;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(String subject, String writer) {
		super();
		this.subject = subject;
		this.writer = writer;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRefno() {
		return refno;
	}

	public void setRefno(int refno) {
		this.refno = refno;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public Date getRegdte() {
		return regdte;
	}

	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}

	public Date getUptdte() {
		return uptdte;
	}

	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}

	public MultipartFile[] getReport() {
		return report;
	}

	public void setReport(MultipartFile[] report) {
		this.report = report;
	}

}
