<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AN SANY 주문결제</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content">
        <div class="order-wrap">
            <div class="order-content">
                <div class="order-title"><h1>주문·결제</h1></div>
                <!-- 주문 단계 표시 -->
                <div class="order-step-wrap">
                    <div class="order-step">
                        <div class="order-step-circle complete-step"><span
                                class="material-symbols-outlined">local_mall</span></div>
                        <p>장바구니</p>
                    </div>
                    <div class="order-step-line active-step">
                    </div>
                    <div class="order-step">
                        <div class="order-step-circle active-step"><span
                                class="material-symbols-outlined">barcode_scanner</span></div>
                        <p>주문·결제</p>
                    </div>
                    <div class="order-step-line">
                    </div>
                    <div class="order-step">
                        <div class="order-step-circle"><span class="material-symbols-outlined">check_circle</span></div>
                        <p>주문 완료</p>
                    </div>
                </div>
                <!-- 구매할 제품 표시 -->
                <div class="cart-table">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2">제품</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>합계</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="cart-img">
                                    <img src="/img/WH-XB910N(블랙)_1.png">
                                </td>
                                <td class="cart-name">
                                    <span>제품명</span>
                                </td>
                                <td class="cart-price">
                                    <span>100,000,000</span>
                                    <span>원</span>
                                </td>
                                <td class="cart-count">
                                    <span>1</span>
                                    <span>개</span>
                                </td>
                                <td class="cart-pricesum">
                                    <span>100,000,000</span>
                                    <span>원</span>
                                </td>
                            </tr>
                            <tr>
                                <td class="cart-img">
                                    <img src="/img/105753554_1.png">
                                </td>
                                <td class="cart-name">
                                    <span>제품명</span>
                                </td>
                                <td class="cart-price">
                                    <span>5,000,000</span>
                                    <span>원</span>
                                </td>
                                <td class="cart-count">
                                    <span>1</span>
                                    <span>개</span>
                                </td>
                                <td class="cart-pricesum">
                                    <span>5,000,000</span>
                                    <span>원</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 주문결제창 -->
                <div class="order-table">
                    <!-- 주문정보 입력창 -->
                    <div class="order-left">
                        <div class="order-info">
                            <a class="order-toggle">주문자 정보
                                <span class="material-symbols-outlined">expand_less</span>
                            </a>
                            <div class="orderer">
                                <div>
                                    <label for="orderer-name">이름 <span class="require">*</span></label>
                                    <input type="text" name="orderer-name" id="orderer-name" value="로그인한 회원이름">
                                </div>
                                <div>
                                    <label for="orderer-email">이메일 <span class="require">*</span></label>
                                    <input type="text" name="orderer-email" id="orderer-email" value="로그인한 회원 이메일">
                                </div>
                                <div>
                                    <label for="orderer-phone">전화번호 <span class="require">*</span></label>
                                    <input type="text" name="orderer-phone" id="orderer-phone" value="로그인한 회원 전화번호">
                                </div>
                            </div>
                        </div>
                        <div class="order-info">
                            <a class="order-toggle">배송지 정보
                                <span class="material-symbols-outlined">expand_less</span>
                            </a>
                            <div class="delivery">
                                <div>
                                    <input type="checkbox" id="get-orderer">
                                    <label for="get-orderer" id="get-orderer2"></label>
                                    <label for="get-orderer">주문자 정보와 동일</label>
                                </div>
                                <div>
                                    <label for="delivery-name">수령인 <span class="require">*</span></label>
                                    <input type="text" name="delivery-name" id="delivery-name" placeholder="이름을 입력하세요.">
                                </div>
                                <div>
                                    <label for="delivery-name">전화번호 <span class="require">*</span></label>
                                    <input type="text" name="delivery-phone" id="delivery-phone" placeholder="입력 예) 010-0000-0000">
                                </div>
                                <div>
                                    <label for="search-address">주소 <span class="require">*</span></label>
                                    <div class="address">
                                        <input type="text" id="sample4_postcode" placeholder="우편번호" readonly>
                                        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 검색" id="search-address"><br>
                                        <input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly>
                                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소" readonly>
                                        <span id="guide" style="color:#999;display:none"></span>
                                        <input type="text" id="sample4_detailAddress" placeholder="주소를 입력해주세요.">
                                    </div>
                                </div>
                                <div>
                                    <label for="delivery-memo">배송요청사항</label>
                                    <input type="text" name="delivery-memo" id="delivery-memo" placeholder="택배기사님께 요청하실 내용을 입력하세요.">
                                </div>
                            </div>
                        </div>
                        <div class="order-info">
                            <a class="order-toggle">할인 정보
                                <span class="material-symbols-outlined">expand_less</span>
                            </a>
                            <div class="discount">
                                <div>
                                    <label for="get-mileage">마일리지</label>
                                    <input type="text" name="mileage" value="0점 보유">
                                    <button id="get-mileage">모두 사용</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 결제창 -->
                    <div class="order-right">
                        <div class="total-price">
                            <p>결제 예정 금액</p>
                            <p id="total-price">
                                <span id="total-price">104,990,000</span>
                                <span>원</span>
                            </p>
                        </div>
                        <div class="price-info">
                            <div>주문 금액</div>
                            <div>
                                <span id="order-price">105,000,000</span>
                                <span>원</span>
                            </div>
                            <div class="discount-price">할인 금액</div>
                            <div class="discount-price">
                                <span>- </span>
                                <span id="discount-price">10,000</span>
                                <span>원</span>
                            </div>
                        </div>
                        <div class="payment">
                            <div>
                                <input type="checkbox" name="payment-agree" id="payment-agree">
                                <label for="payment-agree" id="payment-agree2"></label>
                                <label for="payment-agree">
                                    <p>[필수] 주문할 제품의 거래조건을 확인하였으며, 구매에 동의하시겠습니까?<span>(전자상거래법 제8조 제2항)</span></p>
                                </label>
                            </div>
                            <button id="payment" onclick="location.href='/order_complete.html'">결제</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>