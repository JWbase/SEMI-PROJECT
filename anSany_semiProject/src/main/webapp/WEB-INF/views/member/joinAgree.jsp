<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의</title>
<style>
	.header-logo>a>img{
		margin-bottom: 14px;
	}
</style>
<!--css-->
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/joinAgree.css">
<!--fonts-->
<link rel="stylesheet" href="/css/Noto_Sans.css">
<!--구글 아이콘-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!--jquery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content">
		<div class="join-agree-wrap">
			<div class="agree-header">
				<h1>안사니 스토어</h1>
				<div class="header-text">
					<span>안사니와 안사니 고객지원 사이트는 하나의 아이디와 비밀번호로 운영됩니다.</span> <span>안사니
						고객지원 사이트의 이용약관에 함께 동의하시면,</span> <span>하나의 아이디로 고객지원 사이트를 편리하게
						이용하실수 있습니다.</span>
				</div>
			</div>
			<!--agree-header 끝-->
			<div class="contentdetail">
				<div class="all-box">
					<span class="allAgree-title">약관 전체 동의</span>
					<div class="form-check form-switch">
						<label class="form-check-label" for="flexSwitchCheckDefault">
							<input class="form-check-input" type="checkbox" role="switch"
							id="flexSwitchCheckDefault"> <span class="toggle"></span>
						</label>
					</div>
				</div>
				<div class="agree-check-box">
					<div class="chk_cell">
						<div class="check">
							<input type="checkbox" class="inp_check" id="chk00"
								name="essential"> <label for="chk00">[필수]안사니스토어
								쇼핑몰 이용약관 동의</label> <a href="javascript:void(0)" class="btn_view">전체보기</a>
						</div>
					</div>
					<div class="chk_cell">
						<div class="check">
							<input type="checkbox" class="inp_check" id="chk01"
								name="essential"> <label for="chk01">[필수]안사니
								고객지원 사이트 이용약관 동의</label> <a href="javascript:void(0)" class="btn_view">전체보기</a>
						</div>
					</div>
					<div class="chk_cell">
						<div class="check">
							<input type="checkbox" class="inp_check" id="chk02"
								name="essential"> <label for="chk02">[필수]회원가입
								개인정보 수집에 관한 동의</label> <a href="javascript:void(0)" class="btn_view">전체보기</a>
						</div>
					</div>
					<div class="chk_cell">
						<div class="check">
							<input type="checkbox" class="inp_check" id="chk03"
								name="essential"> <label for="chk03">[필수]개인정보
								위탁에 관한 동의</label> <a href="javascript:void(0)" class="btn_view">전체보기</a>
						</div>
					</div>
					<div class="chk_cell">
						<div class="check">
							<input type="checkbox" class="inp_check" id="chk04"> <label
								for="chk04">[선택]이벤트 등 프로모션 알림 메일 수신</label> <a
								href="javascript:void(0)" class="btn_view">전체보기</a>
						</div>
					</div>
					<div class="chk_cell">
						<div class="check">
							<input type="checkbox" class="inp_check" id="chk05"> <label
								for="chk05">[선택]이벤트 등 프로모션 알림 SMS 수신</label> <a
								href="javascript:void(0)" class="btn_view">전체보기</a>
						</div>
					</div>
				</div>
			</div>
			<!--contentdetail 끝-->
			<div class="agree-footer">
				<div class="agree-btn-box">
					<a href="#">
						<button type="button" class="btn-agree">동의</button>
					</a>
				</div>
			</div>
			<!--agree-footer 끝-->
		</div>
		<!--join-agree-wrap 끝-->
	</div>
	<!--컨텐츠 끝-->
	<div class="modal-wrap">
		<div class="modal">
			<div class="allViewAgree">
				<div class="agreeText">
					<div class="agreeTextTitle">
						<span class="material-symbols-outlined">close</span>
						<h2>안사니스토어 쇼핑몰 이용약관 동의</h2>
						<strong>제1장 총칙</strong> <strong>제1조 (목적)</strong> <span>본
							약관은 안사니코리아 주식회사 (이하 회사라 한다.)가 운영하는 안사니코리아 공식 웹사이트(이하 공식 웹사이트라
							한다.)가 제공하는 인터넷관련 서비스 (이하 서비스라 한다.)를 이용함에 있어 공식 웹사이트와 이용자의 권리, 의무
							및 책임사항을 규정하는 것을 목적으로 합니다.</span>
					</div>
					<div class="agreeTextContent">
						<strong>제2조 (정의)</strong> <span> ① Ansany Store라 함은 회사가 재화
							또는 용역(이하 재화등이라 함)을 이용자에게 제공하기위해 컴퓨터등 정보통신설비를 이용하여 상품을 거래할 수 있도록
							설정한 가상의 영업장을 말하며 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다. ② 이용자라 함은 Ansany
							Store에 접속하여 이 약관에 따라 Ansany Store가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. ③
							회원이라 함은 Ansany Store에 개인정보를 제공하여 회원등록을 한 자로서 Ansany Store가 제공하는
							정보를 지속적으로 받으며 Ansany Store의 서비스를 계속 제공받을 수 있는 자를 말합니다. ④ 비회원이라 함은
							회원에 가입하지 않고 서비스를 이용하는 자를 말합니다. ⑤ 회원아이디(ID)라 함은 회원의 식별과 서비스 이용을 위해
							회원이 정하고 Ansany Store가 승인하는 문자 또는 숫자의 조합으로 회사가 운영하는 다른 인터넷사이트와
							동일하게 사용하게 됩니다. 단, Ansany Store에 가입한 회원이 안사니 코리아가 제공하는 콜럼비아 트라이스타
							사이트에 회원으로 가입하는 경우, Ansany Store와 동일한 회원 아이디(ID)와 비밀번호를 사용해야 합니다.
							⑥ Ansany Store 멤버십제도는 Ansany Store 온라인 가입 회원에게 해당되는 것으로 상품구입시
							마일리지 제공 및 기타 이벤트 참가기회 제공 등 차별화된 서비스를 제공하는 것을 말합니다. </span> <strong>제3조
							(약관의 게시, 효력, 개정)</strong> <span> ① Ansany Store는 본 약관의 내용과 상호 및 대표자
							성명, 영업소소재지(및 소비자의 불만을 처리할 수 있는 곳의 주소), 전화번호, fax번호, 전자우편주소,
							사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 알 수 있도록 Ansany Store의
							초기화면에 게시합니다. 단, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. ② Ansany
							Store는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용중 청약철회, 배송책임, 환불조건 등과 같은
							중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야
							합니다. ③ 본 약관은 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제등에 관한 법률, 전자거래기본법,
							전자서명법, 정보통신망이용촉진 및 정보보호등에 관한 법률, 방문판매등에 관한 법률, 소비자보호법등 관련법을 위반하지
							않는 범위내에서 개정될 수 있습니다. ④ 회사가 본 약관을 이용자에게 불리하게 변경하는 경우에는 최소한 30일 이상의
							사전 유예기간을 두고 공지합니다. 이 경우 Ansany Store는 개정전 내용과 개정후 내용을 명확하게 비교하여
							이용자가 알기 쉽도록 표시합니다. ⑤ 회사가 약관을 개정할 경우에는 그 개정약관은 적용일자 이후에 체결된 계약에만
							적용되고 그 이전에 이미 체결된 계약에 관해서는 개정전의 약관이 적용됩니다. 단, 이미 계약을 체결한 이용자가
							개정약관의 적용을 받기를 원하는 뜻을 제④항의 공지기간내 Ansany Store에 송신하여 Ansany Store의
							동의를 받은 경우는 개정약관 조항이 적용됩니다. ⑥ 본 약관에 명시되지 않은 사항과 본 약관의 해석에 관해서는
							전자상거래등에서의 소비자보호에 관한 법, 약관의규제등에 관한 법,공정거래위원회가 정하는 전자상거래등에서의
							소비자보호지침 및 관계법령 또는 상관례에 따릅니다. </span>
					</div>
				</div>
				<div class="agreeOneBtn">
					<button type="button" class="chkBtn">동의</button>
				</div>
			</div>
			<div class="allViewAgree">
				<div class="agreeText">
					<div class="agreeTextTitle">
						<span class="material-symbols-outlined">close</span>
						<h2>안사니 고객지원 사이트(SCS) 이용약관 동의</h2>
						<strong>제1장 총칙</strong> <strong>제1조 (목적)</strong> <span>본
							약관은 안사니코리아주식회사 (이하 회사라 합니다.)가 운영하는 사이버 고객지원 페이지인 AnSany Customer
							Station (이하 SCS 이라 합니다.)이 제공하는 인터넷관련 서비스 (이하 서비스라 합니다.)를 이용함에 있어
							SCS와 이용자의 권리, 의무 및 책임사항을 규정하는 것을 목적으로 합니다. 본 약관은 "온라인 수리요금 결제 서비스
							이용약관" 및 " 안사니 아카데미 유료강좌 이용약관"에서 특별히 정하지 않은 사항에 대해서도 공통적으로 적용됩니다.</span>
					</div>
					<div class="agreeTextContent">
						<strong>제2조 (정의)</strong> <span> ① 이용자라 함은 SCS에 접속하여 이 약관에
							따라 SCS가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. ② 회원이라 함은 SCS에 개인정보를 제공하여
							회원등록을 한 자로서, SCS의 정보를 지속적으로 제공받으며, SCS가 제공하는 서비스를 계속적으로 이용할 수 있는
							자를 말합니다. ③ 비회원이라 함은 회원에 가입하지 않고 SCS에서 제공하는 서비스를 이용하는 자를 말합니다. ④
							회원아이디(ID)라 함은 회원의 식별과 서비스 이용을 위해 회원이 정하고 SCS가 승인하는 문자 또는 숫자의 조합으로
							회사가 운영하는 다른 인터넷사이트와 동일하게 사용하게 됩니다. </span> <strong>제3조 (약관의 게시,
							효력, 개정)</strong> <span> ① SCS는 본 약관의 내용과 상호 및 대표자 성명, 영업소소재지(및 소비자의
							불만을 처리할 수 있는 곳의 주소), 전화번호, fax번호, 전자우편주소, 사업자등록번호, 통신판매업 신고번호,
							개인정보관리책임자 등을 이용자가 알 수 있도록 SCS의 초기화면에 게시합니다. 단, 약관의 내용은 이용자가 연결화면을
							통하여 볼 수 있도록 할 수 있습니다. ② SCS는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중
							청약철회, 배송책임, 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을
							제공하여 이용자의 확인을 구하여야 합니다. ③ 본 약관은 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제
							등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 및 정보보호 등에 관한 법률, 방문판매 등에 관한
							법률, 소비자보호법 등 관련법을 위반하지 않는 범위 내에서 개정될 수 있습니다. ④ 회사가 본 약관을 개정할 경우
							적용일자 및 개정사유를 명시하여 현행약관과 함께SCS초기화면에 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
							다만 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우
							SCS는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. ⑤ 회사가 약관을 개정할
							경우에는 그 개정약관은 적용일자 이후에 체결된 계약에만 적용되고 그 이전에 이미 체결된 계약에 관해서는 개정전의
							약관이 적용됩니다. 단, 이미 계약을 체결한 이용자가 개정약관의 적용을 받기를 원하는 뜻을 제④항의 공지기간 내
							SCS에 송신하여 SCS의 동의를 받은 경우는 개정약관 조항이 적용됩니다. ⑥ 본 약관에 명시되지 않은 사항과 본
							약관의 해석에 관해서는 전자상거래 등에서의 소비자보호에 관한 법, 약관의 규제 등에 관한 법,공정거래위원회가 정하는
							전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다. </span>
					</div>
				</div>
				<div class="agreeOneBtn">
					<button type="button" class="chkBtn">동의</button>
				</div>
			</div>
			<div class="allViewAgree">
				<div class="agreeText">
					<div class="agreeTextTitle">
						<span class="material-symbols-outlined">close</span>
						<h2>회원가입 개인정보 수집에 관한 동의</h2>
						<strong>수집, 이용목적</strong> <span>서비스 제공에 관한 계약 및 서비스제공에 따른
							요금정산, 회원관리</span>
					</div>
					<div class="agreeTextContent">
						<strong>수집하는 개인정보 항목</strong>
						<div class="layer_tbl">
							<table>
								<colgroup>
									<col style="width: 35%;">
									<col>
								</colgroup>
								<tread>
								<tr>
									<th scope="col">회원가입</th>
									<th scope="col">수집하는 개인정보 항목</th>
								</tr>
								</tread>
								<tbody>
									<tr>
										<td>일반 회원 가입 시</td>
										<td>필수 항목 : 이메일 주소 (아이디),성명, 비밀번호, 휴대폰번호, 생년월일, 성별 최초상품
											주문시 : 주소</td>
									</tr>
									<tr>
										<td>외국인 회원 가입 시</td>
										<td>필수 항목 : 이메일 주소 (아이디),성명, 비밀번호, 휴대폰번호, 생년월일, 성별 최초상품
											주문시 : 주소</td>
									</tr>
									<tr>
										<td>법인 회원 가입 시</td>
										<td>필수 항목 : 이메일 주소 (아이디),성명, 비밀번호, 휴대폰번호, 생년월일, 성별 최초상품
											주문시 : 주소</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--테이블 끝-->
						<strong>개인정보 보유 및 이용기간</strong> <span>수집된 개인정보는 회원 탈퇴및 서비스
							종료시까지 보관됩니다. 단, 회원가입 후 1년동안 이용하지 않은 고객의 개인정보는 파기됩니다.</span> <strong>개인정보
							수집에 거부할수 있으며, 거부할 경우 회원가입이 제한됩니다.</strong>
					</div>
				</div>
				<div class="agreeOneBtn">
					<button type="button" class="chkBtn">동의</button>
				</div>
			</div>
			<div class="allViewAgree">
				<div class="agreeText">
					<div class="agreeTextTitle">
						<span class="material-symbols-outlined">close</span>
						<h2>개인정보 위탁에 관한 동의</h2>
						<span>회사는 원활한 고객서비스 이행을 위해 아래와 같이 외부 전문 업체에 개인정보를 위탁 운영하고
							있습니다. 개인정보 위탁에 대하여 거부할 수 있으며 거부 시 회원가입이 제한됩니다.</span>
					</div>
				</div>
				<div class="agreeOneBtn">
					<button type="button" class="chkBtn">동의</button>
				</div>
			</div>
			<div class="allViewAgree">
				<div class="agreeText">
					<div class="agreeTextTitle">
						<span class="material-symbols-outlined">close</span>
						<h2>이벤트 등 프로모션 알림 메일 수신</h2>
					</div>
					<div class="agreeTextContent">
						<strong>수집 이용목적</strong> <span> 마케팅 등 프로모션 이메일 및 SNS 알림 </span> <strong>수집하는
							개인정보 항목</strong> <span> 필수 : 이메일 주소(아이디), 성명, 휴대폰번호, 생년월일 </span> <strong>개인정보
							보유 및 이용기간</strong> <span> 수집된 개인정보는 회원 탈퇴 및 서비스 종료 시까지 보관됩니다. 단,
							회원가입 후 1년 동안 이용하지 않은 고객의 개인정보는 파기됩니다. </span> <strong>개인정보 수집에
							거부할 수 있으며, 동의를 거부할 경우 이에 따른 불이익은 없습니다.</strong>
					</div>
				</div>
				<div class="agreeOneBtn">
					<button type="button" class="chkBtn">동의</button>
				</div>
			</div>
			<div class="allViewAgree">
				<div class="agreeText">
					<div class="agreeTextTitle">
						<span class="material-symbols-outlined">close</span>
						<h2>이벤트 등 프로모션 알림 sms 수신</h2>
					</div>
					<div class="agreeTextContent">
						<strong>수집 이용목적</strong> <span> 마케팅 등 프로모션 이메일 및 SNS 알림 </span> <strong>수집하는
							개인정보 항목</strong> <span> 필수 : 이메일 주소(아이디), 성명, 휴대폰번호, 생년월일 </span> <strong>개인정보
							보유 및 이용기간</strong> <span> 수집된 개인정보는 회원 탈퇴 및 서비스 종료 시까지 보관됩니다. 단,
							회원가입 후 1년 동안 이용하지 않은 고객의 개인정보는 파기됩니다. </span> <strong>개인정보 수집에
							거부할 수 있으며, 동의를 거부할 경우 이에 따른 불이익은 없습니다.</strong>
					</div>
				</div>
				<div class="agreeOneBtn">
						<button type="button" class="chkBtn">동의</button>
				</div>
			</div>
		</div>
		<!--modal 끝-->
	</div>
	<!--modal-wrap끝-->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/js/header.js"></script>
	<script src="/js/joinAgree.js"></script>
</body>
</html>