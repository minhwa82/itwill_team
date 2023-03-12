<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>로그인 테스트</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="crossorigin="anonymous">

</script> 
</head>

<body>

	<h1>안영화세요</h1>
	
	<form action="./LoginAction.me" method="post">
		아이디 <input type="text" name="id"> <br>
		비밀번호 <input type="password" name="pw"> <br>
		 <input type="hidden" name="name" value=""> 
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" ><br>
		<a href="./findId.me" id="forgotId">아이디 찾기</a>
		<a href="./findPw.me" id="forgotPw">비밀번호 찾기</a>
	</form>
		
<!-- SNS로그인 관련 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- SNS로그인 관련 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<a href="javascript:kakaoLogin();"><img src="./img/kakaoLogo.png" alt="카카오계정 로그인" style="width: 200px;"/></a>

<!-- 네이버 로그인 관련 -->
<div id="naver_id_login"></div>
<!-- 네이버 로그인 관련 -->

<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("Rv8AbbtIDIKKhJ_g5wd4", "http://localhost:8080/Member/NaverLogin.me")
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setDomain("http://localhost8080/");
	  	naver_id_login.setButton("green",2,40);
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
</script>

</body>
</html>