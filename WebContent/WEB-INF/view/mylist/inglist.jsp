<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 계획중인일정 페이지 -->
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPageMenubar</title>



<!-- 탭 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!--  프로그레스 -->
<link rel="stylesheet" href="/resource/member/css/jquery.lineProgressbar.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
 
<!--  메뉴바 -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/base.css" />
<link rel="stylesheet" type="text/css" href="/resource/member/css/style.css" />

<!-- 일정들 mouseover -->
<link rel="stylesheet" type="text/js" href="/resource/mylist/js/listmouse.js" />
<link rel="stylesheet" type="text/css" href="/resource/mylist/css/listmouse.css" />

<!-- 헤더 -->
<!-- <link rel="stylesheet" href="/TravelMakerTest/css/base.css"> -->

<!-- 각 list 틀 -->
<script type="text/javascript" src="/resource/mylist/js/mylist.js"></script> 
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

<header>
<!--  여기에 헤더넣기 -->

</header>

<!--  메뉴네비게이션 -->
<div class="lnb">
		<h1>마이페이지</h1>
		<div class="subtitle"><a href="#">내정보</a></div>
			<ul class="sub" style="display:none;">
				<li><a href="http://localhost:8080/member/memberUpdate.tm">정보보기</a></li>
				<li><a href="http://localhost:8080/member/memberDelete.tm">회원탈퇴</a></li>
			</ul>
		<div class="subtitle"><a href="http://http://localhost:8080/mylist/menubar.tm">나의일정</a></div>
		<div class="subtitle"><a href="">관심일정</a></div>
		<div class="subtitle"><a href="">관심여행지</a></div>
		<div class="subtitle"><a href="">QnA</a></div>
		<div class="subtitle sub_end"><a href="">스탬프</a></div>
	</div>
<!--/메뉴네비게이션-->
 
<!--  달성률 보는 곳 -->
<article   style="margin-left:100px; background-image:url('/resource/mylist/images/test3.png'); height: 250px">
	
	<img src="/resource/mylist/images/flag.png" style="display: inline-block; margin-left:1500px"/>
	<div id="rate" style="margin-left:35%;display:inline-block;"></div>

</article>

 <!-- 탭 -->       
  <div class="container">
        <div class="row">
        <article  style="background-color: #092551; height: 100px;" >
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
<div class="schedule-list">          
            
				<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ing">
							  <img src="/resource/mylist/images/image_1.JPG" />
							  <figcaption>
							    <h3>2017.05.16~2017.06.11</h3>
							    <p>서울>부산</p><a href="#" class="read-more">일정편집</a><br/><br/>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done">
							  <img src="/resource/mylist/images/image_2.JPG" />
							  <figcaption>
							    <h3>2017.08.16~2017.10.11</h3>
							    <p>서울>제주도</p><a href="#" class="read-more">일정편집</a><br/><br/>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter start">
							  <img src="/resource/mylist/images/image_3.JPG" />
							  <figcaption>
							    <h3>2017.05.16~2017.06.11</h3>
							    <p>서울>전주</p><a href="#" class="read-more">일정편집</a><br/><br/>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter end">
							  <img src="/resource/mylist/images/image_4.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p><a href="#" class="read-more">일정편집</a><br/><br/>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ing">
							  <img src="/resource/mylist/images/image_5.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p><a href="#" class="read-more">일정편집</a><br/><br/>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter done">
							  <img src="/resource/mylist/images/image_6.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p><a href="#" class="read-more">일정편집</a><br/><br/>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ing">
							  <img src="/resource/mylist/images/image_7.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p><a href="#" class="read-more">일정편집</a><br/><br/>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter start">
							  <img src="/resource/mylist/images/image_8.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p><a href="#" class="read-more">일정편집</a><br/><br/>
							  </figcaption>
							</figure>
							
							<figure class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter end">
							  <img src="/resource/mylist/images/image_9.JPG" />
							  <figcaption>
							    <h3>2017.07.16~2017.07.20</h3>
							    <p>부산>서울</p><a href="#" class="read-more">일정편집</a><br/><br/>
							  </figcaption>
							</figure>



				</div> 
	
			</div>
		</div>
</body> <!--  바디 끝 -->
<script type="text/javascript">
$(document).ready(function(){

    $(".tab").click(function(){
        var value = $(this).attr('data-filter');
        
        if(value == "all")
        {
            //$('.filter').removeClass('hidden');
            $('.filter').show('1000');
        }
        else
        {
//            $('.filter[filter-item="'+value+'"]').removeClass('hidden');
//            $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
            $(".filter").not('.'+value).hide('3000');
            $('.filter').filter('.'+value).show('3000');
            
        }
    });
    
    if ($(".tab").removeClass("active")) {
$(this).removeClass("active");
}
$(this).addClass("active");

});
</script>
<script src="/resource/member/js/jquery.lineProgressbar.js"></script>
<script type="text/javascript">
	var rate=80; // 계산에서 넘어온 rate 값을 넣어준다. 
	$('#rate').LineProgressbar({
		
		percentage:rate,
		fillBackgroundColor:'#b989c4',
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

<!-- 일정 누를때마다 글자 색 바뀌게 -->
<script type="text/javascript">
$(function(){
	$("#all").click(function(){
		$("#all").css("color","white");
	});
	$("#ing").click(function(){
		$("#ing").css("color","white");
	});
	$("#done").click(function(){
		$("#done").css("color","white");
	});
	$("#start").click(function(){
		$("#start").css("color","white");
	});
	$("#end").click(function(){
		$("#end").css("color","white");
	});
});
</script>

</html>