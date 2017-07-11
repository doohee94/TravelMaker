<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
 <% 
 String userId = (String)session.getAttribute("userId");
 String userNick = (String)session.getAttribute("userNick");
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

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- MetisMenu CSS -->
    <link href="/resource/bootstrap/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!--  메뉴바 -->
	<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/base.css" />
	
	<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/style.css" />
	    
    <!-- 마이페이지 공통 css -->
    <link href="/resource/mypage/base/css/mypage.css" rel="stylesheet" type="text/css">


	<!-- 각 list 틀 -->
	<link rel="stylesheet" type="text/js" href="/resource/mylist/js/mylist.js" />
	<link rel="stylesheet" href="/resource/mylist/css/mylist.css">
	
		
	<!-- mouseover -->
	<link rel="stylesheet" type="text/js" href="/resource/mylist/js/listmouse.js" />
	<link rel="stylesheet" type="text/css" href="/resource/mylist/css/listmouse.css" />
	

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!--     <style type="text/css"> -->

<!--     </style> -->

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


</head>
<body>
    <div id="wrapper">
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
                <a class="navbar-brand moblie_logo" href="/tmmain/main.tm">Travel Maker</a>
            <!-- /모바일 버전때 생성되는 버튼 -->   
            </div>
            <!-- 로고 --> 
            <div class="logobox">
                <a class="navbar-brand" href="/tmmain/main.tm" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">Travel Maker</a>
            </div>
            <!-- /로고 -->
            <!-- 네비 헤더  메뉴 부분 -->
         	<ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm" >일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm" >여행지추천</a>
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행리뷰</a>
                    </li>
                    <li>
                        <a href="/member/memberUpdate.tm">마이페이지</a>
                    </li>
                    <%} //end of if %>
<!--                     <li> -->
<!--                         <a href="/challengeschedule/challengeSchedule.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">도전일정</a> -->
<!--                     </li> -->
                     <li style="padding:10px;">
                       <input type="text" style="width: 170px; height: 26px"/><button id="searchBtn"><span class="glyphicon glyphicon-search"></span> search</button>
                    </li>                                         
                                      <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                    	<a href="#"><%=userNick%>&nbsp;&nbsp;님</a>
                    </li>                      
                    <li>
                        <a href="/tmmain/logout.tm">로그아웃</a>
                    </li>
                    <!-- 로그인 안 할때 생기는 버튼 -->
                    <%}else{ %>
                    <li>
                        <a href="/member/loginForm.tm">로그인</a>
                    </li>
                    <li>
                        <a href="/member/signupForm.tm">회원가입</a>
                    </li>   
                     <%} //end of if %>                 
                </ul>
            <!-- /네비 헤더  메뉴 부분 -->

            <div class="navbar-inverse sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#" style="color: #e2e2e2; font-weight: bold;"><i class="fa fa-user fa-user"></i>  내 정보<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/member/memberUpdate.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  정보수정</a>
                                </li>
                                <li>
                                    <a href="/member/memberDelete.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  회원탈퇴</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/mylist/menubar.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-list-alt fa-list-alt"></i>  내 일정 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/mylist/inglist.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  계획중인일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/donelist.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  완성된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/startlist.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  시작된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/endlist.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  여행한일정</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="/tmmypage/likespot.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-heart fa-heart"></i>  관심 여행지</a>
                        </li>
                        <li>
                            <a href="/tmmypage/schedule.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-calendar fa-calendar"></i>  관심 일정</a>
                        </li>
                        <li>
                            <a href="/tmmypage/qna.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-omments fa-comments"></i>  QnA</a>
                        </li>
                        <li>
                            <a href="/tmmypage/stemp.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-flag fa-flag"></i>  스템프</a>
                        </li>                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		<!-- 바디 부분 -->
        <div id="page-wrapper">
			<div class="container">
				<!-- 바디 타이틀  -->
          		<div class="row">
            		<div class="col-lg-12">
                		<h1 class="page-header">시작된 일정
                		<small>Start Schedule</small>
                		</h1>
            		</div>
            	<!-- /바디 타이틀 -->
            	  <!-- 바디 부분 -->
        <div id="page-wrapper" style="margin-left: 0px; min-height:0px;">
		<!-- 각 일정 보여주는 곳 -->
		
		<div class="schedule-list">                
				</div> 
			
        </div>
  
		</div><!-- /container -->
        </div>
      
    
    </div>
    
    </div>
          
    
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>

<!--     Metis Menu Plugin JavaScript -->
    <script src="/resource/bootstrap/js/metisMenu.min.js"></script>
<!--     Custom Theme JavaScript -->
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>
	<!-- 마이페이지 공통 js -->
    <script src="/resource/mypage/base/js/base.js"></script>

</body>

<script type="text/javascript">

$(function(){

	var list_num = {
			"num":2
	}
	
	$.ajax({
		url : "/mylist/inglistsearch.tm"
			,type:"post"
			,contentType:"application/json "
			,data:JSON.stringify(list_num)
		    ,success:function(data){ 
		    	
		    	
		    	for(var i=0; i<data.length; i++){
		    		//이미지 널값처리
		    		var image = "/resource/step3/step3_image/cityscape.png";	    		
		    		if(data[i].tour == null ){

			    		$(".schedule-list").append('<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done" style="height:350px">'
			    				 +'<img src="'+image+'" style="height:100%" />'
								 +'<figcaption>'
								 +'<h3>'+data[i].sDate+'~'+data[i].eDate+'</h3>'
			    				 +'<p>'+data[i].cityList[0]+'>'+data[i].cityList[(data[i].cityList.length -1)]+'</p>'
			    				 + '<p>'+data[i].tour_title+'</p>'
			    				 +'<a class="read-more" id="check">일정체크</a><br/><br/>'
			    				 +'<a class="read-more" id="delete">일정삭제</a><br/><br/>'
			    				 +'<input type="hidden" value="'+data[i]._id+'"  class="_id"/>'	
			    				 +'</figcaption></figure>'		    		
			    		);// append
		    		}else if(data[i].tour[0].place[0] == null){

			    		$(".schedule-list").append('<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done" style="height:350px">'
			    				 +'<img src="'+image+'" style="height:100%" />'
								 +'<figcaption>'
								 +'<h3>'+data[i].sDate+'~'+data[i].eDate+'</h3>'
			    				 +'<p>'+data[i].cityList[0]+'>'+data[i].cityList[(data[i].cityList.length -1)]+'</p>'
			    				 + '<p>'+data[i].tour_title+'</p>'
			    				 +'<a class="read-more" id="check">일정체크</a><br/><br/>'
			    				 +'<a class="read-more" id="delete">일정삭제</a><br/><br/>'
			    				 +'<input type="hidden" value="'+data[i]._id+'"  class="_id"/>'	
			    				 +'</figcaption></figure>'		    		
			    		);// append
		    		}else{
		    			
		    			$(".schedule-list").append('<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done" style="height:350px">'
			    				 +'<img src="'+data[i].tour[0].place[0].image+'" style="height:100%" />'
								 +'<figcaption>'
								 +'<h3>'+data[i].sDate+'~'+data[i].eDate+'</h3>'
			    				 +'<p>'+data[i].cityList[0]+'>'+data[i].cityList[(data[i].cityList.length -1)]+'</p>'
			    				 + '<p>'+data[i].tour_title+'</p>'
			    				 +'<a class="read-more" id="check">일정체크</a><br/><br/>'
			    				 +'<a class="read-more" id="delete">일정삭제</a><br/><br/>'
			    				 +'<input type="hidden" value="'+data[i]._id+'"  class="_id"/>'	
			    				 +'</figcaption></figure>'	
		    			);
		    		}
		    	
		    	}//end for i
		    	
		     }//end success
			,error:function(err,status,error){
				alert("일정 리스트 가져오기 실패!"+err.status+error);
			}
		
	});//end ajax

	$('.schedule-list').on('click', '#check', function(){
		var _id = $(this).siblings("._id").val().trim();
		location.href="/mypage_checklist/checklist.tm?_id="+_id;
		
	});
	
var num = "2";
	
	$('.schedule-list').on('click', '#delete', function(){
		var _id = $(this).siblings("._id").val().trim();
		location.href="/mylist/delete.tm?_id="+_id+"&num="+num;
		
	});
	
});//end function

</script>
</html>
