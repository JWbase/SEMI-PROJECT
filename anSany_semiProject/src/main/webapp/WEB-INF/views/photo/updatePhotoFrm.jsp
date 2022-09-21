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
<title>사진전 수정</title>
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
	background-color: #fff;
	padding-bottom: 50px;
}

.page-content {
	width: 1280px;
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

.btn-submit {
	width: 15%;
	height: 40px;
	background-color: #000;
	color: #fff;
	font-size: 1.2em;
}

.btn-submit:hover {
	background-color: #5865f5;
	border: 0;
}

.page-title {
	padding: 20px 0px;
	font-size: 1.5rem;
}

.table {
	border-spacing: 0px;
	border-collapse: collapse;
}

th {
	vertical-align: middle;
}

.td-3 {
	width: 100%;
	height: 46px;
	padding-left: 10px;
	border: 0;
}

textarea.input-form {
	resize: none;
	min-height: 300px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-wrap">
		<div class="page-content">
			<div class="page-title">사진전</div>
			<form action="/photoUpdate.do" method="post"
				enctype="multipart/form-data">
				<table class="table table-bordered" id="photoWrite">
					<tr class="">
						<th class="th-1 table-active">제목</th>
						<td colspan="3" class="td-1" style="padding: 0;"><input
							type="text" name="photoTitle" class="td-3"
							style="outline-style: none;" value="<%=p.getPhotoTitle()%>">
							<input type="hidden" name="photoNo" value="<%=p.getPhotoNo()%>">
							<input type="hidden" name="status" value="stay"></td>
						</td>
					</tr>
					<tr>
						<th class="th-1 table-active">사진</th>
						<td colspan="3">
							<%
							if (p.getPhotoFilePath() != null) {
							%> <img src="/img/file.png" width="16px" class="delFile"> <span
							class="delFile"><%=p.getPhotoFileName()%></span>
							<button type="button" class="delFile">삭제</button> <input
							type="file" name="upFile" accept=".jpg,.png,.jpeg"
							onchange="loadImg(this);" style="display: none;"> <input
							type="hidden" name="oldFileName" value="<%=p.getPhotoFileName()%>">
							<input
							type="hidden" name="oldFilePath" value="<%=p.getPhotoFilePath()%>">  
							<%} else {
 %> <input type="file" name="upFile" accept=".jpg,.png,.jpeg"
							onchange="loadImg(this);">
						</td>
						<%
						}
						%>
					</tr>
					<tr>
						<th class="table-active">사진 미리보기</th>
						<td colspan="3">
							<div id="img-viewer">
								<img id="img-view" width="500px">
							</div>
						</td>
					</tr>
					<tr>
						<th class="th-1 table-active" style="line-height: 272.4px;">내용</th>
						<td colspan="3" style="text-align: left; padding: 0;"><textarea
								id="photoContent" name="photoContent" class="input-form"><%=p.getPhotoContent()%></textarea></td>
					</tr>
					<tr>
						<td colspan="4">
							<button type="submit" class="btn-submit">수정하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
		$("button.delFile").on("click", function() {
			$(".delFile").hide();
			$(this).next().show();
			$("[name=status]").val("delete");
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>