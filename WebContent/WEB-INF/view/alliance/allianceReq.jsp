<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>TravelMaker</title>
	<!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<!-- Header CSS -->
    <link href="/resource/bootstrap/css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 메인 헤더 부분 -->
    <jsp:include page="/tmmain/header.tm"></jsp:include>
    
	<div class="container">
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">제휴등록 <br/>
                    <small>
                    	아래 내용을 작성해주시면 빠른 시일 내로<br/>
						등록된 EMAIL로 답변드리겠습니다<br/>
                    </small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/tmmain/main.tm">Home</a></li>
                    <li>제휴 소개</li>
                    <li class="active">제휴 등록</li>
                </ol>
            </div>
        </div>
        <div class="row">
		<form class="form-horizontal" role="form" id="frm" method="post" enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerComname">회사명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerComname" id="partnerComname" placeholder="회사명을 입력해주세요" required="required">
					</div>
					<span class="help-block" id="partnerComnameHint" style="color: red"></span>
				</div>


				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerCeoname">대표명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerCeoname" id="partnerCeoname" placeholder="대표자 성함을 입력해주세요" required="required">
					</div>
					<span class="help-block" id="partnerCeonameHint" style="color: red"></span>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerReginum">사업자 등록번호</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerReginum" id="partnerReginum"
							placeholder="사업자번호를 (-) 없이 입력해주세요" required="required">
					</div>
					<span class="help-block" id="partnerReginumHint" style="color: red"></span>  
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerEmail">E-Mail</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerEmail" id="partnerEmail"
							placeholder="E-mail 주소를 입력해주세요" required="required">
					</div>
					<span class="help-block" id="partnerEmailHint" style="color: red"></span>
				</div>


				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerTel1">연락처</label>
					<div class="row">
						<div class="col-sm-1">
							<input type="text" class="form-control" name="partnerTel1" id="partnerTel1" required="required">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" name="partnerTel2" id="partnerTel2" required="required">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" name="partnerTel3" id="partnerTel3" required="required">
						</div>
						<span class="help-block" id="partnerTelHint" style="color: red"></span>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="file">파일업로드</label>
					<div class="col-sm-3">
						<input type="file" class="form-control" name="file" id="file"
							placeholder="" required="required">
					</div>
					<span class="help-block" id="fileHint" style="color: red"></span>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerContent">문의내용</label>
					<div class="col-sm-5">
						<textarea class="form-control" name="partnerContent" id="partnerContent" rows="5" required="required"></textarea>
					</div>
					<span class="help-block" id="partnerContentHint" style="color: red"></span>
				</div>


				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-check"></span> 문의하기</button>
						<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> 취소</button>
					</div>
				</div>
			</fieldset>
		</form>
		</div>
	</div>
	
	<!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>   
	
	<!-- allianceReq JS -->
	<script src="/resource/alliance/js/allianceReq.js"></script>

</body>
</html>