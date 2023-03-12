<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<nav class="main-nav overlay clearfix">
	<a class="blog-logo" href="./Main.me"><img src="assets/img/logo.png" alt="Fashion Critiques"/></a>
	<ul id="menu">
		<li class="nav-home nav-current"><a href="MovieList.mv">영화</a></li>
		<li class="nav-article-example"><a href="MovieBooking.mv">예매</a></li>
		<li class="nav-about-us"><a href="CinemaPlace.mv">극장</a></li>
		<li class="nav-author-page" role="presentation"><a href="Bonus.me">혜택</a></li>
	<span class="socialheader">
	<c:if test="${id == null }">
		<li><a href="Login.me">로그인</a></li>
		<li><a href="">회원가입</a></li>
	</c:if>
			  	
  	<c:if test="${id != null}">
		<li><a href="LogoutAction.me">로그아웃</a></li>
		<li><a href="MyTicket.me">예매확인</a></li>
		<li><a href="MyPage.me">마이페이지</a></li>
	</c:if>
				
	<c:if test="${id != null && id.equals('admin') }">
		<li><a href="">관리자</a></li>
	</c:if>

	</span>
	</ul>
</nav>