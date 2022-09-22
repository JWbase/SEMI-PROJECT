<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.ansany.product.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Product p = (Product)request.getAttribute("p");
    	int productCount = 1;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
<link rel="stylesheet" href="css/productView.css">
<link rel="stylesheet" href="css/notosans.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<!-- productView 시작 -->
	<div class="product-view-wrapper">
        <div class="product-view-img">
            <img src="/upload/prodImg/<%=p.getProductImg()%>">
        </div>
        <div class="product-view-content">
            <div class="product-view-info">
                <p class="product-message">NEW</p>
                <p class="product-name"><%=p.getProductName()%></p>
                <p class="product-info"><%=p.getProductInfo()%></p>
                <p class="product-comment">이 제품은 기획전을 통해 구매하시면 더 많은 혜택을 받으실 수 있습니다.</p>
                <div class="product-price-div">
                   	<p class="product-price"><%=p.getProductPrice()%>원</p>
                    <p class="product-delivery">무료배송</p>
                </div>
                <p class="membership-comment">회원별 마일리지 적립혜택<span class="icon-question">!</span></p>
                <ul class="membership-ul">
                    <li class="vip">
                        <span class="vip-mark"></span>
                        <div class="save-info">
                            <span class="percent">VIP 4%</span><br>
                            <span class="num"><%=(int)(p.getProductPrice()*0.04)%></span>
                        </div>
                    </li>
                    <li class="membership">
                        <span class="membership-mark"></span>
                        <div class="save-info">
                            <span class="percent">MEMBERSHIP 2%</span><br>
                            <span class="num"><%=(int)(p.getProductPrice()*0.02)%></span>
                        </div>
                    </li>
                </ul>
                <div class="product-select-box">
                    <p>제품선택</p>
                    <select name="select-btn" id="select-btn">
                        <option value="" disabled selected>제품을 선택하세요.</option>
                        <option value="" id="select-option">제품명 : <%=p.getProductName()%></option>
                    </select>
                    <div class="product-option-box">
                        <p>제품</p>
                        <span>제품명 : <%=p.getProductName()%></span>
                        <div class="count-box">
                            <button class="minus">-</button>
                            <input type="text" class="count" value="<%=productCount %>">
                            <button class="plus">+</button>
                            <p><%=p.getProductPrice()*productCount%>원</p>
                        </div>
                    </div>
                </div>
                <div class="product-result-price">
                    <p>총 상품금액(총 <%=productCount-1 %>개)</p>
                    <span><%=p.getProductPrice()*(productCount-1)%>원</span>
                </div>
                <div class="result-btn-box">
                    <ul>
                        <a href="#" class="heart-btn"><li></li></a>
                        <a href="/cartView.do" class="cart-btn"><li></li></a>
                        <a href="#" class="gift-btn"><li></li></a>
                        <a href="#" class="buy-btn"><li>바로 구매하기</li></a>
                    </ul>
                </div>
            </div>
        </div>
    </div>
	<!-- productView 끝 -->
	<script>
		<%-- 세자리 콤마 정규 표현식 --%>
		 function addComma(value){
	   	 	value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	   	 	return value;
	    };
	    
	    <%-- 제품 선택하면 감춰놨던 div 나오도록 하는 코드 --%>
	    $("#select-btn").on("change",function(){
	    	$(".product-option-box").css("display","inline-block");
	    });
	    <%-- 제품 상세페이지에서 제품 수량 조절 버튼(-,+) 동작 코드 --%>
	  //수량 증가(+)버튼 클릭 시 1개 증가
	    $(".plus").on("click",function(){
	    	console.log("클릭되니??");
	        let productCount = $(this).prev();
	        $(".count").val(Number(productCount.val())+1);
	        //가격과 합계 불러오기
	        let cartPrice = $(this).parent().parent().prev().find("input");
	        let cartPriceSum = $(this).parent().parent().next().find("input");
	        //가격에서 콤마 제거 후 합계(가격*수량)계산
	        let numPrice = removeComma(cartPrice.val());
	        let numPriceSum = numPrice*cartCount.val();
	        console.log(typeof numPriceSum, numPriceSum);
	        cartPriceSum.val(numPriceSum);
	        //변경한 수량과 합계를 총수량, 결제예정금액에 반영
	        calCheckedCount();
	        calCheckedPrice();
	        //계산한 합계에 콤마 추가
	        console.log(typeof numPriceSum, numPriceSum);
	        numPriceSum = addComma(numPriceSum);
	        console.log(typeof numPriceSum, numPriceSum);
	        cartPriceSum.val(numPriceSum);
	    });
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>