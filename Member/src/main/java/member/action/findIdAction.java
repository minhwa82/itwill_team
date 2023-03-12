package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class findIdAction implements Action {

	@Override
	public ActionForward execute(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : findIdAction_execute() 호출 ");
		
		// 전달정보 저장(Mm_name, Mem_email)
		String Mem_name = request.getParameter("Mem_name");
		String Mem_email = request.getParameter("Mem_email");
				
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.findId(Mem_name,Mem_email);

		request.setAttribute("dto", dto);
				
		// 페이지 이동
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
				
		ActionForward forward = new ActionForward();
				
		if(dto != null) {	
			
			forward.setPath("member/findIdResult.jsp");
			forward.setRedirect(false);
					
			return forward;
			
		}else {
			
			out.print("<script>");
			out.print(" alert('일치하는 정보가 없습니다.'); ");
			out.print(" location.href='./findId.me'; ");
			out.print("</script>");
			out.close();
					
			return null;
	
		}

	}

}
