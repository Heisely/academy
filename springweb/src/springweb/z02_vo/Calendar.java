package springweb.z02_vo;

// springweb.z02_vo.Calendar
public class Calendar {
	private int id;
//	groupId가 null로 있는 경우 수정 시 bug발생
//	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start;
	private String end;
	private boolean allDay;
	private String textColor;
	private String backgroundColor;
	private String borderColor;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
/*
	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
*/
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getBorderColor() {
		return borderColor;
	}

	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}

}
