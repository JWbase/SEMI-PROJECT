<%@page import="kr.co.ansany.photo.model.vo.Photo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Photo p = (Photo) request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#photoContent {
	min-height: 300px;
	text-align: center;
	padding-top: 20px;
}

#photoContent>img {
	max-height: 500px;
	max-width: 500px;
}

.wrap-bottom {
	width: 960px;
	margin: 0 auto;
}

.wrap-bottom>div>a, button {
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

th {
	vertical-align: middle;
}

.td-title {
	width: 300px
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-wrap">
		<div class="page-content">
			<div class="page-title">사진전</div>

			<table class="table table-group-divider" id="photoView">
				<tr class="table-secondary">
					<th>제목</th>
					<td colspan="3" class="td-title"><%=p.getPhotoTitle()%></td>
					<th>작성자</th>
					<td><%=p.getPhotoWriter()%></td>
					<th>조회수</th>
					<td><%=p.getPhotoReadCount()%></td>
					<th>작성일</th>
					<td><%=p.getPhotoDate()%></td>
				</tr>
				<tr>
					<th style="line-height: 300px;">내용</th>
					<td colspan="9">
						<div id="photoContent">
							<img src="/upload/photo/<%=p.getPhotoFilePath()%>"> <br>
							<br>
							<%=p.getPhotoContent()%>
						</div>
					</td>
				</tr>
			</table>
			<%
			if (m != null && p.getPhotoWriter().equals(m.getMemberId())) {
			%>
			<div class="wrap-bottom">
				<div>
					<button onclick="photoDelete(<%=p.getPhotoNo()%>);">삭제</button>
					<a href="/photoUpdateFrm.do?photoNo=<%=p.getPhotoNo()%>">수정</a>
				</div>
			</div>
			<%
			} else if (m != null && m.getMemberLevel() == 1) {
			%>
			<div class="wrap-bottom">
				<div>
					<button onclick="photoDelete(<%=p.getPhotoNo()%>);">삭제</button>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<script>
		function photoDelete(photoNo){
			if(confirm("삭제하시겠습니까?")) {
				location.href="/photoDelete.do?photoNo="+photoNo;
			}
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>