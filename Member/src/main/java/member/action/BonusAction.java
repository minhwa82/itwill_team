package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberDAO;
import member.db.MemberDTO;

public class BonusAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
								 HttpServletResponse response) throws Exception {
		System.out.println(" M : BonusAction_execute 호출");
		
		// 세션제어
		HttpSession session = request.getSession();
		String Mem_id = (String)session.getAttribute("id");
		
		System.out.println(Mem_id);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(Mem_id);
		request.setAttribute("dto", dto);
		System.out.println(dto);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/bonus.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
