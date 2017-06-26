<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  </head>
  <body>
<!-- 헤더 부분 -->
<header>
	<%@include file="/tmheader/header.tm" %>
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
		<!-- 질문 부분 -->
		<div class="text-left">
		<img alt="Bootstrap Image Preview" src="/resource/mypage/qna/images/question.png" >
		</div>
		<div class="left">
			<div class="row">
				<div class="col-md-12">
					<blockquote>
						<p>
							이페이지 핵구려요
						</p> <small>작성자nick <cite>내용 어쩌구 저쭈구....</cite></small>	
					</blockquote>
				</div>
			</div>
		</div>
		<br/>	
		<!-- 답변 부분 -->
		<div class="text-right">
		<img alt="Bootstrap Image Preview" src="/resource/mypage/qna/images/answer.png">
		</div>	
		<div class="right">
			<div class="row">
				<div class="col-md-12">
					<div class="text_right">
					<blockquote class="pull-right">
						<p>
							죄송합니다
						</p> <small>운영자 <cite>내용 어쩌구 저쭈구....</cite></small>
						
					</blockquote>
					</div>
				</div>
			</div>
		</div>
		<br/>
		
				<!-- 질문 부분 -->
		<div class="text-left">
		<img alt="Bootstrap Image Preview" src="/resource/mypage/qna/images/question.png" >
		</div>
		<div class="left">
			<div class="row">
				<div class="col-md-12">
					<blockquote>
						<p>
							이페이지 핵구려요
						</p> <small>작성자nick <cite>내용 어쩌구 저쭈구....</cite></small>	
					</blockquote>
				</div>
			</div>
		</div>
		<br/>
		
				<!-- 질문 부분 -->
		<div class="text-left">
		<img alt="Bootstrap Image Preview" src="/resource/mypage/qna/images/question.png" >
		</div>
		<div class="left">
			<div class="row">
				<div class="col-md-12">
					<blockquote>
						<p>
							이페이지 핵구려요
						</p> <small>작성자nick <cite>내용 어쩌구 저쭈구....</cite></small>	
					</blockquote>
				</div>
			</div>
		</div>
		<br/>			
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
			<div class="row">
			<!-- 로그인 체크 부분 -->
				<!-- 메세지 작성 부분 -->
				<div class="row">
				<div class="col-md-12">
					<div class="text-left">
					<div class="q_text">
						<label class="title" id="lb_title">제목</label><br/><br/>
						<input type="text" id="title" class="title"/><br/><br/>			
						<label class="content" id="lb_content">내용</label><br/><br/>
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
    	<!-- qna plugin -->
    	<script src="/resource/mypage/qna/js/qna.js"></script>
  </body>
</html>