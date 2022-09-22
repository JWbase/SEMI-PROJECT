<%@page import="kr.co.ansany.freeboard.model.vo.FreeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
FreeBoard f = (FreeBoard) request.getAttribute("f");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="/css/bootstrap.css" />
<style>
.header-logo>a>img {
	margin-bottom: 14px;
}

p {
	margin: 0;
}

.page-content {
	padding-top: 81px;
}

.table {
	text-align: center;
}

.page-wrap {
	padding-top: 50px;
	padding-bottom: 100px;
	background-color: #fff;
}

.page-content {
	width: 960px;
	margin: 0 auto;
}

.input-form {
	width: 100%;
	display: block;
	padding: 0.8rem;
	background-color: #fff;
	outline: none;
	box-sizing: border-box;
}

.page-title {
	padding: 20px 0px;
	padding-left: 10px;
	font-size: 1.5rem;
}

#freeBoardContent {
	min-height: 300px;
	text-align: left;
	padding-left: 10px;
}

.wrap-bottom {
	width: 960x;
	margin: 0 auto;
}

.wrap-bottom>div>a, button {
	display: block;
	width: 80px;
	line-height: 24px;
	height: 24px;
	text-decoration: none;
	color: black;
	border: 1px solid black;
	border-radius: 30px;
	font-weight: 600;
	text-align: center;
	float: right;
	font-size: 14px;
}

.wrap-bottom>div>button {
	background-color: #000;
	color: #fff;
	margin-left: 10px;
	padding: 0;
}

.wrap-bottom>div>button:hover {
	background-color: #5865f5;
	color: white;
	border-color: #5865f5;
}

.wrap-bottom>div>a:hover {
	background-color: #000;
	color: #fff;
	border-color: #fff;
}

.td-title {
	width: 300px
}
th {
	vertical-align: middle;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-wrap">
		<div class="page-content">
			<div class="page-title">자유게시판</div>

			<table class="table table-group-divider" id="freeBoardView">
				<tr class="table-secondary">
					<th>제목</th>
					<td colspan="3" class="td-title"><%=f.getFreeBoardTitle()%></td>
					<th>작성자</th>
					<td><%=f.getFreeBoardWriter() %></td>
					<th>조회수</th>
					<td><%=f.getFreeBoardReadCount()%></td>
					<th>작성일</th>
					<td><%=f.getFreeBoardDate()%></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="9">
						<%
						if (f.getFreeBoardFilename() != null) {
						%> <img src="/img/file.png" width="16px"> <a
						href="/freeBoardFileDown.do?freeBoardNo=<%=f.getFreeBoardNo()%>"><%=f.getFreeBoardFilename()%></a>
						<%
						}
						%>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="9">
						<div id="freeBoardContent"><%=f.getfreeBoardContentBr()%></div>
					</td>
				</tr>
			</table>
			<% if (m != null) {%>
			<%if (f.getFreeBoardWriter().equals(m.getMemberId())) {%>
			<div class="wrap-bottom">
				<div>
					<button onclick="freeBoardDelete(<%=f.getFreeBoardNo()%>);">삭제</button>
					<a href="/freeBoardUpdateFrm.do?freeBoardNo=<%=f.getFreeBoardNo()%>">수정</a>
				</div>
			</div>
			<%} else if(m.getMemberLevel() == 1) {%>
				<div class="wrap-bottom">
				<div>
					<button onclick="freeBoardDelete(<%=f.getFreeBoardNo()%>);">삭제</button>
				</div>
			</div>
			<%} %>
			<%
			}
			%>
		</div>
	</div>
	<script>
		function freeBoardDelete(freeBoardNo){
			if(confirm("삭제하시겠습니까?")) {
				location.href="/freeBoardDelete.do?freeBoardNo="+freeBoardNo;
			}
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>