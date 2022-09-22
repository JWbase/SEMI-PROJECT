package kr.co.ansany.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.co.ansany.member.model.service.MemberService;
import kr.co.ansany.member.model.vo.Member;

/**
 * Servlet implementation class deleteMemberServlet
 */
@WebServlet(name = "deleteMember", urlPatterns = { "/deleteMember.do" })
public class deleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("m");
		String memberId = m.getMemberId();
		m.setMemberId(memberId);
		
		//3. 비즈니스로직
		MemberService service = new MemberService();
		int result = service.deleteMember(memberId);

		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "회원탈퇴 성공");
			request.setAttribute("msg", "회원 정보가 삭제되었습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/logout.do");
		}else {
			request.setAttribute("title", "삭제실패");
			request.setAttribute("msg", "관리자에게 문의하세요");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/myPage.do?memberId="+memberId);
		}
		
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
