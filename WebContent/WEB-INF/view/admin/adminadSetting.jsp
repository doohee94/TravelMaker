<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
	adminadSetting.jsp
	광고 추가 페이지
 -->
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
					<li class="sub-menu active">
						<a href="javascript:;" class="">
							<i class="icon_genius"></i> <span>부가서비스</span>
							<span class="menu-arrow arrow_carrot-right"></span>
						</a>
						<ul class="sub">
							<li class="active"><a class="" href="adminadList.tm">광고</a></li>
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
							<i class="fa fa-laptop"></i> 광고 추가
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="adminMember.tm">Home</a></li>
							<li><i class="icon_genius"></i>광고</li>
							<li><i class="icon_documents_alt"></i>광고 추가</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> 광고추가 </header>
							<div class="panel-body">
								<div class="form">
									<form class="form-validate form-horizontal" action="adadinsert.tm" id="feedback_form" method="post" enctype="multipart/form-data">
										<div class="form-group ">
											<label for="partnername" class="control-label col-lg-2">
												회사명
											</label>
											<div class="col-lg-3">
												<input class="form-control" id="partnername" name="partnername" minlength="5" type="text" readonly="readonly" />
												<input type="hidden" name="partnerNum" id="partnerNum"/>
												<input type="hidden" name="partnerType" id="partnerType"/>
											</div>
											<a class="btn btn-info" href="#allist" data-toggle="modal" title="Bootstrap 3 themes generator">리스트 보기</a>
											<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="allist" class="modal fade">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
															<h4 class="modal-title">제휴리스트</h4>
														</div>

														<div class="modal-body">
															<div class="col-sm-12">
																<section class="panel">
																	<table class="table table-hover">
																		<thead>
																			<tr>
																				<td colspan="3">
																					<div class="row" >
																						<div class="col-lg-10">
																							<input type="text" class="form-control" id="partner_comname" placeholder="회사이름 입력">
																						</div>
																						<button type="button" id="alsearchbtn" class="btn btn-primary">찾기</button>
																					</div>
																				</td>
																			</tr>
																			<tr class="headerth">
																				<th>제휴번호</th>
																				<th>회사명</th>
																				<th>사업자번호</th>
																			</tr>
																		</thead>
																		<tbody>
																		</tbody>
																	</table>
																</section>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group ">
											<label for="adTitle" class="control-label col-lg-2">TITLE</label>
											<div class="col-lg-6">
												<input class="form-control " id="adTitle" type="text" name="adTitle" required />
											</div>
										</div>
										
										<div class="form-group ">
											<label for="adTitle" class="control-label col-lg-2">시작 날짜</label>
											<div class="select">
												<div class="col-lg-1">
													<select class="form-control m-bot15" id="startyear" name="startyear">
													</select>
												</div>
												<div class="col-lg-1">
													<select class="form-control m-bot15" id="startmonth" name="startmonth">
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
													</select>
												</div>
												<div class="col-lg-1">
													<select class="form-control m-bot15" id="startday" name="startday">
													</select>
												</div>
											</div>
										</div>
										<div class="form-group ">
											<label for="adTitle" class="control-label col-lg-2">완료 날짜</label>
											<div class="select">
												<div class="col-lg-1">
													<select class="form-control m-bot15" id="endyear" name="endyear">
													</select>
												</div>
												<div class="col-lg-1">
													<select class="form-control m-bot15" id="endmonth" name="endmonth">
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
													</select>
												</div>
												<div class="col-lg-1">
													<select class="form-control m-bot15" id="endday" name="endday">
													</select>
												</div>
											</div>
										</div>
										<div class="form-group ">
											<label for="file" class="control-label col-lg-2">File input</label>
											<div class="col-lg-10">
												<input type="file" id="file" name="file" required>
											</div>
										</div>
										<div class="form-group ">
											<label for="cemail" class="control-label col-lg-2">미리보기</label>
											<div class="col-lg-10">
												<img id="show" src="#">
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-offset-2 col-lg-10">
												<button class="btn btn-primary" id="submit" type="submit">Save</button>
												<button class="btn btn-default" type="reset">Cancel</button>
												<a class="btn btn-info" href="adminadList.tm" title="Bootstrap 3 themes generator">제휴 회사 리스트</a> 
											</div>
										</div>
									</form>
								</div>
							</div>
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
	
	<!-- adminadSetting JS -->
	<script src="/resource/admin/js/adminadSetting.js"></script>

</body>
</html>