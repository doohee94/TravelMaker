<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="/resource/admin/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="/resource/admin/css/bootstrap-theme.css"
	rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="/resource/admin/css/elegant-icons-style.css"
	rel="stylesheet" />
<link href="/resource/admin/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- Custom styles -->
<link href="/resource/admin/css/widgets.css" rel="stylesheet">
<link href="/resource/admin/css/style.css" rel="stylesheet">
<link href="/resource/admin/css/style-responsive.css"
	rel="stylesheet" />
<link href="/resource/admin/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet">
<link href="/resource/admin/css/qna.css"
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
					<li class="sub-menu active">
						<a href="javascript:;" class="">
							<i class="icon_genius"></i> <span>부가서비스</span>
							<span class="menu-arrow arrow_carrot-right"></span>
						</a>
						<ul class="sub">
							<li><a class="" href="adminadList.tm">광고</a></li>
							<li class="active"><a class="" href="adminstemp.tm">스탬프</a></li>
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
							<i class="fa fa-laptop"></i> 스탬프
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="adminMember.tm">Home</a></li>
							<li><i class="fa fa-desktop"></i>스탬프</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">
						<section class="panel">
							<header class="panel-heading"> 스탬프 </header>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>회사명</th>
										<th>지점명</th>
										<th>상세보기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									<c:choose>
										<c:when test="${!empty list }">
											<c:forEach var="a" items="${list }">
												<td>${a.parstempNum }</td>
												<td>${a.partnerCeoname }</td>
												<td>${a.partnerName }</td>
												<td>
													<a class="infodiv btn btn-primary" href="#${a.parstempNum }" data-toggle="modal">
														<i class="icon_plus_alt2"> 상세보기</i>
													</a>
													<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="${a.parstempNum }" class="modal fade">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
																	<h4 class="modal-title">상세보기</h4>
																</div>
																<div class="modal-body">
																	<form role="form" method="post" class="submitform">
																		<div class="form-group">
																			<label for="partnerNum">스탬프번호</label>
																			<input type="text" class="form-control" name="parstempNum"  readonly="readonly" value="${a.parstempNum }">
																		</div>
																		<div class="form-group">
																			<label for="infoCom">회사명/대표명/사업자번호</label>
																			<input type="text" class="form-control" name="infoCom" id="infoCom" readonly="readonly" 
																			value="${a.partnerComname }/${a.partnerCeoname }/${a.partnerReginum }">
																		</div>
																		<div class="form-group">
																			<label for="partnerNum">주소</label>
																			<input type="text" class="form-control" name="partnerAddr" id="partnerAddr" readonly="readonly" value="${a.partnerAddr }">
																		</div>
																		<button type="button" data-dismiss="modal" class="closebtnf btn btn-primary">닫기</button>
																	</form>
																</div>
															</div>
														</div>
													</div>
													<a class="btn btn-danger" href="#">
														<i class="delete icon_close_alt2" id="deletebtn"> 삭제</i>
													</a>
												</td>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<td colspan="4">
												값이 없습니다
											</td>
										</c:otherwise>
									</c:choose>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
				</div>
			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- container section start -->

	<!-- javascripts -->
	<script src="/resource/admin/js/jquery.js"></script>
	<script src="/resource/admin/js/jquery-ui-1.10.4.min.js"></script>
	<script src="/resource/admin/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="/resource/admin/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!-- bootstrap -->
	<script src="/resource/admin/js/bootstrap.min.js"></script>

	<!-- nice scroll -->
	<script src="/resource/admin/js/jquery.scrollTo.min.js"></script>
	<script src="/resource/admin/js/jquery.nicescroll.js"
		type="text/javascript"></script>

	<!-- charts scripts -->
	<script src="/resource/admin/js/jquery.sparkline.js"
		type="text/javascript"></script>
	<script src="/resource/admin/js/owl.carousel.js"></script>

	<!-- custom select -->
	<script src="/resource/admin/js/jquery.customSelect.min.js"></script>

	<!--custome script for all page-->
	<script src="/resource/admin/js/scripts.js"></script>


</body>
</html>