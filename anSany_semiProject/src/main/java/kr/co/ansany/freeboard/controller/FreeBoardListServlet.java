package kr.co.ansany.freeboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ansany.freeboard.model.service.FreeBoardService;
import kr.co.ansany.freeboard.model.vo.FreeBoardPageData;

/**
 * Servlet implementation class FreeBoardListServlet
 */
@WebServlet(name = "FreeBoardList", urlPatterns = { "/freeBoardList.do" })
public class FreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FreeBoardListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		FreeBoardService service = new FreeBoardService();
		FreeBoardPageData fpd = service.selectFreeBoardList(reqPage);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/freeBoard/freeBoardList.jsp");
		request.setAttribute("list", fpd.getList());
		request.setAttribute("pageNavi", fpd.getPageNavi());
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
