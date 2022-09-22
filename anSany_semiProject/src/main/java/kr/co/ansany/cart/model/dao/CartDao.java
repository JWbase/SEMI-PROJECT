package kr.co.ansany.cart.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.co.ansany.cart.model.vo.Cart;

public class CartDao {

	public ArrayList<Cart> selectAllCart(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cart> list = new ArrayList<Cart>();
		String query = "select cart_no, product_img, product_name, product_price, order_qty from cart_tbl join product_tbl using(product_no) where member_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Cart c = new Cart();
				c.setCartNo(rset.getInt("cart_no"));
				c.setProductImg(rset.getString("product_img"));
				c.setProductName(rset.getString("product_name"));
				c.setProductPrice(rset.getInt("product_price"));
				c.setOrderQty(rset.getInt("order_qty"));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
