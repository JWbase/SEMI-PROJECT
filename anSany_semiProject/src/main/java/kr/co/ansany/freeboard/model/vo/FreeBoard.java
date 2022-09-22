package kr.co.ansany.freeboard.model.vo;

public class FreeBoard {
	private int freeBoardNo;
	private String freeBoardTitle;
	private String freeBoardWriter;
	private String freeBoardContent;
	private int freeBoardReadCount;
	private String freeBoardDate;
	private String freeBoardFilename;
	private String freeBoardFilepath;

	public int getFreeBoardNo() {
		return freeBoardNo;
	}

	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}

	public String getFreeBoardTitle() {
		return freeBoardTitle;
	}

	public void setFreeBoardTitle(String freeBoardTitle) {
		this.freeBoardTitle = freeBoardTitle;
	}

	public String getFreeBoardWriter() {
		return freeBoardWriter;
	}

	public void setFreeBoardWriter(String freeBoardWriter) {
		this.freeBoardWriter = freeBoardWriter;
	}

	public String getfreeBoardContentBr() {
		return freeBoardContent.replaceAll("\r\n", "<br>");
	}

	public String getFreeBoardContent() {
		return freeBoardContent;
	}

	public void setFreeBoardContent(String freeBoardContent) {
		this.freeBoardContent = freeBoardContent;
	}

	public int getFreeBoardReadCount() {
		return freeBoardReadCount;
	}

	public void setFreeBoardReadCount(int freeBoardReadCount) {
		this.freeBoardReadCount = freeBoardReadCount;
	}

	public String getFreeBoardDate() {
		return freeBoardDate;
	}

	public void setFreeBoardDate(String freeBoardDate) {
		this.freeBoardDate = freeBoardDate;
	}

	public String getFreeBoardFilename() {
		return freeBoardFilename;
	}

	public void setFreeBoardFilename(String freeBoardFilename) {
		this.freeBoardFilename = freeBoardFilename;
	}

	public String getFreeBoardFilepath() {
		return freeBoardFilepath;
	}

	public void setFreeBoardFilepath(String freeBoardFilepath) {
		this.freeBoardFilepath = freeBoardFilepath;
	}

	public FreeBoard(int freeBoardNo, String freeBoardTitle, String freeBoardWriter, String freeBoardContent,
			int freeBoardReadCount, String freeBoardDate, String freeBoardFilename, String freeBoardFilepath) {
		super();
		this.freeBoardNo = freeBoardNo;
		this.freeBoardTitle = freeBoardTitle;
		this.freeBoardWriter = freeBoardWriter;
		this.freeBoardContent = freeBoardContent;
		this.freeBoardReadCount = freeBoardReadCount;
		this.freeBoardDate = freeBoardDate;
		this.freeBoardFilename = freeBoardFilename;
		this.freeBoardFilepath = freeBoardFilepath;
	}

	public FreeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

}