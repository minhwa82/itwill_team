<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/css.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script type="text/javascript">
/*global $, document, window, setTimeout, navigator, console, location*/
$(document).ready(function () {

    'use strict';

    var usernameError = true,
        emailError    = true,
        passwordError = true,
        passConfirm   = true,
    	idError = true;
    // Detect browser for css purpose
    if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
        $('.form form label').addClass('fontSwitch');
    }

    // Label effect
    $('input').focus(function () {

        $(this).siblings('label').addClass('active');
        
    });

    // Form validation
    $('input').blur(function () {

        // User Name
        if ($(this).hasClass('name')) {
            if ($(this).val().length === 0) {
                $(this).siblings('span.error').text('이름을 입력하세요.').fadeIn().parent('.form-group').addClass('hasError');
                usernameError = true;
/*             } else if ($(this).val().length > 1 && $(this).val().length <= 6) {
                $(this).siblings('span.error').text('Please type at least 6 characters').fadeIn().parent('.form-group').addClass('hasError');
                usernameError = true; */
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                usernameError = false;
            }
        }
        // id
            if ($(this).hasClass('id')) {
            if ($(this).val().length > 0) {
            	var regId = /^[a-z]+[a-z0-9]{5,19}$/g;
            	 if(regId.test($(this).val())){
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                idError = false;
            	 
            } else {
                $(this).siblings('span.error').text('6~20자의 영문 소문자, 숫자만 사용 가능합니다.').fadeIn().parent('.form-group').addClass('hasError');
                idError = true;
            }
            }
        }




		
        // Email
        // https://jh91.tistory.com/entry/javescript-%EC%9D%B4%EB%A9%94%EC%9D%BC-%EC%9C%A0%ED%9A%A8%EC%84%B1-%EA%B2%80%EC%82%AC
        if ($(this).hasClass('email')) {
            if ($(this).val().length > 0) {
            	 var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            	 if(regEmail.test($(this).val())){
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                emailError = false;
            	 
            } else {
                $(this).siblings('span.error').text('이메일 주소를 다시 확인해주세요.').fadeIn().parent('.form-group').addClass('hasError');
                emailError = true;
            }
            }
        }
        
        

        // Birth
        
      
        if ($(this).hasClass('bir_yy')) {
            var date = new Date();
            var yyyy = date.getFullYear();
                   if ($(this).val().length <4 ) {
                       $(this).siblings('span.error').text('태어난 년도 4자리를 정확하게 입력하세요.').fadeIn().parent('.form-group').addClass('hasError');
                       bir_yyError = true;
                   }
                   else if ($(this).val()> yyyy) {
                       $(this).siblings('span.error').text('태어난 년도가 '+$(this).val()+'년이 맞나요?').fadeIn().parent('.form-group').addClass('hasError');
                       bir_yyError = true;
                   }                  
                   else if ($(this).val()< yyyy-100) {
                       $(this).siblings('span.error').text('태어난 년도가 '+$(this).val()+'년이 맞나요?').fadeIn().parent('.form-group').addClass('hasError');
                       bir_yyError = true;
                   } else {
                     $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                      bir_yyError = false;
                   }
               }
        
        

        
        if($(this).hasClass('bir_dd')){
/*             var input_yy = $('.bir_yy').val();
            var input_mm = $('.bir_mm').val(); */
            var last = new Date($('.bir_yy').val(),$('.bir_mm').val(),0); // 입력받은 년,월의 말일
            var dddd = last.getDate(); // dddd=말일
            //console.log(last);


              if ($(this).val()>0 ) {
              	if($(this).val()>dddd) { // 입력받은 년월의 말일보다 높은 값이 들어왔을 때
	               $(this).siblings('span.error').text($('.bir_yy').val()+'년'+$('.bir_mm').val()+'월은'+dddd+'까지').fadeIn().parent('.form-group').addClass('hasError');
	               bir_ddError = true;
                 } else { // 정상값일 경우 error 삭제
                 	$(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                 	bir_ddError = false;
                 }
              	
              } else { // 0보다 이하인 값이나 숫자가 아닌 값일 들어왔을 때
            	  $(this).siblings('span.error').text('다시 입력해주세요.').fadeIn().parent('.form-group').addClass('hasError');
	               bir_ddError = true;
              }
        }

         
         


        // PassWord
        if ($(this).hasClass('pass')) {
            if ($(this).val().length > 0) {
            	var regPass = /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;
            	//var regPass = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;
            	 if(regPass.test($(this).val())){
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                passwordError = false;
            	 
	            } else {
	                $(this).siblings('span.error').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.').fadeIn().parent('.form-group').addClass('hasError');
	                passwordError = true;
	            }
            }
        }

        // PassWord confirmation
        
	        if ($('.pass').val() !== $('.passConfirm').val()) {
	            $('.passConfirm').siblings('.error').text('비밀번호가 일치하지 않습니다.').fadeIn().parent('.form-group').addClass('hasError');
	            passConfirm = false;
	        } else {
	            $('.passConfirm').siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
	            passConfirm = false;
	        }
        
        
        
        // 휴대폰 번호
            if ($(this).hasClass('phone3')) {
            if ($(this).val().length > 0) {
            	 var regPhone= /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
            	 if(regPhone.test($('.phone1').val()+$('.phone2').val()+$('.phone3').val())){
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                phoneError = false;
            	 
            } else {
                $(this).siblings('span.error').text('휴대폰 번호를 다시 확인해주세요').fadeIn().parent('.form-group').addClass('hasError');
                phoneError = true;
            }
            }
        }
        
        
	        
	         // Type 좋아하는 장르
            $(":checkbox").click(function(){
               var cnt=$("input:checkbox[name=type]:checked").length;
               
           console.log(cnt);
          // console.log($(":checkbox(:checked)"));

	    	if(cnt>3){
	    		//$(":checkbox:not(:checked)").attr("disabled", "disabled");
	    		$(":checkbox:not(:checked)").siblings('.error').text('최대 3개 선택 가능합니다.').fadeIn().parent('.form-group').addClass('hasError');
	    		typeError = false;
	    	}else {
	            //$("input[name=type]:checkbox").removeAttr("disabled");
		        $(":checkbox:not(:checked)").siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
		        typeError = false;
	    	}
       });
	    	
	    	
        
        
        
        // label effect
        if ($(this).val().length > 0) {
            $(this).siblings('label').addClass('active');
        } else {
            $(this).siblings('label').removeClass('active');
        }
    });


    // form switch
    $('a.switch').click(function (e) {
        $(this).toggleClass('active');
        e.preventDefault();

        if ($('a.switch').hasClass('active')) {
            $(this).parents('.form-peice').addClass('switched').siblings('.form-peice').removeClass('switched');
        } else {
            $(this).parents('.form-peice').removeClass('switched').siblings('.form-peice').addClass('switched');
        }
    });


    // Form submit
    $('form.signup-form').submit(function (event) {
        event.preventDefault();

        if (usernameError == true || emailError == true || passwordError == true || passConfirm == true) {
            $('.name, .email, .pass, .passConfirm').blur();
        } else {
            $('.signup, .login').addClass('switched');

            setTimeout(function () { $('.signup, .login').hide(); }, 700);
            setTimeout(function () { $('.brand').addClass('active'); }, 300);
            setTimeout(function () { $('.heading').addClass('active'); }, 600);
            setTimeout(function () { $('.success-msg p').addClass('active'); }, 900);
            setTimeout(function () { $('.success-msg a').addClass('active'); }, 1050);
            setTimeout(function () { $('.form').hide(); }, 700);
        }
    });   

    // Reload page
    $('a.profile').on('click', function () {
        location.reload(true);
    });

    
});
</script>
</head>
<body>
<div class="container">
   <section id="formHolder">

      <div class="row">

         <!-- Brand Box -->
         <div class="col-sm-6 brand">
            <a href="#" class="logo">MR <span>.</span></a>
<!-- 
            <div class="heading">
               <h2>Marina</h2>
               <p>Your Right Choice</p>
            </div>
 -->
            <div class="success-msg">
               <p>Great! You are one of our members now</p>
               <a href="#" class="profile">Your Profile</a>
            </div>
         </div>


         <!-- Form Box -->
         <div class="col-sm-6 form">

<!--             Login Form
            <div class="login form-peice switched">
               <form class="login-form" action="#" method="post">
                  <div class="form-group">
                     <label for="loginemail">Email Adderss</label>
                     <input type="email" name="loginemail" id="loginemail" required>
                  </div>

                  <div class="form-group">
                     <label for="loginPassword">Password</label>
                     <input type="password" name="loginPassword" id="loginPassword" required>
                  </div>

                  <div class="CTA">
                     <input type="submit" value="Login">
                     <a href="#" class="switch">I'm New</a>
                  </div>
               </form>
            </div>End Login Form

 -->
            <!-- Signup Form -->
            <div class="signup form-peice" >
               <form class="signup-form" action="./MemberLoginAction.mv" method="post">
				
				
				
				<!-- 회원번호 -->
				<input type="hidden" name="num" value="0" >
				<input type="hidden" name="grade" value="normal" >
				<input type="hidden" name="joindate" value="" >
				<input type="hidden" name="rCount" value="0" >
				
                  <div class="form-group">
                     <label for="userId">아이디</label>
                     <input type="text" name="id" id="id" class="id" maxlength="20">
                     <span class="error"></span>
                  </div>
                  
                  <div class="form-group">
                     <label for="password">비밀번호</label>
                     <input type="password" name="password" id="password" class="pass">
                     <span class="error"></span>
                  </div>

                  <div class="form-group">
                     <label for="passwordCon">비밀번호 재확인</label>
                     <input type="password" name="passwordCon" id="passwordCon" class="passConfirm">
                     <span class="error"></span>
                   </div>
                   
                   
                  <div class="form-group">
                     <label for="name">이름</label>
                     <input type="text" name="username" id="name" class="name">
                     <span class="error"></span>
                  </div>


 

                  <div class="form-group">
                     <label for="email">이메일</label>
                     <input type="email" name="emailAdress" id="email" class="email" placeholder="선택입력">
                     <span class="error"></span>
                  </div>

                   <div class="form-group">
                     <label for="phone">휴대폰 번호</label>
                     <input type="text" class="phone1" maxlength="3">-
                     <input type="text" class="phone2" maxlength="4">-
                     <input type="text" class="phone3" maxlength="4">
                     <span class="error"></span>
                  </div>
                 	
                 
                 <div class="form-group">
                     <label for="birth">생년월일</label>
      				 <input class="bir_yy" type="text" name="year" id="year" maxlength="4" placeholder="년(4자)">
                     <!-- <div class = "bir_mm"> -->
                     <select class="bir_mm" >
                     <option value="0">월zz</option>
                   	   <c:forEach var="mon" begin="1" end="12" step="1">
                    	   <option value="${mon }">${mon }</option>
                       </c:forEach>
                     </select>
              <!-- </div> -->
                     <input class="bir_dd" type="text" name="day" id="day" maxlength="2" placeholder="일" >
                 <span class="error"></span>
                  </div>
                  
                  
                  <div class="form-gruop">
                     <label for="type">좋아하는 장르  </label>  <small>(최대 3개 선택가능)</small>
                     <input type="checkbox" name="type" value="로맨스"> 로맨스
                     <input type="checkbox" name="type" value="코미디"> 코미디
                     <input type="checkbox" name="type" value="ㅅㄹㄹ"> 스릴러
                     <input type="checkbox" name="type" value="ㅇㅇ"> ㅇㅇ
                     <input type="checkbox" name="type" value="ㅋㅋ"> ㅋㅋ
                     <span class="error"></span>
                  </div>
				
				
				                   
                  <div class="form-group">
                     <!-- <label for="addr_num">우편번호</label> -->
                     <input type="text" id="postcode" placeholder="우편번호" />
                     <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
                 <!--     <label for="addr">주소</label> -->
                     <input type="text" id="address" placeholder="주소"/><br>
                    <!--  <label for="addr_detail">상세주소</label> -->
                     <input type="text" name="detailAddress" placeholder="상세주소" />
                     <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                     <span class="error"></span>
                  </div>




                  <div class="CTA">
                     <input type="submit" value="회원가입" id="submit">
                     <a href="#" class="switch">I have an account</a>
                  </div>
               </form>
               
               
               
            </div><!-- End Signup Form -->
         </div>
      </div>

   </section>


   <footer>
      <p>
         Form made by: <a href="http://mohmdhasan.tk" target="_blank">Mohmdhasan.tk</a>
      </p>
   </footer>

</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</html>