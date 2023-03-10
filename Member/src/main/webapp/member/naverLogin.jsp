<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<div id="naver_id_login"></div>
			
<script type="text/javascript">
var naver_id_login = new naver_id_login("Rv8AbbtIDIKKhJ_g5wd4", "http://localhost:8080/Member/NaverLoginAction.mv")
//접근 토큰 값 출력
// alert(naver_id_login.oauthParams.access_token);
//네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");
//네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
	
	var id = naver_id_login.getProfileData('id');
	var name = naver_id_login.getProfileData('name');
	var email = naver_id_login.getProfileData('email');
	var birthday = naver_id_login.getProfileData('birthday');
 	var mobile = naver_id_login.getProfileData('mobile');
	
 	alert(id);
 	alert(email);
 	alert(birthday);
 	alert(name);
 	alert(mobile);


 	$.ajax({
		url: "./NaverLoginAction.mv",
		type: 'post',     
		data : {
			id:naver_id_login.getProfileData('id'),
			name:naver_id_login.getProfileData('name'),
			email:naver_id_login.getProfileData('email'),
			birthday:naver_id_login.getProfileData('birthday')
// 			mobile:naver_id_login.getProfileData('mobile')
		},

		error:function(){
		location.href="./Main.mv";
 		}
	})
 	
};

</script>
<!-- 네이버 로그인 관련 -->		

</body>
</html>