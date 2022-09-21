package kr.co.ansany.photo.model.vo;

import java.util.ArrayList;

public class PhotoViewData {
	private Photo p;
	private ArrayList<PhotoComment> commentList;
	private ArrayList<PhotoComment> reCommentList;
	public PhotoViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PhotoViewData(Photo p, ArrayList<PhotoComment> commentList, ArrayList<PhotoComment> reCommentList) {
		super();
		this.p = p;
		this.commentList = commentList;
		this.reCommentList = reCommentList;
	}
	public Photo getP() {
		return p;
	}
	public void setP(Photo p) {
		this.p = p;
	}
	public ArrayList<PhotoComment> getCommentList() {
		return commentList;
	}
	public void setCommentList(ArrayList<PhotoComment> commentList) {
		this.commentList = commentList;
	}
	public ArrayList<PhotoComment> getReCommentList() {
		return reCommentList;
	}
	public void setReCommentList(ArrayList<PhotoComment> reCommentList) {
		this.reCommentList = reCommentList;
	}
	
}
