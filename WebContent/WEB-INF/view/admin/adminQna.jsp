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
			<a href="index.html" class="logo">TM <span class="lite">Admin</span></a>
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
					<li class="active">
						<a class="" href="adminQna.tm">
							<i class="icon_desktop"></i> <span>QnA</span>
						</a>
					</li>
					<li class="sub-menu">
						<a href="javascript:;" class="">
							<i class="icon_genius"></i> <span>광고</span>
							<span class="menu-arrow arrow_carrot-right"></span>
						</a>
						<ul class="sub">
							<li><a class="" href="adminadSetting.tm">등록</a></li>
							<li><a class="" href="adminadList.tm">리스트</a></li>
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
							<i class="fa fa-laptop"></i> Qna
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="adminMember.tm">Home</a></li>
							<li><i class="fa fa-desktop"></i>Qna</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> 회원목록 </header>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>문의 번호</th>
										<th>문의 유형</th>
										<th>작성자</th>
										<th>답변여부</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>
											<a class="btn btn-success" data-toggle="modal" href="#myModal" title="Bootstrap 3 themes generator">답변완료</a>
											<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
															<h4 class="modal-title">답변달기</h4>
														</div>
														<div class="modal-body">
															<form role="form" class="form-inline">
															<input type="hidden" name="num" value="글번호들어갈곳"/>
																<div class="form-group">
																	<label class="control-label col-sm-2">문의 내용</label>
																	<div class="col-sm-10">
																		<textarea class="form-control ckeditor" name="editor1" rows="6" readonly="readonly"></textarea>
																	</div>
																	<label class="control-label col-sm-2" style="margin-top: 4%;">답변 내용</label>
																	<div class="col-sm-10">
																		<textarea class="form-control ckeditor" name="editor1" rows="6" style="margin-top: 5%;"></textarea>
																	</div>
																	<a class="btn btn-success" title="Bootstrap 3 themes generator" style="margin-left: 80%; margin-top: 2%;">답변완료</a>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>
											<a class="btn btn-danger" data-toggle="modal" href="#myModal2" title="Bootstrap 3 themes generator">답변필요</a>
											<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal2" class="modal fade">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
															<h4 class="modal-title">답변달기</h4>
														</div>
														<div class="modal-body">
															<form role="form">
																<div class="form-group">
																	<div class="form-group">
																		<label class="control-label col-sm-2">문의 내용</label>
																		<div class="col-sm-10">
																			<textarea class="form-control ckeditor" name="editor1" rows="6" readonly="readonly"></textarea>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-sm-2" style="margin-top: 4%;">답변 내용</label>
																		<div class="col-sm-10">
																			<textarea class="form-control ckeditor" name="editor1" rows="6" style="margin-left: 80%; margin-top: 2%;"></textarea>
																		</div>
																	</div>
																	<a class="btn btn-success" title="Bootstrap 3 themes generator">답변완료</a>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</td>
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