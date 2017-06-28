<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My qna</title>
    <link href="/resource/mypage/qna/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resource/mypage/qna/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/jquery.sidr/2.0.0/stylesheets/jquery.sidr.dark.min.css">
	<link rel="stylesheet" href="/resource/mypage/qna/css/qna.css">
  	<!-- header css -->
	<link rel="stylesheet" href="/resource/main/header/css/base.css">
  </head>
  <body>
<!-- 헤더 부분 -->
<header>
	<div class="header-main">
			<div class="header-logo">
				<a href="main.tm"><img class="logo" src="/resource/main/header/images/samplelogo.png"></a>
			</div>
			<div class="header-navi">
			<!-- 
				navi list 
				if문으로 유저아이디 식별하여 메뉴 출력 
			-->
				<ul class="navi-list">
					<li><a href="#"><img src="/resource/main/header/images/plan.png"></a></li>
					<li><a href="#"><img src="/resource/main/header/images/destination.png"></a></li>
					<% if (session.getAttribute("userId")!=null){ %>
					<li><a href="#" id="btn-challenge"><img src="/resource/main/header/images/challenge.png"></a></li>
					<li><a href="#" id="btn-mypage"><img src="/resource/main/header/images/mypage.png"></a></li>
					<li><a href="#" id="btn-mypage"><img src="/resource/main/header/images/review.png"></a></li>
					<%} %>
				</ul>
			</div>
			<div class="header-sub">
				<div class="header-serch">
				<!-- 검색창 -->
					<ul class="search-bar">	
						<li><input type='text'class="search-form"></li>
						<li><a href='#' class='button-search' id="btn-search"><img src="/resource/main/header/images/search.png"></a></li>
					</ul>
				</div>
				<div class="header-login">
					<ul class="login-list">
						<!--  회원 로그인시 생성되는 버튼 -->
						<% if (session.getAttribute("userId")!=null){ %>
						<li><label><%=session.getAttribute("userNick")%></label></li>
						<li><a href='#' class='button-logout' id="btn-logout"><img src="/resource/main/header/images/logout.png"></a></li>
						<!--  비회원 접속시 생성되는 버튼-->
						<%}else {%>
						<li><a href='#' class='button-login' id="btn-login"><img src="/resource/main/header/images/login.png"></a></li>
						<li><a href='#' class='button-join' id="btn-join"><img src="/resource/main/header/images/join.png"></a></li>		
						<%} %>
					</ul>	
				</div>
			</div>
		</div>
</header>
	<!-- 토글 버튼 -->

	<a id="simple-menu" href="#sidr">
	<img src="/resource/mypage/qna/images/menu.png">
	</a> 

	<!-- 사이드 메뉴 -->	
	<div id="side_menu_nav" style="display:none">
		<nav class="nav">
  			<ul id="menu">
      			<li>
      				<a href="#">
        			<span class="fa-stack fa-lg pull-left">
          			<i class="fa fa-gears fa-stack-1x "></i>
        			</span> 나의 정보
      				</a>
      				<ul>
        				<li><a href="#">내정보 보기</a></li>
        				<li><a href="#">회원 탈퇴</a></li> 
      				</ul>
      			</li>
      			<li>
      				<a href="/mylist/menubar.tm">
        				<span class="fa-stack fa-lg pull-left">
          				<i class="fa fa-server fa-stack-1x "></i>
        				</span> 내 일정
      				</a>
      			</li>
      			<li>
      				<a href="likespot.tm">
        				<span class="fa-stack fa-lg pull-left">
          				<i class="fa fa-server fa-stack-1x "></i>
        				</span> 관심여행지
      				</a>
      			</li>
      			<li>
      				<a href="schedule.tm">
        				<span class="fa-stack fa-lg pull-left">
          				<i class="fa fa-server fa-stack-1x "></i>
        				</span> 관심일정
      				</a>
      			</li>
      			<li>
      				<a href="qna.tm">
        				<span class="fa-stack fa-lg pull-left">
          				<i class="fa fa-server fa-stack-1x "></i>
        				</span> QnA
      				</a>
      			</li>
      			<li>
      				<a href="stemp.tm">
        				<span class="fa-stack fa-lg pull-left">
          				<i class="fa fa-server fa-stack-1x "></i>
        				</span> 스탬프
      				</a>
      			</li>
    		</ul>
		</nav>
	</div>

<!-- 바디 -->
<article>
	<br/>
<div class="container-box">
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<c:choose>
			<c:when test="${!empty qnalist}">
				<c:forEach var="i" items="${qnalist}">
						<!-- 질문 부분 -->
							<div class="text-left">
								<img alt="Bootstrap Image Preview" src="/resource/mypage/qna/images/question.png" >
							</div>
								<div class="left">
									<div class="row">
										<div class="col-md-12">
											<blockquote>
												<p>${i.qnaContent}</p> 
												<small>${i.userId }</small>	
											</blockquote>
										</div>
									</div>
								</div>
							<br/>	
					<c:choose>
						<c:when test="${!empty i.qnaReply}">
							<!-- 답변 부분 -->
							<div class="text-right">
								<img alt="Bootstrap Image Preview" src="/resource/mypage/qna/images/answer.png">
							</div>	
							<div class="right">
								<div class="row">
									<div class="col-md-12">
										<div class="text_right">
											<blockquote class="pull-right">
											<p>${i.qnaReply}</p> <small>TravelMaker</small>
											</blockquote>
										</div>
									</div>
								</div>
							</div>
							<br/>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 페이지 넘기는 버튼 -->
			<div class="text-center">
			<ul class="pagination pagination-lg">
				<li>
					<a href="#">Prev</a>
				</li>
				<li>
					<a href="#">1</a>
				</li>
				<li>
					<a href="#">2</a>
				</li>
				<li>
					<a href="#">3</a>
				</li>
				<li>
					<a href="#">4</a>
				</li>
				<li>
					<a href="#">5</a>
				</li>
				<li>
					<a href="#">Next</a>
				</li>
			</ul>
			</div>
			</c:when>
			<c:otherwise>
				<h1>문의하시거나 신고한 내용이 없습니다.</h1>
			</c:otherwise>
		</c:choose>			
			<div class="row">
			<!-- 로그인 체크 부분 -->
				<!-- 메세지 작성 부분 -->
				<div class="row">
				<div class="col-md-12">
					<div class="text-left">
							<div class="col-md-12">
								<label class="title" class="label" id="lb_type">유형</label><br/>
									<select class="select">
										<option value="">유형을 선택하세요~</option>
  										<option value="문의">문의</option>
  										<option value="신고">신고</option>
									</select>
							</div>
							<div class="col-md-12">	
								<label class="content" class="label" id="lb_content">내용</label><br/>
								<textarea class="content" id="content" rows="10" cols="120"></textarea>
								<button type="button" id="btn_write" class="btn btn-lg btn-success">작성</button>
							</div>
						</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
</article>
    	<!-- Include jQuery -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    	<script src="/resource/mypage/qna/js/bootstrap.min.js"></script>
   	 	<script src="/resource/mypage/qna/js/scripts.js"></script>
    	<!-- Include the Sidr JS -->
    	<script src="//cdn.jsdelivr.net/jquery.sidr/2.0.0/jquery.sidr.js"></script>
    	<!-- header function -->
		<script type="text/javascript" src="/resource/main/header/js/function.js"></script>
    	<!-- qna plugin -->
    	<script src="/resource/mypage/qna/js/qna.js"></script>
  </body>
</html>