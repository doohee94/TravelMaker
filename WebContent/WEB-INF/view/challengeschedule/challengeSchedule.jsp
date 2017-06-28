<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 도전일정 페이지  -->
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도전일정 페이지</title>


<!--게시글(네모창)에 마우스오버 했을때 사용되는 부트스트랩 link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!--게시글(네모창)에 마우스오버 했을때 사용되는 부트스트랩 link-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 베스트 3 css -->
<link rel="stylesheet" href="/resource/challengeSchedule/css/challengeSchedule.css"/>


<!--게시글(네모창)에 마우스오버 했을때 사용되는 부트스트랩 스크립트-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!--게시글(네모창)에 마우스오버 했을때 사용되는 부트스트랩 스크립트-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--게시글(네모창)에 마우스오버 했을때 사용되는 부트스트랩 스크립트-->
<script>
$(document).ready(function() {
	// 이미지 클릭시 상세페이지로 이동.
	$(".titles").click(function(){
		//상세페이지로 보낸다
		location.href="challengeScheduleDetail.tm";
	});		
	
	
    $("[rel='tooltip']").tooltip();    
 	
    //게시글(네모창)에 마우스 오버시 기능 
    $('.thumbnail').hover(
        function(){
        	//슬라이드 내려오는 속도
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
        	//슬라이드 다시 올라가는 속도
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    ); 
 });
</script>

</head>
<body>
		
<!-- 도전일정 라벨  -->
<div class="tryhead">도전일정</div>

<!-- 베스트3 라벨 -->
<div class="bestthree">BEST 3</div>

<!-- 베스트3 container (바디 : 게시글 공간) -->
<div class="container">
		
	 <div class="row">
	 
   		<!-- best1 -->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- best1 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- best1 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- best1 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div><!-- end best1 -->

        <!-- best2 -->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- best2 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- best2 내용 -->
                    <p class="">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium
					</p>
                </div>
                <!-- best2 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
                </a>
            </div>
        </div><!-- end best2 -->

        <!-- best3 -->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- best3 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- best3 내용 -->
                    <p class="">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum
    				</p>
                </div>
                <!-- best3 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
			</a>
            </div>
        </div><!-- end best3 -->

    </div><!--/row -->
	
</div> <!-- end of 첫번째 container -->

<!-- 도전 라벨 -->
<div class="dojeonlist">도전</div>

<!-- 도전 container (바디 : 게시글 공간) -->
<div class="container">
    <div class="row">

		<!-- 도전 게시글 하나-->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- 도전 게시글 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- 도전 게시글 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- 도전 게시글 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div>
		<!-- 도전 게시글 중 하나 -->
		
		<!-- 도전 게시글 하나-->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- 도전 게시글 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- 도전 게시글 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- 도전 게시글 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div>
		<!-- 도전 게시글 중 하나 -->
		
		<!-- 도전 게시글 하나-->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- 도전 게시글 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- 도전 게시글 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- 도전 게시글 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div>
		<!-- 도전 게시글 중 하나 -->
		
		<!-- 도전 게시글 하나-->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- 도전 게시글 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- 도전 게시글 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- 도전 게시글 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div>
		<!-- 도전 게시글 중 하나 -->
		
		<!-- 도전 게시글 하나-->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- 도전 게시글 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- 도전 게시글 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- 도전 게시글 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div>
		<!-- 도전 게시글 중 하나 -->
		
		<!-- 도전 게시글 하나-->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="titlestitles">
                <div class="caption">
                	 <!-- 도전 게시글 제목 -->
                     <h4 class="">Thumbnail Headline</h4>
					<!-- 도전 게시글 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- 도전 게시글 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div>
		<!-- 도전 게시글 중 하나 -->
		
		<!-- 도전 게시글 하나-->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- 도전 게시글 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- 도전 게시글 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- 도전 게시글 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div>
		<!-- 도전 게시글 중 하나 -->
		
		<!-- 도전 게시글 하나-->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- 도전 게시글 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- 도전 게시글 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- 도전 게시글 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div>
		<!-- 도전 게시글 중 하나 -->
		
		<!-- 도전 게시글 하나-->
        <div class="col-sm-4">
            <div class="thumbnail">
              <a href="#" class="">
                <div class="caption">
                	 <!-- 도전 게시글 제목 -->
                     <h4 class="titles">Thumbnail Headline</h4>
					<!-- 도전 게시글 내용 -->
                    <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
					</p>
                </div>
                <!-- 도전 게시글 이미지 -->
                <img src="http://placehold.it/350x250" alt="..." class="">
               </a>
            </div>
        </div>
		<!-- 도전 게시글 중 하나 -->
		
    </div><!--/row -->

</div> <!-- end 도전 container (바디 : 게시글 공간)  -->
</body>
</html>