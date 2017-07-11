<%@page import="tm.mypage.dto.LikeSpotDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
 <% 
 String userId = (String)session.getAttribute("userId");
 String userNick = (String)session.getAttribute("userNick");
 
 ArrayList<LikeSpotDTO> list = (ArrayList)request.getAttribute("likelist");
 
 %>   
<!DOCTYPE html>
<html lang="UTF-8">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Travel Maker 마이페이지</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- MetisMenu CSS -->
    <link href="/resource/bootstrap/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- list CSS -->
	<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/component.css" />
	
	<!-- list Plug-In -->
	<script src="/resource/mypage/likespot/js/modernizr.custom.js"></script>
	    
    <!-- 마이페이지 공통 css -->
    <link href="/resource/mypage/base/css/mypage.css" rel="stylesheet" type="text/css">
	<!-- 지정 CSS -->	
    <link href="/resource/mypage/likespot/css/likespot.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!--     <style type="text/css"> -->

<!--     </style> -->
</head>
<body>
    <div id="wrapper">
       	<!-- Navigation -->
        <jsp:include page="/tmmain/mypageheader.tm"></jsp:include>
		<!-- 바디 부분 -->
        <div id="page-wrapper">
			<div class="container" style="margin-right:65%">
				<!-- 바디 타이틀  -->
          		<div class="row">
            		<div class="col-lg-12">
                		<h1 class="page-header">관심 여행지
                    		<small>Like Travel Destination</small>
                		</h1>
            		</div>
            	<!-- /바디 타이틀 -->
        		</div>
          	<article>
          	<input type="hidden" id="listNum" value="<%=list.size()%>"/>
          	<%for(int i=0; i<list.size(); i++){%>
          	<input type="hidden" class="likeNum<%=i%>" value="<%=list.get(i).getLikespotName()%>"/>
          	<%} %>
				
						<section class="grid-wrap">
							<ul class="grid swipe-right" id="grid">
								<!--  likelist 길이 만큼 for문 돌리기 		-->
								
									
								
							</ul>
						</section>
					
						<div class='nonlist'>
								<section class="grid-wrap">
								</section>
						</div>
					
		  	</article>  
			</div><!-- /container -->
        </div>
        <!-- 바디 부분 -->
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resource/bootstrap/js/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>
    <!--  list plug-In -->
    <script src="/resource/mypage/likespot/js/masonry.pkgd.min.js"></script>
	<script src="/resource/mypage/likespot/js/imagesloaded.pkgd.min.js"></script>
	<script src="/resource/mypage/likespot/js/classie.js"></script>
	<script src="/resource/mypage/likespot/js/colorfinder-1.1.js"></script>
	<script src="/resource/mypage/likespot/js/gridScrollFx.js"></script>
	
	<!-- 마이페이지 공통 js -->
    <script src="/resource/mypage/base/js/base.js"></script>
	<!--  지정 스크립트  -->
	<script src="/resource/mypage/likespot/js/likespot.js"></script>
	<script>
	new GridScrollFx( document.getElementById( 'grid' ), {
	viewportFactor : 0.4
	} );
	</script>

</body>

</html>
