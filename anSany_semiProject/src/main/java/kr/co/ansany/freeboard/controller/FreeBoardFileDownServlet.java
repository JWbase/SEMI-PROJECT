package kr.co.ansany.freeboard.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ansany.freeboard.model.service.FreeBoardService;
import kr.co.ansany.freeboard.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardFileDownServlet
 */
@WebServlet(name = "FreeBoardFileDown", urlPatterns = { "/freeBoardFileDown.do" })
public class FreeBoardFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FreeBoardFileDownServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int freeBoardNo = Integer.parseInt(request.getParameter("freeBoardNo"));
		FreeBoardService service = new FreeBoardService();
		FreeBoard f = service.getFreeBoard(freeBoardNo);

		String root = getServletContext().getRealPath("/");
		String downFile = root + "upload/freeBoard/" + f.getFreeBoardFilepath();
		FileInputStream fis = new FileInputStream(downFile);
		BufferedInputStream bis = new BufferedInputStream(fis);
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);

		String resFilename = new String(f.getFreeBoardFilename().getBytes("UTF-8"), "ISO-8859-1");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + resFilename);

		while (true) {
			int read = bis.read();
			if (read != -1) {
				bos.write(read);
			} else {
				break;
			}
		}
		bos.close();
		bis.close();
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
