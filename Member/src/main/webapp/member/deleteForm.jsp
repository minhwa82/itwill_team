<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 회원 탈퇴</h2>
	
	<!-- 비밀번호 입력받아서 삭제 -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("./Login.me");
	}
	%>
	
	<!--  회원 비밀번호만 입력받아서 deletePro.jsp 페이지 이동후 삭제
		  비밀번호와 db 비밀번호 일치 -> 삭제하면 안됨 비번이 같은 회원이 있을 수 있음 -->
	<fieldset>
		<form action="./DeleteAction.me" method="post">
		<input type="hidden" name="id" value="<%=id%>">
		비밀번호 
		<input type="password" name="pw" > <br>
		<input type="submit" value="회원탈퇴">
			
	</form>
</fieldset>

</body>
</html>