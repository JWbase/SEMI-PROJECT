<%@page import="kr.co.ansany.photo.model.vo.PhotoComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.ansany.photo.model.vo.Photo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Photo p = (Photo) request.getAttribute("p");
ArrayList<PhotoComment> commentList = (ArrayList<PhotoComment>) request.getAttribute("commentList");
ArrayList<PhotoComment> reCommentList = (ArrayList<PhotoComment>) request.getAttribute("reCommentList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진전 상세보기</title>
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
	max-height: 800px;
	max-width: 800px;
}

.wrap-bottom {
	width: 960px;
	margin: 0 auto;
	margin-bottom: 36px;
}

.wrap-bottom>div>a {
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

th {
	vertical-align: middle;
}

.td-title {
	width: 300px
}

.inputCommentBox>form>ul {
	list-style-type: none;
	display: flex;
}

.inputCommentBox>form>ul>li:first-child {
	width: 15%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.inputCommentBox>form>ul>li:first-child>span {
	font-size: 80px;
}

.inputCommentBox>form>ul>li:nth-child(2) {
	width: 75%
}

.inputCommentBox>form>ul>li:nth-child(2)>textarea.input-form {
	height: 96px;
	min-height: 96px;
	resize: none;
}

.inputCommentBox>form>ul>li:last-child {
	width: 10%;
}

.inputCommentBox>form>ul>li:last-child>button {
	height: 96px;
	border: 1px solid black;
	background-color: black;
	color: #fff;
}


.inputRecommentBox {
	margin: 30px 0px;
	display: none;
}

.inputRecommentBox>form>ul {
	list-style-type: none;
	display: flex;
}

.inputRecommentBox>form>ul>li:first-child {
	width: 15%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.inputRecommentBox>form>ul>li:first-child>span {
	font-size: 50px;
}

.inputRecommentBox>form>ul>li:nth-last-child(2) {
	width: 75%;
}

.inputRecommentBox>form>ul>li:nth-last-child(2)>textarea.input-form {
	height: 96px;
	min-height: 96px;
}

.inputRecommentBox>form>ul>li:last-child {
	width: 10%;
}
.inputRecommentBox>form>ul>li:last-child>button {
	height: 96px;
	border: 1px solid black;
	background-color: black;
	color: #fff;
}

/* 댓글관련 css */
.posting-comment {
	display: flex;
	border-top: 2px solid #ccc;
	list-style-type: none;
}

.posting-comment>li {
	box-sizing: border-box;
}

.posting-comment>li:first-child {
	width: 15%;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100px;
	border-right: 1px solid #ccc;
}

.posting-comment.reply>li:first-child {
	width: 20%;
}

.posting-comment>li:first-child .material-icons {
	font-size: 80px;
}

.posting-comment.reply>li:first-child .material-icons:first-child {
	font-size: 40px;
}

.posting-comment.reply>li:last-child {
	display: flex;
	flex-direction: column;
	width: 80%;
}

.posting-comment>li:last-child {
	display: flex;
	flex-direction: column;
	width: 85%;
}

.posting-comment>li:last-child>p {
	width: 100%;
	padding: 5px;
	box-sizing: border-box;
}

.posting-comment>li:last-child>.comment-info>span {
	padding: 0px 10px;
}

.posting-comment>li:last-child>.comment-info>span:not(:last-child) {
	border-right: 2px solid #ccc;
}

.posting-comment>li:last-child>.comment-content {
	padding: 0px 15px;
}

.posting-comment>li:last-child>.comment-link {
	text-align: right;
}

.posting-comment>li:last-child>.comment-link>a {
	margin: 0px 5px;
}

.posting-comment>li:last-child>.comment-link>a:hover {
	text-decoration: underline;
}

.comment-link>a {
	text-decoration: none;
	color: #000;
}

.material-icons {
	color: #222222;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-wrap">
		<div class="page-content">
			<div class="page-title">사진전</div>
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
							<%=p.getPhotoContentBr()%>
						</div>
					</td>
				</tr>
			</table>
			<%
			if (m != null) {
			%>

			<div class="inputCommentBox">
				<form action="/insertComment.do" method="post">
					<ul>
						<li><span class="material-icons">account_box</span></li>
						<li><input type="hidden" name="pCommentWriter"
							value="<%=m.getMemberId()%>"> <input type="hidden"
							name="photoRef" value="<%=p.getPhotoNo()%>"> <input
							type="hidden" name="pCommentRef" value="0"> <textarea
								class="input-form" name="pCommentContent"></textarea></li>
						<li>
							<button type="submit" class="btn-repl">댓글쓰기</button>
						</li>
					</ul>
				</form>
			</div>
			<%
			}
			%>

			<div class="commentBox">
				<%
				for (PhotoComment pc : commentList) {
				%>
				<ul class="posting-comment">
					<li><span class="material-icons">account_box</span></li>
					<li>
						<p class="comment-info">
							<span><%=pc.getpCommentWriter()%></span> <span><%=pc.getpCommentDate()%></span>
						</p>
						<p class="comment-content"><%=pc.getpCommentContentBr()%>
							<textarea name="ncContent" class="input-form"
								style="min-height: 96px; display: none;"><%=pc.getpCommentContent()%></textarea>
						<p class="comment-link">
							<%
							if (m != null) {
							%>
							<%
							if (m.getMemberId().equals(pc.getpCommentWriter())) {
							%>
							<a href="javascript:void(0)"
								onclick="modifyComment(this,<%=pc.getpCommentNo()%>, <%=p.getPhotoNo()%>);">수정</a>
							<a href="javascript:void(0)">삭제</a>
							<%
							}
							%>
							<a href="javascript:void(0)" class="recShow">답글</a>
							<%
							}
							%>
						</p>
					</li>
				</ul>
				<%
				for (PhotoComment pct : reCommentList) {
				%>
				<%
				if (pct.getpCommentRef() == pc.getpCommentNo()) {
				%>
				<ul class="posting-comment reply">
					<li><span class="material-icons">subdirectory_arrow_right</span>
						<span class="material-icons">account_box</span></li>
					<li>
						<p class="comment-info">
							<span><%=pct.getpCommentWriter()%></span> <span><%=pct.getpCommentDate()%></span>
						</p>
						<p class="comment-content"><%=pct.getpCommentContentBr()%>
						<p class="comment-link">
					</li>
				</ul>
				<%
				}
				%>
				<%
				}
				%>

				<%
				if (m != null) {
				%>
				<div class="inputRecommentBox">
					<form action="/insertComment.do" method="post">
						<ul>
							<li><span class="material-icons">subdirectory_arrow_right</span>
							</li>
							<li><input type="hidden" name="pCommentWriter"
								value="<%=m.getMemberId()%>"> <input type="hidden"
								name="photoRef" value="<%=p.getPhotoNo()%>"> <input
								type="hidden" name="pCommentRef" value="<%=pc.getpCommentNo()%>">
								<textarea class="input-form" name="pCommentContent"></textarea></li>
							<li>
								<button type="submit" class="btn-repl">댓글쓰기</button>
							</li>
						</ul>
					</form>
				</div>
				<%
				}
				%>
				<%
				}
				%>
			</div>
		</div>
	</div>

	<script>
	
		function photoDelete(photoNo){
			if(confirm("삭제하시겠습니까?")) {
				location.href="/photoDelete.do?photoNo="+photoNo;
			}
		}
		
		$(".recShow").on("click",function(){
			const idx = $(".recShow").index(this);
			if($(this).text() == "답글") {
				$(this).text("취소");
			} else {
				$(this).text("답글");
			}
			$(".inputRecommentBox").eq(idx).toggle();
			$(".inputRecommentBox").eq(idx).find("textarea").focus();
		});
		
		function modifyComment(obj,pCommentNo,photoNo) {
			
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>