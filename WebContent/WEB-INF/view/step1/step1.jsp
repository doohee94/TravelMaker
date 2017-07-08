<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 일정만들기 step1 페이지 출/경/도착지 선택과 동행자 선택 그리고 날짜입력하는 페이지
    (화면설계 슬라이드4번)-->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>일정만들기 step1</title>

<!-- 출발지 경유지 도착지 화면 css -->
<link href="/resource/step1/css/step1.css" rel="stylesheet" />
<link href="/resource/step1/css/travelRegionStart.css" rel="stylesheet" />
<link href="/resource/step1/css/travelRegionStopover.css"
	rel="stylesheet" />
<link href="/resource/step1/css/travelRegionDestination.css"
	rel="stylesheet" />

<!-- jquery Datepicker css-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

<!-- 출발지 경유지 도착지 탭 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!-- 헤더 css -->
<link href="/resource/header/css/header.css" rel="stylesheet" />

</head>
<body>
	<!-- 로딩페이지 -->
	<div id="loading" style="display: none;">

		<img id="loading-image" alt="로딩중" src="/resource/step2/loding.gif" />

		<form action="stepinfo.tm" method='post' id="hiddeninfofrm">
			<input type="hidden" id="sregion" name="liststart" >
			<input type="hidden" id="tregion" name="listthrough" >
			<input type="hidden" id="aregion" name="listarrival" >
			<input type="hidden" id="ttitle" name="title" >
			<input type="hidden" id="ffellow" name="partystr" >
			<input type="hidden" id="stdate" name="startDate" >
			<input type="hidden" id="enddate" name="endDate" >
		</form>

		<form id="hiddenmodalfrm" method="post" action="step1searchfellow.tm">
			<input type="hidden" id="searchid" name="userId">
		</form>

	</div>

	<!-- 메인 헤더 부분 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/tmmain/main.tm">Travel Maker</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/step1/step1.tm">일정만들기</a></li>
					<li><a href="/recommandtravelregion/recommandTravelRegion.tm">여행지추천</a>
					</li>
					<!-- 로그인 할때 생기는 버튼 -->
					<c:if test="${not empty sessionScope.userNick }">
						<li><a href="/travelReview/reviewlist.tm">여행리뷰</a>
						</li>
						<li><a href="/mylist/menubar.tm">마이페이지</a></li>
					</c:if>
					<li style="padding: 10px" id="mobile_search"><input
						type="text" />
					<button id="#searchBtn"
							style="background-color: #fafafa; border: 0px; border-style: none; height: 27px;">
							<span class="glyphicon glyphicon-search"></span>
						</button></li>
					<!-- 로그인 할때 생기는 버튼 -->
					<c:choose>
						<c:when test="${not empty sessionScope.userNick }">
							<li><a href="#">${sessionScope.userNick }&nbsp;&nbsp;님</a></li>
							<li><a href="/tmmain/logout.tm">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/member/loginForm.tm">로그인</a></li>
							<li><a href="/member/signupForm.tm">회원가입</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>

	<form class="contnsubform" method='post' id="infofrm">

		<div class="container" id="container">

			<div class="prevnextbtn">
				<center>
<!-- 					<input type="button" value="< 메인" class="nextbtnmain"onclick="location.href='/tmmain/main.tm'"> -->
<!-- 					<input type="button" value="다음 >" class="nextbtnstep2"> -->
				</center>
			</div>

			<div class="row">
	            <div class="col-lg-12">
	                <ol class="breadcrumb">
	                    <li class="step1blur">1단계</li>
	                    <li>2단계</li>
	                    <li>3단계</li>
	                    <input type="button" value="다음 >" class="nextbtnstep2">
	                </ol>
	            </div>
        	</div>
		
			<div class="col-lg-12">
				<h2 class="page-header" id="titlediv">경로</h2>
			</div>


			<!--   출발지 경유지 도착지 탭	-->

			<ul class="nav nav-tabs">
				<li class="active tabstart"><a data-toggle="tab" href="#menu1" style="width:370px; text-align:center">출발지</a></li>
				<li class="tabstopover"><a data-toggle="tab" href="#menu2" style="width:370px; text-align:center">경유지</a></li>
				<li class="tabarrival"><a data-toggle="tab" href="#menu3" style="width:370px; text-align:center">도착지</a></li>
			</ul>

			<div class="tab-content">
				<!-- 출발지 탭 -->
				<div id="menu1" class="tab-pane fade in active">

					<div class="wrap">

						<!-- 여행 지역 선택 3행 중 1행 -->
						<div class="city0">
							<input type="button" value="주요도시" id=majorcitymark> <input
								type="button" value="서울" id="myButton1" class="a"> <input
								type="button" value="제주" id="myButton2" class="a"> <input
								type="button" value="부산" id="myButton3" class="a"> <input
								type="button" value="경주" id="myButton4" class="a"> <input
								type="button" value="양평" id="myButton5" class="a"> <input
								type="button" value="태안" id="myButton6" class="a"> <input
								type="button" value="진주" id="myButton7" class="a"> <input
								type="button" value="강릉" id="myButton8" class="a">
						</div>

						<hr>

						<!-- 여행 지역 선택 3행 중 2행 -->
						<div class="city1">
							<input type="button" value="강원도▽" class="Gangwondo"> <input
								type="button" value="경기도▽" class="Gyeonggido"> <input
								type="button" value="경상남도▽" class="Gyeongsangnamdo"> <input
								type="button" value="경상북도▽" class="Gyeongsangbukdo"> <input
								type="button" value="광주" id="myButton29" class="a"> <input
								type="button" value="대구" id="myButton152" class="a"> <input
								type="button" value="대전" id="myButton153" class="a"> <input
								type="button" value="부산" id="myButton3" class="a">

						</div>

						<hr>

						<!-- 여행 지역 선택 3행중 2행 강원도 버튼 -->
						<div class="Gangwondodiv" id="Gangwondodiv">
							<!-- 강원도 버튼 하위 1행 -->
							<div id="gangwon1">
								<input type="button" value="강릉" id="myButton8" class="a">
								<input type="button" value="고성" id="myButton9" class="a">
								<input type="button" value="동해" id="myButton10" class="a">
								<input type="button" value="삼척" id="myButton11" class="a">
								<input type="button" value="속초" id="myButton12" class="a">
								<input type="button" value="양구" id="myButton13" class="a">
								<input type="button" value="양양" id="myButton14" class="a">
								<input type="button" value="영월" id="myButton15" class="a">
							</div>

							<!-- 강원도 버튼 하위 2행 -->
							<div id="gangwon2">
								<input type="button" value="원주" id="myButton16" class="a">
								<input type="button" value="인제" id="myButton17" class="a">
								<input type="button" value="정선" id="myButton18" class="a">
								<input type="button" value="철원" id="myButton19" class="a">
								<input type="button" value="춘천" id="myButton20" class="a">
								<input type="button" value="태백" id="myButton21" class="a">
								<input type="button" value="평창" id="myButton22" class="a">
								<input type="button" value="홍천" id="myButton23" class="a">
							</div>

							<!-- 강원도 버튼 하위 3행 -->
							<div id="gangwon3">
								<input type="button" value="화천" id="myButton24" class="a">
								<input type="button" value="횡성" id="myButton25" class="a">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 2행 경기도 버튼 -->
						<div class="Gyeonggidodiv" id="Gyeonggidodiv">
							<!-- 경기도 버튼 하위 1행 -->
							<div id="gyeongi1">
								<input type="button" value="가평" id="myButton25" class="a">
								<input type="button" value="고양" id="myButton26" class="a">
								<input type="button" value="과천" id="myButton27" class="a">
								<input type="button" value="광명" id="myButton28" class="a">
								<input type="button" value="광주" id="myButton29" class="a">
								<input type="button" value="구리" id="myButton30" class="a">
								<input type="button" value="군포" id="myButton31" class="a">
								<input type="button" value="김포" id="myButton32" class="a">
							</div>

							<!-- 경기도 버튼 하위 2행 -->
							<div id="gyeongi2">
								<input type="button" value="남양주" id="myButton33" class="a">
								<input type="button" value="동두천" id="myButton34" class="a">
								<input type="button" value="부천" id="myButton35" class="a">
								<input type="button" value="성남" id="myButton36" class="a">
								<input type="button" value="수원" id="myButton37" class="a">
								<input type="button" value="시흥" id="myButton38" class="a">
								<input type="button" value="안산" id="myButton39" class="a">
								<input type="button" value="안성" id="myButton40" class="a">
							</div>

							<!-- 경기도 버튼 하위 3행 -->
							<div id="gyeongi3">
								<input type="button" value="안양" id="myButton41" class="a">
								<input type="button" value="양주" id="myButton42" class="a">
								<input type="button" value="양평" id="myButton5" class="a">
								<input type="button" value="여주" id="myButton43" class="a">
								<input type="button" value="연천" id="myButton44" class="a">
								<input type="button" value="오산" id="myButton45" class="a">
								<input type="button" value="용인" id="myButton46" class="a">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 2행 경상남도 버튼 -->
						<div class="Gyeongsangnamdodiv" id="Gyeongsangnamdodiv">
							<!-- 경상남도 버튼 하위 1행 -->
							<div id="gyeongnam1">
								<input type="button" value="거제" id="myButton47" class="a">
								<input type="button" value="거창" id="myButton48" class="a">
								<input type="button" value="고성" id="myButton49" class="a">
								<input type="button" value="김해" id="myButton50" class="a">
								<input type="button" value="남해" id="myButton51" class="a">
								<input type="button" value="마산" id="myButton52" class="a">
								<input type="button" value="밀양" id="myButton53" class="a">
								<input type="button" value="사천" id="myButton54" class="a">
							</div>

							<!-- 경상남도 버튼 하위 2행 -->
							<div id="gyeongnam2">
								<input type="button" value="산청" id="myButton55" class="a">
								<input type="button" value="양산" id="myButton56" class="a">
								<input type="button" value="의령" id="myButton57" class="a">
								<input type="button" value="진주" id="myButton7" class="a">
								<input type="button" value="진해" id="myButton58" class="a">
								<input type="button" value="창녕" id="myButton59" class="a">
								<input type="button" value="창원" id="myButton60" class="a">
								<input type="button" value="통영" id="myButton61" class="a">
							</div>

							<!-- 경상남도 버튼 하위 3행 -->
							<div id="gyeongnam3">
								<input type="button" value="하동" id="myButton62" class="a">
								<input type="button" value="함안" id="myButton63" class="a">
								<input type="button" value="함양" id="myButton64" class="a">
								<input type="button" value="합천" id="myButton65" class="a">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 2행 경상북도 버튼 -->
						<div class="Gyeongsangbukdodiv" id="Gyeongsangbukdodiv">
							<!-- 경상북도 버튼 하위 1행 -->
							<div id="gyeongbuk1">
								<input type="button" value="경산" id="myButton66" class="a">
								<input type="button" value="경주" id="myButton4" class="a">
								<input type="button" value="고령" id="myButton67" class="a">
								<input type="button" value="구미" id="myButton68" class="a">
								<input type="button" value="군위" id="myButton69" class="a">
								<input type="button" value="김천" id="myButton70" class="a">
								<input type="button" value="문경" id="myButton71" class="a">
								<input type="button" value="봉화" id="myButton72" class="a">
							</div>

							<!-- 경상북도 버튼 하위 2행 -->
							<div id="gyeongbuk2">
								<input type="button" value="상주" id="myButton73" class="a">
								<input type="button" value="성주" id="myButton74" class="a">
								<input type="button" value="안동" id="myButton75" class="a">
								<input type="button" value="영덕" id="myButton76" class="a">
								<input type="button" value="영양" id="myButton77" class="a">
								<input type="button" value="영주" id="myButton78" class="a">
								<input type="button" value="영천" id="myButton79" class="a">
								<input type="button" value="예천" id="myButton80" class="a">
							</div>

							<!-- 경상북도 버튼 하위 3행 -->
							<div id="gyeongbuk3">
								<input type="button" value="울릉" id="myButton81" class="a">
								<input type="button" value="울진" id="myButton82" class="a">
								<input type="button" value="의성" id="myButton83" class="a">
								<input type="button" value="청도" id="myButton84" class="a">
								<input type="button" value="청송" id="myButton85" class="a">
								<input type="button" value="칠곡" id="myButton86" class="a">
								<input type="button" value="포항" id="myButton87" class="a">

							</div>

						</div>

						<!-- 여행 지역 선택 3행 중 3행 -->
						<div class="city2">

							<input type="button" value="서울" id="myButton1" class="a">
							<input type="button" value="울산" id="myButton88" class="a">
							<input type="button" value="인천" id="myButton89" class="a">
							<input type="button" value="전라남도▽" class="Jeollanamdo"> <input
								type="button" value="전라북도▽" class="Jeollabukdo"> <input
								type="button" value="제주" id="myButton2" class="a"> <input
								type="button" value="충청남도▽" class="Chungcheongnamdo"> <input
								type="button" value="충청북도▽" class="Chungcheongbukdo">

						</div>

						<!-- 여행 지역 선택 3행중 3행 전라남도 버튼 -->
						<div class="Jeollanamdodiv" id="Jeollanamdodiv">
							<!-- 전라남도 버튼 하위 1행 -->
							<div id="jeollanam1">
								<input type="button" value="강진" id="myButton90" class="a">
								<input type="button" value="고흥" id="myButton91" class="a">
								<input type="button" value="곡성" id="myButton92" class="a">
								<input type="button" value="광양" id="myButton93" class="a">
								<input type="button" value="구례" id="myButton94" class="a">
								<input type="button" value="나주" id="myButton95" class="a">
								<input type="button" value="담양" id="myButton96" class="a">
								<input type="button" value="목포" id="myButton97" class="a">
							</div>

							<!-- 전라남도 버튼 하위 2행 -->
							<div id="jeollanam2">
								<input type="button" value="무안" id="myButton98" class="a">
								<input type="button" value="보성" id="myButton99" class="a">
								<input type="button" value="순천" id="myButton100" class="a">
								<input type="button" value="신안" id="myButton101" class="a">
								<input type="button" value="여수" id="myButton102" class="a">
								<input type="button" value="영광" id="myButton103" class="a">
								<input type="button" value="영암" id="myButton104" class="a">
								<input type="button" value="완도" id="myButton105" class="a">
							</div>

							<!-- 전라남도 버튼 하위 3행 -->
							<div id="jeollanam3">
								<input type="button" value="장성" id="myButton106" class="a">
								<input type="button" value="장흥" id="myButton107" class="a">
								<input type="button" value="진도" id="myButton108" class="a">
								<input type="button" value="함평" id="myButton109" class="a">
								<input type="button" value="해남" id="myButton110" class="a">
								<input type="button" value="화순" id="myButton111" class="a">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 3행 전라북도 버튼 -->
						<div class="Jeollabukdodiv" id="Jeollabukdodiv">
							<!-- 전라북도 버튼 하위 1행 -->
							<div id="jeollabuk1">
								<input type="button" value="고창" id="myButton112" class="a">
								<input type="button" value="군산" id="myButton113" class="a">
								<input type="button" value="김제" id="myButton114" class="a">
								<input type="button" value="남원" id="myButton115" class="a">
								<input type="button" value="무주" id="myButton116" class="a">
								<input type="button" value="부안" id="myButton117" class="a">
								<input type="button" value="순창" id="myButton118" class="a">
								<input type="button" value="완주" id="myButton119" class="a">
							</div>

							<!-- 전라북도 버튼 하위 2행 -->
							<div id="jeollabuk2">
								<input type="button" value="익산" id="myButton120" class="a">
								<input type="button" value="임실" id="myButton121" class="a">
								<input type="button" value="장수" id="myButton122" class="a">
								<input type="button" value="전주" id="myButton123" class="a">
								<input type="button" value="정읍" id="myButton124" class="a">
								<input type="button" value="진안" id="myButton125" class="a">

							</div>
						</div>

						<!-- 여행 지역 선택 3행중 3행 충청남도 버튼 -->
						<div class="Chungcheongnamdodiv" id="Chungcheongnamdodiv">
							<!-- 충청남도 버튼 하위 1행 -->
							<div id="chungnam1">
								<input type="button" value="공주" id="myButton126" class="a">
								<input type="button" value="금산" id="myButton127" class="a">
								<input type="button" value="논산" id="myButton128" class="a">
								<input type="button" value="당진" id="myButton129" class="a">
								<input type="button" value="보령" id="myButton130" class="a">
								<input type="button" value="부여" id="myButton131" class="a">
								<input type="button" value="서산" id="myButton132" class="a">
								<input type="button" value="서천" id="myButton133" class="a">
							</div>

							<!-- 충청남도 버튼 하위 2행 -->
							<div id="chungnam2">
								<input type="button" value="아산" id="myButton134" class="a">
								<input type="button" value="예산" id="myButton135" class="a">
								<input type="button" value="천안" id="myButton136" class="a">
								<input type="button" value="청양" id="myButton137" class="a">
								<input type="button" value="태안" id="myButton6" class="a">
								<input type="button" value="홍성" id="myButton138" class="a">
								<input type="button" value="계룡" id="myButton139" class="a">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 3행 충청북도 버튼 -->
						<div class="Chungcheongbukdodiv" id="Chungcheongbukdodiv">
							<!-- 충청북도 버튼 하위 1행 -->
							<div id="chungbuk1">
								<input type="button" value="괴산" id="myButton140" class="a">
								<input type="button" value="단양" id="myButton141" class="a">
								<input type="button" value="보은" id="myButton142" class="a">
								<input type="button" value="영동" id="myButton143" class="a">
								<input type="button" value="옥천" id="myButton144" class="a">
								<input type="button" value="음성" id="myButton145" class="a">
								<input type="button" value="제천" id="myButton146" class="a">
								<input type="button" value="진천" id="myButton147" class="a">
							</div>

							<!-- 충청북도 버튼 하위 2행 -->
							<div id="chungbuk2">
								<input type="button" value="청원" id="myButton148" class="a">
								<input type="button" value="청주" id="myButton149" class="a">
								<input type="button" value="충주" id="myButton150" class="a">
								<input type="button" value="증평" id="myButton151" class="a">

							</div>

						</div>

					</div>
					<!-- end wrap class 출발지 탭-->


				</div>

				<!-- 경유지 탭 -->
				<div id="menu2" class="tab-pane fade">

					<div class="wrap">

						<!-- 여행 지역 선택 3행 중 1행 -->
						<div class="city0">
							<input type="button" value="주요도시" id=majorcitymark> <input
								type="button" value="서울" id="myButton1" class="b"> <input
								type="button" value="제주" id="myButton2" class="b"> <input
								type="button" value="부산" id="myButton3" class="b"> <input
								type="button" value="경주" id="myButton4" class="b"> <input
								type="button" value="양평" id="myButton5" class="b"> <input
								type="button" value="태안" id="myButton6" class="b"> <input
								type="button" value="진주" id="myButton7" class="b"> <input
								type="button" value="강릉" id="myButton8" class="b">
						</div>

						<hr>

						<!-- 여행 지역 선택 3행 중 2행 -->
						<div class="city1">
							<input type="button" value="강원도▽" class="Gangwondo2"> <input
								type="button" value="경기도▽" class="Gyeonggido2"> <input
								type="button" value="경상남도▽" class="Gyeongsangnamdo2"> <input
								type="button" value="경상북도▽" class="Gyeongsangbukdo2"> <input
								type="button" value="광주" id="myButton29" class="b"> <input
								type="button" value="대구" id="myButton152" class="b"> <input
								type="button" value="대전" id="myButton153" class="b"> <input
								type="button" value="부산" id="myButton3" class="b">

						</div>

						<hr>

						<!-- 여행 지역 선택 3행중 2행 강원도 버튼 -->
						<div class="Gangwondodiv2" id="Gangwondodiv2">
							<!-- 강원도 버튼 하위 1행 -->
							<div id="gangwon1">
								<input type="button" value="강릉" id="myButton8" class="b">
								<input type="button" value="고성" id="myButton9" class="b">
								<input type="button" value="동해" id="myButton10" class="b">
								<input type="button" value="삼척" id="myButton11" class="b">
								<input type="button" value="속초" id="myButton12" class="b">
								<input type="button" value="양구" id="myButton13" class="b">
								<input type="button" value="양양" id="myButton14" class="b">
								<input type="button" value="영월" id="myButton15" class="b">
							</div>

							<!-- 강원도 버튼 하위 2행 -->
							<div id="gangwon2">
								<input type="button" value="원주" id="myButton16" class="b">
								<input type="button" value="인제" id="myButton17" class="b">
								<input type="button" value="정선" id="myButton18" class="b">
								<input type="button" value="철원" id="myButton19" class="b">
								<input type="button" value="춘천" id="myButton20" class="b">
								<input type="button" value="태백" id="myButton21" class="b">
								<input type="button" value="평창" id="myButton22" class="b">
								<input type="button" value="홍천" id="myButton23" class="b">
							</div>

							<!-- 강원도 버튼 하위 3행 -->
							<div id="gangwon3">
								<input type="button" value="화천" id="myButton24" class="b">
								<input type="button" value="횡성" id="myButton25" class="b">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 2행 경기도 버튼 -->
						<div class="Gyeonggidodiv2" id="Gyeonggidodiv2">
							<!-- 경기도 버튼 하위 1행 -->
							<div id="gyeongi1">
								<input type="button" value="가평" id="myButton25" class="b">
								<input type="button" value="고양" id="myButton26" class="b">
								<input type="button" value="과천" id="myButton27" class="b">
								<input type="button" value="광명" id="myButton28" class="b">
								<input type="button" value="광주" id="myButton29" class="b">
								<input type="button" value="구리" id="myButton30" class="b">
								<input type="button" value="군포" id="myButton31" class="b">
								<input type="button" value="김포" id="myButton32" class="b">
							</div>

							<!-- 경기도 버튼 하위 2행 -->
							<div id="gyeongi2">
								<input type="button" value="남양주" id="myButton33" class="b">
								<input type="button" value="동두천" id="myButton34" class="b">
								<input type="button" value="부천" id="myButton35" class="b">
								<input type="button" value="성남" id="myButton36" class="b">
								<input type="button" value="수원" id="myButton37" class="b">
								<input type="button" value="시흥" id="myButton38" class="b">
								<input type="button" value="안산" id="myButton39" class="b">
								<input type="button" value="안성" id="myButton40" class="b">
							</div>

							<!-- 경기도 버튼 하위 3행 -->
							<div id="gyeongi3">
								<input type="button" value="안양" id="myButton41" class="b">
								<input type="button" value="양주" id="myButton42" class="b">
								<input type="button" value="양평" id="myButton5" class="b">
								<input type="button" value="여주" id="myButton43" class="b">
								<input type="button" value="연천" id="myButton44" class="b">
								<input type="button" value="오산" id="myButton45" class="b">
								<input type="button" value="용인" id="myButton46" class="b">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 2행 경상남도 버튼 -->
						<div class="Gyeongsangnamdodiv2" id="Gyeongsangnamdodiv2">
							<!-- 경상남도 버튼 하위 1행 -->
							<div id="gyeongnam1">
								<input type="button" value="거제" id="myButton47" class="b">
								<input type="button" value="거창" id="myButton48" class="b">
								<input type="button" value="고성" id="myButton49" class="b">
								<input type="button" value="김해" id="myButton50" class="b">
								<input type="button" value="남해" id="myButton51" class="b">
								<input type="button" value="마산" id="myButton52" class="b">
								<input type="button" value="밀양" id="myButton53" class="b">
								<input type="button" value="사천" id="myButton54" class="b">
							</div>

							<!-- 경상남도 버튼 하위 2행 -->
							<div id="gyeongnam2">
								<input type="button" value="산청" id="myButton55" class="b">
								<input type="button" value="양산" id="myButton56" class="b">
								<input type="button" value="의령" id="myButton57" class="b">
								<input type="button" value="진주" id="myButton7" class="b">
								<input type="button" value="진해" id="myButton58" class="b">
								<input type="button" value="창녕" id="myButton59" class="b">
								<input type="button" value="창원" id="myButton60" class="b">
								<input type="button" value="통영" id="myButton61" class="b">
							</div>

							<!-- 경상남도 버튼 하위 3행 -->
							<div id="gyeongnam3">
								<input type="button" value="하동" id="myButton62" class="b">
								<input type="button" value="함안" id="myButton63" class="b">
								<input type="button" value="함양" id="myButton64" class="b">
								<input type="button" value="합천" id="myButton65" class="b">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 2행 경상북도 버튼 -->
						<div class="Gyeongsangbukdodiv2" id="Gyeongsangbukdodiv2">
							<!-- 경상북도 버튼 하위 1행 -->
							<div id="gyeongbuk1">
								<input type="button" value="경산" id="myButton66" class="b">
								<input type="button" value="경주" id="myButton4" class="b">
								<input type="button" value="고령" id="myButton67" class="b">
								<input type="button" value="구미" id="myButton68" class="b">
								<input type="button" value="군위" id="myButton69" class="b">
								<input type="button" value="김천" id="myButton70" class="b">
								<input type="button" value="문경" id="myButton71" class="b">
								<input type="button" value="봉화" id="myButton72" class="b">
							</div>

							<!-- 경상북도 버튼 하위 2행 -->
							<div id="gyeongbuk2">
								<input type="button" value="상주" id="myButton73" class="b">
								<input type="button" value="성주" id="myButton74" class="b">
								<input type="button" value="안동" id="myButton75" class="b">
								<input type="button" value="영덕" id="myButton76" class="b">
								<input type="button" value="영양" id="myButton77" class="b">
								<input type="button" value="영주" id="myButton78" class="b">
								<input type="button" value="영천" id="myButton79" class="b">
								<input type="button" value="예천" id="myButton80" class="b">
							</div>

							<!-- 경상북도 버튼 하위 3행 -->
							<div id="gyeongbuk3">
								<input type="button" value="울릉" id="myButton81" class="b">
								<input type="button" value="울진" id="myButton82" class="b">
								<input type="button" value="의성" id="myButton83" class="b">
								<input type="button" value="청도" id="myButton84" class="b">
								<input type="button" value="청송" id="myButton85" class="b">
								<input type="button" value="칠곡" id="myButton86" class="b">
								<input type="button" value="포항" id="myButton87" class="b">

							</div>

						</div>

						<!-- 여행 지역 선택 3행 중 3행 -->
						<div class="city2">
							<input type="button" value="서울" id="myButton1" class="b">
							<input type="button" value="울산" id="myButton88" class="b">
							<input type="button" value="인천" id="myButton89" class="b">
							<input type="button" value="전라남도▽" class="Jeollanamdo2">
							<input type="button" value="전라북도▽" class="Jeollabukdo2">
							<input type="button" value="제주" id="myButton2" class="b">
							<input type="button" value="충청남도▽" class="Chungcheongnamdo2">
							<input type="button" value="충청북도▽" class="Chungcheongbukdo2">

						</div>

						<!-- 여행 지역 선택 3행중 3행 전라남도 버튼 -->
						<div class="Jeollanamdodiv2" id="Jeollanamdodiv2">
							<!-- 전라남도 버튼 하위 1행 -->
							<div id="jeollanam1">
								<input type="button" value="강진" id="myButton90" class="b">
								<input type="button" value="고흥" id="myButton91" class="b">
								<input type="button" value="곡성" id="myButton92" class="b">
								<input type="button" value="광양" id="myButton93" class="b">
								<input type="button" value="구례" id="myButton94" class="b">
								<input type="button" value="나주" id="myButton95" class="b">
								<input type="button" value="담양" id="myButton96" class="b">
								<input type="button" value="목포" id="myButton97" class="b">
							</div>

							<!-- 전라남도 버튼 하위 1행 -->
							<div id="jeollanam2">
								<input type="button" value="무안" id="myButton98" class="b">
								<input type="button" value="보성" id="myButton99" class="b">
								<input type="button" value="순천" id="myButton100" class="b">
								<input type="button" value="신안" id="myButton101" class="b">
								<input type="button" value="여수" id="myButton102" class="b">
								<input type="button" value="영광" id="myButton103" class="b">
								<input type="button" value="영암" id="myButton104" class="b">
								<input type="button" value="완도" id="myButton105" class="b">
							</div>

							<!-- 전라남도 버튼 하위 3행 -->
							<div id="jeollanam3">
								<input type="button" value="장성" id="myButton106" class="b">
								<input type="button" value="장흥" id="myButton107" class="b">
								<input type="button" value="진도" id="myButton108" class="b">
								<input type="button" value="함평" id="myButton109" class="b">
								<input type="button" value="해남" id="myButton110" class="b">
								<input type="button" value="화순" id="myButton111" class="b">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 3행 전라북도 버튼 -->
						<div class="Jeollabukdodiv2" id="Jeollabukdodiv2">
							<!-- 전라북도 버튼 하위 1행 -->
							<div id="jeollabuk1">
								<input type="button" value="고창" id="myButton112" class="b">
								<input type="button" value="군산" id="myButton113" class="b">
								<input type="button" value="김제" id="myButton114" class="b">
								<input type="button" value="남원" id="myButton115" class="b">
								<input type="button" value="무주" id="myButton116" class="b">
								<input type="button" value="부안" id="myButton117" class="b">
								<input type="button" value="순창" id="myButton118" class="b">
								<input type="button" value="완주" id="myButton119" class="b">
							</div>

							<!-- 전라북도 버튼 하위 2행 -->
							<div id="jeollabuk2">
								<input type="button" value="익산" id="myButton120" class="b">
								<input type="button" value="임실" id="myButton121" class="b">
								<input type="button" value="장수" id="myButton122" class="b">
								<input type="button" value="전주" id="myButton123" class="b">
								<input type="button" value="정읍" id="myButton124" class="b">
								<input type="button" value="진안" id="myButton125" class="b">

							</div>
						</div>

						<!-- 여행 지역 선택 3행중 3행 충청남도 버튼 -->
						<div class="Chungcheongnamdodiv2" id="Chungcheongnamdodiv2">
							<!-- 충청남도 버튼 하위 1행 -->
							<div id="chungnam1">
								<input type="button" value="공주" id="myButton126" class="b">
								<input type="button" value="금산" id="myButton127" class="b">
								<input type="button" value="논산" id="myButton128" class="b">
								<input type="button" value="당진" id="myButton129" class="b">
								<input type="button" value="보령" id="myButton130" class="b">
								<input type="button" value="부여" id="myButton131" class="b">
								<input type="button" value="서산" id="myButton132" class="b">
								<input type="button" value="서천" id="myButton133" class="b">
							</div>

							<!-- 충청남도 버튼 하위 2행 -->
							<div id="chungnam2">
								<input type="button" value="아산" id="myButton134" class="b">
								<input type="button" value="예산" id="myButton135" class="b">
								<input type="button" value="천안" id="myButton136" class="b">
								<input type="button" value="청양" id="myButton137" class="b">
								<input type="button" value="태안" id="myButton6" class="b">
								<input type="button" value="홍성" id="myButton138" class="b">
								<input type="button" value="계룡" id="myButton139" class="b">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 3행 충청북도 버튼 -->
						<div class="Chungcheongbukdodiv2" id="Chungcheongbukdodiv2">
							<!-- 충청북도 버튼 하위 1행 -->
							<div id="chungbuk1">
								<input type="button" value="괴산" id="myButton140" class="b">
								<input type="button" value="단양" id="myButton141" class="b">
								<input type="button" value="보은" id="myButton142" class="b">
								<input type="button" value="영동" id="myButton143" class="b">
								<input type="button" value="옥천" id="myButton144" class="b">
								<input type="button" value="음성" id="myButton145" class="b">
								<input type="button" value="제천" id="myButton146" class="b">
								<input type="button" value="진천" id="myButton147" class="b">
							</div>

							<!-- 충청북도 버튼 하위 2행 -->
							<div id="chungbuk2">
								<input type="button" value="청원" id="myButton148" class="b">
								<input type="button" value="청주" id="myButton149" class="b">
								<input type="button" value="충주" id="myButton150" class="b">
								<input type="button" value="증평" id="myButton151" class="b">

							</div>

						</div>

					</div>
					<!-- end wrap class 경유지 탭 -->

				</div>

				<!-- 도착지 탭 -->
				<div id="menu3" class="tab-pane fade ">
					<div class="wrap">

						<!-- 여행 지역 선택 3행 중 1행 -->
						<div class="city0">
							<input type="button" value="주요도시" id=majorcitymark> <input
								type="button" value="서울" id="myButton1" class="c"> <input
								type="button" value="제주" id="myButton2" class="c"> <input
								type="button" value="부산" id="myButton3" class="c"> <input
								type="button" value="경주" id="myButton4" class="c"> <input
								type="button" value="양평" id="myButton5" class="c"> <input
								type="button" value="태안" id="myButton6" class="c"> <input
								type="button" value="진주" id="myButton7" class="c"> <input
								type="button" value="강릉" id="myButton8" class="c">
						</div>

						<hr>

						<!-- 여행 지역 선택 3행 중 2행 -->
						<div class="city1">
							<input type="button" value="강원도▽" class="Gangwondo3"> <input
								type="button" value="경기도▽" class="Gyeonggido3"> <input
								type="button" value="경상남도▽" class="Gyeongsangnamdo3"> <input
								type="button" value="경상북도▽" class="Gyeongsangbukdo3"> <input
								type="button" value="광주" id="myButton29" class="c"> <input
								type="button" value="대구" id="myButton152" class="c"> <input
								type="button" value="대전" id="myButton153" class="c"> <input
								type="button" value="부산" id="myButton3" class="c">

						</div>

						<hr>

						<!-- 여행 지역 선택 3행중 2행 강원도 버튼 -->
						<div class="Gangwondodiv3" id="Gangwondodiv3">

							<!-- 강원도 버튼 하위 1행 -->
							<div id="gangwon1">
								<input type="button" value="강릉" id="myButton8" class="c">
								<input type="button" value="고성" id="myButton9" class="c">
								<input type="button" value="동해" id="myButton10" class="c">
								<input type="button" value="삼척" id="myButton11" class="c">
								<input type="button" value="속초" id="myButton12" class="c">
								<input type="button" value="양구" id="myButton13" class="c">
								<input type="button" value="양양" id="myButton14" class="c">
								<input type="button" value="영월" id="myButton15" class="c">
							</div>

							<!-- 강원도 버튼 하위 2행 -->
							<div id="gangwon2">
								<input type="button" value="원주" id="myButton16" class="c">
								<input type="button" value="인제" id="myButton17" class="c">
								<input type="button" value="정선" id="myButton18" class="c">
								<input type="button" value="철원" id="myButton19" class="c">
								<input type="button" value="춘천" id="myButton20" class="c">
								<input type="button" value="태백" id="myButton21" class="c">
								<input type="button" value="평창" id="myButton22" class="c">
								<input type="button" value="홍천" id="myButton23" class="c">
							</div>

							<!-- 강원도 버튼 하위 3행 -->
							<div id="gangwon3">
								<input type="button" value="화천" id="myButton24" class="c">
								<input type="button" value="횡성" id="myButton25" class="c">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 2행 경기도 버튼 -->
						<div class="Gyeonggidodiv3" id="Gyeonggidodiv3">

							<!-- 경기도 버튼 하위 1행 -->
							<div id="gyeongi1">
								<input type="button" value="가평" id="myButton25" class="c">
								<input type="button" value="고양" id="myButton26" class="c">
								<input type="button" value="과천" id="myButton27" class="c">
								<input type="button" value="광명" id="myButton28" class="c">
								<input type="button" value="광주" id="myButton29" class="c">
								<input type="button" value="구리" id="myButton30" class="c">
								<input type="button" value="군포" id="myButton31" class="c">
								<input type="button" value="김포" id="myButton32" class="c">
							</div>

							<!-- 경기도 버튼 하위 2행 -->
							<div id="gyeongi2">
								<input type="button" value="남양주" id="myButton33" class="c">
								<input type="button" value="동두천" id="myButton34" class="c">
								<input type="button" value="부천" id="myButton35" class="c">
								<input type="button" value="성남" id="myButton36" class="c">
								<input type="button" value="수원" id="myButton37" class="c">
								<input type="button" value="시흥" id="myButton38" class="c">
								<input type="button" value="안산" id="myButton39" class="c">
								<input type="button" value="안성" id="myButton40" class="c">
							</div>

							<!-- 경기도 버튼 하위 3행 -->
							<div id="gyeongi3">
								<input type="button" value="안양" id="myButton41" class="c">
								<input type="button" value="양주" id="myButton42" class="c">
								<input type="button" value="양평" id="myButton5" class="c">
								<input type="button" value="여주" id="myButton43" class="c">
								<input type="button" value="연천" id="myButton44" class="c">
								<input type="button" value="오산" id="myButton45" class="c">
								<input type="button" value="용인" id="myButton46" class="c">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 2행 경상남도 버튼 -->
						<div class="Gyeongsangnamdodiv3" id="Gyeongsangnamdodiv3">

							<!-- 경상남도 버튼 하위 1행 -->
							<div id="gyeongnam1">
								<input type="button" value="거제" id="myButton47" class="c">
								<input type="button" value="거창" id="myButton48" class="c">
								<input type="button" value="고성" id="myButton49" class="c">
								<input type="button" value="김해" id="myButton50" class="c">
								<input type="button" value="남해" id="myButton51" class="c">
								<input type="button" value="마산" id="myButton52" class="c">
								<input type="button" value="밀양" id="myButton53" class="c">
								<input type="button" value="사천" id="myButton54" class="c">
							</div>

							<!-- 경상남도 버튼 하위 2행 -->
							<div id="gyeongnam2">
								<input type="button" value="산청" id="myButton55" class="c">
								<input type="button" value="양산" id="myButton56" class="c">
								<input type="button" value="의령" id="myButton57" class="c">
								<input type="button" value="진주" id="myButton7" class="c">
								<input type="button" value="진해" id="myButton58" class="c">
								<input type="button" value="창녕" id="myButton59" class="c">
								<input type="button" value="창원" id="myButton60" class="c">
								<input type="button" value="통영" id="myButton61" class="c">
							</div>

							<!-- 경상남도 버튼 하위 3행 -->
							<div id="gyeongnam3">
								<input type="button" value="하동" id="myButton62" class="c">
								<input type="button" value="함안" id="myButton63" class="c">
								<input type="button" value="함양" id="myButton64" class="c">
								<input type="button" value="합천" id="myButton65" class="c">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 2행 경상북도 버튼 -->
						<div class="Gyeongsangbukdodiv3" id="Gyeongsangbukdodiv3">

							<!-- 경상북도 버튼 하위 1행 -->
							<div id="gyeongbuk1">
								<input type="button" value="경산" id="myButton66" class="c">
								<input type="button" value="경주" id="myButton4" class="c">
								<input type="button" value="고령" id="myButton67" class="c">
								<input type="button" value="구미" id="myButton68" class="c">
								<input type="button" value="군위" id="myButton69" class="c">
								<input type="button" value="김천" id="myButton70" class="c">
								<input type="button" value="문경" id="myButton71" class="c">
								<input type="button" value="봉화" id="myButton72" class="c">
							</div>

							<!-- 경상북도 버튼 하위 2행 -->
							<div id="gyeongbuk2">
								<input type="button" value="상주" id="myButton73" class="c">
								<input type="button" value="성주" id="myButton74" class="c">
								<input type="button" value="안동" id="myButton75" class="c">
								<input type="button" value="영덕" id="myButton76" class="c">
								<input type="button" value="영양" id="myButton77" class="c">
								<input type="button" value="영주" id="myButton78" class="c">
								<input type="button" value="영천" id="myButton79" class="c">
								<input type="button" value="예천" id="myButton80" class="c">
							</div>

							<!-- 경상북도 버튼 하위 3행 -->
							<div id="gyeongbuk3">
								<input type="button" value="울릉" id="myButton81" class="c">
								<input type="button" value="울진" id="myButton82" class="c">
								<input type="button" value="의성" id="myButton83" class="c">
								<input type="button" value="청도" id="myButton84" class="c">
								<input type="button" value="청송" id="myButton85" class="c">
								<input type="button" value="칠곡" id="myButton86" class="c">
								<input type="button" value="포항" id="myButton87" class="c">

							</div>

						</div>

						<!-- 여행 지역 선택 3행 중 3행 -->
						<div class="city2">

							<input type="button" value="서울" id="myButton1" class="c">
							<input type="button" value="울산" id="myButton88" class="c">
							<input type="button" value="인천" id="myButton89" class="c">
							<input type="button" value="전라남도▽" class="Jeollanamdo3">
							<input type="button" value="전라북도▽" class="Jeollabukdo3">
							<input type="button" value="제주" id="myButton2" class="c">
							<input type="button" value="충청남도▽" class="Chungcheongnamdo3">
							<input type="button" value="충청북도▽" class="Chungcheongbukdo3">

						</div>


						<!-- 여행 지역 선택 3행중 3행 전라남도 버튼 -->
						<div class="Jeollanamdodiv3" id="Jeollanamdodiv3">

							<!-- 전라남도 버튼 하위 1행 -->
							<div id="jeollanam1">
								<input type="button" value="강진" id="myButton90" class="c">
								<input type="button" value="고흥" id="myButton91" class="c">
								<input type="button" value="곡성" id="myButton92" class="c">
								<input type="button" value="광양" id="myButton93" class="c">
								<input type="button" value="구례" id="myButton94" class="c">
								<input type="button" value="나주" id="myButton95" class="c">
								<input type="button" value="담양" id="myButton96" class="c">
								<input type="button" value="목포" id="myButton97" class="c">
							</div>

							<!-- 전라남도 버튼 하위 2행 -->
							<div id="jeollanam2">
								<input type="button" value="무안" id="myButton98" class="c">
								<input type="button" value="보성" id="myButton99" class="c">
								<input type="button" value="순천" id="myButton100" class="c">
								<input type="button" value="신안" id="myButton101" class="c">
								<input type="button" value="여수" id="myButton102" class="c">
								<input type="button" value="영광" id="myButton103" class="c">
								<input type="button" value="영암" id="myButton104" class="c">
								<input type="button" value="완도" id="myButton105" class="c">
							</div>

							<!-- 전라남도 버튼 하위 3행 -->
							<div id="jeollanam3">
								<input type="button" value="장성" id="myButton106" class="c">
								<input type="button" value="장흥" id="myButton107" class="c">
								<input type="button" value="진도" id="myButton108" class="c">
								<input type="button" value="함평" id="myButton109" class="c">
								<input type="button" value="해남" id="myButton110" class="c">
								<input type="button" value="화순" id="myButton111" class="c">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 3행 전라북도 버튼 -->
						<div class="Jeollabukdodiv3" id="Jeollabukdodiv3">

							<!-- 전라북도 버튼 하위 1행 -->
							<div id="jeollabuk1">
								<input type="button" value="고창" id="myButton112" class="c">
								<input type="button" value="군산" id="myButton113" class="c">
								<input type="button" value="김제" id="myButton114" class="c">
								<input type="button" value="남원" id="myButton115" class="c">
								<input type="button" value="무주" id="myButton116" class="c">
								<input type="button" value="부안" id="myButton117" class="c">
								<input type="button" value="순창" id="myButton118" class="c">
								<input type="button" value="완주" id="myButton119" class="c">
							</div>

							<!-- 전라북도 버튼 하위 2행 -->
							<div id="jeollabuk2">
								<input type="button" value="익산" id="myButton120" class="c">
								<input type="button" value="임실" id="myButton121" class="c">
								<input type="button" value="장수" id="myButton122" class="c">
								<input type="button" value="전주" id="myButton123" class="c">
								<input type="button" value="정읍" id="myButton124" class="c">
								<input type="button" value="진안" id="myButton125" class="c">

							</div>
						</div>

						<!-- 여행 지역 선택 3행중 3행 충청남도 버튼 -->
						<div class="Chungcheongnamdodiv3" id="Chungcheongnamdodiv3">

							<!-- 충청남도 버튼 하위 1행 -->
							<div id="chungnam1">
								<input type="button" value="공주" id="myButton126" class="c">
								<input type="button" value="금산" id="myButton127" class="c">
								<input type="button" value="논산" id="myButton128" class="c">
								<input type="button" value="당진" id="myButton129" class="c">
								<input type="button" value="보령" id="myButton130" class="c">
								<input type="button" value="부여" id="myButton131" class="c">
								<input type="button" value="서산" id="myButton132" class="c">
								<input type="button" value="서천" id="myButton133" class="c">
							</div>

							<!-- 충청남도 버튼 하위 2행 -->
							<div id="chungnam2">
								<input type="button" value="아산" id="myButton134" class="c">
								<input type="button" value="예산" id="myButton135" class="c">
								<input type="button" value="천안" id="myButton136" class="c">
								<input type="button" value="청양" id="myButton137" class="c">
								<input type="button" value="태안" id="myButton6" class="c">
								<input type="button" value="홍성" id="myButton138" class="c">
								<input type="button" value="계룡" id="myButton139" class="c">

							</div>

						</div>

						<!-- 여행 지역 선택 3행중 3행 충청북도 버튼 -->
						<div class="Chungcheongbukdodiv3" id="Chungcheongbukdodiv3">

							<!-- 충청북도 버튼 하위 1행 -->
							<div id="chungbuk1">
								<input type="button" value="괴산" id="myButton140" class="c">
								<input type="button" value="단양" id="myButton141" class="c">
								<input type="button" value="보은" id="myButton142" class="c">
								<input type="button" value="영동" id="myButton143" class="c">
								<input type="button" value="옥천" id="myButton144" class="c">
								<input type="button" value="음성" id="myButton145" class="c">
								<input type="button" value="제천" id="myButton146" class="c">
								<input type="button" value="진천" id="myButton147" class="c">
							</div>

							<!-- 충청북도 버튼 하위 2행 -->
							<div id="chungbuk2">
								<input type="button" value="청원" id="myButton148" class="c">
								<input type="button" value="청주" id="myButton149" class="c">
								<input type="button" value="충주" id="myButton150" class="c">
								<input type="button" value="증평" id="myButton151" class="c">

							</div>

						</div>

					</div>
					<!-- end wrap class 도착지 탭-->
				</div>
			</div>

			<hr>

			<!-- 	출발지 경유지 도착지를 선택하면 출력해주는 곳 	-->
			<div class="pathoutput">
				<!-- 출발지 출력공간 -->
				<input type="text" class="liststart" placeholder="출발지"
					readonly="readonly" />

				<!-- 경유지 출력공간 -->
				<input type="textarea" class="listthrough" placeholder="경유지"
					readonly="readonly"/>

				<!-- 도착지 출력공간 -->
				<input type="text" class="listarrival" placeholder="도착지"
					readonly="readonly" />

				<!-- 경유지비우기 버튼 -->
				<input type="text" class="reset" value="경유지 비우기"
					readonly="readonly" />
			</div>

			<!-- end contnsubform class  -->
		</div>
		<!--end id container div  -->
		<div class=container id="secondcontainer">
			<!-- 일정제목 및 동행자 버튼 공간  -->

			<div class="threerow">
				<div class="col-lg-12">
					<h2 class="page-header">일정 제목</h2>
				</div>

				<input type="text" class="traveltitle"
					placeholder=" 25자내로 제목을 입력해주세요."> <br />
			</div>
			<!-- threerow -->

			<!-- 동행자 팝업 -->
			<div class="col-lg-12">
				<h2 class="page-header" id="titlediv">동행자</h2>
			</div>
			
			<!-- 동행자 팝업버튼 -->
			<div class="fourrow">
				<input type="text" class="fellowpeople" id="fellowpeople"
					placeholder="동행자를 선택해주세요." readonly="readonly">
				<button type="button" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#myModal">동행자</button>

			</div>

			<!-- Modal -->
			<!-- 동행자 버튼 클릭시 나오는 화면 , data-backdrop="static"은 모달창 외부영역 눌러도 모달창이 닫히지 않도록 해준다.-->
			<div class="modal fade" id="myModal" role="dialog"
				data-backdrop="static">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">

						<!-- 동행자 팝업 헤더 -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">동행자 검색</h3>
						</div>

						<!-- 동행자 팝업 바디(동행자 아이디 검색 및 출력공간) -->
						<div class="modal-body">

							<!-- 동행자 아이디 검색 공간 -->
							<div class="input-group">
								<form id="modalfrm" method="post" action="step1searchfellow.tm">
									<input id="modalsearchplace" type="text" class="form-control"
										placeholder="아이디를 검색해주세요."> 
										<span class="input-group-btn"> 
										<input type="button" id="modalsearchbtn" 
										style="font-family:맑은고딕"class="modalsearchbtn btn btn-default"	value='SEARCH'>
									</span>
								</form>
							</div>

							<!--/input-group  -->
							<!-- 	 팝업창에서 검색한 아이디 출력해주는 장소    -->
							<div class="idlistfrm col-md-13"></div>

						</div>
						<!-- end input-group class -->

						<!-- 						검색한 아이디를 선택해서 출력해주는 공간 -->
						<div class="modal-body-bottom">
							<ul class="mbbul" style="border: 1px solid black">

							</ul>
						</div>

						<!-- 동행자 팝업 푸터 (클로즈버튼) -->
						<div class="modal-footer">
							<button type="button" class="ftrsbtn btn btn-default ftokbtn"
								id="ftrsbtn">목록초기화</button>
							<button type="button" class="btn btn-default ftokbtn"
								data-dismiss="modal" id="ftokbtn">완료</button>
						</div>

					</div>
					<!-- end modal-content class -->
				</div>
				<!-- end modal-dialog class -->
			</div>
			<!-- end myModal id -->

			<div class="col-lg-12">
				<h2 class="page-header">날짜</h2>
			</div>

			<!--	출발날짜 도착날짜 공간	-->
			<div class="input-group input-group-lg" id="datediv">
				<span class="input-group-addon" id="sizing-addon1"style="background-color:#eee">출발날짜</span>
				<input type="text" id="startdate" class="form-control" placeholder="선택"	
				aria-describedby="sizing-addon1" readonly="readonly" style="background-color:white">
				
				<span class="input-group-addon" id="sizing-addon1"style="background-color:#eee">도착날짜</span>
				<input type="text" id="arrivaldate" class="form-control" placeholder="선택"
					aria-describedby="sizing-addon1" readonly="readonly" style="background-color:white">
			</div>


			<!-- end contnsubform -->
		</div>
		<!-- end class container id secondcontainer -->
	</form>




	<!-- 출발지 경유지 도착지 탭 script -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- jquery Datepicker script -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- js -->
	<script src="/resource/step1/js/step1.js"></script>


</body>
</html>
