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
 * Servlet implementation class loginServlet
 */
@WebServlet(name = "login", urlPatterns = { "/login.do" })
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값추출
		String memberId = request.getParameter("signId");
		String memberPw = request.getParameter("signPw");
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		//3.비즈니스로직
		MemberService service = new MemberService();
		Member m = service.selectOneMember(member);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(m!=null) {
			//로그인성공
			request.setAttribute("title", "로그인 성공");
			request.setAttribute("msg", "환영합니다");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/");
			//로그인 성공시 로그인 유지
			HttpSession session = request.getSession();
			session.setAttribute("m", m);
		}else {
			//로그인실패
			request.setAttribute("title", "로그인 권한없음");
			request.setAttribute("msg", "로그인 권한이 없습니다. 관리자에게 문의하세요");
			request.setAttribute("icon", "warning");
			request.setAttribute("loc", "/");
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
