<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
<!DOCTYPE html>
<html lang="UTF-8">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>
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
	

    <!-- 지정 css -->
    <link href="/resource/mypage/likespot/css/likespot.css" rel="stylesheet" type="text/css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
	<!-- 탭 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!--  프로그레스 -->
	<link rel="stylesheet" href="/resource/member/css/jquery.lineProgressbar.css">
	
	<!--  메뉴바 -->
	<link rel="stylesheet" type="text/css" href="/resource/member/css/base.css" />
	<link rel="stylesheet" type="text/css" href="/resource/member/css/style.css" />
	
	<!-- mouseover -->
	<link rel="stylesheet" type="text/js" href="/resource/mylist/js/listmouse.js" />
	<link rel="stylesheet" type="text/css" href="/resource/mylist/css/listmouse.css" />
	
	<!-- 헤더 -->
	<!-- <link rel="stylesheet" href="/TravelMakerTest/css/base.css"> -->
	
	<!-- 각 list 틀 -->
	<link rel="stylesheet" type="text/js" href="/resource/mylist/js/mylist.js" />
	<link rel="stylesheet" href="/resource/mylist/css/mylist.css">

<style type="text/css">

/*탭부분 스타일지정*/
.tab{
	font-size: 20px;
	display: inline-block;	
	font-weight: bold;
}
.tab:hover{
text-decoration:none;
}
</style>


<!--  메뉴바 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    $(".subtitle:not(:first)").attr('class','subtitle sub_on');
    $(".sub:first").css("display","block");
    $(".sub:not(:first)").css("display","none");
    $(".subtitle").click(function() { 
        if ($(this).next(".sub").css("display") == "none") {
            $(this).attr('class','subtitle');
        } else {
            $(this).attr('class','subtitle sub_on');
        }
        $(this).next(".sub").slideToggle('fast');
    });
});
</script>

<!--  탭관련 js
	클릭시 해당하는 일정 페이지로 넘어간다.-->
<script type="text/javascript">
$(function(){
	//전체 일정을 보여준다
	$('#all').click(function(){
		$('#all').attr('href','menubar.tm');//여기 경로만 수정해주세요
	});
	//계획중인 일정을 누르면 계획중인 일정 페이지로 넘어간다. 
	$('#ing').click(function(){
		$('#ing').attr('href','inglist.tm');//여기 경로만 수정해주세요
	});
	
	//완성된 일정을 페이지로 넘어감. 
	$('#done').click(function(){
		$('#done').attr('href','donelist.tm'); //여기 경로만 수정해주세요
	});
	
	//시작된 일정 페이지로 넘어감
	$('#start').click(function(){
		$('#start').attr('href','startlist.tm');//여기 경로만 수정해주세요
	});
	
	//여행한 일정 페이지로 넘어감.
	$('#end').click(function(){
		$('#end').attr('href','endlist.tm');//여기 경로만 수정해주세요
	});
	
});

</script>

</head>



<body>

    <div id="wrapper">
        <!-- 헤더 부분 -->
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
            <!--  모바일 버전때 생성되는 버튼 -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            <!-- /모바일 버전때 생성되는 버튼 -->   
            <!-- 로고 --> 
                <a class="tmlogo navbar-brand" href="tmmain/main.tm">Travel Maker</a>
            <!-- /로고 -->
            </div>
            <!-- 네비 헤더  메뉴 부분 -->
      		   <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm">일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행지추천</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행리뷰</a>
                    </li>
                    <li style="padding:10px;">
                       <input type="text" style="height: 27px; margin-right:5px;"/><button id="#searchBtn" style="background-color: #fafafa;border:0px; border-style: none; height: 27px;width:30px">
                       <span class="glyphicon glyphicon-search"></span>
                       </button> 
                    </li>                      
                     <li>
                        <a href="/member/loginForm.tm" style="padding-right: 378px">로그인　</a>
                    </li>
                </ul>
            <!-- /네비 헤더  메뉴 부분 -->

            <div class="navbar-inverse sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#"><i class="fa fa-user fa-user"></i>  내 정보<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/member/memberUpdate.tm">  정보수정</a>
                                </li>
                                <li>
                                    <a href="/member/memberDelete.tm">  회원탈퇴</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>  내 일정<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/mylist/inglist.tm">  계획중인일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/donelist.tm">  완성된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/startlist.tm">  시작된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/endlist.tm">  여행한일정</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="/tmmypage/likespot.tm"><i class="fa fa-check-square-o fa-fw"></i>  관심 여행지</a>
                        </li>
                        <li>
                            <a href="/tmmypage/schedule.tm"><i class="fa fa-check-square-o fa-fw"></i>  관심 일정</a>
                        </li>
                        <li>
                            <a href="/tmmypage/qna.tm"><i class="fa fa-comments fa-fw"></i>  QnA</a>
                        </li>
                        <li>
                            <a href="/tmmypage/stemp.tm"><i class="fa fa-map-marker fa-fw"></i>  스템프</a>
                        </li>                        
                    </ul>
                </div>
                <!-- /사이드 메뉴 -->
            </div>
            <!-- /네비게이션 -->
        </nav>
		<!-- 바디 부분 -->
        <!-- Page Content -->
        <div id="page-wrapper" style="padding-right: 0px;">

     

		<!-- 각 일정 보여주는 곳 -->
		<center>
		<div class="schedule-list">          
            
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ing">
							  <img src="/resource/mylist/images/image_1.JPG" />
							  <figcaption>
							    <h3>2017.05.16~2017.06.11</h3>
							    <p>서울>부산</p>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done">
							  <img src="/resource/mylist/images/image_2.JPG" />
							  <figcaption>
							    <h3>2017.08.16~2017.10.11</h3>
							    <p>서울>제주도</p>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter start">
							  <img src="/resource/mylist/images/image_3.JPG" />
							  <figcaption>
							    <h3>2017.05.16~2017.06.11</h3>
							    <p>서울>전주</p>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter end">
							  <img src="/resource/mylist/images/image_4.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ing">
							  <img src="/resource/mylist/images/image_5.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done">
							  <img src="/resource/mylist/images/image_6.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ing">
							  <img src="/resource/mylist/images/image_7.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter start">
							  <img src="/resource/mylist/images/image_8.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter end">
							  <img src="/resource/mylist/images/image_9.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p>
							  </figcaption>
							</figure>



				</div> 
			</center>
        </div>
        <!-- /#page-wrapper -->
	</div>
    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resource/bootstrap/js/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>

</body>

</html>
