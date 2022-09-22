<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
    <!--css-->
    <link rel="stylesheet" href="/css/myPage.css">
    <!--fonts-->
    <link rel="stylesheet" href="/css/Noto_Sans.css">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>
<content>
        <div class="mypage-wrap">
            <div class="mypage-header">
                <h1>마이페이지</h1>
                <div class="span-wrap">
                    <span class="welecome">회원이름 안녕하세요 :)</span>
                    <a href="/logout.do" class="logoutLink" name="logout">로그아웃</a>
                </div>
                <ul class="header-box">
                    <a href="#"><li class="oneMemberLevel">회원등급</li></a>
                    <a href="/updateMemberInfoFrm.do"><li class="oneMemberInfo">회원정보수정</li></a>
                    <a href="#"><li class="oneMembercart">장바구니</li></a>
                </ul>
            </div>
            <div class="mypage-content">
                <div class="memberOrder_tbl">
                    <h1>주문내역</h1>
                    <table>
                        <colgroup>
                            <col style="width: 120px;">
                            <col>
                            <col style="width: 160px;">
                            <col style="width: 160px;">
                        </colgroup>
                        <tread>
                            <tr>
                                <th scope="col">주문일</th>
                                <th scope="col">주문번호</th>
                                <th scope="col">상품정보</th>
                                <th scope="col">상품가격</th>
                            </tr>
                        </tread>
                        <tbody>
                            <tr>
                                <td scope="col">주문날짜</td>
                                <td scope="col">주문번호</td>
                                <td scope="col">상품명</td>
                                <td scope="col">내용</td>
                            </tr>
                        </tbody>
                    </table>
                    <p>
                        작성 가능한 구매후기가 있어요 구매후기를 작성하신 고객님께
                        <strong class="reserve">적립금</strong>
                        을 지급해 드립니다
                    </p>
                </div>
                <div class="myBoardView_tbl">
                    <h1>1:1 문의내역</h1>
                    <table>
                        <colgroup>
                            <col style="width: 120px;">
                            <col>
                            <col style="width: 160px;">
                            <col style="width: 160px;">
                            <col style="width: 100px;">
                        </colgroup>
                        <tread>
                            <tr>
                                <th scope="col">상담구분</th>
                                <th scope="col">상담제목</th>
                                <th scope="col">작성일</th>
                                <th scope="col">답변유무</th>
                                <th scope="col">삭제</th>
                            </tr>
                        </tread>
                        <tbody>
                            <tr>
                                <td>교환문의</td>
                                <td>색상변경</td>
                                <td>작성일</td>
                                <td>답변유무</td>
                                <td class="colDelete-btn">
                                    <button type="button">삭제</button>
                                </td>
                            </tr>
                        </tbody>
                    </table><!--table 끝-->
                </div>
            </div>
        </div>
    </content><!--컨텐츠 끝-->
<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>