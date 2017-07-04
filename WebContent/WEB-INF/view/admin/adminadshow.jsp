<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<li><i class="icon_documents_alt"></i>광고 수정</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> 광고 상세 정보 </header>
							<div class="panel-body">
								<div class="form">
									<form class="form-validate form-horizontal" action="adupdate.tm" id="feedback_form" method="post" enctype="multipart/form-data">
										<div class="form-group ">
											<label for="partnername" class="control-label col-lg-2">
												회사명
											</label>
											<div class="col-lg-3">
												<input class="form-control" id="partnername" name="partnername" minlength="5" type="text" value="${dto.partnerCeoname }" readonly="readonly" />
												<input type="hidden" name="partnerNum" id="partnerNum" value="${dto.partnerNum }"/>
												<input type="hidden" id="adNum" name="adNum" value="${dto.adNum }"/>
												<input type="hidden" id="pstartyear" value="${dto.startyear }"/>
												<input type="hidden" id="pstartmonth" value="${dto.startmonth }"/>
												<input type="hidden" id="pstartday" value="${dto.startday }"/>
												<input type="hidden" id="pendyear" value="${dto.endyear }"/>
												<input type="hidden" id="pendmonth" value="${dto.endmonth }"/>
												<input type="hidden" id="pendday" value="${dto.endday }"/>
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
												<input class="form-control " id="adTitle" type="text" name="adTitle" value="${dto.adTitle }" />
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
												<input type="file" id="file" name="file" >
											</div>
										</div>
										<div class="form-group ">
											<label for="cemail" class="control-label col-lg-2">미리보기</label>
											<div class="col-lg-10">
												<img id="show" src="/upload/admin/${dto.adPhotofake }">
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
	<script type="text/javascript">
		$("#submit").click(function(){
			if($("#partnername").val() == "" || $("#partnername").val() == null){
				alert("회사를 선택");
				return false;
			}
		});
		
		var now = new Date();
	    var year= now.getFullYear();
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

		for (var i = year; i < (year+20); i++) {
			$("#startyear").append("<option value='"+i+"'>" + i)
			$("#endyear").append("<option value='"+i+"'>" + i)
		}
		
		$("#startyear").find("option").each(function(){
			if($(this).val() == $("#pstartyear").val()){
				$(this).attr("selected","selected");
			}
		});
		$("#startmonth").find("option").each(function(){
			if($(this).val() == $("#pstartmonth").val()){
				$(this).attr("selected","selected");
			}
		});
		$("#endyear").find("option").each(function(){
			if($(this).val() == $("#pendyear").val()){
				$(this).attr("selected","selected");
			}
		});
		$("#endmonth").find("option").each(function(){
			if($(this).val() == $("#pendmonth").val()){
				$(this).attr("selected","selected");
			}
		});
		
		$("#startday option").remove();
		var d = new Date();
		d.setYear($("#pstartyear").val());
		d.setMonth($("#pstartmonth").val());
		d.setDate(0);
		var date = d.getDate();
		
		
		//1~마지막날까지 옵션 추가
		for (var i = 1; i <= date; i++) {
			if(i <10){
				$("#startday").append("<option value='0" + i + "'>" + i);
			}else{
				$("#startday").append("<option value=" + i + ">" + i);
			}
		}
		
		$("#startday").find("option").each(function(){
			if($(this).val() == $("#pstartday").val()){
				$(this).attr("selected","selected");
			}
		});
		
		d.setYear($("#pendyear").val());
		d.setMonth($("#pendmonth").val());
		d.setDate(0);
		var date = d.getDate();
		
		
		//1~마지막날까지 옵션 추가
		for (var i = 1; i <= date; i++) {
			if(i <10){
				$("#endday").append("<option value='0" + i + "'>" + i);
			}else{
				$("#endday").append("<option value=" + i + ">" + i);
			}
		}
		
		$("#endday").find("option").each(function(){
			if($(this).val() == $("#pendday").val()){
				$(this).attr("selected","selected");
			}
		});
		
		$("#startyear").change(startchangeday);
		$("#startmonth").change(startchangeday);
		$("#endyear").change(endchangeday);
		$("#endmonth").change(endchangeday);
		$("#endday").change(function(){
			if($("#startyear").val() == $("#endyear").val() && $("#startmonth").val() == $("#endmonth").val() && $("#startday").val() > $("#endday").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endday").val($("#startday").val());
			}
		});
		
		function startchangeday(){	
			$("#startday option").remove();
			var d = new Date();
			d.setYear($("#startyear").val());
			d.setMonth($("#startmonth").val());
			d.setDate(0);
			var date = d.getDate();

			//1~마지막날까지 옵션 추가
			for (var i = 1; i <= date; i++) {
				if(i <10){
					$("#startday").append("<option value='0" + i + "'>" + i);
				}else{
					$("#startday").append("<option value=" + i + ">" + i);
				}
			}
			$("#endyear").val($("#startyear").val());
			$("#endmonth").val($("#startmonth").val());
		};
		
		function endchangeday(){
			if($("#startyear").val() > $("#endyear").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endyear").val($("#startyear").val());
			}else if($("#startyear").val() == $("#endyear").val() && $("#startmonth").val() > $("#endmonth").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endmonth").val($("#startmonth").val());
			}
			
			$("#endday option").remove();
			var d = new Date();
			d.setYear($("#endyear").val());
			d.setMonth($("#endmonth").val());
			d.setDate(0);
			var date = d.getDate();

			//1~마지막날까지 옵션 추가
			for (var i = 1; i <= date; i++) {
				if(i <10){
					$("#endday").append("<option value='0" + i + "'>" + i);
				}else{
					$("#endday").append("<option value=" + i + ">" + i);
				}
			}
		};
	
		$("#file").change(function(){
			showImg(this);
		});
		
		function showImg(input){	
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#show').attr('src', e.target.result); 
				}
				reader.readAsDataURL(input.files[0]); 
			}
		}
		
		$("#alsearchbtn").click(function(){
			var partnercomname = $("#partner_comname").val();
			
			$.ajax({
				url : "/tmadmin/adadsearch.tm",
				type : "POST",
				data : {
					"partnercomname" : partnercomname,
				},
				dataType : "json",
				success : function(data){
					$("tbody").empty();
					for (var i = 0; i < data.length; i++) {
						$("tbody").append("<tr class='for"+i+" allisttr' data-dismiss='modal'>");
						$(".for"+i).append("<td>"+data[i].partnerNum);	
						$(".for"+i).append("<td>"+data[i].partnerComname);	
						$(".for"+i).append("<td>"+data[i].partnerReginum);	
					}
				}
			});
		});
		
		$(document).on("click",".allisttr",function(){
			var num = $(this).children().first();
			var name = num.next().text();
			
			$("#partnername").val(name);
			$("#partnerNum").val(num.text());
		});
		
	</script>

</body>
</html>