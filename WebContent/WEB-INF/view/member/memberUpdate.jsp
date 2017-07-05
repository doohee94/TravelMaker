<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!--  메뉴바 -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/base.css" />
<link rel="stylesheet" type="text/css" href="/resource/member/css/style.css" />

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/insert.css">




  

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
                        <a href="member/loginForm.tm" style="padding-right: 398px; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">로그인　</a>
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
                            <a href="/mylist/menubar.tm"><i class="fa fa-edit fa-fw"></i>  내 일정</a>
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
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>



 <!--this was made my Agil Asadi. You are free to delete this comment line and use it as you wish-->   

<div class="row col-md-8 col-md-offset-2 registeration" style="border-top: 5px solid #5d6062;" >
    
<div class="registerInner">
        <div class="col-md-6 signUp">
            <h1 class="headerSign">회원정보수정</h1>
            <form action="memberDelete">
<br/>
<br/>
<br/>
				

				<br/>
				<!-- ****중복확인하기**** -->
                <div class="form-group">
                    <input class="form-control" type="text" name="userId" id="userId" value="${userId}" placeholder="아이디" required="required" readonly="readonly"> 
                	
                </div>
                
				<div class="form-group ">
                    <input class="form-control" type="password" name="userPw" id="userPw" value="${userPw}" placeholder="비밀번호" required="required" readonly="readonly"> 
                    <!-- <p class="help-block">숫자 또는 특수문자 포함 6자 이상</p> -->
                </div>
                
                <div class="form-group ">
                    <input class="form-control" type="password" name="userPasswordcheck" id="userPasswordcheck" value="1111" placeholder="비밀번호확인" required="required" readonly="readonly">
                	<!-- <p class="help-block">비밀번호를 한번 더 입력해주세요.</p> -->
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userName" id="userName" value="${userName}" placeholder="이름" required="required" readonly="readonly">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userNick" id="userNick" value="${userNick}" placeholder="닉네임" required="required" readonly="readonly">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userTel" id="userTel" value="${userTel}" placeholder="전화번호" required="required" readonly="readonly">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userEmail" id="userEmail" value="${userEmail}" placeholder="이메일" required="required" readonly="readonly">
                </div>
                <!-- ****플러스누르면 추가되게**** -->
                <script type="text/javascript">
                
                function doChange(srcE, targetId){
                    var val = srcE.options[srcE.selectedIndex].value;
                    var targetE = document.getElementById(targetId);
                       
                    removeAll(targetE);
            
                    if(val == '서울특별시'){
                       addOption('강남구', targetE);
                       addOption('강독구', targetE);
                       addOption('강북구', targetE);
                       addOption('강서구', targetE);
                       addOption('관악구', targetE);
                       addOption('광진구', targetE);
                       addOption('구로구', targetE);
                       addOption('금천구', targetE);
                       addOption('노원구', targetE);
                       addOption('도봉구', targetE);
                       addOption('동대문구', targetE);
                       addOption('동작구', targetE);
                       addOption('마포구', targetE);
                       addOption('서대문구', targetE);
                       addOption('서초구', targetE);
                       addOption('성동구', targetE);
                       addOption('성북구', targetE);
                       addOption('송파구', targetE);
                       addOption('양천구', targetE);
                       addOption('영등포구', targetE);
                       addOption('용산구', targetE);
                       addOption('은평구', targetE);
                       addOption('종로구', targetE);
                       addOption('중구', targetE);
                       addOption('중랑구', targetE); 
                      }

                       else if(val == '부산광역시'){
                       addOption('동구', targetE);
                       addOption('영동구', targetE);
                       addOption('부산진구', targetE);
                       addOption('동래구', targetE);
                       addOption('서구', targetE);
                       addOption('남구', targetE);
                       addOption('북구', targetE);
                       addOption('해운대구', targetE);
                       addOption('금정구', targetE);
                       addOption('강서구', targetE);
                       addOption('연제구', targetE);
                       addOption('수영구', targetE);
                       addOption('사상구', targetE);
                       addOption('기장군', targetE);
                       addOption('중구', targetE);
                       addOption('사하구', targetE);
                       }

                       else if(val == '대구광역시'){
                          addOption('중구', targetE);
                           addOption('동구', targetE);
                           addOption('서구', targetE);
                           addOption('남구', targetE);
                           addOption('북구', targetE);
                           addOption('수성구', targetE);
                           addOption('달서구', targetE);
                           addOption('달성군', targetE);
                          
                       }
                       else if(val == '인천광역시'){
                           addOption('중구', targetE);                 addOption('동구', targetE);                 addOption('남구', targetE);
                            addOption('연수구', targetE);                 addOption('남동구', targetE);                 addOption('부평구', targetE);
                            addOption('계양구', targetE);                 addOption('서구', targetE);
                        }
                    

                       else if(val == '광주광역시'){
                           addOption('동구', targetE);                 addOption('서구', targetE);                 addOption('남구', targetE);
                            addOption('북구', targetE);                 addOption('광산구', targetE);
                        }
                    
                       else if(val == '대전광역시'){
                           addOption('동구', targetE);                 addOption('중구', targetE);                 addOption('서구', targetE);
                           addOption('유성구', targetE);                 addOption('대덕구', targetE);
                       }
                    
                       else if(val == '울산광역시'){
                           addOption('중구', targetE);                addOption('남구', targetE);                addOption('동구', targetE);
                           addOption('북구', targetE);                addOption('울주군', targetE);
                       }
                       else if(val == '세종특별자치시'){
                      	 addOption('조치원읍', targetE);                 addOption('연기면', targetE);                 addOption('연동면', targetE);
                           addOption('부강면', targetE);                 addOption('금남면', targetE);                 addOption('장군면', targetE);                 addOption('연서면', targetE);
                           addOption('전의면', targetE);                 addOption('전동면', targetE);                 addOption('소정면', targetE);
                           addOption('한솔동', targetE);                 addOption('도담동', targetE);                 addOption('아름동', targetE);
                           addOption('종촌동', targetE);                 addOption('고운동', targetE);                 addOption('보람동', targetE);
                      }
                    
                       else if(val == '경기도'){
                           addOption('장안구', targetE);                addOption('권선구', targetE);                addOption('팔달구', targetE);
                           addOption('영통구', targetE);                addOption('수정구', targetE);                addOption('중원구', targetE);
                           addOption('분당구', targetE);                addOption('만안구', targetE);                addOption('동안구', targetE);
                           addOption('상록구', targetE);                addOption('단원구', targetE);                addOption('처인구', targetE);
                           addOption('기흥구', targetE);                addOption('수지구', targetE);                addOption('광명시', targetE);
                           addOption('평택시', targetE);                addOption('과천시', targetE);                addOption('오산시', targetE);
                           addOption('시흥시', targetE);                addOption('군포시', targetE);                addOption('의왕시', targetE);
                           addOption('하남시', targetE);                addOption('이천시', targetE);                addOption('안성시', targetE);
                           addOption('김포시', targetE);                addOption('화성시', targetE);                addOption('광주시', targetE);
                           addOption('여주시', targetE);                addOption('부천시', targetE);                addOption('양평군', targetE);
                           addOption('고양시', targetE);                addOption('일산동구', targetE);                addOption('일산서구', targetE);
                           addOption('의정부시', targetE);                addOption('동두천시', targetE);                addOption('구리시', targetE);
                           addOption('남양주시', targetE);                addOption('파주시', targetE);                addOption('양주시', targetE);
                           addOption('포천시', targetE);                addOption('연천군', targetE);                addOption('가평군', targetE);
                       }
                    
                       else if(val == '강원도'){
                           addOption('춘천시', targetE);                addOption('원주시', targetE);                addOption('강릉시', targetE);
                           addOption('동해시', targetE);                addOption('태백시', targetE);                addOption('속초시', targetE);
                           addOption('삼척시', targetE);                addOption('홍천군', targetE);                addOption('횡성군', targetE);
                           addOption('영월군', targetE);                addOption('평창군', targetE);                addOption('정선군', targetE);
                           addOption('철원군', targetE);                addOption('화천군', targetE);                addOption('양구군', targetE);
                           addOption('인제군', targetE);                addOption('고성군', targetE);                addOption('양양군', targetE);
                       }
                    
                       else if(val == '충청북도'){
                           addOption('상당구', targetE);                addOption('서원구', targetE);                addOption('흥덕구', targetE);
                           addOption('청원구', targetE);                addOption('충주시', targetE);                addOption('제천시', targetE);
                           addOption('보은군', targetE);                addOption('옥천군', targetE);                addOption('영동군', targetE);
                           addOption('진천군', targetE);                addOption('괴산군', targetE);                addOption('음성군', targetE);
                           addOption('단양군', targetE);                addOption('증평군', targetE);
                           }
                    
                       else if(val == '충청남도'){
                           addOption('동남구', targetE);                addOption('서북구', targetE);                addOption('공주시', targetE);
                           addOption('보령시', targetE);                addOption('아산시', targetE);                addOption('서산시', targetE);
                           addOption('논산시', targetE);                addOption('계롱시', targetE);                addOption('당진시', targetE);
                           addOption('금산군', targetE);                addOption('부여군', targetE);                addOption('서천군', targetE);
                           addOption('청양군', targetE);                addOption('홍성군', targetE);                addOption('예산군', targetE);
                           addOption('태안군', targetE);
                           }
                       else if(val == '전라북도'){
                           addOption('완산구', targetE);                addOption('덕진구', targetE);                addOption('군산시', targetE);
                           addOption('익산시', targetE);                addOption('정읍시', targetE);                addOption('남원시', targetE);
                           addOption('김제시', targetE);                addOption('완주군', targetE);                addOption('진안군', targetE);
                           addOption('무주군', targetE);                addOption('장수군', targetE);                addOption('임실군', targetE);
                           addOption('순창군', targetE);                addOption('고창군', targetE);                addOption('부안군', targetE);
                       }
                    
                       else if(val == '전라남도'){
                           addOption('목포시', targetE);                addOption('여수시', targetE);                addOption('순천시', targetE);
                           addOption('나주시', targetE);                addOption('광양시', targetE);                addOption('담양군', targetE);
                           addOption('곡성군', targetE);                addOption('구례군', targetE);                addOption('고흥군', targetE);
                           addOption('보성군', targetE);                addOption('화순군', targetE);                addOption('장흥군', targetE);
                           addOption('강진군', targetE);                addOption('해남군', targetE);                addOption('영암군', targetE);
                           addOption('무안군', targetE);                addOption('함평군', targetE);                addOption('영광군', targetE);
                           addOption('장성군', targetE);                addOption('완도군', targetE);                addOption('진도군', targetE);
                           addOption('신안군', targetE);
                       }
                    
                       else if(val == '경상북도'){
                           addOption('포항시 남구', targetE);                addOption('포항시 북구', targetE);                addOption('경주시', targetE);
                           addOption('김천시', targetE);                addOption('안동시', targetE);                addOption('구미시', targetE);
                           addOption('영주시', targetE);                addOption('영천시', targetE);                addOption('상주시', targetE);                
                           addOption('문경시', targetE);                addOption('경산시', targetE);                addOption('군위군', targetE);                addOption('의성군', targetE);
                           addOption('청송군', targetE);                addOption('영양군', targetE);                addOption('영덕군', targetE);
                           addOption('청도군', targetE);                addOption('고령군', targetE);                addOption('성주군', targetE);
                           addOption('칠곡군', targetE);                addOption('예천군', targetE);                addOption('봉화군', targetE);
                           addOption('울진군', targetE);                addOption('울릉군', targetE);
                       }
                    
                       else if(val == '경상남도'){
                           addOption('의창구', targetE);                addOption('성산구', targetE);                addOption('마산합포구', targetE);
                           addOption('마산회원구', targetE);                addOption('진해구', targetE);                addOption('진주시', targetE);
                           addOption('통영시', targetE);                addOption('사천시', targetE);                addOption('김해시', targetE);
                           addOption('밀양시', targetE);                addOption('거제시', targetE);                addOption('양산시', targetE);
                           addOption('의령군', targetE);                addOption('함안군', targetE);                addOption('창녕군', targetE);
                           addOption('고성군', targetE);                addOption('남해군', targetE);                addOption('하동군', targetE);
                           addOption('신청군', targetE);                addOption('함양군', targetE);                addOption('거창군', targetE);
                           addOption('합천군', targetE);
                       }
                    
                       else if(val == '제주특별자치도'){
                           addOption('제주시', targetE);                addOption('서귀포시', targetE);
                       }
                    
                   }
		                function addOption(value, e){
		                    var o = new Option(value);
		                    try{
		                        e.add(o);
		                    }catch(ee){
		                        e.add(o, null);
		                    }
		                }
		
		                function removeAll(e){
		                    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
		                        e.remove(1);
		                    }
		                }
                
                </script>
                
				<div class="form-group">
                    <select name="userCity" id="userCity" onchange="doChange(this, 'userBorough')" disabled>
		            
		            <option value="서울특별시">서울특별시</option>
		            <option value="시,도">시,도</option>
		            <option value="부산광역시">부산광역시</option>
		            <option value="대구광역시">대구광역시</option>
		            <option value="인천광역시">인천광역시</option>
		            <option value="광주광역시">광주광역시</option>
		            <option value="대전광역시">대전광역시</option>
		            <option value="울산광역시">울산광역시</option>
		            <option value="세종특별자치시">세종특별자치시</option>
		            <option value="경기도">경기도</option>
		            <option value="강원도">강원도</option>
		            <option value="충청북도">충청북도</option>
		            <option value="충청남도">충청남도</option>
		            <option value="전라북도">전라북도</option>
		            <option value="전라남도">전라남도</option>
		            <option value="경상북도">경상북도</option>
		            <option value="경상남도">경상남도</option>
		            <option value="제주특별자치도">제주특별자치도</option>
		          </select>
		          
		          <select name="userBorough" id="userBorough" disabled>
		          	<option value="default">시, 군, 구</option>
		          </select>
                </div>
                
				<div class="form-group">
                    <select name="selOne" id="selOne" onchange="doChange(this, 'selTwo')" disabled>
		            
		            <option value="부산광역시">부산광역시</option>
		            <option value="시,도">시,도</option>
		            <option value="서울특별시">서울특별시</option>
		            <option value="대구광역시">대구광역시</option>
		            <option value="인천광역시">인천광역시</option>
		            <option value="광주광역시">광주광역시</option>
		            <option value="대전광역시">대전광역시</option>
		            <option value="울산광역시">울산광역시</option>
		            <option value="세종특별자치시">세종특별자치시</option>
		            <option value="경기도">경기도</option>
		            <option value="강원도">강원도</option>
		            <option value="충청북도">충청북도</option>
		            <option value="충청남도">충청남도</option>
		            <option value="전라북도">전라북도</option>
		            <option value="전라남도">전라남도</option>
		            <option value="경상북도">경상북도</option>
		            <option value="경상남도">경상남도</option>
		            <option value="제주특별자치도">제주특별자치도</option>
		          </select>
		          
		          <select name="selTwo" id="selTwo" disabled>
		          	<option value="default">시, 군, 구</option>
		          </select>
                </div>
                
                <center><button type="button" class="signbuttons btn btn-primary" id="update" name="update" style="background: #5d6062; border-color:#5d6062">수정하기</a></button>
                <button type="submit" class="signbuttons btn btn-primary" id="insert" name="insert" style="background: #5d6062; border-color:#5d6062">완료</a></button></center>
                <br/><br/><br/><br/>
            </form>    
        </div>
      </div>  
        
</div>

</body>

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
<!-- 수정버튼 눌림시 완료버튼 뜨게 -->
<script type="text/javascript">
$(function(){
		$("#insert").hide();
	$("#update").click(function(){
		$("#insert").show();
		$("#update").hide();
		
	});
	/* 수정버튼 누르면 readonly 해제 */
	$("#update").click(function(){
		$("#userPw").removeAttr("readonly");
		$("#userPasswordcheck").removeAttr("readonly");
		$("#userName").removeAttr("readonly");
		$("#userNick").removeAttr("readonly");
		$("#userTel").removeAttr("readonly");
		$("#userEmail").removeAttr("readonly");
		$("#userCity").removeAttr("disabled");
		$("#userBorough").removeAttr("disabled");
		$("#selOne").removeAttr("disabled");
		$("#selTwo").removeAttr("disabled");
	});
});
</script>

</html>