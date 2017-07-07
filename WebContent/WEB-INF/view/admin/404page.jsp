<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="img/favicon.png">

<title>관리자 기본틀</title>

<!-- Bootstrap CSS -->
<link href="/Test/resource/admin/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="/Test/resource/admin/css/bootstrap-theme.css"
	rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="/Test/resource/admin/css/elegant-icons-style.css"
	rel="stylesheet" />
<link href="/Test/resource/admin/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- Custom styles -->
<link href="/Test/resource/admin/css/widgets.css" rel="stylesheet">
<link href="/Test/resource/admin/css/style.css" rel="stylesheet">
<link href="/Test/resource/admin/css/style-responsive.css"
	rel="stylesheet" />
<link href="/Test/resource/admin/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet">
</head>

<body>
	<!-- container section start -->
	<section id="container" class="">

		<!-- 로고 -->
		<header class="header dark-bg">
			<div class="toggle-nav">
				<div class="icon-reorder tooltips"
					data-original-title="Toggle Navigation" data-placement="bottom">
					<i class="icon_menu"></i>
				</div>
			</div>
			<!--logo start-->
			<a href="adminMember.tm" class="logo">TM <span class="lite">Admin</span></a>
			<!--logo end-->
			<div class="top-nav notification-row">
				<ul class="nav pull-right top-menu">
					<li>
						<a href="adminlogout.tm">
							<i class="icon_close_alt2"></i>  Logout
	                    </a>
					</li>
				</ul>
			</div>
		</header>
		<!--header end-->

		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu">
					<li>
						<a class="" href="adminMember.tm">
							<i class="icon_house_alt"></i> <span>회원관리</span>
						</a>
					</li>
					<li>
						<a class="" href="adminQna.tm">
							<i class="icon_desktop"></i> <span>QnA</span>
						</a>
					</li>
					<li class="sub-menu">
						<a href="javascript:;" class="">
							<i class="icon_genius"></i> <span>부가서비스</span>
							<span class="menu-arrow arrow_carrot-right"></span>
						</a>
						<ul class="sub">
							<li><a class="" href="adminadList.tm">광고</a></li>
							<li><a class="" href="adminstemp.tm">스탬프</a></li>
						</ul>
					</li>
					<li class="sub-menu">
						<a href="javascript:;" class="">
							<i class="icon_documents_alt"></i> <span>제휴</span>
							<span class="menu-arrow arrow_carrot-right"></span>
						</a>
						<ul class="sub">
							<li><a class="" href="adminAllianceList.tm">리스트</a></li>
							<li><a class="" href="adminAllianceRec.tm">승인</a></li>
						</ul>
					</li>
				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->

		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-laptop"></i> 오류페이지
						</h3>
					</div>
				</div>
				
				<div class="row">
					<img alt="오류페이지 사진" src="/resource/admin/img/404page.png" style="margin-left: 150px; margin-top: 50px;">
				</div>
				
			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- container section start -->

	<!-- javascripts -->
	<script src="/Test/resource/admin/js/jquery.js"></script>
	<script src="/Test/resource/admin/js/jquery-ui-1.10.4.min.js"></script>
	<script src="/Test/resource/admin/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="/Test/resource/admin/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!-- bootstrap -->
	<script src="/Test/resource/admin/js/bootstrap.min.js"></script>

	<!-- nice scroll -->
	<script src="/Test/resource/admin/js/jquery.scrollTo.min.js"></script>
	<script src="/Test/resource/admin/js/jquery.nicescroll.js"
		type="text/javascript"></script>

	<!-- charts scripts -->
	<script src="/Test/resource/admin/js/jquery.sparkline.js"
		type="text/javascript"></script>
	<script src="/Test/resource/admin/js/owl.carousel.js"></script>

	<!-- custom select -->
	<script src="/Test/resource/admin/js/jquery.customSelect.min.js"></script>

	<!--custome script for all page-->
	<script src="/Test/resource/admin/js/scripts.js"></script>


</body>
</html>