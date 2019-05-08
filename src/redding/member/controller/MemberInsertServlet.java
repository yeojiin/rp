package redding.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import redding.member.model.service.MemberService;
import redding.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insertMember.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberPwd2 = request.getParameter("memberPwd2");
		String memberName = request.getParameter("memberName");
		String nickName = request.getParameter("nickName");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		String con1 = request.getParameter("con1");
		String con2 = request.getParameter("con2");
		String con3 = request.getParameter("con3");
		String emergenCon = con1 + "-" + con2 + "-" + con3;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email3 = request.getParameter("email3");
		String email = email1 + "@" + email3;
		String gender = request.getParameter("gender");
		String condition1 = request.getParameter("condition1");
		String condition2 = request.getParameter("condition2");
		
		System.out.println("id : " + memberId + ", pwd : " + memberPwd + ", name : " +memberName + ", nickName : " + nickName + ", phone : " + phone + ", emergenCon : " + emergenCon + ", email : " + email + ", gender : " + gender + ", condition[1, 2] : " + condition1 + condition2);
		
		Member insertMember = new Member();
		insertMember.setMemberId(memberId);
		insertMember.setMemberPwd(memberPwd);
		insertMember.setMemberName(memberName);
		insertMember.setNickName(nickName);
		insertMember.setPhone(phone);
		insertMember.setEmergenCon(emergenCon);
		insertMember.setEmail(email);
		insertMember.setGender(gender);

		int result = new MemberService().insertMember(insertMember);
		
		String page = "";
		if(result > 0) {
			page = "index.jsp";
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원가입을 실패했습니다.");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
