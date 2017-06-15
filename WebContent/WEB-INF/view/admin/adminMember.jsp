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
					<li class="active">
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
				<!--overview start-->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-laptop"></i> 회원관리
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="adminMember.tm">Home</a></li>
							<li><i class="fa fa-laptop"></i>회원관리</li>
						</ol>
					</div>
				</div>
				<!-- 검색 start -->
				<div class="row">
					<form class="form-inline" role="form" >
						<div class="select">
							<div class="col-lg-1">
								<select class="form-control m-bot15">
									<option>ID</option>
									<option>이름</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="exampleInputEmail2">Email address</label>
							<input type="text" class="form-control" id="exampleInputEmail2" placeholder="검색어 입력">
						</div>
						<button type="submit" class="btn btn-primary">검색</button>
					</form>
				</div>
				<!-- end -->
				<div class="row">
					<div class="col-lg-8">
						<section class="panel">
							<header class="panel-heading"> 회원목록 </header>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>회원번호</th>
										<th>ID</th>
										<th>이름</th>
										<th>가입일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<td>3</td>
										<td colspan="2">Larry the Bird</td>
										<td>@twitter</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Sumon</td>
										<td>Mosa</td>
										<td>@twitter</td>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
					<div class="col-lg-3">
                      <section class="panel">
                          <header class="panel-heading">
                              Basic Forms
                          </header>
                          <div class="panel-body">
                              <form role="form">
                                  <div class="form-group">
                                      <label for="exampleInputEmail1">ID</label>
                                      <input type="text" class="form-control" id="exampleInputEmail1" value="ID값">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputEmail1">이름</label>
                                      <input type="text" class="form-control" id="exampleInputEmail1" value="이름값">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputEmail1">닉네임</label>
                                      <input type="text" class="form-control" id="exampleInputEmail1" value="닉네임">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputEmail1">주소</label>
                                      <input type="text" class="form-control" id="exampleInputEmail1" value="주소">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputEmail1">전화번호</label>
                                      <input type="text" class="form-control" id="exampleInputEmail1" value="전화번호">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputEmail1">가입일</label>
                                      <input type="text" class="form-control" id="exampleInputEmail1" value="가입일">
                                  </div>
                                  <button type="submit" class="btn btn-primary">Submit</button>
                              </form>

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