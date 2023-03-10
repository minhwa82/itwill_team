package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberDAO;
import member.db.MemberDTO;

public class DeleteAction implements Action {

	@Override
	public ActionForward execute(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : DelteAction_0xecute() ");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
	
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./Login.mv");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(request.getParameter("id"));
		dto.setMem_pw(request.getParameter("pw"));
		
		int result = dao.deleteMember(dto);
				
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if(result == 0) { //로그인 비번오류
			
			out.print("<script>");
			out.print("alert('비밀번호 오류');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null; 
			
		} else if(result == -1) {
			
			out.print("<script>");
			out.print("alert('존재하지 않는 아이디입니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null; 	
			
		}
		
		// if(result == 1)
		session.invalidate();
		System.out.println(" 회원탈퇴 성공 ");
		
		out.print("<script>");
		out.print("alert('회원탈퇴 성공');");
		out.print("location.href='./Main.mv';");
		out.print("</script>");
		out.close();
		return null;
	}

}
