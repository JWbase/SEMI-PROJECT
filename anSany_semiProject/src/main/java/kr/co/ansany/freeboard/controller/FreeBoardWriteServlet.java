package kr.co.ansany.freeboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.ansany.freeboard.model.service.FreeBoardService;
import kr.co.ansany.freeboard.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardWriteServlet
 */
@WebServlet(name = "FreeBoardWrite", urlPatterns = { "/freeBoardWrite.do" })
public class FreeBoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FreeBoardWriteServlet() {
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
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload/freeBoard";
		int maxSize = 10 * 1024 * 1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		String freeBoardTitle = mRequest.getParameter("freeBoardTitle");
		String freeBoardWriter = mRequest.getParameter("freeBoardWriter");
		String freeBoardContent = mRequest.getParameter("freeBoardContent");
		String freeBoardFilename = mRequest.getOriginalFileName("upfile");
		String freeBoardFilepath = mRequest.getFilesystemName("upfile");
		FreeBoard f = new FreeBoard();
		f.setFreeBoardTitle(freeBoardTitle);
		f.setFreeBoardWriter(freeBoardWriter);
		f.setFreeBoardContent(freeBoardContent);
		f.setFreeBoardFilename(freeBoardFilename);
		f.setFreeBoardFilepath(freeBoardFilepath);

		FreeBoardService service = new FreeBoardService();
		int result = service.insertFreeBoard(f);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if (result > 0) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "게시글이 등록 되었습니다.");
			request.setAttribute("icon", "success");
		} else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "등록에 실패했습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/freeBoardList.do?reqPage=1");
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
