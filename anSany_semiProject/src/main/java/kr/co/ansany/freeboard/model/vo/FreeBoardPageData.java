package kr.co.ansany.freeboard.model.vo;

import java.util.ArrayList;

public class FreeBoardPageData {
	private ArrayList<FreeBoard> list;
	private String pageNavi;
	public FreeBoardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeBoardPageData(ArrayList<FreeBoard> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<FreeBoard> getList() {
		return list;
	}
	public void setList(ArrayList<FreeBoard> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
