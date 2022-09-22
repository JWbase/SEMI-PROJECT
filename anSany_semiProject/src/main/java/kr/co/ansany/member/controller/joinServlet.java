package kr.co.ansany.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ansany.member.model.service.MemberService;
import kr.co.ansany.member.model.vo.Member;

/**
 * Servlet implementation class joinServlet
 */
@WebServlet(name = "join", urlPatterns = { "/join.do" })
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinServlet() {
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
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberEmail = request.getParameter("memberEmail");
		String memberName = request.getParameter("memberName");
		String memberBirth = request.getParameter("memberBirth");
		String memberPhone = request.getParameter("memberPhone");
		
		Member m = new Member();
		
		m.setMemberId(memberId);
		m.setMemberPw(memberPw);
		m.setMemberEmail(memberEmail);
		m.setMemberName(memberName);
		m.setMemberBirth(memberBirth);
		m.setMemberPhone(memberPhone);
		
		//3. 비즈니스로직 
		MemberService service = new MemberService();
		int result = service.insertMember(m);
		
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "회원가입성공");
			request.setAttribute("msg", "환영합니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "회원가입실패");
			request.setAttribute("msg", "관리자에게 문의하세요");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/");
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
