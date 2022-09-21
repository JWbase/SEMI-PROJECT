package kr.co.ansany.photo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.co.ansany.photo.model.vo.Photo;

public class PhotoDao {

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) as cnt from photo_tbl";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				totalCount = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return totalCount;
	}

	public ArrayList<Photo> morePhoto(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Photo> list = new ArrayList<Photo>();
		String query = "select * from (select rownum as rnum, p.* from (select * from photo_tbl order by 1 desc)p) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Photo p = new Photo();
				p.setPhotoFilePath(rset.getNString("photo_filepath"));
				p.setPhotoContent(rset.getString("photo_content"));
				p.setPhotoTitle(rset.getNString("photo_title"));
				p.setPhotoWriter(rset.getNString("photo_writer"));
				p.setPhotoNo(rset.getInt("photo_no"));
				p.setPhotoReadCount(rset.getInt("photo_readcount"));
				p.setPhotoDate(rset.getNString("photo_date"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}

		return list;
	}

	public int insertPhoto(Connection conn, Photo p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into photo_tbl values(photo_seq.nextval, ?, ?, ?, 0, to_char(sysdate, 'yyyy-mm-dd'), ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPhotoWriter());
			pstmt.setString(2, p.getPhotoTitle());
			pstmt.setString(3, p.getPhotoContent());
			pstmt.setString(4, p.getPhotoFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Photo selectOnePhoto(Connection conn, int photoNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Photo p = null;
		String query = "select * from photo_tbl where photo_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, photoNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				p = new Photo();
				p.setPhotoFilePath(rset.getNString("photo_filepath"));
				p.setPhotoContent(rset.getString("photo_content"));
				p.setPhotoTitle(rset.getNString("photo_title"));
				p.setPhotoWriter(rset.getNString("photo_writer"));
				p.setPhotoNo(rset.getInt("photo_no"));
				p.setPhotoReadCount(rset.getInt("photo_readcount"));
				p.setPhotoDate(rset.getNString("photo_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return p;
	}

	public int updateReadCount(Connection conn, int photoNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update photo_tbl set photo_readcount = photo_readcount + 1 where photo_no =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, photoNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteNotice(Connection conn, int photoNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from photo_tbl where photo_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, photoNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
