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
                $(this).siblings('span.error').text('�̸��� �Է��ϼ���.').fadeIn().parent('.form-group').addClass('hasError');
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
                $(this).siblings('span.error').text('6~20���� ���� �ҹ���, ���ڸ� ��� �����մϴ�.').fadeIn().parent('.form-group').addClass('hasError');
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
                $(this).siblings('span.error').text('�̸��� �ּҸ� �ٽ� Ȯ�����ּ���.').fadeIn().parent('.form-group').addClass('hasError');
                emailError = true;
            }
            }
        }
        
        

        // Birth
        
      
        if ($(this).hasClass('bir_yy')) {
            var date = new Date();
            var yyyy = date.getFullYear();
                   if ($(this).val().length <4 ) {
                       $(this).siblings('span.error').text('�¾ �⵵ 4�ڸ��� ��Ȯ�ϰ� �Է��ϼ���.').fadeIn().parent('.form-group').addClass('hasError');
                       bir_yyError = true;
                   }
                   else if ($(this).val()> yyyy) {
                       $(this).siblings('span.error').text('�¾ �⵵�� '+$(this).val()+'���� �³���?').fadeIn().parent('.form-group').addClass('hasError');
                       bir_yyError = true;
                   }                  
                   else if ($(this).val()< yyyy-100) {
                       $(this).siblings('span.error').text('�¾ �⵵�� '+$(this).val()+'���� �³���?').fadeIn().parent('.form-group').addClass('hasError');
                       bir_yyError = true;
                   } else {
                     $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                      bir_yyError = false;
                   }
               }
        
        

        
        if($(this).hasClass('bir_dd')){
/*             var input_yy = $('.bir_yy').val();
            var input_mm = $('.bir_mm').val(); */
            var last = new Date($('.bir_yy').val(),$('.bir_mm').val(),0); // �Է¹��� ��,���� ����
            var dddd = last.getDate(); // dddd=����
            //console.log(last);


              if ($(this).val()>0 ) {
              	if($(this).val()>dddd) { // �Է¹��� ����� ���Ϻ��� ���� ���� ������ ��
	               $(this).siblings('span.error').text($('.bir_yy').val()+'��'+$('.bir_mm').val()+'����'+dddd+'����').fadeIn().parent('.form-group').addClass('hasError');
	               bir_ddError = true;
                 } else { // ������ ��� error ����
                 	$(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                 	bir_ddError = false;
                 }
              	
              } else { // 0���� ������ ���̳� ���ڰ� �ƴ� ���� ������ ��
            	  $(this).siblings('span.error').text('�ٽ� �Է����ּ���.').fadeIn().parent('.form-group').addClass('hasError');
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
	                $(this).siblings('span.error').text('8~16�� ���� �� �ҹ���, ����, Ư�����ڸ� ����ϼ���.').fadeIn().parent('.form-group').addClass('hasError');
	                passwordError = true;
	            }
            }
        }

        // PassWord confirmation
        
	        if ($('.pass').val() !== $('.passConfirm').val()) {
	            $('.passConfirm').siblings('.error').text('��й�ȣ�� ��ġ���� �ʽ��ϴ�.').fadeIn().parent('.form-group').addClass('hasError');
	            passConfirm = false;
	        } else {
	            $('.passConfirm').siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
	            passConfirm = false;
	        }
        
        
        
        // �޴��� ��ȣ
            if ($(this).hasClass('phone3')) {
            if ($(this).val().length > 0) {
            	 var regPhone= /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
            	 if(regPhone.test($('.phone1').val()+$('.phone2').val()+$('.phone3').val())){
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                phoneError = false;
            	 
            } else {
                $(this).siblings('span.error').text('�޴��� ��ȣ�� �ٽ� Ȯ�����ּ���').fadeIn().parent('.form-group').addClass('hasError');
                phoneError = true;
            }
            }
        }
        
        
	        
	         // Type �����ϴ� �帣
            $(":checkbox").click(function(){
               var cnt=$("input:checkbox[name=type]:checked").length;
               
           console.log(cnt);
          // console.log($(":checkbox(:checked)"));

	    	if(cnt>3){
	    		//$(":checkbox:not(:checked)").attr("disabled", "disabled");
	    		$(":checkbox:not(:checked)").siblings('.error').text('�ִ� 3�� ���� �����մϴ�.').fadeIn().parent('.form-group').addClass('hasError');
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
				
				
				
				<!-- ȸ����ȣ -->
				<input type="hidden" name="num" value="0" >
				<input type="hidden" name="grade" value="normal" >
				<input type="hidden" name="joindate" value="" >
				<input type="hidden" name="rCount" value="0" >
				
                  <div class="form-group">
                     <label for="userId">���̵�</label>
                     <input type="text" name="id" id="id" class="id" maxlength="20">
                     <span class="error"></span>
                  </div>
                  
                  <div class="form-group">
                     <label for="password">��й�ȣ</label>
                     <input type="password" name="password" id="password" class="pass">
                     <span class="error"></span>
                  </div>

                  <div class="form-group">
                     <label for="passwordCon">��й�ȣ ��Ȯ��</label>
                     <input type="password" name="passwordCon" id="passwordCon" class="passConfirm">
                     <span class="error"></span>
                   </div>
                   
                   
                  <div class="form-group">
                     <label for="name">�̸�</label>
                     <input type="text" name="username" id="name" class="name">
                     <span class="error"></span>
                  </div>


 

                  <div class="form-group">
                     <label for="email">�̸���</label>
                     <input type="email" name="emailAdress" id="email" class="email" placeholder="�����Է�">
                     <span class="error"></span>
                  </div>

                   <div class="form-group">
                     <label for="phone">�޴��� ��ȣ</label>
                     <input type="text" class="phone1" maxlength="3">-
                     <input type="text" class="phone2" maxlength="4">-
                     <input type="text" class="phone3" maxlength="4">
                     <span class="error"></span>
                  </div>
                 	
                 
                 <div class="form-group">
                     <label for="birth">�������</label>
      				 <input class="bir_yy" type="text" name="year" id="year" maxlength="4" placeholder="��(4��)">
                     <!-- <div class = "bir_mm"> -->
                     <select class="bir_mm" >
                     <option value="0">��zz</option>
                   	   <c:forEach var="mon" begin="1" end="12" step="1">
                    	   <option value="${mon }">${mon }</option>
                       </c:forEach>
                     </select>
              <!-- </div> -->
                     <input class="bir_dd" type="text" name="day" id="day" maxlength="2" placeholder="��" >
                 <span class="error"></span>
                  </div>
                  
                  
                  <div class="form-gruop">
                     <label for="type">�����ϴ� �帣  </label>  <small>(�ִ� 3�� ���ð���)</small>
                     <input type="checkbox" name="type" value="�θǽ�"> �θǽ�
                     <input type="checkbox" name="type" value="�ڹ̵�"> �ڹ̵�
                     <input type="checkbox" name="type" value="������"> ������
                     <input type="checkbox" name="type" value="����"> ����
                     <input type="checkbox" name="type" value="����"> ����
                     <span class="error"></span>
                  </div>
				
				
				                   
                  <div class="form-group">
                     <!-- <label for="addr_num">�����ȣ</label> -->
                     <input type="text" id="postcode" placeholder="�����ȣ" />
                     <input type="button" onclick="DaumPostcode()" value="�����ȣ ã��"><br>
                 <!--     <label for="addr">�ּ�</label> -->
                     <input type="text" id="address" placeholder="�ּ�"/><br>
                    <!--  <label for="addr_detail">���ּ�</label> -->
                     <input type="text" name="detailAddress" placeholder="���ּ�" />
                     <input type="text" id="sample6_extraAddress" placeholder="�����׸�">
                     <span class="error"></span>
                  </div>




                  <div class="CTA">
                     <input type="submit" value="ȸ������" id="submit">
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
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</html>