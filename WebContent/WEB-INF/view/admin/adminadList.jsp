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
<link href="/resource/admin/css/adminadList.css"
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
					<div class="modal-body">
						<form class="form-inline" method="post" role="form" action="adminadsearch.tm">
							<div class="form-group">
								<input type="text" class="form-control sm-input"  name="partnerComname" placeholder="회사명 검색" value="${partnerName }">
							</div>
							<button type="submit" class="btn btn-success">검색</button>
							<div class="form-group">
								<a class="btn btn-info" href="adminadSetting.tm" >광고추가</a>
								<a class="btn btn-success" href="#" id="checkend">설정완료</a>
							</div>
						</form>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-10">
						<!--tab nav start-->
						<section class="panel">
							<header class="panel-heading tab-bg-primary ">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#home">전체</a></li>
									<li class=""><a data-toggle="tab" href="#about">완료</a></li>
									<li class=""><a data-toggle="tab" href="#profile">현재</a></li>
									<li class=""><a data-toggle="tab" href="#contact">예정</a></li>
								</ul>
							</header>
							<div class="panel-body">
								<div class="tab-content">
									<div id="home" class="tab-pane active">
										<!-- page Number Start -->
										<input type="hidden" id="pageNumber" name="pageNumber" value="${pageNum }"/>
										<input type="hidden" id="totalpage" name="totalpage" value="${totalpage }"/>
										<input type="hidden" id="url" name="url" value="${url }"/>
										<input type="hidden" id="partnerComname"  value="${partnerComname }"/>
										<div class="btn-row">
											<div class="btn-group">
												<input type="hidden" id="totalpage" value="${totalpage }">
												<c:choose>
													<c:when test="${url  eq 'adminadsearch.tm' }">
														<a href="${url }?pageNumber=1&partnerComname=${partnerComname }" class="pagebtn btn btn-default" type="button">&#171;</a>
													</c:when>
													<c:otherwise>
														<a href="${url }?pageNumber=1" class="pagebtn btn btn-default" type="button">&#171;</a>
													</c:otherwise>
												</c:choose>
												<button class="pagebtn btn btn-default" id="prevPage" type="button">&#60;</button>
												<c:forEach var="i" begin="1" end="${totalpage }">
													<c:choose>
														<c:when test="${pageNum == i}">
															<a class="pagebtn btn btn-primary" type="button">${i }</a>
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${url  eq 'adminadsearch.tm' }">
																	<a href="${url }?pageNumber=${i }&partnerComname=${partnerComname }" class="pagebtn btn btn-default" type="button">${i }</a>
																</c:when>
																<c:otherwise>
																	<a href="${url }?pageNumber=${i }" class="pagebtn btn btn-default" type="button">${i }</a>
																</c:otherwise>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<button class="pagebtn btn btn-default" id="nextPage" type="button">&#62;</button>
												<c:choose>
													<c:when test="${url  eq 'adminadsearch.tm' }">
														<a href="${url }?pageNumber=${totalpage }&partnerComname=${partnerComname }" class="pagebtn btn btn-default" type="button">&#187;</a>
													</c:when>
													<c:otherwise>
														<a href="${url }?pageNumber=${totalpage }" class="pagebtn btn btn-default" type="button">&#187;</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<!-- page Number End -->
										<section class="panel">
											<table id="alllistad" class="table table-striped table-advance table-hover">
												<tbody>
													<c:choose>
														<c:when test="${!empty adlist}">
															<c:forEach items="${adlist }" var="a" varStatus="i">
																<tr class="showadvi">
																	<td>
																		<table style="margin-left:40px; border: 1px solid #e2e2e2;">
																			<tr align="center" >
																				<td style="width : 100px;">
																					<div class="checkbox" >
																						<c:choose>
																							<c:when test="${a.adCheck eq '20' }">
																								<label><input name="checkboxin" type="checkbox" value="${a.adNum }"  checked="checked"/></label>
																							</c:when>
																							<c:otherwise>
																								<label><input name="checkboxin" type="checkbox" value="${a.adNum }"/></label>
																							</c:otherwise>
																						</c:choose>
																					</div>	
																				</td>
																				<td style="width:1200px; font-size: 1.5em;">
																					[ ${a.partnerComname } ]  ${a.adTitle }
																					<a class="btn btn-danger" href="#" style="float: right;">삭제</a>
																					<form method="post"><input type="hidden" name="num" value="${a.adNum }"></form>
																				</td>
																			</tr>
																			<tr>
																				<td style="text-align: center;">
																					img
																				</td>
																				<td class="imgclick" style="text-align: center;">
																					<img alt="" class="clickimg" src="/upload/admin/${a.adPhotofake }" style="width: 120px; height: 15px;" >
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<form method="post"><input type="hidden" name="num" value="${a.adNum }"></form>
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
									<div id="about" class="tab-pane">
										<section class="panel">
											<table class="table table-striped table-advance table-hover">
												<tbody>
													<c:choose>
														<c:when test="${!empty adlist}">
															<c:forEach items="${adlist }" var="a" varStatus="i">
																<c:if test="${a.state eq '10' }">
																<tr class="showadvi">
																	<td>
																		<table style="margin-left:40px; border: 1px solid #e2e2e2;">
																			<tr align="center" >
																				<td style="width : 100px;">
																					<div class="checkbox" >
																						<c:choose>
																							<c:when test="${a.adCheck eq '20' }">
																								<label><input type="checkbox" checked="checked"/></label>
																							</c:when>
																							<c:otherwise>
																								<label><input type="checkbox" /></label>
																							</c:otherwise>
																						</c:choose>
																					</div>	
																				</td>
																				<td style="width:1200px; font-size: 1.5em;">
																					[ ${a.partnerComname } ]  ${a.adTitle }
																					<a class="btn btn-danger" href="#" title="Bootstrap 3 themes generator" style="float: right;">삭제</a>
																					<form method="post"><input type="hidden" name="num" value="${a.adNum }"></form>
																				</td>
																			</tr>
																			<tr>
																				<td style="text-align: center;">
																					img
																				</td>
																				<td class="imgclick" style="text-align: center;">
																					<img alt="" class="clickimg" src="/upload/admin/${a.adPhotofake }" style="width: 120px; height: 15px;" >
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<form method="post"><input type="hidden" name="num" value="${a.adNum }"></form>
															</c:if>
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
									<div id="profile" class="tab-pane">
										<section class="panel">
											<table class="table table-striped table-advance table-hover">
												<tbody>
													<c:choose>
														<c:when test="${!empty adlist}">
															<c:forEach items="${adlist }" var="a" varStatus="i">
																<c:if test="${a.state eq '20' }">
																<tr class="showadvi">
																	<td>
																		<table style="margin-left:40px; border: 1px solid #e2e2e2;">
																			<tr align="center" >
																				<td style="width : 100px;">
																					<div class="checkbox" >
																						<c:choose>
																							<c:when test="${a.adCheck eq '20' }">
																								<label><input type="checkbox" checked="checked"/></label>
																							</c:when>
																							<c:otherwise>
																								<label><input type="checkbox" /></label>
																							</c:otherwise>
																						</c:choose>
																					</div>	
																				</td>
																				<td style="width:1200px; font-size: 1.5em;">
																					[ ${a.partnerComname } ]  ${a.adTitle }
																					<a class="btn btn-danger" href="#" title="Bootstrap 3 themes generator" style="float: right;">삭제</a>
																					<form method="post"><input type="hidden" name="num" value="${a.adNum }"></form>
																				</td>
																			</tr>
																			<tr>
																				<td style="text-align: center;">
																					img
																				</td>
																				<td class="imgclick" style="text-align: center;">
																					<img alt="" class="clickimg" src="/upload/admin/${a.adPhotofake }" style="width: 120px; height: 15px;" >
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<form method="post"><input type="hidden" name="num" value="${a.adNum }"></form>
															</c:if>
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
									<div id="contact" class="tab-pane">
										<section class="panel">
											<table class="table table-striped table-advance table-hover">
												<tbody>
													<c:choose>
														<c:when test="${!empty adlist}">
															<c:forEach items="${adlist }" var="a" varStatus="i">
																<c:if test="${a.state eq '30' }">
																<tr>
																	<td>
																		<table style="margin-left:40px; border: 1px solid #e2e2e2;">
																			<tr align="center" >
																				<td style="width : 100px;">
																					<div class="checkbox" >
																						<c:choose>
																							<c:when test="${a.adCheck eq '20' }">
																								<label><input type="checkbox" checked="checked"/></label>
																							</c:when>
																							<c:otherwise>
																								<label><input type="checkbox" /></label>
																							</c:otherwise>
																						</c:choose>
																					</div>	
																				</td>
																				<td style="width:1200px; font-size: 1.5em;">
																					[ ${a.partnerComname } ]  ${a.adTitle }
																					<a class="btn btn-danger" href="#" style="float: right;">삭제</a>
																					<form method="post"><input type="hidden" name="num" value="${a.adNum }"></form>
																				</td>
																			</tr>
																			<tr>
																				<td style="text-align: center;">
																					img
																				</td>
																				<td class="imgclick" style="text-align: center;">
																					<img alt="" class="clickimg" src="/upload/admin/${a.adPhotofake }" style="width: 120px; height: 15px;" >
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<form method="post"><input type="hidden" name="num" value="${a.adNum }"></form>
															</c:if>
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
							</div>
						</section>
					</div>
				</div>
			</section>
		</section>
		<form action="adcheck.tm" method="post" id="checkfrm">
			<input type="hidden" id="textcheck" name="textcheck">
		</form>
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
	
	<!-- adminadList JS -->
	<script src="/resource/admin/js/adminadList.js"></script>

</body>
</html>