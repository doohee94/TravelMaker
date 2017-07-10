<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- 
	adminAllianceList.jsp
	제휴 회사 리스트 페이지
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
					<li class="sub-menu active">
						<a href="javascript:;" class="">
							<i class="icon_documents_alt"></i> <span>제휴</span>
							<span class="menu-arrow arrow_carrot-right"></span>
						</a>
						<ul class="sub">
							<li class="active"><a class="" href="adminAllianceList.tm">리스트</a></li>
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
							<i class="fa fa-laptop"></i> 제휴회사 리스트
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="adminMember.tm">Home</a></li>
							<li><i class="icon_documents_alt"></i>제휴</li>
							<li><i class="fa fa-th-list"></i>제휴 리스트</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="tableview col-lg-12" style="height: 610px;">
						<section class="panel">
							<header class="panel-heading" style="padding: 5px;">
							제휴 회사 리스트
								<form class="form-inline" id="searchalli" role="form" method="post" action="searchalli.tm" style="float: right;">
									<div class="form-group">
										<input type="text" class="form-control" name="partnerComname" required="required" placeholder="회사명 입력">
										<input type="hidden" id="pageNumber" name="pageNum" value="${pageNum }">
									</div>
									<button type="submit" id="searchallibtn" class="btn btn-primary">검색</button>
								</form>
							</header>
							<table class="table table-striped table-advance table-hover">
								<tbody>
									<tr>
										<th><i class="icon_pin_alt"></i> 제휴번호</th>
										<th><i class="icon_calendar"></i> 회사명</th>
										<th><i class="icon_documents_alt"></i> 사업자등록번호</th>
										<th><i class="icon_calendar"></i> 등록일</th>
										<th><i class="icon_plus_alt2"></i> 상세보기</th>
									</tr>
									<c:choose>
										<c:when test="${!empty allist }">
											<c:forEach items="${allist }" var="a">
												<c:if test="${a.partnerType!='0' }">
												<tr>
													<td>${a.partnerNum }</td>
													<td>${a.partnerComname }</td>
													<td>${a.partnerReginum }</td>
													<td>${a.partnerDate }</td>
													<td>
														<div class="btn-group">
															<a class="infodiv btn btn-primary" href="#${a.partnerNum }" data-toggle="modal">
																<i class="icon_plus_alt2"> 상세보기</i>
															</a>
															<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="${a.partnerNum }" class="modal fade">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
																			<h4 class="modal-title">상세보기</h4>
																		</div>
																		<div class="modal-body">
																			<form role="form" method="post" class="submitform">
																				<div class="form-group">
																					<label for="partnerNum">제휴번호</label>
																					<input type="text" class="form-control" 
																					name="partnerNum" id="partnerNum" readonly="readonly" value="${a.partnerNum }">
																				</div>
																				<div class="form-group">
																					<label for="infoCom">회사명/대표명/사업자번호</label>
																					<input type="text" class="form-control"
																						name="infoCom" id="infoCom" readonly="readonly" 
																						value="${a.partnerComname }/${a.partnerCeoname }/${a.partnerReginum }">
																				</div>
																				<div class="form-group">
																					<label for="partnerDate">등록일</label>
																					<input type="text" class="form-control"
																						name="partnerDate" id="partnerDate" readonly="readonly"
																						value="${a.partnerDate }">
																				</div>
																				<div class="stateview form-group">
																					<label for="partnerStateview">제휴 형태</label>
																					<c:choose>
																						<c:when test="${a.partnerType=='10' }">
																							<c:set var="str" value="제휴"/>
																						</c:when>
																						<c:when test="${a.partnerType=='20' }">
																							<c:set var="str" value="광고"/>
																						</c:when>
																						<c:when test="${a.partnerType=='30' }">
																							<c:set var="str" value="스탬프"/>
																						</c:when>
																						<c:when test="${a.partnerType=='40' }">
																							<c:set var="str" value="광고/스템프"/>
																						</c:when>
																						<c:otherwise>
																							<c:set var="str" value="승인대기"/>
																						</c:otherwise>
																					</c:choose>
																					<input type="text" class="state form-control"
																						name="partnerStateview" id="partnerStateview"  readonly="readonly"
																						value='${str }'>
																					<input type="hidden" value="${a.partnerType}">
																					<button type="button" class="partnerch btn btn-info">변경</button>
																					<select class="partnerType form-control m-bot15" id="partnerType" name="partnerType">
																						<option value="10">제휴</option>
																						<option value="20">광고</option>
																						<option value="30">스탬프</option>
																						<option value="40">광고/스탬프</option>
																					</select>
																				</div>
																				<div class="form-group">
																					<label for="imgshow">사업자 등록증</label>
																				</div>
																				<div class="form-group">
																					<img class="imgshow" id="imgshow" alt="사업자등록증" src="/upload/alliance/${a.partnerPhotofake }" width="50px" height="70px">
																				</div>
																				<button type="button" data-dismiss="modal" class="partnerStatech btn btn-info">변경</button>
																				<button type="button" data-dismiss="modal" class="closebtnf btn btn-primary">닫기</button>
																			</form>
																		</div>
																	</div>
																</div>
															</div>
															<a class="btn btn-danger" href="#">
																<i class="delete icon_close_alt2" id="deletebtn"> 삭제</i>
																<input type="hidden" value="${a.partnerNum }" />
															</a>
														</div>
													</td>
												</tr>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5">검색결과가 없습니다</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</section>
					</div>
				</div>
				<div class="btn-row">
					<div class="btn-group">
						<input type="hidden" id="totalpage" value="${totalpage }">
						<c:choose>
							<c:when test="${url eq 'searchalli.tm' }">
								<a href="${url }?pageNumber=1&partnerComname=${partnerComname }" class="pagebtn btn btn-default" type="button">&#171;</a>
							</c:when>
							<c:otherwise>
								<a href="${url }?pageNumber=1" class="pagebtn btn btn-default" type="button">&#171;</a>
							</c:otherwise>
						</c:choose>
						
						<button class="pagebtn btn btn-default" id="prevPage" type="button">&#60;</button>
						<c:forEach var="i" begin="${startpageNum}" end="${endpageNum}">
							<c:choose>
								<c:when test="${pageNum == i}">
									<a class="pagebtn btn btn-primary" type="button">${i }</a>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${url eq 'searchalli.tm' }">
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
							<c:when test="${url eq 'searchalli.tm' }">
								<a href="${url }?pageNumber=${totalpage }&partnerComname=${partnerComname }" class="pagebtn btn btn-default" type="button">&#187;</a>
							</c:when>
							<c:otherwise>
								<a href="${url }?pageNumber=${totalpage }" class="pagebtn btn btn-default" type="button">&#187;</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- container section start -->
	
	<input type="hidden" id="url" value="${url }">
	<input type="hidden" id="partnerComname" value="${partnerComname }">
	
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
	
	<!--adminAllianceList js-->
	<script src="/resource/admin/js/adminAllianceList.js"></script>
	

</body>
</html>