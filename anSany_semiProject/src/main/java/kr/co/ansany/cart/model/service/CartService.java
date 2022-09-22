package kr.co.ansany.cart.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.co.ansany.cart.model.dao.CartDao;
import kr.co.ansany.cart.model.vo.Cart;

public class CartService {
	private CartDao dao;

	public CartService() {
		super();
		dao = new CartDao();
	}

	public ArrayList<Cart> selectAllCart(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Cart> list = dao.selectAllCart(conn,memberId);
		JDBCTemplate.close(conn);
		return list;
	}
}
