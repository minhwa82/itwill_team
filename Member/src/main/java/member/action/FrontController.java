package member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.me")
public class FrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : MemberFrontController - doPROCESS! ");
		
		///////////////////////// 1. 가상 주소 계산 /////////////////////////
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getRequestURL());		
/*		URI와 URL 차이 -> URI에서 내 프로젝트명을 뺀 /*.me 만 들고다님 */
		System.out.println("\n\n 1. 가상주소 계산 - 시작 ");
		
		String requestURI = request.getRequestURI(); // 가상주소 가져옴
		System.out.println(" C : requestURI - " + requestURI);
		String ctxPath = request.getContextPath(); // 프로젝트명 호출 
		System.out.println(" C : ctxPath - " + ctxPath); 
		String command = requestURI.substring(ctxPath.length()); // ctxPath 배열의 길이부터 끝까지 잘라와라
		System.out.println(" C : command - " + command);
		
		System.out.println("\n 1. 가상주소 계산 - 끝 ");
		///////////////////////// 1. 가상 주소 계산 /////////////////////////
		
		
		
		///////////////////////// 2. 가상 주소 매핑 /////////////////////////
		System.out.println("\n\n 2. 가상주소 매핑 - 시작 ");
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/Join.mv")) {
			System.out.println(" C : /join.me 호출! ");
			System.out.println(" C : DB 동작 필요 없음, view 필요");
			
			// 패턴1
			forward = new ActionForward();
			forward.setPath("./member/insertForm.jsp");
			forward.setRedirect(false);
		} 
		
		else if(command.equals("/Main.me")) {
			System.out.println(" C : /Main.me 호출");
			System.out.println(" C : DB 사용 X, view 필요");
			
			// 패턴1
			forward = new ActionForward();
			forward.setPath("./main/main.jsp");
			forward.setRedirect(false);
		}
		else if (command.equals("/Login.me")) {
			System.out.println(" C : /Login.me 호출! ");
			
			// 패턴1
			forward = new ActionForward();
			forward.setPath("./member/loginForm_t.jsp");
			forward.setRedirect(false); 
		} 
		
		else if (command.equals("/LoginAction.me")) {
			System.out.println(" C : /LoginAction.me 호출! ");
			System.out.println(" C : DB 동작 필요, view 이동  ");
			
			// 패턴2
			action = new LoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/NaverLogin.me")) {
			System.out.println(" C : /NaverLogin.me 호출 ");
			
			forward = new ActionForward();
			forward.setPath("./member/naverLogin.jsp");
			forward.setRedirect(false);	
					
		}
		else if(command.equals("/NaverLoginAction.me")) {
			System.out.println(" C : /NaverLoginAction.me 호출 ");
			
			action = new NaverLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		else if (command.equals("/LogoutAction.me")) {
			System.out.println(" C : /LogoutAction.me 호출! ");
			
			action = new LogoutAcion();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/Delete.me")) {
			
			forward = new ActionForward();
			forward.setPath("./member/deleteForm.jsp");
			forward.setRedirect(false); 
			
		}
		else if(command.equals("/DeleteAction.me")) {
			
			// 패턴2
			action = new DeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}				
		}
		else if(command.equals("/MyTicket.me")) {
			
			action = new MyTicketAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/MyPage.me")) {
			System.out.println(" C : /MyPage.me 호출! ");
			
			// 패턴1
			forward = new ActionForward();
			forward.setPath("./member/myPage.jsp");
			forward.setRedirect(false); 
		}
		else if(command.equals("/Bonus.me")) {
			System.out.println(" C : Bonus.me 호출 ");
			action = new BonusAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/findId.me")) {
			System.out.println(" C : /findId.me 호출 ");
			
			forward = new ActionForward();
			forward.setPath("./member/findId.jsp");
			forward.setRedirect(false);
			
		}
		else if(command.equals("/findIdAction.me")) {
			System.out.println(" C : /findIdAction.me 호출 ");
			
			// MemberFindIdAction.me() 객체
			action = new findIdAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/findIdResult.me")) {
			System.out.println(" C : /fFindIdResult.me 호출 ");

			forward = new ActionForward();
			forward.setPath("./member/findIdResult.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/findPw.me")) {
			System.out.println(" C : /findPw.me 호출 ");

			forward = new ActionForward();
			forward.setPath("./member/findPw.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/findPwAction.me")) {
			System.out.println(" C : /findPwAction.me 호출");

			// MemberFindPwAction.me() 객체
			action = new findPwAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/findPwResult.me")) {
			System.out.println(" C : /findPwResult.me 호출 ");

			forward = new ActionForward();
			forward.setPath("./member/findPwResult.jsp");
			forward.setRedirect(false);
		}
		

		System.out.println("\n 2. 가상주소 매핑 - 끝 ");
		///////////////////////// 2. 가상 주소 매핑 /////////////////////////
		
		
		
		///////////////////////// 3. 가상 주소 이동 /////////////////////////
		System.out.println("\n\n 3. 가상주소 이동 - 시작 ");
		if(forward != null) { // 이동정보가 있을때
			
			if(forward.isRedirect()) { // true 
				System.out.println(" C : 방식 - " + forward.isRedirect() 
									+ ", 주소 - " + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else { // false
				System.out.println(" C : 방식 - " + forward.isRedirect() 
									+ ", 주소 - " + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
			
		}
		System.out.println("\n 3. 가상주소 이동 - 끝 ");
		///////////////////////// 3. 가상 주소 이동 /////////////////////////
	
	}
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : MemberFrontController - doGET! ");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : MemberFrontController - doPOST! ");
		doProcess(request, response);
	}
	
}
