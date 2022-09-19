<%@page import="kr.co.ansany.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%
    	Member m = (Member)session.getAttribute("m");
    %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- jquery -->
<script src="/js/jquery-3.6.0.js"></script>
<!-- 기본 CSS -->
<link rel="stylesheet" href="/css/header.css" />

<div class="header-body">
	<div class="header-fixed">
		<div class="header-wrap">
			<div class="header-top">
				<div class="header-logo">
					<a href="#"><img src="/img/logo2.png" alt=""></a>
				</div>
				<div class="header-navi">
					<ul>
						<li><a href="#">제품</a>
							<ul>
								<li><a href="#">헤드폰/이어폰</a></li>
								<li><a href="#">스피커</a></li>
								<li><a href="#">턴테이블</a></li>
								<li><a href="#">워크맨</a></li>
							</ul></li>
						<li><a href="#">커뮤니티</a>
							<ul>
								<li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
								<li><a href="#">구매후기</a></li>
								<li><a href="#">사진전</a></li>
								<li><a href="#">자유게시판</a></li>
							</ul></li>
						<li><a href="#">멤버십</a>
							<ul>
								<li><a href="#">등급&혜택 안내</a></li>
							</ul></li>
						<li><a href="#">고객 서비스</a>
							<ul>
								<li><a href="#">FAQ / Q<span>&</span>A
								</a></li>
								<li><a href="#"></a></li>
							</ul></li>
						<li><a href="#">직영점 안내</a>
							<ul>
								<li><a href="/map.do">찾아오시는길</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="header-icon">
					<div class="icon-wrap">
						<div>
							<a href="#"> <span class="material-icons">shopping_cart</span>
							</a>
						</div>
						<div>
							<%
							if (m == null) {
							%>
							<a href="loginFrm.do"> <span class="material-icons">person</span>
							</a>
							<%
							} else {
							%>
							<a href="#"> <span class="material-icons"
								style="color: #5865f5">person</span>
							</a>
							<%
							}
							%>
						</div>
						<div>
							<a href="#"> <span class="material-icons">search</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/js/header.js"></script>
