<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="lnb-area">
		<nav id="lnb">
			<p class="tit"><a href="/mypage" title="나의 메가박스">나의 메가박스</a></p>

			<ul>
				<li class="on"><a href="/mypage/bookinglist" title="예매/구매내역">예매/구매내역</a></li>
                   <li>
                   	<a href="/mypage/movie-coupon" title="영화/스토어 관람권">영화/스토어 관람권</a>
					<ul class="depth3">
						<li><a href="/mypage/movie-coupon" title="영화관람권">영화관람권</a></li>
						<li><a href="/mypage/store-coupon" title="스토어 교환권">스토어 교환권</a></li>
					</ul>
				</li>
				<li><a id="discountCoupon" href="/mypage/discount-coupon" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
				<!-- <li><a href="/on/oh/ohh/Mvtckt/GiftCardL.do">메가박스 기프트카드</a></li> -->
				<li>
					<a href="/mypage/point-list" title="멤버십 포인트">멤버십 포인트</a>
					<ul class="depth3">
						<li><a href="/mypage/point-list" title="포인트 이용내역">포인트 이용내역</a></li>
						<li><a href="/mypage/card-list" title="멤버십 카드관리">멤버십 카드관리</a></li>
						<li><a href="/mypage/milk-service" title="MiL.k 제휴서비스">MiL.k 포인트</a></li>
					</ul>
				</li>
				<li><a href="/mypage/moviestory" titel="나의 무비스토리">나의 무비스토리</a></li>
				<li><a href="/mypage/myevent" title="나의 이벤트 응모내역">나의 이벤트 응모내역</a></li>
				<li><a href="/mypage/myinquiry" title="나의 문의내역">나의 문의내역</a></li>
				<li><a href="/mypage/mydiscount" title="자주쓰는 할인카드">자주쓰는 카드 관리</a></li>
				<li>
					<a href="/mypage/myinfo?returnURL=info" title="회원정보">회원정보</a>
					<ul class="depth3">
						<li><a href="/mypage/myinfo?returnURL=info" title="개인정보 수정">개인정보 수정</a></li>
						<li><a href="/mypage/additionalinfo" title="선택정보 수정">선택정보 수정</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>

</body>
</html>