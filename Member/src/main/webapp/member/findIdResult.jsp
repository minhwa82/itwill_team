<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>아이디 찾기 완료</h1>

<h3>아이디 찾기</h3>
<p>회원님의 아이디는 다음과 같습니다.</p>

<form action="./findIdAction.me" method="post">
	<input type="text" name="mem_id" id="mem_id" value="${dto.Mem_id}" readonly />

	<button type="button" class="formbold-btn" onclick="location.href='./Login.me'">로그인</button>
</form>

</body>
</html>