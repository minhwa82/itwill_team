package member.action;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberLogoutAction_execute() 호출 ");
		
		// 로그아웃 처리 -> 세션정보 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 페이지 이동 -> main 페이지
		// 1. 컨트롤러 사용 O
//		ActionForward forward = new ActionForward();
//		forward.setPath("./Main.me");
//		forward.setRedirect(true);
//		return forward;
		
		// 2. 컨트롤러 사용 X, 자바스크립트 사용
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<script>");
		out.write(" alert('로그아웃 성공!'); ");
		out.write(" location.href='./Main.me'; ");
		out.write("</script>");
		out.close(); // 자원해제
		return null;
			
	}

}
