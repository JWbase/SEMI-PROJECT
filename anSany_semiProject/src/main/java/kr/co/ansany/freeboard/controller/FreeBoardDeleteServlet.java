package kr.co.ansany.freeboard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ansany.freeboard.model.service.FreeBoardService;
import kr.co.ansany.freeboard.model.vo.FreeBoard;
import kr.co.ansany.notice.model.service.NoticeService;
import kr.co.ansany.notice.model.vo.Notice;

/**
 * Servlet implementation class FreeBoardDeleteServlet
 */
@WebServlet(name = "FreeBoardDelete", urlPatterns = { "/freeBoardDelete.do" })
public class FreeBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FreeBoardDeleteServlet() {
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
		FreeBoard f = service.deleteFreeBoard(freeBoardNo);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if (f != null) {
			
			if (f.getFreeBoardFilepath() != null) {
				String root = getServletContext().getRealPath("/");
				String deleteFile = root + "upload/freeBoard/" + f.getFreeBoardFilepath();
				File delFile = new File(deleteFile);
				delFile.delete();
			}
			request.setAttribute("title", "삭제완료");
			request.setAttribute("msg", "삭제가 완료되었습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/freeBoardList.do?reqPage=1");
		} else {
			request.setAttribute("title", "삭제실패");
			request.setAttribute("msg", "관리자에게 문의하세요.");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/freeBoardView.do?freeBoardNo=" + freeBoardNo);
		}
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
