package kr.co.ansany.freeboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.co.ansany.freeboard.model.dao.FreeBoardDao;
import kr.co.ansany.freeboard.model.vo.FreeBoard;
import kr.co.ansany.freeboard.model.vo.FreeBoardPageData;

public class FreeBoardService {

	private FreeBoardDao dao;

	public FreeBoardService() {
		super();
		dao = new FreeBoardDao();
	}

	public FreeBoardPageData selectFreeBoardList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10; // 페이지당 게시물 수
		int end = numPerPage * reqPage;
		int start = end - numPerPage + 1;
		ArrayList<FreeBoard> list = dao.selectFreeBoardList(conn, start, end);
		int totalCount = dao.selectFreeBoardCount(conn);
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int pageNaviSize = 10;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		String pageNavi = "<nav aria-label='Page navigation example'>";
		pageNavi += "<ul class='pagination'>";
		if (pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/freeBoardList.do?reqPage=" + (pageNo - 1)
					+ "'>Previous</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item active' aria-current='page'><a class='page-link' href='/freeBoardList.do?reqPage="
						+ pageNo + "'>" + pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/freeBoardList.do?reqPage=" + pageNo + "'>"
						+ pageNo + "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/freeBoardList.do?reqPage=" + pageNo
					+ "'>Next</a></li>";
		}
		pageNavi += "</ul>";
		pageNavi += "</nav>";
		FreeBoardPageData fpd = new FreeBoardPageData(list, pageNavi);
		JDBCTemplate.close(conn);

		return fpd;
	}

	public int insertFreeBoard(FreeBoard p) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertFreeBoard(conn, p);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public FreeBoard selectOnefreeBoard(int freeBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateReadCount(conn, freeBoardNo);
		if (result > 0) {
			JDBCTemplate.commit(conn);
			FreeBoard f = dao.selectOneFreeBoard(conn, freeBoardNo);
			JDBCTemplate.close(conn);
			return f;
		} else {
			JDBCTemplate.rollback(conn);
			JDBCTemplate.close(conn);
			return null;
		}
	}

	public FreeBoard getFreeBoard(int freeBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		FreeBoard f = dao.selectOneFreeBoard(conn, freeBoardNo);
		JDBCTemplate.close(conn);
		return f;
	}

	public FreeBoard deleteFreeBoard(int freeBoardNo) {
		Connection conn = JDBCTemplate.getConnection();
		FreeBoard n = dao.selectOneFreeBoard(conn, freeBoardNo);
		int result = dao.deleteFreeBoard(conn, freeBoardNo);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
			n = null;
		}
		JDBCTemplate.close(conn);
		return n;
	}

	public int updateFreeBoard(FreeBoard f) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateFreeBoard(conn, f);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}