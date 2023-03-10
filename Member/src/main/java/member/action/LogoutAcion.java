package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAcion implements Action {

	@Override
	public ActionForward execute(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" LogoutAction_execute() ");
		
		// 로그아웃 처리 -> 세션정보 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 페이지 이동 -> main 페이지
		// 1. 컨트롤러 사용 O
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.mv");
		forward.setRedirect(true);
		return forward;
				
	}

}
