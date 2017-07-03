<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- 
	adminadList.jsp
	광고 리스트 페이지
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
<style type="text/css">
input[type=checkbox]
{
  /* Double-sized Checkboxes */
  -ms-transform: scale(2); /* IE */
  -moz-transform: scale(2); /* FF */
  -webkit-transform: scale(2); /* Safari and Chrome */
  -o-transform: scale(2); /* Opera */
  padding: 10px;
}

.radio input[type="radio"], .radio-inline input[type="radio"], .checkbox input[type="checkbox"], .checkbox-inline input[type="checkbox"] {
        float: none;
        margin-left: -20px;
}


</style>
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
							<i class="fa fa-laptop"></i> 광고 리스트
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="adminMember.tm">Home</a></li>
							<li><i class="icon_genius"></i>부가서비스</li>
							<li><i class="fa fa-th-list"></i>광고 리스트</li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-10">
						<section class="panel">
							<header class="panel-heading" style="padding: 6px;">
							광고리스트
							<a class="btn btn-success" href="" title="Bootstrap 3 themes generator" style="margin-left:10px; float: right;">설정완료</a>
							<a class="btn btn-info" href="adminadSetting.tm" title="Bootstrap 3 themes generator" style="margin-left:10px; float: right;">광고추가</a>
							<form class="form-inline" role="form" style="float: right;">
								<div class="form-group">
									<input type="text" class="form-control" id="exampleInputEmail2" required="required" placeholder="회사명 입력">
								</div>
								<button type="submit" class="btn btn-primary">검색</button>
							</form>
							</header>
							<table class="table table-striped table-advance table-hover">
								<tbody>
									<c:choose>
										<c:when test="${!empty adlist}">
											<c:forEach items="${adlist }" var="a" varStatus="i">
												<tr>
													<td>
														<table style="margin-left:40px; border: 1px solid #e2e2e2;">
															<tr align="center" >
																<td style="width : 100px;">
																	<div class="checkbox" >
																		<c:choose>
																			<c:when test="${a.adCheck eq '1' }">
																				<label><input type="checkbox" checked="checked"/></label>
																			</c:when>
																			<c:otherwise>
																				<label><input type="checkbox" /></label>
																			</c:otherwise>
																		</c:choose>
																	</div>	
																</td>
																<td style="width:1200px; font-size: 1.5em;">
																	${a.adTitle }<a class="btn btn-danger" href="#" title="Bootstrap 3 themes generator" style="float: right;">삭제</a>
																	<form method="post"><input type="hidden" name="num" value="${a.adNum }"></form>
																</td>
															</tr>
															<tr>
																<td style="text-align: center;">
																	img
																</td>
																<td class="imgclick" style="text-align: center;">
																	<img alt="" class="clickimg" src="/upload/alliance/${a.adPhotofake }" style="width: 120px; height: 15px;" >
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											값이없습니다
										</c:otherwise>
									</c:choose>
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

	<script type="text/javascript">
		$(".btn-danger").click(function(){
			$(this).next().attr("action","adminadList.tm");
			$(this).next().submit();
		})
		
		$(".clickimg").toggle(function(){
			$(this).animate({"width":"1200px","height":"150px"},"slow","easeOutBack");
		},function(){
			$(this).animate({"width":"120px","height":"15px"},"slow","easeOutBack");
		});
		
	</script>
</body>
</html>