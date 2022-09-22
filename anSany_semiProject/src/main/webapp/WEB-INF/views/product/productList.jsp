<%@page import="kr.co.ansany.product.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int totalCount = (Integer)request.getAttribute("totalCount");
    	Product p = (Product)request.getAttribute("p");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/productPage.css">
<link rel="stylesheet" href="css/notosans.css">
<title>오디오</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="product-wrap">
        <div class="product-top">
            <h2 class="product-top-title">오디오</h2>
            <div class="product-top-category">
                <div class="product-top-1"><a href="#">헤드셋/이어폰</a></div>
                <div class="product-top-2"><a href="#">스피커</a></div>
                <div class="product-top-3"><a href="#">턴테이블</a></div>
                <div class="product-top-4"><a href="#">워크맨/녹음기</a></div>
            </div>
        </div>
        <div class="product-content">
            <h2 class="product-content-title">제품(<%=totalCount %>)</h2>
            <div class="product-wrapper">
                <!-- 상품 div 들어갈 공간 -->
                <!-- <form action="/productView.do" method="post">
                	<input type="hidden" name="productNo" value= %>>
                </form>
                 -->
            </div>
            <div class="more-btn-div">
	            <button class="more-btn" 
	            totalCount="<%=totalCount%>" currentCount="0" value="1">제품 더보기 +</button>
            </div>
                <%--
				totalCount : 전체 게시물 수
				currentCount : 실제 jsp에 가지고 온 게시물 수
				value : 더보기 요청 시 다음 게시물 시작번호
			 	--%>
        </div>
    </div>
     <script>
     	 <%-- 세자리 콤마 정규 표현식 --%>
		 function addComma(value){
	    	 value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    	 return value;
	     };
	       
	     $(".more-btn").on("click",function(){
		 	 const amount = 4; // 더보기 클릭 시 추가로 가져올 게시물 수
		 	 const start = $(this).val(); // 추가로 가져올 게시물 시작번호
			 $.ajax({
					url : "/productMore.do",
					type : "post",
					data : {start:start, amount:amount},
					success : function(data){
						console.log(data);
						for(let i=0;i<data.length;i++){
							const p = data[i];
							const a = $("<a>");
							a.attr("href","/productView.do?productNo="+p.productNo);
							
							const div = $("<div>");
							div.addClass("product");
							
							const imgDiv = $("<div>");
							imgDiv.addClass("product-img");
							
							const img = $("<img>");
							img.attr("src","/upload/prodImg/"+p.productImg);
							
							imgDiv.append(img);
							
							const nameStrong = $("<strong>");
							nameStrong.addClass("product-name");
							nameStrong.append(p.productName);
							
							const infoP = $("<p>");
							infoP.addClass("product-info")
							infoP.append(p.productInfo);
							
							const priceSpan = $("<span>");
							priceSpan.addClass("product-price");
							priceSpan.append(addComma(p.productPrice)+"원");
							
								
							div.append(imgDiv);
							div.append(nameStrong);
							div.append(infoP);
							div.append(priceSpan);
							a.append(div);
							$(".product-wrapper").append(a);
						}
						// 화면 추가 완료 후 다음 더보기를 위한 값 수정
						// value를 증가 -> 기존 value + amount
						$(".more-btn").val(Number(start)+Number(amount));
						// currentCount값도 읽어온 만큼으로 수정
						const currentCount = Number($(".more-btn").attr("currentCount"))+data.length;
						$(".more-btn").attr("currentCount",currentCount);
						const totalCount = $(".more-btn").attr("totalCount");
						if(totalCount == currentCount) {
							$(".more-btn").remove(); // 더보기 버튼 없어지게
							$(".more-btn").attr("disabled",true); // 더보기 비활성화
							$(".more-btn").css("cursor","not-allowed"); // 커서 모양 변환
						}
					},
					error : function(){
						console.log("에러 발생");
					}
				});
		  	});	
	     $(".more-btn").click();
	 </script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>