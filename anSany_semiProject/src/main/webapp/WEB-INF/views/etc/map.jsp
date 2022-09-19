<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직영점 안내 : 찾아오시는 길</title>
<style>
.btn {
	background: rgb(242, 242, 242);
	padding: 0.5em;
	height: 32px;
	font-size: 14px;
	min-width: 82px;
	color: #444;
	border: 1px solid #ddd;
}

.btn:hover {
	cursor: pointer;
}
</style>
<link rel="stylesheet" href="css/store.css"></link>
<script src="/js/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5ya8c2ww8s&submodules=geocoder"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="store_info_wrap">
		<div class="bg_img">
			<img src="img/store.jpg"> <span class="bg"></span>
		</div>
		<div class="store_info_wrap_txtbox">
			<strong class="info_txt">직영점 안내</strong>
			<h1 class="info_store_title">안사니스토어 압구정</h1>
			<p class="info_desc">
				안사니 전 제품을 직접 체험하고,<br> 컨설팅도 받아 볼 수 있는 안사니스토어 직영점을 방문해 보세요!
			</p>
		</div>
		<div class="store_info_wrap_guidebox">
			<div class="guidebox_wrapper">
				<div class="guidebox">
					<span class="box_title">매장 운영시간</span>
					<div class="box_time">
						<em class="everyday">매일</em> <span class="time">11:00~20:00</span>
					</div>
				</div>
				<div class="guidebox">
					<span class="box_title">매장 전화번호</span>
					<div class="box_time">
						<em class="everyday">02)</em> <span class="time">515-7946</span>
					</div>
				</div>
				<div class="guidebox">
					<span class="box_title">고객센터 운영시간</span>
					<div class="box_day">
						<p class="day">월-금요일</p>
						<p class="day">09:00 ~ 18:00</p>
					</div>
				</div>
			</div>
		</div>
		<div class="way_box">
			<div class="way_box_inner">
				<div class="way_box_addr">
					<strong class="way_box_addr_title">오시는 길</strong>
					<p class="way_box_addr_txt">
						서울특별시 강남구 선릉로 801 <br>(신사동 배강빌딩)
					</p>
					<button class="btn">지도보기</button>
				</div>
			</div>
			<div class="way_box_transp">
				<ul class="route">
					<li class="route_subway"><strong class="route_title">지하철</strong>
						<p class="route_method">
							<span class="color_subway1">7호선</span> 강남구청 3-1번 출구 / <span
								class="color_subway2"> 분당선 </span> 압구정로데오역 5번 출구
						</p></li>
					<li class="route_bus"><strong class="route_title">버스</strong>
						<p class="route_method">
							<span class="color_bus1">간선</span> 145, 301, 472 / <span
								class="color_bus2"> 지선 </span> 4412, 3011
						</p></li>
					<li class="route_car"><strong class="route_title">승용차</strong>
						<p class="route_method">
							도산대로 학동사거리 <span class="br">배강빌딩 1층</span>
						</p></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="map" style="width: 100%; height: 600px;"></div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
	const mapView = $("#map");
	const btn = $(".btn");

	btn.on("click", function() {
		if ($(this).html() == '지도보기') {
			$(this).html('지도닫기');
		} else {
			$(this).html('지도보기');
		}
		mapView.toggle();
	});
	const map = new naver.maps.Map("map", {
		center : new naver.maps.LatLng(37.5235807, 127.0388520),
		zoom : 17,
		zoomControl : true,
		zoomControlOptions : {
			position : naver.maps.Position.TOP_RIGHT,
			style : naver.maps.ZoomControlStyle.SMALL
		}
	});
	const marker = new naver.maps.Marker({
		position : new naver.maps.LatLng(37.5235807, 127.0388520),
		map : map,
		icon : {
			url : '/img/marker.png',
			origin : new naver.maps.Point(0, 0),
		}
	});
	let contentString = [ "<h3>안사니스토어 압구정</h3>" ].join("");
	let infoWindow = new naver.maps.InfoWindow();
	// 마커에 클릭이벤트 추가
	naver.maps.Event.addListener(marker, "click", function(e) {
		infoWindow = new naver.maps.InfoWindow({
			content : contentString
		});
		// 생성된 infoWindow를 map의 marker위치에 생성
		infoWindow.open(map, marker);
	});
	// 지도에 클릭이벤트 추가
	naver.maps.Event.addListener(map, "click", function(e) {
		if (infoWindow.getMap()) {
			infoWindow.close();
		}
	});
</script>
</html>