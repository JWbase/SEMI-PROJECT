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
 * Servlet implementation class updateMemberInfoServlet
 */
@WebServlet(name = "updateMemberInfo", urlPatterns = { "/updateMemberInfo.do" })
public class updateMemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateMemberInfoServlet() {
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
		String memberPw = request.getParameter("memberPw");
		String memberEmail = request.getParameter("memberEmail");
		String memberPhone = request.getParameter("memberPhone");
		String addr1 = request.getParameter("memberAddr1");
		String addr2 = request.getParameter("memberAddr2");
		String addr3 = request.getParameter("memberAddr3");
		String memberAddr = addr1+"*"+addr2+ "*"+addr3;
		//정보수정
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("m");
		int memberNo = m.getMemberNo();
		String memberId = m.getMemberId();
		
		Member member = new Member();
		
		member.setMemberNo(memberNo);
		member.setMemberPw(memberPw);
		member.setMemberEmail(memberEmail);
		member.setMemberPhone(memberPhone);
		member.setMemberAddr(memberAddr);
		
		//3.비즈니스로직
		MemberService service = new  MemberService();
		int result = service.updateMemberInfo(member);
		//4.결좌처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			m.setMemberPw(memberPw);
			m.setMemberEmail(memberEmail);
			m.setMemberPhone(memberPhone);
			m.setMemberAddr(memberAddr);
			request.setAttribute("title", "정보변경 성공");
			request.setAttribute("msg", "정보가 변경되었습니다 !!");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "정보변경 실패");
			request.setAttribute("msg", "정보변경에 실패했습니다.");
			request.setAttribute("icon", "error");
		}
		
		request.setAttribute("loc", "/myPageFrm.do?memberId="+memberId);
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
