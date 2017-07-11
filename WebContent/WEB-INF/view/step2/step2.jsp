<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    
    <!-- step2 CSS -->
    <link href="/resource/step2/css/step2.css" rel="stylesheet" type="text/css">
    
    
</head>
<body>
	<jsp:include page="/tmmain/header.tm"></jsp:include>
<%--     	<center> --%>
<%--     		<input type="button" value="< 이전" class="nextbtn" onclick="location.href='/step1/step1.tm'"> --%>
<!-- 			<input type="button" value="다음 >" class="nextbtn" onclick="location.href='/step/step3.tm'"> -->
<%--     	</center> --%>
	
    	
	<div class="container">
		
		<div class="row">
	            <div class="col-lg-13">
	                <ol class="breadcrumb">
	                    <li>1단계</li>
	                    <li class="step1blur">2단계</li>
	                    <li>3단계</li>
	                    
	                    <input type="button" value="다음 >" class="nextbtn" onclick="location.href='/step/step3.tm'">
	                    <input type="button" value="< 이전" class="nextbtn" onclick="location.href='/step1/step1.tm'">
	                </ol>
	            </div>
    	</div>
        
        <!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<!-- 초기 여행지 start -->
			
<!-- 		<div class="showlist"> -->
		<br/>
		<br/>
		<br/>
		<!--  style="border: 1px solid yellow;" -->
			<div class="stepwizard" >
				<div class="stepwizard-row">
					<c:if test="${!empty list }">
						<c:forEach var="s" items="${list}" varStatus="cnt">
							<c:choose>
								<c:when test="${cnt.index eq '0'}">
									<div class="stepwizard-step">
										<button type="button" class="btn btn-circle" disabled="disabled">S</button>
										<p>${s }</p>
									</div>
								</c:when>
								<c:when test="${cnt.count eq fn:length(list)}">
									<div class="stepwizard-step">
										<button type="button" class="btn btn-circle" disabled="disabled">E</button>
										<p>${s }</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="stepwizard-step">
										<button type="button" class="btn btn-circle" disabled="disabled"><c:out value="${cnt.index }" /></button>
										<p>${s }</p>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
				</div>
			</div>
		<!-- 초기 여행지 end -->
		
		<br /><br />
		
		<!-- 변경 여행지 start -->
			<form id="frm" method="post">
				<input type="hidden" id="changelisthidden" name="changelist" />
				<div style="width: 1150px; margin: auto;"class="locchangebtn">
					<input type="button" id="changelistbtn" value="변경" class="nextbtn" style="float: right; margin-top: 0">
					<span style="padding-right:30px; float:right; text-align: right; font-size: 1.5em;">변경 여행 리스트</span>
				</div>
			</form>
		<!-- 변경 여행지 end -->
		
		<br /><br />
			<!-- border: 2px groove #EAEAEA; -->
			<div class="changelistdiv" >
				<center>
				<ul id="changelist" class="changelist">
					<c:if test="${list !=null }">
						<c:set var="i">0</c:set>
						<c:forEach var="s" items="${list}">
							<li class="changelist">${s }</li>
						</c:forEach>
					</c:if>
				</ul>
				</center>
			</div>
			
		<br /> <br /><br />
		<!-- style="border: 1px solid black;" -->
			<div class="maintop">
				<div class="maintop1"><span class="headerlike">추천(시,군)</span></div>
				<div class="maintop2"><span class="headerlike">여행지</span></div>
			</div>
		
		<!-- 추천 여행지 start -->
		
		<br /> <br />
		<!-- style="border: 1px solid red;" -->
			<div class="main" >
				<!-- 추천 여행지 리스트 start -->
				<!-- style="border: 1px solid blue;" -->
				<div class="mainleft" >
					<center>
					<ul id="selectlist" class="dropfalse">
						<c:if test="${addlist !=null }">
							<c:forEach var="add" items="${addlist}">
								<li class="sellist">${add }</li>
							</c:forEach>
						</c:if>
					</ul>
					</center>
				</div>
				<!-- 추천 여행지 리스트 end -->
				<!-- 여행지 상세 start -->
				<!--  style="border: 1px solid green;" -->
				<div class="mainright">
					<img alt="페이지 설명" src="/resource/step2/content.png" id="con" style="margin-top: -100px;">
				</div>
				<!-- 여행지 상세 end -->
			</div>
			<br style="clear: both">
		<!-- 추천 여행지 end -->
<!-- 		</div> -->
		</div>
    </div>
    <!-- /.container -->
    <br/>
    <br/>
    <br/>
    <br/>
    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
    <!-- jQuery UI -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- step2 JS -->
    <script src="/resource/step2/js/step2.js"></script>
</body>
</html>