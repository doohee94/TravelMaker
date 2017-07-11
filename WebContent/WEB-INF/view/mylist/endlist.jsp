<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String userId = (String) session.getAttribute("userId");
	String userNick = (String) session.getAttribute("userNick");
%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Travel Maker 마이페이지</title>
<!-- Bootstrap Core CSS -->
<link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- MetisMenu CSS -->
<link href="/resource/bootstrap/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resource/bootstrap/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!--  메뉴바 -->
<link rel="stylesheet" type="text/css"
	href="/resource/mypage/likespot/css/base.css" />

<link rel="stylesheet" type="text/css"
	href="/resource/mypage/likespot/css/style.css" />

<!-- 마이페이지 공통 css -->
<link href="/resource/mypage/base/css/mypage.css" rel="stylesheet"
	type="text/css">


<!-- mouseover -->
<link rel="stylesheet" type="text/js"
	href="/resource/mylist/js/listmouse.js" />
<link rel="stylesheet" type="text/css"
	href="/resource/mylist/css/listmouse.css" />


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!--     <style type="text/css"> -->

<!--     </style> -->


</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<jsp:include page="/tmmain/mypageheader.tm"></jsp:include>
		<!-- 바디 부분 -->
		<div id="page-wrapper">
			<div class="container" style="margin-right:65%">
				<!-- 바디 타이틀  -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							여행한 일정 <small>Finish Schedule</small>
						</h1>
					</div>
					<!-- /바디 타이틀 -->
					<!-- 바디 부분 -->
					<div id="page-wrapper" style="margin-left: 0px; min-height: 0px;">
						<!-- 각 일정 보여주는 곳 -->

						<div class="schedule-list"></div>

					</div>

				</div>
				<!-- /container -->
			</div>


		</div>

	</div>


	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/resource/bootstrap/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resource/bootstrap/js/bootstrap.min.js"></script>

	<!--     Metis Menu Plugin JavaScript -->
	<script src="/resource/bootstrap/js/metisMenu.min.js"></script>
	<!--     Custom Theme JavaScript -->
	<script src="/resource/bootstrap/js/sb-admin-2.js"></script>
	<!-- 마이페이지 공통 js -->
	<script src="/resource/mypage/base/js/base.js"></script>

</body>

<script type="text/javascript">
	$(function() {

		var list_num = {
			"num" : 3
		}

		$
				.ajax({
					url : "/mylist/inglistsearch.tm",
					type : "post",
					contentType : "application/json ",
					data : JSON.stringify(list_num),
					success : function(data) {

						for (var i = 0; i < data.length; i++) {
							var godata = data[i];
							var _idData = {
								"_id" : data[i]._id
							}

							//작성된 리뷰가 있는지 확인하는 에이작스
							$
									.ajax({
										url : "/mylist/findReview.tm",
										type : "post",
										contentType : "application/json ",
										data : JSON.stringify(_idData),
										success : function(getData) {

											if (getData == null
													|| getData == "") { //리뷰가 등록 안돼있을 경우

												$(".schedule-list")
														.append(
																'<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done" style="height:350px">'
																		+ '<img src="'
																		+ godata.tour[0].place[0].image
																		+ '" style="height:100%" />'
																		+ '<figcaption>'
																		+ '<h3>'
																		+ godata.sDate
																		+ '~'
																		+ godata.eDate
																		+ '</h3>'
																		+ '<p>'
																		+ godata.cityList[0]
																		+ '>'
																		+ godata.cityList[(godata.cityList.length - 1)]
																		+ '</p>'
																		+ '<p>'
																		+ godata.tour_title
																		+ '</p>'
																		+ '<a href="#" class="read-more" id="view">상세일정보기</a><br/><br/>'
																		+ '<a href="#" class="read-more" id="insert">리뷰등록</a><br/><br/>'
																		+ '<a class="read-more" id="delete">일정삭제</a><br/><br/>'
																		+ '<input type="hidden" value="'+godata._id+'"  class="_id"/>'
																		+ '</figcaption></figure>');// append

											} else {//리뷰가 등록 돼 있는 경우

												$(".schedule-list")
														.append(
																'<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done">'
																		+ '<img src="'
																		+ godata.tour[0].place[0].image
																		+ '" style="height:100%"/>'
																		+ '<figcaption>'
																		+ '<h3>'
																		+ godata.sDate
																		+ '~'
																		+ godata.eDate
																		+ '</h3>'
																		+ '<p>'
																		+ godata.cityList[0]
																		+ '>'
																		+ godata.cityList[(godata.cityList.length - 1)]
																		+ '</p>'
																		+ '<p>'
																		+ godata.tour_title
																		+ '</p>'
																		+ '<a href="#" class="read-more" id="view">상세일정보기</a><br/><br/>'
																		+ '<a class="read-more" id="delete">일정삭제</a><br/><br/>'
																		+ '<a class="read-more" id="deleteReview">리뷰삭제</a><br/><br/>'
																		+ '<input type="hidden" value="'+godata._id+'"  class="_id"/>'
																		+ '</figcaption></figure>');// append

											}//end else if

										}//end success
										,
										error : function(err, status, error) {
											alert("여행한리스트생성실패!" + err.status
													+ error);
										}

									});//end ajax
						}//end for i

					}//end success
					,
					error : function(err, status, error) {
						alert("계획중인 일정 리스트 가져오기 실패!" + err.status + error);
					}

				});//end ajax

		$('.schedule-list').on('click', '#insert', function() {
			var _id = $(this).siblings("._id").val().trim();
			location.href = "/travelReview/registReview.tm?_id=" + _id;

		});

		var num = "3";
		$('.schedule-list').on('click', '#delete', function() {
			var _id = $(this).siblings("._id").val().trim();
			location.href = "/mylist/delete.tm?_id=" + _id + "&num=" + num;

		});

		$('.schedule-list').on('click', '#deleteReview', function() {
			var _id = $(this).siblings("._id").val().trim();
			location.href = "/mylist/deleteReview.tm?_id=" + _id;

		});

		$('.schedule-list').on(
				'click',
				'#view',
				function() {
					var _id = $(this).siblings("._id").val().trim();
					var url = "/mylist/viewPopUp.tm?_id=" + _id;
					window.open(url, "상세보기팝업",
							"width=700px, height=500px, scrollbars=yes");

				});

	});//end function
</script>


</html>
