<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AN SANY 주문완료</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content">
        <div class="order-wrap">
            <div class="order-content">
                <div class="order-title"><h1>주문 완료</h1></div>
                <div class="order-step-wrap">
                    <div class="order-step">
                        <div class="order-step-circle complete-step">
                            <span class="material-symbols-outlined">local_mall</span>
                        </div>
                        <p>장바구니</p>
                    </div>
                    <div class="order-step-line active-step">
                    </div>
                    <div class="order-step">
                        <div class="order-step-circle complete-step">
                            <span class="material-symbols-outlined">barcode_scanner</span>
                        </div>
                        <p>주문·결제</p>
                    </div>
                    <div class="order-step-line active-step">
                    </div>
                    <div class="order-step">
                        <div class="order-step-circle active-step">
                            <span class="material-symbols-outlined">check_circle</span>
                        </div>
                        <p>주문 완료</p>
                    </div>
                </div>
                <div class="complete-msg">
                    <div>
                        <p>주문이 완료되었습니다.</p>
                        <p>감사합니다.</p>
                    </div>
                </div>
                <div class="btn-wrap">
                    <button type="button" onclick="location.href='#'">쇼핑 계속 하기</button>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>