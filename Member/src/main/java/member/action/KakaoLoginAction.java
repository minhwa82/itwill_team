package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class KakaoLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		HttpSession session = request.getSession();
			
		session.setAttribute("id", request.getParameter("id"));
			
		HttpSession sessionKakao=request.getSession();
		sessionKakao.setAttribute("logoutValue", 101);
			
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.mv");
		forward.setRedirect(true);

		return forward;
	}

}