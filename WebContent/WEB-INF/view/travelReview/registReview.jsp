<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	String user_id = (String)request.getAttribute("userId"); 
	String _id = (String)request.getAttribute("_id");
%>
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

<!-- 해시태그 관련 파일 -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet"
   href="/resource/travelReview/dist/bootstrap-tagsinput.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/themes/github.css">
<link rel="stylesheet" href="/resource/travelReview/assets/app.css">
<script>
   (function(i, s, o, g, r, a, m) {
      i['GoogleAnalyticsObject'] = r;
      i[r] = i[r] || function() {
         (i[r].q = i[r].q || []).push(arguments)
      }, i[r].l = 1 * new Date();
      a = s.createElement(o), m = s.getElementsByTagName(o)[0];
      a.async = 1;
      a.src = g;
      m.parentNode.insertBefore(a, m)
   })(window, document, 'script', '//www.google-analytics.com/analytics.js',
         'ga');

   ga('create', 'UA-42755476-1', 'bootstrap-tagsinput.github.io');
   ga('send', 'pageview');
</script>
<meta name="robots" content="index, follow" />

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<header>
    <jsp:include page="/tmmain/header.tm"></jsp:include>
</header>

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
         <form id="reviewForm" action="/travelReview/insertReview.tm" enctype="multipart/form-data" method="post">
            <input type="hidden" name="scNum" value=<%=_id %>> <input
               type="hidden" name="userId" value=<%=user_id%>> <input
               type="hidden" name="totalreLikecount" value="0">

            <!-- Projects Row -->
            <h4>여행 중 찍은 사진을 등록해보세요</h4>

            <%
               for (int i = 0; i < 4; i++) {
            %>
            <div class="col-md-3 img-portfolio " style="margin-bottom: 2px;">
               <img style="width:450px; height:200px" class="img-responsive img-hover" id="photow<%=i + 1%>" src="http://placehold.it/750x450" alt="">
               <input type="file" name="photo<%=i + 1%>" id="photo<%=i + 1%>" class="photo">
            </div>
            <%
               }
            %>
            <hr>

               <div id="noEnter" class="control-group form-group">

                  <div class="controls">
                     <h4>제목</h4> <input type="text" class="form-control"
                        id="title" name="totalreTitle">
                     <p class="help-block"></p>
                  </div>
                  <div class="example example_multivalue">
                     <h4>해시태그</h4>
                     <input type="text" name="hashtag" value="" data-role="tagsinput" />
                  </div>
                </div>

                  <div class="control-group form-group">
                     <div class="controls">
                        <h4>리뷰</h4>
                        <textarea rows="10" cols="100" class="form-control" id="content"
                           style="resize: none" name="totalreContent"></textarea>
                     </div>
                  </div>
                  <div id="success"></div>
                  <!-- For success/fail messages -->
                  <button type="submit" class="btn btn-primary">등록</button>
         </form>
      </div>
      <!-- /.row -->

   </div>


   <script src="/resource/travelReview/dist/bootstrap-tagsinput.min.js"></script>
   <script type="text/javascript" src="/resource/travelReview/js/registReview.js"></script>

</body>
</html>