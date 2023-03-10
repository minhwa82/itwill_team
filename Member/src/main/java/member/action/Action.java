package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 동작(DB 사용) 통일하기 위해 인터페이스 사용 => 다형성
public interface Action {
	/**
	 * 
	 * @param request
	 * @param response
	 * @return ActionForward (이동정보)
	 * @throws Exception
	 */
	public ActionForward execute(
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
