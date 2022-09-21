package kr.co.ansany.photo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ansany.photo.model.service.PhotoService;
import kr.co.ansany.photo.model.vo.Photo;

/**
 * Servlet implementation class PhotoUpdateFrmServlet
 */
@WebServlet(name = "PhotoUpdateFrm", urlPatterns = { "/photoUpdateFrm.do" })
public class PhotoUpdateFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PhotoUpdateFrmServlet() {
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
		int photoNo = Integer.parseInt(request.getParameter("photoNo"));
		PhotoService service = new PhotoService();
		Photo p = service.getPhoto(photoNo);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/photo/updatePhotoFrm.jsp");
		request.setAttribute("p", p);
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
