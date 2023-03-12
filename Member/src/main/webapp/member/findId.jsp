<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./findIdAction.me"  method="post" name="fid">
	
	<h3>아이디 찾기</h3>

	<label for="mem_name"> 이름 </label> 
	<input type="text" name="mem_name" id="mem_name" placeholder="이름을 입력하세요" required/>
		
	<label for="mem_email" > e-mail </label> 
	<input type="email" name="mem_email" id="mem_email" placeholder="이메일을 입력하세요" required/>

	<button type="submit" class="submit">아이디 찾기</button>
	
</form>

</body>
</html>