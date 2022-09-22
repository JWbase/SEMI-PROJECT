package kr.co.ansany.freeboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ansany.freeboard.model.service.FreeBoardService;
import kr.co.ansany.freeboard.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardViewServlet
 */
@WebServlet(name = "FreeBoardViewServlet", urlPatterns = { "/freeBoardView.do" })
public class FreeBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FreeBoardViewServlet() {
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

		int freeBoardNo = Integer.parseInt(request.getParameter("freeBoardNo"));

		FreeBoardService service = new FreeBoardService();
		FreeBoard f = service.selectOnefreeBoard(freeBoardNo);

		if (f == null) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("title", "조회실패");
			request.setAttribute("msg", "게시글이 존재하지 않습니다.");
			request.setAttribute("icon", "info");
			request.setAttribute("loc", "/freeBoardList.do?reqPage=1");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/freeBoard/freeBoardView.jsp");
			request.setAttribute("f", f);
			view.forward(request, response);
		}
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
