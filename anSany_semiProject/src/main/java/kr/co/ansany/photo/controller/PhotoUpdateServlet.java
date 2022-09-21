package kr.co.ansany.photo.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.ansany.photo.model.service.PhotoService;
import kr.co.ansany.photo.model.vo.Photo;

/**
 * Servlet implementation class PhotoUpdateServlet
 */
@WebServlet(name = "PhotoUpdate", urlPatterns = { "/photoUpdate.do" })
public class PhotoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PhotoUpdateServlet() {
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
		String saveDirectory = root + "upload/photo";

		int maxSize = 10 * 1024 * 1024;

		MultipartRequest mRquest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		int photoNo = Integer.parseInt(mRquest.getParameter("photoNo"));
		String photoTitle = mRquest.getParameter("photoTitle");
		String photoContent = mRquest.getParameter("photoContent");
		String status = mRquest.getParameter("status");
		String fileName = mRquest.getOriginalFileName("upFile");
		String filePath = mRquest.getFilesystemName("upFile");
		String oldFilePath = mRquest.getParameter("oldFilePath");
		String oldFileName = mRquest.getParameter("oldFileName");

		if (oldFileName != null && status.equals("stay")) {
			filePath = oldFilePath;
			fileName = oldFileName;
		}
		Photo p = new Photo();
		p.setPhotoNo(photoNo);
		p.setPhotoTitle(photoTitle);
		p.setPhotoContent(photoContent);
		p.setPhotoFilePath(filePath);
		p.setPhotoFileName(fileName);

		PhotoService service = new PhotoService();
		int result = service.updatePhoto(p);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if (result > 0) {
			request.setAttribute("title", "변경완료");
			request.setAttribute("msg", "게시글 수정완료");
			request.setAttribute("icon", "success");
			if (status.equals("delete")) {
				File delFile = new File(saveDirectory + "/" + oldFilePath);
				delFile.delete();
			}
		} else {
			request.setAttribute("title", "변경실패");
			request.setAttribute("msg", "다시 확인해주세요.");
			request.setAttribute("icon", "error");

		}
		request.setAttribute("loc", "/photoView.do?photoNo=" + photoNo);
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
