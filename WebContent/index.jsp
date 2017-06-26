<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#loading {
 width: 100%;   
 height: 100%;   
 top: 0px;
 left: 0px;
 position: fixed;   
 display: block;   
 opacity: 0.7;   
 background-color: #fff;   
 z-index: 99;   
 text-align: center; }  

#loading-image {   
 position: absolute;   
 top: 40%;   
 left: 40%;  
 z-index: 100; } 
</style>
<body>
<div id="loading" style="display: none;">
   <img id="loading-image" alt="로딩중" src="/resource/step2/loding.gif" />
</div>
<div id="main">
<a href="allianceMain.tm">dddd</a>

<a href="tmadmin/adminMember.tm">관리자</a>

<a href="searchpage/search.tm">서치페이지</a>

<form action="searchpage/search.tm" method="get">

<input type="text" name="cityName"/>
<input type="submit"/>
</form>   

<a href = "step2/step2.tm" id="clicka" >스텝222222222222222가기</a> <br/>
<a href = "step/step3.tm">스텝3333가기</a> <br/>
<a href = "mypage_checklist/checklist.tm">마이페이지-체크리스트</a> <br/>
<a href = "travelReview/reviewlist.tm">여행리뷰</a><br/><br/>

<a href="member/loginForm.tm">로그인</a> <br/>
<a href="member/signupForm.tm">회원가입</a> <br/>
<a href="mylist/menubar.tm">내일정</a> <br/>
<a href="member/memberUpdate.tm">내정보보기</a> <br/>
<a href="member/memberModify.tm">내정보수정</a> <br/>
<a href="member/memberDelete.tm">탈퇴하기</a>

<br/>
<a href="tmmain/main.tm">메인메인</a>
<br/>
<a href="tmtour/detailtour.tm">여행지 상세</a>
<br/>
<a href="tmmoblie/mstemp.tm">모바일 보기</a>
<br/>
<a href="tmheader/header.tm">헤더</a>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(function(){
      $("#loading").hide();
      
      $("#clicka").click(function(event){
         event.preventDefault();
         $("#main").hide();
         $("#loading").show();
         var url = "step2/step2.tm"; 
         $(location).attr('href',url);

      });
   });
</script>
</body>
</html>