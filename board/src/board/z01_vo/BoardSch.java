package board.z01_vo;

public class BoardSch {
	// 1. 검색 속성
	private String subject; // 제목
	private String writer; // 작성자
	// 2. 페이징
	private int count; // 총 데이터 건수
	private int pageSize; // 페이지 당 건수
	private int pageCount; // 총 페이지 수(=count/pageSize)
	private int curPage; // 클릭한 현재 페이지 번호
	private int start; // 페이지의 시작 번호
	private int end; // 페이지의 마지막 번호
	// 3. block 처리
	private int blocksize; // 한 번에 보여줄 block의 크기
	private int startBlock; // block의 시작번호
	private int endBlock; // block의 끝번호

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBlocksize() {
		return blocksize;
	}

	public void setBlocksize(int blocksize) {
		this.blocksize = blocksize;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}



}
