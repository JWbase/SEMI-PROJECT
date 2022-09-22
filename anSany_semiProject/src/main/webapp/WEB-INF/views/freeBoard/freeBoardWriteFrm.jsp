<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
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

.th-1 {
	line-height: 29.5px
}

.td-1 {
	width: 600px;
}

.td-3 {
	width: 100%;
	height: 46px;
	padding-left: 10px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">

	<div class="page-wrap">
		<div class="page-content">
			<div class="page-title">공지사항</div>
			<form action="/noticeWrite.do" method="post"
				enctype="multipart/form-data">
				<table class="table table-borderless" id="noticeWrite">
					<tr class="table table-dark">
						<th class="th-1">제목</th>
						<td class="td-1" style="padding: 0;"><input type="text"
							name="noticeTitle" class="td-3" style="outline-style: none;"></td>
						<th class="th-1">첨부파일</th>
						<td style="text-align: left;"><input type="file"
							name="upfile" class="td-2"> <input type="hidden"
							name="noticeWriter" value="<%=m.getMemberId()%>"></td>
					</tr>
					<tr>
						<td colspan="4"
							style="text-align: left; padding: 0; padding-top: 8px;"><textarea
								id="noticeContent" name="noticeContent" class="input-form"></textarea></td>
					</tr>
					<tr>
						<td colspan="4">
							<button type="submit" class="btn-submit">작성하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
		$("#noticeContent").summernote({
			height : 400,
			lang : "ko-KR",
			callbacks : {
				onImageUpload : function(files) {
					uploadImage(files[0], this);
				}
			}
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>