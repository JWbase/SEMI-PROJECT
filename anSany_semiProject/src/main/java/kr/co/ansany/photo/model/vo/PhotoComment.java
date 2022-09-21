package kr.co.ansany.photo.model.vo;

public class PhotoComment {
	private int pCommentNo;
	private String pCommentWriter;
	private String pCommentContent;
	private String pCommentDate;
	private int photoRef;
	private int pCommentRef;

	public PhotoComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PhotoComment(int pCommentNo, String pCommentWriter, String pCommentContent, String pCommentDate,
			int photoRef, int pCommentRef) {
		super();
		this.pCommentNo = pCommentNo;
		this.pCommentWriter = pCommentWriter;
		this.pCommentContent = pCommentContent;
		this.pCommentDate = pCommentDate;
		this.photoRef = photoRef;
		this.pCommentRef = pCommentRef;
	}

	public int getpCommentNo() {
		return pCommentNo;
	}

	public void setpCommentNo(int pCommentNo) {
		this.pCommentNo = pCommentNo;
	}

	public String getpCommentWriter() {
		return pCommentWriter;
	}

	public void setpCommentWriter(String pCommentWriter) {
		this.pCommentWriter = pCommentWriter;
	}

	public String getpCommentContent() {
		return pCommentContent;
	}

	public String getpCommentContentBr() {
		return pCommentContent.replaceAll("\r\n", "<br>");
	}

	public void setpCommentContent(String pCommentContent) {
		this.pCommentContent = pCommentContent;
	}

	public String getpCommentDate() {
		return pCommentDate;
	}

	public void setpCommentDate(String pCommentDate) {
		this.pCommentDate = pCommentDate;
	}

	public int getPhotoRef() {
		return photoRef;
	}

	public void setPhotoRef(int photoRef) {
		this.photoRef = photoRef;
	}

	public int getpCommentRef() {
		return pCommentRef;
	}

	public void setpCommentRef(int pCommentRef) {
		this.pCommentRef = pCommentRef;
	}
}