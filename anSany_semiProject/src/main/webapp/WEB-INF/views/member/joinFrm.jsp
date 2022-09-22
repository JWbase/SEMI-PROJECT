<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!--css-->
<link rel="stylesheet" href="/css/join.css">
<!--fonts-->
<link rel="stylesheet" href="/css/Noto_Sans.css">
<!--jquery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<content><!--컨텐츠시작-->
	<div class="join-wrap">
		<div class="join-header">
			<h1>회원가입</h1>
			<span>안사니 통합 웹회원 정책상 공식적으로 만 14세 미만의 경우 회원가입이 불가합니다.</span>
		</div>
		<div class="join-content">
			<form action="/join.do" method="post" name="joinFrm">
				<div class="join-box">
					<label for="memberId">아이디</label> <input type="text"
						name="memberId" id="memberId" class="join-input-form"
						placeholder="아이디" required>
					<button type="button" id="idChkBtn" class="idChkBtn">중복확인</button>
					<span class="comment" id="idComment"></span>
				</div>
				<div class="join-box">
					<label for="memberPw">비밀번호</label> <input type="password"
						name="memberPw" id="memberPw" class="join-input-form"
						placeholder="비밀번호" required> <span class="comment"></span>
				</div>
				<div class="join-box">
					<label for="memberPwRe">비밀번호 확인</label> <input type="password"
						name="memberPwRe" id="memberPwRe" class="join-input-form"
						placeholder="비밀번호 확인" required> <span class="comment"></span>
				</div>
				<div class="join-box">
					<label for="memberEmail">이메일</label> <input type="text"
						name="memberEmail" id="memberEmail" class="join-input-form"
						placeholder="이메일 (ex : ansany@gmail.com)" required> <span
						class="comment"></span>
					<button id="sendEmailBtn" class="sendEmailBtn" type="button">인증메일전송</button>
					<!--display: none-->
					<div id="auth">
						<input type="text" id="authCode" placeholder="인증코드입력">
						<button class="inputCode" id="authBtn" type="button">인증하기</button>
						<!--시간제한용-->
						<div class="timeBox">
							<span id="timeZone"></span> <span id="authMsg"></span>
						</div>
					</div>
					<span class="comment"></span>
				</div>
				<div class="join-box">
					<label for="memberName">이름</label> <input type="text"
						name="memberName" id="memberName" class="join-input-form"
						placeholder="이름" required> <span class="comment"></span>
				</div>
				<div class="join-box">
					<label for="memberBirth">생년월일</label> <input type="text"
						name="memberBirth" id="memberBirth" class="join-input-form"
						placeholder="생년월일 (ex : 1999-01-01 )" required> <span
						class="comment"></span>
				</div>
				<div class="join-box">
					<label for="memberPhone">휴대폰 번호</label> <input type="text"
						name="memberPhone" id="memberPhone" class="join-input-form"
						placeholder="휴대폰 번호 (ex : 010-1111-1111)" required> <span
						class="comment"></span>
				</div>
				<div class="submit-btn">
					<button type="submit" class="join-btn">가입완료</button>
				</div>
			</form>
		</div>
	</div>
	</content>
	<!--컨텐츠 끝-->
	<!--스크립트-->
	<script src="/js/join.js"></script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>