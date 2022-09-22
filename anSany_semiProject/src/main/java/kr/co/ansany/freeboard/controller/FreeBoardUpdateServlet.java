package kr.co.ansany.freeboard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.multi.MultiButtonUI;

import org.apache.tomcat.util.http.fileupload.RequestContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.ansany.freeboard.model.service.FreeBoardService;
import kr.co.ansany.freeboard.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardUpdateServlet
 */
@WebServlet(name = "FreeBoardUpdate", urlPatterns = { "/freeBoardUpdate.do" })
public class FreeBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FreeBoardUpdateServlet() {
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

		int freeBoardNo = Integer.parseInt(mRequest.getParameter("freeBoardNo"));
		String freeBoardTitle = mRequest.getParameter("freeBoardTitle");
		String freeBoardContent = mRequest.getParameter("freeBoardContent");
		String status = mRequest.getParameter("status");
		String fileName = mRequest.getOriginalFileName("upfile");
		String filePath = mRequest.getFilesystemName("upfile");

		String oldFilename = mRequest.getParameter("oldFilename");
		String oldFilepath = mRequest.getParameter("oldFilepath");

		if (oldFilename != null && status.equals("stay")) {
			fileName = oldFilename;
			filePath = oldFilepath;
		}

		FreeBoard f = new FreeBoard();
		f.setFreeBoardNo(freeBoardNo);
		f.setFreeBoardTitle(freeBoardTitle);
		f.setFreeBoardContent(freeBoardContent);
		f.setFreeBoardFilename(fileName);
		f.setFreeBoardFilepath(filePath);

		FreeBoardService service = new FreeBoardService();
		int result = service.updateFreeBoard(f);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if (result > 0) {
			request.setAttribute("title", "변경완료");
			request.setAttribute("msg", "공지사항 수정완료");
			request.setAttribute("icon", "success");
			if (status.equals("delete")) {
				File delFile = new File(saveDirectory + "/" + oldFilepath);
				delFile.delete();
			}
		} else {
			request.setAttribute("title", "변경실패");
			request.setAttribute("msg", "다시 확인해주세요.");
			request.setAttribute("icon", "error");

		}
		request.setAttribute("loc", "/freeBoardView.do?freeBoardNo=" + freeBoardNo);
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
