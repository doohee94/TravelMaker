<%@page import="java.util.Iterator"%>
<%@page import="tm.totalre.dto.TotalreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   ArrayList replyList = (ArrayList)request.getAttribute("replyList");
   int result = (Integer) request.getAttribute("result");
   String _id = (String)request.getAttribute("_id");
   String user_id = (String) request.getAttribute("user_id");
   
   TotalreDTO totalreDTO = (TotalreDTO)request.getAttribute("totalreDTO");
   
   //System.out.println(result);
%>
<% 
   JSONArray tourarray = (JSONArray)request.getAttribute("obj");

   //각 day에 해당하는 place배열을 담을 리스트
   JSONArray placeArray[] = new JSONArray[tourarray.size()];
   
   //각 day에 해당하는 mapx배열을 담을 리스트
   JSONArray mapxArray[] = new JSONArray[tourarray.size()];
   //각 day에 해당하는 mapy배열을 담을 리스트
   JSONArray mapyArray[] = new JSONArray[tourarray.size()];
   
   for(int i=0; i<tourarray.size(); i++){
      //System.out.println( tourarray.get(i).toString());
      
      //각각의 tour리스트에서 place정보 빼오기
      JSONObject tour = (JSONObject)tourarray.get(i);
      
      //place배열 저장
      JSONObject temp = new JSONObject();
      temp = (JSONObject)tourarray.get(i);
      placeArray[i] = (JSONArray)temp.get("place");
   
   }
   
   
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reviewDetail.jsp</title>

<!-- 페이지 css파일 -->
<link rel="stylesheet"
   href="/resource/travelReview/css/reviewDetail.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resource/bootstrap/css/modern-business.css"
   rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">

<!-- 탭 부분 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 페이스북 공유하기 관련 파일 -->
<meta property="og:title" content="공유하기 연습">
<meta property="og:url"
   content="http://localhost:8080/ProjectUIPractice/TravelSpotReview/reviewDetail.jsp">
<meta property="og:description" content="내용입니다 내용 내용 내용">
<meta property="og:image" content="sample.JPG">

<!-- 지도 api 키 -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=1464ab905ce0a7acbcb1f9933dbd5961&libraries=services"></script>

<!-- 페이지 js파일 -->
<script type="text/javascript"
   src="/resource/travelReview/js/travelDetail.js"></script>

<script type="text/javascript" src="/resource/bootstrap/js/bootstrap.js"></script>

</head>

<header>
   <jsp:include page="/tmmain/header.tm"></jsp:include>
</header>

<body>
   <div class="container" style="width: 71%; margin-left: 15%">
      <!-- Page Heading/Breadcrumbs -->
      <div class="row">
         <div class="col-lg-12">
            <h1 class="page-header"><%=totalreDTO.getTotalreTitle() %>
               <small> 
               <%if(result == 0) {%>
                  <input style="margin-left:73%;" type="image" id="heartBtn" src="/resource/travelReview/images/heart1.png" /> 
               <%}else{%> 
               <input style="margin-left:73%;" type="image" id="heartBtn" src="/resource/travelReview/images/heart2.png" />
               <%}%>
               <a href="#"><i class="fa fa-facebook-square fa-2x" id="shareBtn"></i></a>
               </small>
            </h1>
            <ol class="breadcrumb"  style="height:40px" >
               <li  style="font-size:17px;font-weight:bold;font-family:맑은고딕">리뷰</li>
               <li  style="font-size:17px;font-family:맑은고딕">리뷰 상세페이지</li>
            </ol>
            <input type="hidden" value="<%=_id%>" id="_id">
            <input type="hidden" value="<%=user_id%>" id="user_id">
         </div>
      </div>
      <!-- /.row -->

      <!-- 사진 나열 -->
         <div class="carousel slide article-slide" id="article-photo-carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner cont-slider" style="width:">
               <div class="item active" style="width: 100%; height: 400px;">
                  <img alt=""
                     src="/upload/review/<%=totalreDTO.getTotalrePhoto1fake() %>"
                     class="img-responsive" style="width: 100%; height: 400px">
               </div>
            </div>
            <!-- Indicators -->
            <ol style="margin-left:30%" class="carousel-indicators">
               <li class="active" data-slide-to="0"
                  data-target="#article-photo-carousel"><img style=" cursor:pointer; width:100px; height:54px" alt=""
                  src="/upload/review/<%=totalreDTO.getTotalrePhoto1fake() %>"
                  class="img-responsive"></li>
               <li class="" data-slide-to="1"
                  data-target="#article-photo-carousel"><img style="cursor:pointer; width:100px; height:54px" alt=""
                  src="/upload/review/<%=totalreDTO.getTotalrePhoto2fake() %>">
               </li>
               <li class="" data-slide-to="2"
                  data-target="#article-photo-carousel"><img style="cursor:pointer; width:100px; height:54px" alt=""
                  src="/upload/review/<%=totalreDTO.getTotalrePhoto3fake() %>">
               </li>
               <li class="" data-slide-to="3"
                  data-target="#article-photo-carousel"><img style="cursor:pointer; width:100px; height:54px" alt=""
                  src="/upload/review/<%=totalreDTO.getTotalrePhoto4fake() %>">
               </li>
            </ol>
         </div>
         <br/>
	  <div class="thumbnail">
         <div class="caption-full">
            <p style="font-size:17px"><%=totalreDTO.getTotalreContent() %></p>
         </div>
      </div>
   </div>

   <div class="container map" style="width: 40%; margin-left: 15%">
      <!-- Service Tabs -->
      <div class="row map">
      <!-- 설명팁 -->
<!--       	<img class="map" alt="" src="/resource/travelReview/images/Tab.JPG"> -->

         <div class="col-lg-12">
            <h2 class="page-header">일정</h2>
         </div>
         <div class="col-lg-12">

            <ul id="myTab" class="nav nav-tabs nav-justified">
               <!-- 일정 수만큼 탭 갯수 만들기 -->
               <%
                  for (int i = 0; i < tourarray.size() && placeArray[i] != null; i++) {
               %>
               <li class="mapInfo"><a style="cursor:pointer;" href="#service-<%=i %>"
                  data-toggle="tab"><i class="fa fa-tree"></i>DAY<%=i+1 %></a> <%
                  //위에서 만든 place배열에서 title, mapx, mapy 정보 가져오기
                     for (int j = 0; j < placeArray[i].size(); j++) {
                        JSONObject temp = new JSONObject();
                        temp  = (JSONObject)placeArray[i].get(j);
                        
                        String mapx = temp.get("mapx").toString();
                        String mapy = temp.get("mapy").toString();
                        String title = temp.get("title").toString();
                  %> <input type="hidden" class="mapx" value=<%=mapx %>> <input
                  type="hidden" class="mapy" value=<%=mapy %>> <input
                  type="hidden" class="title" value=<%=title %>> <%
                     }
                  %></li>
               <%
                  }
               %>
            </ul>

            <div id="myTabContent" class="tab-content"
               style="height: 400px; overflow: scroll;">
               <%
               for (int i = 0; i < tourarray.size(); i++) {
                  if(placeArray[i] != null){
               %>
               <div class="tab-pane fade in" id="service-<%=i %>">
                  <%
                  //위에서 만든 place배열에서 title, mapx, mapy 정보 가져오기
                     for (int j = 0; j < placeArray[i].size(); j++) {
                        JSONObject temp = new JSONObject();
                        temp  = (JSONObject)placeArray[i].get(j);
                        String title = temp.get("title").toString();
                        String oneline_review = "";
                           if(temp.get("oneline_review") != null){
                              oneline_review = temp.get("oneline_review").toString();
                           }
                  %>
                  <h4><%= title%></h4>
                  <p><%=oneline_review %></p>
                  <hr>
                  <%
                     }
                  %>
               </div>

               <%
                  }
               }
               %>
            </div>

         </div>
      </div>
   </div>

   <!-- 지도 구성 -->
   <div id="map" style="width: 30%; height: 450px;" class="map"></div>
   <br/>
   <!-- 댓글창 -->
   <div style="width: 70%; margin-left: 15%" align="center">
      <table class="table table-striped" style="font-size:15px;">
         <tr>
            <th>내용</th>
            <th>작성자</th>
            <th>날짜</th>
         </tr>
         <c:choose>
            <c:when test="${! empty replyList }">
               <c:forEach items="${replyList}" var="list">
                  <tr>
                     <td>${list.reply }</td>
                     <td>${list.userId }</td>
                     <td>${list.writeDate }</td>
                  </tr>
               </c:forEach>
            </c:when>
         </c:choose>
      </table>
      <br/>

      <form action="/travelReview/insertReply.tm">
         <input type="hidden" value="<%=_id%>" id="_id" name="scNum">
         <input type="hidden" value="<%=user_id%>" id="user_id" name="userId">
         <input style="width: 60%; height:30px; font-size:15px; margin-bottom:5px" type="text" placeholder="댓글" id="reply" name="reply">
         <input type="submit" value="입력" style="cursor:pointer;padding-bottom:5px;width:100px;height:30px; background-color:#103e68 ;border:1px solid #103e68;color:white; font-size:20px;">
      </form>
   </div>

</body>


</html>