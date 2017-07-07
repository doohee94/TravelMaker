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
    
    <!-- 헤더 css -->
	<link href="/resource/header/css/header.css" rel="stylesheet" />
</head>
<body>
	<!-- 메인 헤더 부분 -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/tmmain/main.tm">Travel Maker</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm">일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행지추천</a>
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <c:if test="${not empty sessionScope.userNick }">
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행리뷰</a>
                    </li>
                    <li>
                        <a href="/mylist/menubar.tm">마이페이지</a>
                    </li>
                    </c:if>
                    <li style="padding:10px" id="mobile_search">
                       <input type="text"/><button id="#searchBtn" style="background-color: #fafafa; border:0px; border-style: none; height: 25px;"><span class="glyphicon glyphicon-search"></span> search</button> 
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <c:choose>
                    	<c:when test="${not empty sessionScope.userNick }">
                    		 <li>
		                    	<a href="#">${sessionScope.userNick }&nbsp;&nbsp;님</a>
		                    </li>                      
		                    <li>
		                        <a href="/tmmain/logout.tm">로그아웃</a>
		                    </li>
                    	</c:when>
                    	<c:otherwise>
                    		 <li>
		                        <a href="/member/loginForm.tm">로그인</a>
		                    </li>
		                    <li>
		                        <a href="/member/signupForm.tm">회원가입</a>
		                    </li>   
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    
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
						<input type="text" class="form-control" name="partnerComname" id="partnerComname" placeholder="회사명을 입력해주세요">
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerCeoname">대표명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerCeoname" id="partnerCeoname" placeholder="대표자 성함을 입력해주세요">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerReginum">사업자 등록번호</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerReginum" id="partnerReginum"
							placeholder="사업자번호를 (-) 없이 입력해주세요" >
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerEmail">E-Mail</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerEmail" id="partnerEmail"
							placeholder="E-mail 주소를 입력해주세요">
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerTel1">연락처</label>
					<div class="row">
						<div class="col-sm-1">
							<input type="text" class="form-control" name="partnerTel1" id="partnerTel1">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" name="partnerTel2" id="partnerTel2">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" name="partnerTel3" id="partnerTel3">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="file">파일업로드</label>
					<div class="col-sm-3">
						<input type="file" class="form-control" name="file" id="file"
							placeholder="">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerContent">문의내용</label>
					<div class="col-sm-5">
						<textarea class="form-control" name="partnerContent" id="partnerContent" rows="5"></textarea>
					</div>
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
	<script type="text/javascript">
		$(".btn-info").click(function(){
			if($("#partnerComname").val() == "" || $("#partnerComname").val() == null){
				alert("회사명 누락");
				$("#partnerComname").focus();
				return false;
			}
			
			if($("#partnerCeoname").val() == "" || $("#partnerCeoname").val() == null){
				alert("대표자명 누락");
				$("#partnerCeoname").focus();
				return false;
			}
			
			if($("#partnerReginum").val() == "" || $("#partnerReginum").val() == null){
				alert("사업자번호 누락");
				$("#partnerReginum").focus();
				return false;
			}
			
			var pattern1=/[0-9]{10}$/;
			if(!(pattern1.test($("#partnerReginum").val()))){
				alert("잘못된 입력");
				$("#partnerReginum").focus();
				return false;
			}
			
			if($("#partnerEmail").val() == "" || $("#partnerEmail").val() == null){
				alert("E-mail 누락");
				$("#partnerEmail").focus();
				return false;
			}
			
			var pattern2=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			if(!(pattern2.test($("#partnerEmail").val()))){
				alert("E-mail 잘못");
				$("#partnerEmail").focus();
				return false;
			}
			
			var pattern3=/[0-9]{2,3}$/;
			if($("#partnerTel1").val() == "" || $("#partnerTel1").val() == null){
				alert("전화번호 누락");
				$("#partnerTel1").focus();
				return false;
			}
			if(!(pattern3.test($("#partnerTel1").val()))){
				alert("전화번호 잘못된입력");
				$("#partnerTel1").focus();
				return false;
			}
			
			var pattern4=/[0-9]{3,4}$/;
			if($("#partnerTel2").val() == "" || $("#partnerTel2").val() == null){
				alert("전화번호 누락");
				$("#partnerTel2").focus();
				return false;
			}
			if(!(pattern4.test($("#partnerTel2").val()))){
				alert("전화번호 잘못된입력");
				$("#partnerTel2").focus();
				return false;
			}
			
			var pattern5=/[0-9]{4}$/;
			if($("#partnerTel3").val() == "" || $("#partnerTel3").val() == null){
				alert("전화번호 누락");
				$("#partnerTel3").focus();
				return false;
			}
			if(!(pattern5.test($("#partnerTel3").val()))){
				alert("전화번호 잘못된입력");
				$("#partnerTel3").focus();
				return false;
			}
			
			if($("#partnerContent").val() == "" || $("#partnerContent").val() == null){
				alert("내용 누락");
				$("#partnerContent").focus();
				return false;
			}
			
			$("#frm").attr("action","allianceOk.tm");
			$("#frm").submit();
		});
	</script>

</body>
</html>