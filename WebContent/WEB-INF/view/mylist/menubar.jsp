<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=10" />
	
    <!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap//css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resource/bootstrap/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
	font-size: 30px;
	display: inline-block;	
	font-weight: bold;
}
.tab:hover{
text-decoration:none;
}
</style>

</head>
<body>

    <div id="wrapper" class="wrapper">

                <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
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
                <a class="navbar-brand" href="index.html">TravelMaker</a>
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
                    <li>
                        <a href="/challengeschedule/challengeSchedule.tm">도전일정</a>
                    </li>
                     <li style="padding:10px">
                       <input type="text"/><button id="#searchBtn" style="background-color: #fafafa; border:0px; border-style: none; height: 25px;"><span class="glyphicon glyphicon-search"></span> search</button>
                    </li>                      
                     <li>
                        <a href="member/loginForm.tm">로그인　</a>
                    </li>
                </ul>
            <!-- /네비 헤더  메뉴 부분 -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#"><i class="fa fa-user fa-user"></i>  내 정보<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="http://localhost:8080/member/memberUpdate.tm">  정보수정</a>
                                </li>
                                <li>
                                    <a href="http://localhost:8080/member/memberDelete.tm">  회원탈퇴</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="http://localhost:8080/mylist/menubar.tm"><i class="fa fa-list-alt fa-list-alt"></i>  내 일정</a>
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-heart fa-heart"></i>  관심 여행지</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-calendar fa-calendar"></i>  관심 일정</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-omments fa-comments"></i>  QnA</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-flag fa-flag"></i>  스템프</a>
                        </li>                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper" style="padding-right: 0px;">
        <!--  달성률 보는 곳 -->
		<article   style="margin-left:-30px;  background-image:url('/resource/mylist/images/test101.png'); height: 250px;">
			
			<img src="/resource/mylist/images/flag.png" style="display: inline-block; margin-left:1500px"/>
			<div id="rate" style="margin-left:35%;display:inline-block;"></div>
		
		</article>


 <!-- 탭 -->       
        <div class="row">
        <article  style="background-color: #F2F2F2; height: 100px; margin-left: -15px; margin-right: 15px;" >
        <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
        </div>
		
        <div align="center" ><br/>
            <a class="tab" data-filter="all" id="all" style="cursor:pointer" style="font-size: 5pt">전체<br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="tab" data-filter="ing" id="ing" style="cursor:pointer" style="font-size: 5pt">계획중인<br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="tab" data-filter="done" id="done" style="cursor:pointer" style="font-size: 5pt">완성된<br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="tab" data-filter="start" id="start" style="cursor:pointer" style="font-size: 5pt">시작된<br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="tab" data-filter="end" id="end" style="cursor:pointer" style="font-size: 5pt">여행한<br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        </article>
        <br/>

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
				    <h3>2017.05.16~2017.06.11</h3>
				    <p>서울>부산</p>
				  </figcaption>
				</figure>
				
				<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter start">
				  <img src="/resource/mylist/images/image_3.JPG" />
				  <figcaption>
				    <h3>2017.05.16~2017.06.11</h3>
				    <p>서울>부산</p>
				  </figcaption>
				</figure>
				
				<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter end">
				  <img src="/resource/mylist/images/image_4.JPG" />
				  <figcaption>
				    <h3>2017.05.16~2017.06.11</h3>
				    <p>서울>부산</p>
				  </figcaption>
				</figure>
				
				<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ing">
				  <img src="/resource/mylist/images/image_5.JPG" />
				  <figcaption>
				    <h3>2017.05.16~2017.06.11</h3>
				    <p>서울>부산</p>
				  </figcaption>
				</figure>
				
				<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done">
				  <img src="/resource/mylist/images/image_6.JPG" />
				  <figcaption>
				    <h3>2017.05.16~2017.06.11</h3>
				    <p>서울>부산</p>
				  </figcaption>
				</figure>
				
				<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ing">
				  <img src="/resource/mylist/images/image_7.JPG" />
				  <figcaption>
				    <h3>2017.05.16~2017.06.11</h3>
				    <p>서울>부산</p>
				  </figcaption>
				</figure>
				
				<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter start">
				  <img src="/resource/mylist/images/image_8.JPG" />
				  <figcaption>
				    <h3>2017.05.16~2017.06.11</h3>
				    <p>서울>부산</p>
				  </figcaption>
				</figure>
				
				<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter end">
				  <img src="/resource/mylist/images/image_9.JPG" />
				  <figcaption>
				    <h3>2017.05.16~2017.06.11</h3>
				    <p>서울>부산</p>
				  </figcaption>
				</figure>



		</div> 
		</center>
	</div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap//js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resource/bootstrap//js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>

</body>

<script src="/resource/member/js/jquery.lineProgressbar.js"></script>
<script type="text/javascript">
	var rate=80; // 계산에서 넘어온 rate 값을 넣어준다. 
	$('#rate').LineProgressbar({
		
		percentage:rate,
		fillBackgroundColor:'#C6DAD9',
		height:'65px',
		radius:'50px',
		width:'900px'
	});	
</script>


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

</html>