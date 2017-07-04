<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>registReview.jsp</title>

<!-- Bootstrap Core CSS -->
<link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resource/bootstrap/css/modern-business.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		for(var i=0; i<4; i++){
			
			var id="";
			id = "#photo"+(i+1);
			
			var imgid="";
			imgid = "#photow"+(i+1);
			$(imgid).change(function(){
				$(imgid).attr("src",window.URL.createObjectURL(file));
			});
		}
	});
</script>
</head>
<body>

	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					리뷰 등록 <small>추억을 남겨보세요</small>
				</h1>
				<ol class="breadcrumb">
					<li>마이페이지</li>
					<li>완료된 일정</li>
					<li>리뷰등록</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<form id="reviewForm" action="/registReview/insertReview.tm" enctype="multipart/form-data">
				
				<input type="hidden" name="scNum" value="127">
				<input type="hidden" name="userId" value="maro">
				<input type="hidden" name="totalreLikecount" value="0">
			
				<!-- Projects Row -->
				<h4>여행 중 찍은 사진을 등록해보세요</h4>

			<%for(int i=0; i<4; i++) {%>
				<div class="col-md-3 img-portfolio " style="margin-bottom:2px;">
					<a href="#"> <img
						class="img-responsive img-hover" id="photow<%=i+1 %>" src="http://placehold.it/750x450"
						alt="">
					</a>
					<input type="file" name="photo<%=i+1 %>" id="photo<%=i+1 %>">
<%-- 					<input type="hidden" name="totalrePhoto<%=i+1 %>fake" value="totalrePhoto<%=i+1 %>"> --%>
				</div>
			<%}%>
			<br/>

				
				<div class="col-md-8">

					<div class="control-group form-group">

						<div class="controls">
							<label>제목</label> <input type="text" class="form-control"
								id="title" name="totalreTitle">
							<p class="help-block"></p>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>테마</label> <input type="tel" class="form-control"
								id="thema">
						</div>
						<br />
						<input type="text" value="tag" name="totalreThema">
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>리뷰</label>
							<textarea rows="10" cols="100" class="form-control" id="content"
								style="resize: none" name="totalreContent"></textarea>
						</div>
					</div>
					<div id="success"></div>
					<!-- For success/fail messages -->
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
		<!-- /.row -->

	</div>

</body>
</html>