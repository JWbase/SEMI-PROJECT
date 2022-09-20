<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/mainPage.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/notosans.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
			body::-webkit-scrollbar {
                width: 16px; /*스크롤바의 너비*/
            }
 
            body::-webkit-scrollbar-thumb {
                background-color: lightgray; /*스크롤바의 색상*/
            }
 
            body::-webkit-scrollbar-track {
                background-color: white; /*스크롤바 트랙 색상*/
            }
 
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- 메인 컨텐츠 시작 -->
	 <div class="main-wrap">
        <div class="main-top">
            <video muted autoplay loop src="img/mainVideo.mp4"></video>
        </div>
        <div class="main-mid">
            <h2 class="main-mid-title">PRODUCT</h2>
            <ul class="main-mid-list">
                <li class="main-mid-list-1"><a href="#">Headphone</a></li>
                <li class="main-mid-list-2"><a href="#">Speaker</a></li>
                <li class="main-mid-list-3"><a href="#">Turntable</a></li>
                <li class="main-mid-list-4"><a href="#">Walkman</a></li>
            </ul>
        </div>
        <div class="main-bot">
            <h2 class="main-bot-title">EVENT</h2>
            <ul class="main-bot-list">
                <li class="main-bot-list-1">
                <a href="#">
                    <div class="main-bot-1">
                        <div class="main-bot-comment">
                            <span>연휴 특강 필수템</span><br>
                            <span>IDC-TX660</span>
                            <p>강의 녹음이 필요할 땐 작고 가벼운 IDC-TX660!</p>
                        </div>
                    </div>
                </a>
                </li>
                <li class="main-bot-list-1">
                <a href="#">
                    <div class="main-bot-2">
                        <div class="main-bot-comment">
                            <span>올 가을은</span><br>
                            <span>안사니스토어와 함께</span>
                            <p>안사니스토어 당산점을 방문 하시면 다양한 혜택을 드립니다.</p>
                        </div>
                    </div>
                </a>
                </li>
                <li class="main-bot-list-1">
                <a href="#">
                    <div class="main-bot-3">
                        <div class="main-bot-comment">
                            <span>ECM</span><br>
                            <span>가을 소리를 듣다</span>
                            <p>컴팩트 마이크를 어디에서나 사용해보세요.</p>
                        </div>
                    </div>
                </a>
                </li>
            </ul>
        </div>
    </div>
	<!-- 메인 컨텐츠 끝 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	 <script src="js/header.js"></script>
</body>
</html>