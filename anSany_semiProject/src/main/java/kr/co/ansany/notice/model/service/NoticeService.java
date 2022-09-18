package kr.co.ansany.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.co.ansany.notice.model.dao.NoticeDao;
import kr.co.ansany.notice.model.vo.Notice;
import kr.co.ansany.notice.model.vo.NoticePageData;

public class NoticeService {

	private NoticeDao dao;

	public NoticeService() {
		super();
		dao = new NoticeDao();
	}

	public NoticePageData selectNoticeList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10; // 페이지당 게시물 수
		int end = numPerPage * reqPage;
		int start = end - numPerPage + 1;
		ArrayList<Notice> list = dao.selectNoticeList(conn, start, end);
		int totalCount = dao.selectNoticeCount(conn);
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
			pageNavi += "<li class='page-item'><a class='page-link' href='/noticeList.do?reqPage=" + (pageNo - 1)
					+ "'>Previous</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item active' aria-current='page'><a class='page-link' href='/noticeList.do?reqPage="
						+ pageNo + "'>" + pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/noticeList.do?reqPage=" + pageNo + "'>"
						+ pageNo + "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/noticeList.do?reqPage=" + pageNo
					+ "'>Next</a></li>";
		}
		pageNavi += "</ul>";
		pageNavi += "</nav>";
		NoticePageData npd = new NoticePageData(list, pageNavi);
		JDBCTemplate.close(conn);

		return npd;
	}

}