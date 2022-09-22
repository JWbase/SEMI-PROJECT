<%@page import="kr.co.ansany.cart.model.vo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	int totalCount = 0;
	int totalPrice = 0;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AN SANY 장바구니</title>
<link rel="stylesheet" href="css/notosans.css">
<link rel="stylesheet" href="css/cart.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content">
		<div class="cart-wrap">
			<div class="cart-content">
				<div class="cart-title">
					<h1>장바구니</h1>
				</div>
				<!-- 주문 단계 표시 -->
				<div class="order-step-wrap">
					<div class="order-step">
						<div class="order-step-circle active-step">
							<span class="material-symbols-outlined">local_mall</span>
						</div>
						<p>장바구니</p>
					</div>
					<div class="order-step-line"></div>
					<div class="order-step">
						<div class="order-step-circle">
							<span class="material-symbols-outlined">barcode_scanner</span>
						</div>
						<p>주문·결제</p>
					</div>
					<div class="order-step-line"></div>
					<div class="order-step">
						<div class="order-step-circle">
							<span class="material-symbols-outlined">check_circle</span>
						</div>
						<p>주문 완료</p>
					</div>
				</div>
				<% if(list.isEmpty()){%>
				<!-- 장바구니 목록 없는 경우 -->
				<div class="cart-empty">
					<table>
						<tr>
							<td colspan="7">
								<div>
									<span>장바구니에 담긴 상품이 없습니다.</span>
								</div>
							</td>
						</tr>
					</table>
					<div class="btn-wrap empty">
						<button type="button" onclick="location.href='#'">쇼핑 계속
							하기</button>
					</div>
				</div>
				<%} else{%>
				<!-- 장바구니 전체선택/선택삭제 버튼 -->
				<div class="cart-select">
					<div class="selectbox">
						<input type="checkbox" name="select-all" id="select-all">
						<label for="select-all" id="select-all2"></label> <label
							for="select-all">전체</label>
					</div>
					<div class="select-removebtn">
						<button type="button" id="select-removebtn">선택 삭제</button>
					</div>
				</div>
				<!-- 장바구니 목록 -->
				<div class="cart-table">
					<table>
						<thead>
							<tr>
								<th colspan="3">제품</th>
								<th>가격</th>
								<th>수량</th>
								<th>합계</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Cart c : list) {
							%>
							<tr>
								<td class="cart-checkbox">
									<input type="checkbox" name="select-one" id="cart-product">
									<label for="cart-product"></label>
								</td>
								<td class="cart-img"><img src="/img/WH-XB910N(블랙)_1.png"></td>
								<td class="cart-name"><span><%=c.getProductName() %></span></td>
								<td class="cart-price"><input class="cart-price-value" value="<%=c.getProductPrice() %>" readonly><span>원</span></td>
								<td class="cart-count">
									<div class="cart-count-wrap">
										<button type="button" class="cart-count-minus"><span class="material-symbols-outlined">remove</span></button>
										<input type="text" class="cart-count-value" name="cart-count" value="<%=c.getOrderQty() %>">
										<button type="button" class="cart-count-plus"><span class="material-symbols-outlined">add</span></button>
									</div>
								</td>
								<td class="cart-pricesum"><input class="cart-pricesum-value" value="<%=c.getProductPrice()*c.getOrderQty() %>" readonly><span>원</span></td>
								<td>
									<button class="cart-removebtn">
										<span class="material-symbols-outlined">close</span>
									</button>
								</td>
							</tr>
							<%} %>
						</tbody>
						<!-- 결제예정금액 표시 -->
						<tfoot>
							<tr>
								<td colspan="7">
								<span class="tfoot-span1">결제 예정 금액</span>
								<span class="tfoot-span1">(총 </span>
								<input id="total-count" value="0" readonly>
								<span class="tfoot-span1">개)</span>
								<input id="total-price" value="0" readonly class="tfoot-span2">
								<span class="tfoot-span2">원</span></td>
							</tr>
							<tr>
								<td colspan="7"><span class="tfoot-span3">* 최종 결제금액은 회원등급별 할인율 적용에 따라 달라질 수 있습니다.</span></td>
							</tr>
						</tfoot>
					</table>
					<!-- 쇼핑 계속 / 구매 버튼 -->
					<div class="btn-wrap buy">
						<button type="button" onclick="location.href='#'">쇼핑 계속
							하기</button>
						<button type="button" onclick="location.href='/order.html'">구매하기</button>
					</div>
				</div>
				<!-- cart-table종료 -->
				<%} %>
			</div>
			<!-- cart-content종료(width:1200px) -->
		</div>
		<!-- cart-wrap종료(width:100%) -->
	</div>
	<!-- content종료 -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script src="/js/cart.js"></script>
</html>