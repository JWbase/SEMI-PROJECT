<%@page import="kr.co.ansany.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--css-->
    <link rel="stylesheet" href="/css/login.css">
    <!--fonts-->
    <link rel="stylesheet" href="/css/Noto_Sans.css">
    <!--구글 아이콘-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {
	background-color: #fff;
}

.header-logo>a>img {
	margin-top: 29.5px;
}
</style>
</head>
<body>
<%@ include file ="/WEB-INF/views/common/header.jsp" %>
    <div class="content">
        <div class="login-wrap">
            <div class="login-header">
                <h1>회원 로그인</h1>
            </div>
            <div class="login-content">
                <form action="/login.do" method="post" name="loginFrm">
                    <div class="login-input-box">
                        <input type="text" name="signId" id="signId" class="login-input-form" placeholder="아이디">
                        <i></i>
                    </div>
                    <div class="login-input-box">
                        <input type="password" name="signPw" id="signPw" class="login-input-form" placeholder="비밀번호">
                        <i></i>
                    </div>
                    <div class="login-footer">
                        <div class="input-box-btn">
                            <button type="submit" class="btn login">로그인</button>
                        </div>
                        <div class="link-box">
                            <ul>
                                <li><a href="#">아이디/비밀번호 찾기</a>
                                </li>
                                <li><a href="/joinAgree.do">회원가입</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </form><!--폼태그 끝-->
            </div>
        </div><!--login-wrap 끝-->
    </div><!--컨텐츠 끝-->
<%@ include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>