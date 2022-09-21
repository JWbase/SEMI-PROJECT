package kr.co.ansany.photo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.co.ansany.photo.model.vo.Photo;
import kr.co.ansany.photo.model.vo.PhotoComment;

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
				p.setPhotoFilePath(rset.getString("photo_filepath"));
				p.setPhotoFileName(rset.getString("photo_filename"));
				p.setPhotoContent(rset.getString("photo_content"));
				p.setPhotoTitle(rset.getString("photo_title"));
				p.setPhotoWriter(rset.getString("photo_writer"));
				p.setPhotoNo(rset.getInt("photo_no"));
				p.setPhotoReadCount(rset.getInt("photo_readcount"));
				p.setPhotoDate(rset.getString("photo_date"));
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
		String query = "insert into photo_tbl values(photo_seq.nextval, ?, ?, ?, 0, to_char(sysdate, 'yyyy-mm-dd'),?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPhotoWriter());
			pstmt.setString(2, p.getPhotoTitle());
			pstmt.setString(3, p.getPhotoContent());
			pstmt.setString(4, p.getPhotoFilePath());
			pstmt.setString(5, p.getPhotoFileName());
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
				p.setPhotoFilePath(rset.getString("photo_filepath"));
				p.setPhotoFileName(rset.getString("photo_filename"));
				p.setPhotoContent(rset.getString("photo_content"));
				p.setPhotoTitle(rset.getString("photo_title"));
				p.setPhotoWriter(rset.getString("photo_writer"));
				p.setPhotoNo(rset.getInt("photo_no"));
				p.setPhotoReadCount(rset.getInt("photo_readcount"));
				p.setPhotoDate(rset.getString("photo_date"));
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

	public int updatePhoto(Connection conn, Photo p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update photo_tbl set photo_title=?, photo_content=?,photo_filepath=?,photo_filename=? where photo_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPhotoTitle());
			pstmt.setString(2, p.getPhotoContent());
			pstmt.setString(3, p.getPhotoFilePath());
			pstmt.setString(4, p.getPhotoFileName());
			pstmt.setInt(5, p.getPhotoNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertPhotoComment(Connection conn, PhotoComment pc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into photo_comment_tbl values(pcomment_seq.nextval,?,?,to_char(sysdate,'yyyy-mm-dd'),?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pc.getpCommentWriter());
			pstmt.setString(2, pc.getpCommentContent());
			pstmt.setInt(3, pc.getPhotoRef());
			pstmt.setString(4, (pc.getpCommentRef() == 0) ? null : String.valueOf(pc.getpCommentRef()));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<PhotoComment> selectPhotoCommentList(Connection conn, int photoNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PhotoComment> list = new ArrayList<PhotoComment>();
		String query = "select * from photo_comment_tbl where photo_ref = ? and pcomment_ref is null order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, photoNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				PhotoComment pc = new PhotoComment();
				pc.setpCommentContent(rset.getString("pcomment_content"));
				pc.setpCommentDate(rset.getString("pcomment_date"));
				pc.setpCommentNo(rset.getInt("pcomment_no"));
				pc.setpCommentRef(rset.getInt("pcomment_ref"));
				pc.setpCommentWriter(rset.getString("pcomment_writer"));
				pc.setPhotoRef(rset.getInt("photo_ref"));
				list.add(pc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<PhotoComment> selectPhotoReCommentList(Connection conn, int photoNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PhotoComment> list = new ArrayList<PhotoComment>();
		String query = "select * from photo_comment_tbl where photo_ref = ? and pcomment_ref is not null order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, photoNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				PhotoComment pc = new PhotoComment();
				pc.setpCommentContent(rset.getString("pcomment_content"));
				pc.setpCommentDate(rset.getString("pcomment_date"));
				pc.setpCommentNo(rset.getInt("pcomment_no"));
				pc.setpCommentRef(rset.getInt("pcomment_ref"));
				pc.setpCommentWriter(rset.getString("pcomment_writer"));
				pc.setPhotoRef(rset.getInt("photo_ref"));
				list.add(pc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}