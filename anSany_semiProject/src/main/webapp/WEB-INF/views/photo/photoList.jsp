<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int totalCount = (Integer) request.getAttribute("totalCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진게시판</title>
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
				<li><a href="#"> <span class="tablink">자유게시판</span>
				</a></li>
				<li><a href="/photoList.do"> <span class="tablink">사진전
							<%=totalCount%></span>
				</a></li>
			</ul>
		</nav>
		<%
		if (m != null) {
		%>
		<div class="top-wrap">
			<div>
				<a href="/photoWriteFrm.do">사진올리기</a>
			</div>
		</div>
		<%
		}
		%>
		<div class="photoWrapper posting-wrap"></div>
		<button class="btn" id="more-btn" totalCount="<%=totalCount%>"
			currentCount="0" value="1">더보기</button>
			
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
		
		$("#more-btn").on("click",function(){
			const amount = 5;
			const start = $(this).val();
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>