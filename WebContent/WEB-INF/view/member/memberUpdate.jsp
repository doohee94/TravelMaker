<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <!-- 회원정보보기 페이지 -->
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원수정</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=10" />

	<!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap//js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resource/bootstrap//js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>
	
    <!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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

	<!-- 마이페이지 공통 css -->
    <link href="/resource/mypage/base/css/mypage.css" rel="stylesheet" type="text/css">

	<!--  메뉴바 -->
	<link rel="stylesheet" type="text/css" href="/resource/member/css/base.css" />
	<link rel="stylesheet" type="text/css" href="/resource/member/css/style.css" />
	
	<!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>

	 <!--     Metis Menu Plugin JavaScript --> 
    <script src="/resource/bootstrap/js/metisMenu.min.js"></script>
    
	 <!--     Custom Theme JavaScript --> 
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/resource/member/css/insert.css">
	<!-- JS -->
	<script src="/resource/member/js/memberUpdate.js"></script>
</head>
<body>

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
                <a class="navbar-brand" href="tmmain/main.tm" style="padding-left: 381px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">Travel Maker</a>
            <!-- /로고 -->
            </div>
            <!-- 네비 헤더  메뉴 부분 -->
         <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">여행지추천</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">여행리뷰</a>
                    </li>
                    <li>
                        <a href="/challengeschedule/challengeSchedule.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">도전일정</a>
                    </li>
                     <li style="padding:10px;">
                       <input type="text" style="width: 170px; height: 26px"/><button id="#searchBtn" style="background-color: #fafafa; border:0px; border-style: none; height: 25px; width: 77px; font-size: 15px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; color:#2e2e2e"><span class="glyphicon glyphicon-search"></span> search</button>
                    </li>                      
                     <li>
                        <a href="/member/loginForm.tm" style="padding-right: 398px; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">로그인　</a>
                    </li>
                </ul>
            <!-- /네비 헤더  메뉴 부분 -->

            <div class="navbar-inverse sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-user fa-user"></i>  내 정보<span class="fa arrow"></span></a>
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
                            <a href="#" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-list-alt fa-list-alt"></i>  내 일정<span class="fa arrow"></span></a>
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
                            <a href="/tmmypage/likespot.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-check-square-o fa-fw"></i>  관심 여행지</a>
                        </li>
                        <li>
                            <a href="/tmmypage/schedule.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-check-square-o fa-fw"></i>  관심 일정</a>
                        </li>
                        <li>
                            <a href="/tmmypage/qna.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-comments fa-fw"></i>  QnA</a>
                        </li>
                        <li>
                            <a href="/tmmypage/stemp.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-map-marker fa-fw"></i>  스템프</a>
                        </li>                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>



 <!--this was made my Agil Asadi. You are free to delete this comment line and use it as you wish-->   

<div class="row col-md-8 col-md-offset-2 registeration" style="border-top: 5px solid #5d6062;" >
    
<div class="registerInner">
        <div class="col-md-6 signUp">
        <form action="membermodify.tm" method="post" id="frm" name="frm">
            <br/><center><h3  style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif">회원정보수정</h3></center>
            
<br/>
<br/>
<br/>
				

				<br/>
				<!-- ****중복확인하기**** -->
                <div class="form-group">
                    <input class="form-control" type="text" name="userId" id="userId" value="${dto.userId}" placeholder="아이디" required="required" readonly="readonly"> 
                	
                </div>
                
				<div class="form-group ">
                    <input class="form-control" type="password" name="userPw" id="userPw" value="${dto.userPw}" placeholder="비밀번호" required="required" readonly="readonly"> 
                    <!-- <p class="help-block">숫자 또는 특수문자 포함 6자 이상</p> -->
                </div>
                
                <div class="form-group ">
                    <input class="form-control" type="password" name="userPasswordcheck" id="userPasswordcheck" placeholder="비밀번호확인" required="required" readonly="readonly">
                	<!-- <p class="help-block">비밀번호를 한번 더 입력해주세요.</p> -->
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userName" id="userName" value="${dto.userName}" placeholder="이름" required="required" readonly="readonly">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userNick" id="userNick" value="${dto.userNick}" placeholder="닉네임" required="required" readonly="readonly">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userTel" id="userTel" value="${dto.userTel}" placeholder="전화번호" required="required" readonly="readonly">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userEmail" id="userEmail" value="${dto.userEmail}" placeholder="이메일" required="required" readonly="readonly">
                </div>
                
				<div class="form-group">
				<font style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; font-size: 15px;">주소 :　</font>
                    <select name="userCity" id="userCity">
		            <option value="시,도">시,도</option>
		            <option value="서울특별시 ">서울특별시</option>
		            <option value="부산광역시 ">부산광역시</option>
		            <option value="대구광역시 ">대구광역시</option>
		            <option value="인천광역시 ">인천광역시</option>
		            <option value="광주광역시 ">광주광역시</option>
		            <option value="대전광역시 ">대전광역시</option>
		            <option value="울산광역시 ">울산광역시</option>
		            <option value="세종특별자치시 ">세종특별자치시</option>
		            <option value="경기도 ">경기도</option>
		            <option value="강원도 ">강원도</option>
		            <option value="충청북도 ">충청북도</option>
		            <option value="충청남도 ">충청남도</option>
		            <option value="전라북도 ">전라북도</option>
		            <option value="전라남도 ">전라남도</option>
		            <option value="경상북도 ">경상북도</option>
		            <option value="경상남도 ">경상남도</option>
		            <option value="제주특별자치도 ">제주특별자치도</option>
		          </select>
		          <select name="userBorough" id="userBorough" >
		          	<option value="default">시, 군, 구</option>
		          </select>
		          <input type="hidden" id="userBoroughdto" value="${dto.userBorough }">
		          <input type="hidden" id="userCitydto" value="${dto.userCity }">
				 <input type="hidden" id="OneCity" value="${dto.selOneCity }">
		         <input type="hidden" id="TwoCity" value="${dto.selTwoCity }">
		         <input type="hidden" id="ThrCity" value="${dto.selThrCity }">
                </div>
                
                <center><button type="button" class="signbuttons btn btn-primary" id="updatebutton" name="updatebutton" style="background: #5d6062; border-color:#5d6062">수정하기</a></button>
                <button type="submit" class="signbuttons btn btn-primary" id="insertbutton" name="insertbutton" style="background: #5d6062; border-color:#5d6062">완료</a></button></center>
                <br/><br/><br/><br/>
            </form>    
        </div>
        
        <div class ="col-md-6">
			<h3 class="headerSign"></h3>
				<form action="likeloc.tm" method="post">
				
                <br/><center><h3 style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif">관심지역</h3></center>
                
                <br/><br/><br/><center><div class="form-group">
				<font style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; font-size: 15px;">관심지역1 :　</font>
                  <select name="selOneCity" id="selOne" >
		          	<option value="시,도">시,도</option>
		            <option value="서울특별시 ">서울특별시</option>
		            <option value="부산광역시 ">부산광역시</option>
		            <option value="대구광역시 ">대구광역시</option>
		            <option value="인천광역시 ">인천광역시</option>
		            <option value="광주광역시 ">광주광역시</option>
		            <option value="대전광역시 ">대전광역시</option>
		            <option value="울산광역시 ">울산광역시</option>
		            <option value="세종특별자치시 ">세종특별자치시</option>
		            <option value="경기도 ">경기도</option>
		            <option value="강원도 ">강원도</option>
		            <option value="충청북도 ">충청북도</option>
		            <option value="충청남도 ">충청남도</option>
		            <option value="전라북도 ">전라북도</option>
		            <option value="전라남도 ">전라남도</option>
		            <option value="경상북도 ">경상북도</option>
		            <option value="경상남도 ">경상남도</option>
		            <option value="제주특별자치도 ">제주특별자치도</option>
		          </select>
		          
		          <select name="selOneBorough" id="oneSel">
		          </select>
                </div></center>
                
                <center><div class="form-group">
				<font  style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; font-size: 15px;">관심지역2 :　</font>
                  <select name="selTwoCity" id="selTwo" >
		          	<option value="시,도">시,도</option>
		            <option value="서울특별시 ">서울특별시</option>
		            <option value="부산광역시 ">부산광역시</option>
		            <option value="대구광역시 ">대구광역시</option>
		            <option value="인천광역시 ">인천광역시</option>
		            <option value="광주광역시 ">광주광역시</option>
		            <option value="대전광역시 ">대전광역시</option>
		            <option value="울산광역시 ">울산광역시</option>
		            <option value="세종특별자치시 ">세종특별자치시</option>
		            <option value="경기도 ">경기도</option>
		            <option value="강원도 ">강원도</option>
		            <option value="충청북도 ">충청북도</option>
		            <option value="충청남도 ">충청남도</option>
		            <option value="전라북도 ">전라북도</option>
		            <option value="전라남도 ">전라남도</option>
		            <option value="경상북도 ">경상북도</option>
		            <option value="경상남도 ">경상남도</option>
		            <option value="제주특별자치도 ">제주특별자치도</option>
		          </select>
		          
		          <select name="selTwoBorough" id="twoSel"   >
		          </select>
                </div></center>
                
                <center><div class="form-group">
				<font  style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; font-size: 15px;">관심지역3 :　</font>
                  <select name="selThrCity" id="selThree">
		          	<option value="시,도">시,도</option>
		            <option value="서울특별시 ">서울특별시</option>
		            <option value="부산광역시 ">부산광역시</option>
		            <option value="대구광역시 ">대구광역시</option>
		            <option value="인천광역시 ">인천광역시</option>
		            <option value="광주광역시 ">광주광역시</option>
		            <option value="대전광역시 ">대전광역시</option>
		            <option value="울산광역시 ">울산광역시</option>
		            <option value="세종특별자치시 ">세종특별자치시</option>
		            <option value="경기도 ">경기도</option>
		            <option value="강원도 ">강원도</option>
		            <option value="충청북도 ">충청북도</option>
		            <option value="충청남도 ">충청남도</option>
		            <option value="전라북도 ">전라북도</option>
		            <option value="전라남도 ">전라남도</option>
		            <option value="경상북도 ">경상북도</option>
		            <option value="경상남도 ">경상남도</option>
		            <option value="제주특별자치도 ">제주특별자치도</option>
		          </select>
		          
		          <select name="selThrBorough" id="threeSel"  >
		          </select>
                </div></center>
                
				<c:if test="${!empty list }">
					<c:forEach var="l" items="${list }" varStatus="cnt">
						<c:choose>
							<c:when test="${cnt.index eq '0' }">
								<input type="hidden"  name="OneCity" value="${l.likelocNum }">
							</c:when>
							<c:when test="${cnt.index eq '1' }">
								<input type="hidden"  name="TwoCity" value="${l.likelocNum }">
							</c:when>
							<c:when test="${cnt.index eq '2' }">
								<input type="hidden"  name="ThrCity" value="${l.likelocNum }">
							</c:when>
						</c:choose>
					</c:forEach>
				</c:if>
				
                <br/><br/><br/><center><button type="submit" class="btn btn-primary" id="updatesel" name="updatesel" style="background: #5d6062; border-color:#5d6062">수정하기</a></button>
                <br/><br/><br/><br/>
   </form>                             
            
</div>
        
      </div>  
        
</div>


</body>

<!--  메뉴바 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>



</html>