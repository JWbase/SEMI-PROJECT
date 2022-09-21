package kr.co.ansany.photo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.co.ansany.photo.model.dao.PhotoDao;
import kr.co.ansany.photo.model.vo.Photo;

public class PhotoService {
	private PhotoDao dao;

	public PhotoService() {
		super();
		dao = new PhotoDao();
	}

	public int totalCount() {
		Connection conn = JDBCTemplate.getConnection();
		int totalCount = dao.totalCount(conn);
		JDBCTemplate.close(conn);
		return totalCount;
	}

	public ArrayList<Photo> photoMore(int start, int amount) {
		Connection conn = JDBCTemplate.getConnection();
		int end = start + amount - 1;
		ArrayList<Photo> list = dao.morePhoto(conn, start, end);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertPhoto(Photo p) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertPhoto(conn, p);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Photo selectOnePhoto(int photoNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateReadCount(conn, photoNo);
		if (result > 0) {
			JDBCTemplate.commit(conn);
			Photo p = dao.selectOnePhoto(conn, photoNo);
			JDBCTemplate.close(conn);
			return p;
		} else {
			JDBCTemplate.rollback(conn);
			JDBCTemplate.close(conn);
			return null;
		}
	}

	public Photo deletePhoto(int photoNo) {
		Connection conn = JDBCTemplate.getConnection();
		Photo p = dao.selectOnePhoto(conn, photoNo);
		int result = dao.deleteNotice(conn, photoNo);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
			p = null;
		}
		JDBCTemplate.close(conn);
		return p;
	}

	public Photo getPhoto(int photoNo) {
		Connection conn = JDBCTemplate.getConnection();
		Photo p = dao.selectOnePhoto(conn, photoNo);
		JDBCTemplate.close(conn);
		return p;
	}

}
