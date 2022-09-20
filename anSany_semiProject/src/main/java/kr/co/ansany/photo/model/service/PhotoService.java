package kr.co.ansany.photo.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import kr.co.ansany.photo.model.dao.PhotoDao;

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

}
