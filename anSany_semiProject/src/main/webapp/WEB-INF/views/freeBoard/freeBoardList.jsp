<%@page import="oracle.net.aso.n"%>
<%@page import="kr.co.ansany.freeboard.model.vo.FreeBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<FreeBoard> list = (ArrayList<FreeBoard>) request.getAttribute("list");
String pageNavi = (String) request.getAttribute("pageNavi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<link rel="stylesheet" href="/css/bootstrap.css" />
<style>
.header-logo>a>img {
	margin-bottom: 14px;
}

.board_wrap {
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

.tablink:hover {
	color: #ea0029;
}

.tablink.active {
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

.pagination a {
	color: black;
}

.table {
	width: 1280px;
	margin: 0 auto;
	margin-bottom: 50px;
}

.table>tr>td>a {
	text-decoration: none;
	color: black;
}

.table:hover>tr>td>a {
	background-color: white;
}

.pageNavi {
	color: black;
}

.page-item.active .page-link {
	z-index: 1;
	color: #ccc;
	font-weight: bold;
	background-color: #333;
	border-color: #444;
}

.page-link:focus, .page-link:hover {
	color: #ccc;
	background-color: #222;
	border-color: #444;
}

.top-wrap {
	width: 1280px;
	margin: 0 auto;
}

.top-wrap>div>a {
	display: block;
	width: 100px;
	line-height: 30px;
	height: 30px;
	text-decoration: none;
	color: black;
	border: 1px solid black;
	border-radius: 30px;
	font-weight: 600;
	text-align: center;
	float: right;
}

.top-wrap>div>a:hover {
	background-color: #5865f5;
	color: white;
	border-color: #5865f5;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="board_wrap">
		<nav class="page-navi">
			<ul>
				<li><a href="/noticeList.do?reqPage=1"> <span
						class="tablink">공지사항</span>
				</a></li>
				<li><a href="#"> <span class="tablink">구매후기</span>
				</a></li>
				<li><a href="/photoList.do"> <span class="tablink">사진전</span>
				</a></li>
				<li><a href="/freeBoardList.do?reqPage=1"> <span
						class="tablink">자유게시판</span>
				</a></li>

			</ul>
		</nav>
		<%
		if (m != null) {
		%>
		<div class="top-wrap">
			<div>
				<a href="/freeBoardWriteFrm.do">글쓰기</a>
			</div>
		</div>
		<%
		}
		%>
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
				for (FreeBoard f : list) {
				%>
				<tbody class="table">
					<tr>
						<th scope="row"><%=f.getFreeBoardNo()%></th>
						<td><a href="/freeBoardView.do?freeBoardNo=<%=f.getFreeBoardNo()%>"><%=f.getFreeBoardTitle()%></a></td>
						<td><%=f.getFreeBoardWriter()%></td>
						<td><%=f.getFreeBoardDate()%></td>
						<td><%=f.getFreeBoardReadCount()%></td>
					</tr>
				</tbody>
				<%
				}
				%>
			</table>
			<div class="pageNavi"><%=pageNavi%></div>
		</div>
	</div>
	<script>
		$(".tablink:eq(3)").addClass("active");

		$(".tablink").on("click", function() {
			const selectedIndex = $(".tablink").index(this);
			$(".tablink").each(function(index, item) {
				if (index != selectedIndex) {
					$(item).removeClass("active");
				} else {
					$(item).addClass("active");
				}
			});
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>