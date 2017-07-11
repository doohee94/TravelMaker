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
 	
    <!-- 마이페이지 공통 css -->
    <link href="/resource/mypage/base/css/mypage.css" rel="stylesheet" type="text/css">
	
    <!-- 지정 css -->
    <link href="/resource/mypage/qna/css/qna.css" rel="stylesheet" type="text/css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    

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
                <a class="navbar-brand" href="/tmmain/main.tm" >Travel Maker</a>
            </div>
            <!-- /로고 -->
            <!-- 네비 헤더  메뉴 부분 -->
         	<ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm">일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm" >여행지추천</a>
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                        <a href="/travelReview/reviewlist.tm">여행리뷰</a>
                    </li>
                    <%} //end of if %>
                     <li style="padding:10px;">
                       <input type="text" id="tf_search" style="width: 170px; height: 26px"/><button id="searchBtn"><span class="glyphicon glyphicon-search"></span></button>
                    </li>                                         
                                      <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                    	<a href="/mylist/menubar.tm"><%=userNick%>&nbsp;&nbsp;님</a>
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
                            <a href="#" style="color: #9d9d9d;"><i class="fa fa-user fa-user"></i>  내 정보<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/member/memberUpdate.tm" style="color: #9d9d9d;">  정보수정</a>
                                </li>
                                <li>
                                    <a href="/member/memberDelete.tm" style="color: #9d9d9d;">  회원탈퇴</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="/mylist/menubar.tm" style="color: #9d9d9d;"><i class="fa fa-list-alt fa-list-alt"></i>  내 일정<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/mylist/inglist.tm" style="color: #9d9d9d;">  계획중인일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/donelist.tm" style="color: #9d9d9d;">  완성된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/startlist.tm" style="color: #9d9d9d;">  시작된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/endlist.tm" style="color: #9d9d9d;">  여행한일정</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="/tmmypage/likespot.tm" style="color: #9d9d9d;"><i class="fa fa-heart fa-heart"></i>  관심 여행지</a>
                        </li>
                        <li>
                            <a href="/tmmypage/schedule.tm" style="color: #9d9d9d;"><i class="fa fa-calendar fa-calendar"></i>  관심 일정</a>
                        </li>
                        <li>
                            <a href="/tmmypage/qna.tm" style="color: #9d9d9d;"><i class="fa fa-omments fa-comments"></i>  QnA</a>
                        </li>
                        <li>
                            <a href="/tmmypage/stemp.tm" style="color: #9d9d9d;"><i class="fa fa-flag fa-flag"></i>  스템프</a>
                        </li>                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		<!-- 바디 부분 -->
        <div id="page-wrapper">
        	<article>
				<div class="container">
					<!-- 바디 타이틀  -->
          			<div class="row">
            			<div class="col-lg-12">
                			<h1 class="page-header">QnA
                    			<small>Question and Answer</small>
            					<a href="#" class="btn btn-lg btn-danger" id="btn-question">문의하기</a>
                			</h1>            				
            			</div>
            		<!-- /바디 타이틀 -->
            		<br/>
        			</div>
        			<div class="row">
        			<div class="col-lg-12">
        					<div class="container-box">        				 
    							<div class="container-fluid">
									<div class="row">
									<div class="col-md-12">
										<c:choose>
										<c:when test="${!empty qnalist}">
											<c:forEach var="i" items="${qnalist}">
												<c:choose>
												<c:when test="${i.qnaType eq '문의'}">
													<div class="question">
														<div class="q_head">
															<p id="q_title"><i class="glyphicon glyphicon-question-sign fa-fw"></i>Question</p>
														</div>
														<div class="left">
														<div class="row">
															<div class="col-md-12">	
															<div class="qna-content">								
                                    							<h2><span>${i.qnaContent}</span></h2>
                                    							<p class="text-right" id="writer">작성자 : ${i.userId }</p>
															</div>
															</div>
														</div>
														</div>
													</div>	
 												</c:when>
	 											<c:when test="${i.qnaType eq '신고'}">
 													<div class="question">
														<div class="r_head">																		
 															<p id="r_title"><i class="fa fa-exclamation-circle  fa-fw"></i>Report</p>
														</div>
														<div class="left">
														<div class="row">
															<div class="col-md-12">	
															<div class="qna-content">								
                                    							<h2><span>${i.qnaContent}</span></h2>
                                    							<p class="text-right" id="writer">작성자 : ${i.userId }</p>
															</div>
															</div>
														</div>
														</div>
													</div>	
 												</c:when>
												<c:otherwise>
												</c:otherwise>
												</c:choose>		
												<br/>				
												<c:choose>
												<c:when test="${!empty i.qnaReply}">
													<!-- 답변 부분 -->
													<div class="answer">
														<div class="a_head">
															<p id="a_title" class="text-right"><i class="fa fa-info-circle fa-fw"></i>Answer</p>
														</div>
														<div class="right">
														<div class="row">
															<div class="col-md-12">
															<div class="qna-content">
                                    							<h2 class='text-right'><span>${i.qnaReply}</span></h2>
																<p class="text-right" id="writer">TravelMaker</p>
															</div>
															</div>
														</div>
														</div>
													</div>
													<br/>
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>	
											</c:forEach>
											<c:choose>
													<c:when test="${pageNum < qnaedNum}">
													<div class ="text-center">
														<a href="#" class="btn btn-warning btn-lg" id="btn-moreqna">더보기</a>
														<input type ="hidden" id="pageNum" value="${pageNum}">
													</div>
													</c:when>
											</c:choose>
											</c:when>
											<c:otherwise>
												<h1>문의하시거나 신고한 내용이 없습니다.</h1>
											</c:otherwise>
									</c:choose>			
								</div>
							</div>
						</div>
					</div>	 
        		</div>
        	</div>
        		</div>
        		<!-- Modal -->
 				<div class="modal fade" id="myModal" role="dialog">
    				<div class="modal-dialog">
      					<!-- Modal content-->
      					<div class="modal-content">
        					<div class="modal-header">
          						<button type="button" class="close" data-dismiss="modal">×</button>
          						<h4 class="modal-title">문의하기</h4>
       	 					</div>
        					<div class="modal-body">          						
          						<div class="form-group">
          						<h4>질문유형</h4>
               			 			<div class="icon-addon addon">
                    					<select class="form-control" id="select-box">
                        					<option value="">질문 유형을 선택하세요</option>
                        					<option value="문의">문의</option>
                        					<option value="신고">신고</option>
                    					</select>
                    				<label for="email" class="glyphicon glyphicon-question-sign" rel="tooltip" title="email"></label>
                					</div>
                    			<h4>내용</h4>
                    			<textarea class="form-control col-sm-10" rows="10" id="content"></textarea>
            					</div>
        					</div>
        					<div class="modal-footer">
        					    <button type="button" class="btn btn-primary btn-success" id="btn-write">작성</button>
          						<button type="button" class="btn btn-primary btn-danger" data-dismiss="modal">닫기</button>
        					</div>
      					</div>
    				</div>
  				</div>
        	</article>	
    	</div>
    	<!-- /#wrapper -->
    </div>	

    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resource/bootstrap/js/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>
    <!-- 마이페이지 공통 js -->
    <script src="/resource/mypage/base/js/base.js"></script>
    <!-- 지정 js -->
    <script src="/resource/mypage/qna/js/qna.js"></script>
    
</body>

</html>
