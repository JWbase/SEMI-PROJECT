package kr.co.ansany.photo.model.vo;

public class Photo {
	private int photoNo;
	private String photoWriter;
	private String photoTitle;
	private String photoContent;
	private int photoReadCount;
	private String photoDate;
	private String photoFilePath;
	private String photoFileName;

	public Photo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Photo(int photoNo, String photoWriter, String photoTitle, String photoContent, int photoReadCount,
			String photoDate, String photoFilePath, String photoFileName) {
		super();
		this.photoNo = photoNo;
		this.photoWriter = photoWriter;
		this.photoTitle = photoTitle;
		this.photoContent = photoContent;
		this.photoReadCount = photoReadCount;
		this.photoDate = photoDate;
		this.photoFilePath = photoFilePath;
		this.photoFileName = photoFileName;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public String getPhotoWriter() {
		return photoWriter;
	}

	public void setPhotoWriter(String photoWriter) {
		this.photoWriter = photoWriter;
	}

	public String getPhotoTitle() {
		return photoTitle;
	}

	public void setPhotoTitle(String photoTitle) {
		this.photoTitle = photoTitle;
	}

	public String getPhotoContent() {
		return photoContent;
	}

	public String getPhotoContentBr() {
		return photoContent.replaceAll("\r\n", "<br>");
	}

	public void setPhotoContent(String photoContent) {
		this.photoContent = photoContent;
	}

	public int getPhotoReadCount() {
		return photoReadCount;
	}

	public void setPhotoReadCount(int photoReadCount) {
		this.photoReadCount = photoReadCount;
	}

	public String getPhotoDate() {
		return photoDate;
	}

	public void setPhotoDate(String photoDate) {
		this.photoDate = photoDate;
	}

	public String getPhotoFilePath() {
		return photoFilePath;
	}

	public void setPhotoFilePath(String photoFilePath) {
		this.photoFilePath = photoFilePath;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

}
