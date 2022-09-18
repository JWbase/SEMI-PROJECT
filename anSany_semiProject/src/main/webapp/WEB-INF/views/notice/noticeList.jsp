<%@page import="oracle.net.aso.n"%>
<%@page import="kr.co.ansany.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
String pageNavi = (String) request.getAttribute("pageNavi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bootstrap.css" />
<style>
.notice_wrap {
	width: 100%;
	max-width: 1920px;
	margin: auto;
	padding-top: 81px;
	padding-bottom: 81px;
	background-color: #fff;
}

.table-secondary {
	text-align: center;
}

tbody {
	text-align: center;
}

tbody tr>td:nth-child(2) {
	text-align: left;
	padding-left: 30px;
}

.page-navi {
	width: 100%;
	margin: 0 auto;
	padding: 40px 0 20px;
	float: none;
}

.page-navi ul {
	display: flex;
	align-items: center;
	justify-content: space-around;
	text-align: center;
	list-style: none;
	padding-left: 0;
	border-bottom: 2px solid #888;
}

.page-navi span {
	font-weight: 600;
}

.page-navi a {
	display: block;
	position: relative;
	font-weight: 600px;
	font-size: 22px;
	line-height: 50px;
	text-decoration: none;
	color: #010101;
	border-bottom: 2px solid transparent;
}

.page-navi a:hover {
	color: #ea0029;
}

.table_wrap {
	width: 100%;
	padding-top: 40px;
	padding-bottom: 30px;
}

.pagination {
	justify-content: center;
	align-items: center;
}

.table{
	width: 1280px;
	margin: 0 auto;
	margin-bottom: 50px;
}

.table>tr>td>a {
	text-decoration: none;
	color: black;
}
.table:hover>tr>td>a{
	background-color: white;
}
.pageNavi{
	color: black;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>\
	<div class="notice_wrap">
		<nav class="page-navi">
			<ul>
				<li><a href="#"> <span>공지사항</span>
				</a></li>
				<li><a href="#"> <span>구매후기</span>
				</a></li>
				<li><a href="#"> <span>자유게시판</span>
				</a></li>
				<li><a href="#"> <span>사진전</span>
				</a></li>
			</ul>
		</nav>
		<div class="table_wrap">
			<table class="table table-hover table-group-divider">
				<thead class="table-secondary">
					<tr>
						<th scope="col" style="width: 10%;">번호</th>
						<th scope="col" style="width: 55%;">제목</th>
						<th scope="col" style="width: 10%;">작성자</th>
						<th scope="col" style="width: 15%;">등록일</th>
						<th scope="col" style="width: 10%;">조회수</th>
					</tr>
				</thead>
				<%
				for (Notice n : list) {
				%>
				<tbody class="table">
					<tr>
						<th scope="row"><%=n.getNoticeTitle()%></th>
						<td><a href="#"><%=n.getNoticeTitle()%></a></td>
						<td><%=n.getNoticeWriter()%></td>
						<td><%=n.getNoticeDate()%></td>
						<td><%=n.getNoticeReadCount()%></td>
					</tr>
				</tbody>
				<%
				}
				%>
			</table>
			<div class="pageNavi"><%=pageNavi%></div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>