<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Sortable - Handle empty lists</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style>
.showlist{
	width: 70%;
}
.allbtn{
	width: 1200px;
}
.allbtn a{
	float: right;
}

#selectlist{
 	list-style-type: none; 
	padding:0;
	margin:0;
	width: 160px;
	border: 1px solid #EAEAEA;
}

.sellist{
	background-color:#2995F7;
	color:white;
	margin:5px;
	padding:3px;
	font-size: 1.3em;
	text-align: center;
}

.sellist:hover{
	color:black;
	background-color: #EAEAEA;
}
.changelist{
	margin-top: 8px;
}

#changelist li{
	margin-left : 10px;
	padding:5px;
	padding-left:20px;
	padding-right:20px;
	display: inline-block;
	font-size: 1.2em;
}
#changelist .changelist{
	
	color : white;
	background-color : #96C8F7;
	font-size: 1.3em;
	text-align: center;
}

.maintop{
	width:1200px;
	margin-bottom: 20px;
}

.main{
	width:1200px;
}

.mainleft{
	margin-right:20px;
	width: 200px;
	float: left;
}
.mainright{
	width:80%;
	float: left;
}

.maintop1{
	width:190px;
	float: left;
	font-size: 1.5em;
	text-align: center;
}
.maintop2{
	width:80%;
	float: left;
	font-size: 1.5em;
	text-align: center;
}
.stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}

.cours2{
	position:relative;
	margin-bottom:50px;
	width: 30%;	
	margin-left:30px;
	float: left;
}

.cours3{
	-border:1px solid red;
	position:absolute;
	top:-100px;
	opacity:0;
	-bottom:100px;
	-background-color:rgba(142,198,63,.8);
	background-color:rgba(0,0,0,0.9);
	color:white;
	padding:10p;
}
.cours2:hover .cours3 {
	opacity:1;
	top:20px;
	transition:1s;
}

.cours2:hover {
	opacity:1;
	bottom:0;
	transition:1s;
}
.cours2:hover .hover{
	transform:scale(1.3);
	transition:1s;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>
  $( function() {
    $( "ul.changelist" ).sortable();
    $( "ul.dropfalse" ).sortable({
    	connectWith: "ul"
    });
//     $( "#selectlist" ).disableSelection();
    
    $(".ui-sortable-handle").dblclick(function(){
    	if($(this).attr("class") == "sellist ui-sortable-handle"){
    		$(".dropfalse").append("<li class='sellist ui-sortable-handle'>"+$(this).text());
    		$(this).remove();
    	}else{
    		$(this).remove();
    	}
    });
    
    $(".sellist").click(function(){
    	var keyword = $(this).text();
    	var key = "CKOKxPOpAhEnu8gzrMSEwqHCW3zGNCxaFWAOjtXL%2B82aon1CjzdWU8g%2BkknZZRWgd9CnHDJywcDr495yzWoV4g%3D%3D";
		$.ajax({
			url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey="+key
			,dataType:"json"
			,data : {
				"keyword":keyword,
				"MobileOS":"ETC",
				"MobileApp":"AppTesting",
				"arrange":"B",
				"numOfRows":"6",
				"_type":"json"
			}
			,success:function(data){
				$(".mainright").text("");
				//undefined
				for (var i = 0; i < 7; i++) {
					$(".mainright").append("<div class='for2"+[i]+" cours2' style='overflow:hidden;'>");
					if(data.response.body.items.item[i].firstimage == null || data.response.body.items.item[i].firstimage=="undefined"){
						$(".for2"+[i]).append("<img class='hover' src='/resource/step2/noimage.jpg' style='width:100%;height:200px;border:1px solid transparent;transition:1s;'>");
					}else{
						$(".for2"+[i]).append("<img class='hover' src='"+data.response.body.items.item[i].firstimage+"' style='width:100%;height:200px;border:1px solid transparent;transition:1s;'>");
					}
					$(".for2"+[i]).append("<div class='for3"+[i]+" cours3'>");
					$(".for3"+[i]).append("<h2 style='text-align:center;margin-top:-6px;color:rgb(237,78,110);'>"+data.response.body.items.item[i].title+"</h2>");
					$(".for3"+[i]).append("<h5 style='text-align:center;'>"+data.response.body.items.item[i].addr1+data.response.body.items.item[i].addr2+"</h5>");
				}
				
			}//end success
			,error:function(err){
				alert("실패!"+err.status);
			}
		}); //end of ajax
  	
	});
    
    $("#changelistbtn").click(function(){
    	var str = "";
    	$(".changelist li").each(function(){
    		str += $(this).text();
    		str += " ";
    	});
    	$("#changelist").val(str.trim());
    	$("#frm").attr("action","step2.tm");
    	$("#frm").submit();
    });
    
  } );
</script>
</head>

<body>
	<div style="height: 75px; background-color: #103e68;">
		<br />
		<div style="color: #fff; font-size: 2em; display: inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나의
			여행일정</div>
		<div style="float: right; margin-right: 50px;">

			<button id="chat" onclick="openNav()" style="margin-left: 70px">채팅</button>
		</div>
	</div>
	<br>
	<br>
	<center>
		<div class="allbtn">
			<a href="#" class="btn btn-info"><span class="glyphicon glyphicon-chevron-right"></span> 다음</a>
			<a href="#" class="btn btn-info"><span class="glyphicon glyphicon-new-window"></span> 스킵</a>
			<a href="#" class="btn btn-info"><span class="glyphicon glyphicon-chevron-left"></span> 이전</a>
		</div>
		<br /><br /><br />
		<div class="showlist">
			<div class="stepwizard">
				<div class="stepwizard-row">
					<c:if test="${!empty list }">
						<c:forEach var="s" items="${list}" varStatus="cnt">
							<c:choose>
								<c:when test="${cnt.index eq '0'}">
									<div class="stepwizard-step">
										<button type="button" class="btn btn-default btn-circle" disabled="disabled">start</button>
										<p>${s }</p>
									</div>
								</c:when>
								<c:when test="${cnt.count eq fn:length(list)}">
									<div class="stepwizard-step">
										<button type="button" class="btn btn-default btn-circle" disabled="disabled">end</button>
										<p>${s }</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="stepwizard-step">
										<button type="button" class="btn btn-default btn-circle" disabled="disabled"><c:out value="${cnt.index }" /></button>
										<p>${s }</p>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
				</div>
			</div>
		<div>

		<br /><br />
		<form id="frm" method="post">
			<input type="hidden" id="changelist" name="changelist" />
		<div><a href="#" id="changelistbtn" class="btn btn-primary btn-info" style="float: right;"><span class="glyphicon glyphicon-check"></span>변경</a><span style="padding-right:30px; float:right; text-align: right; font-size: 1.5em;">변경 여행 리스트</span></div>
		</form>
		<br /><br />
		<div style="border: 2px inset #EAEAEA;">
			<ul id="changelist" class="changelist">
				<c:if test="${list !=null }">
					<c:set var="i">0</c:set>
					<c:forEach var="s" items="${list}">
						<li class="changelist">${s }</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
		<br /> <br /><br />
		<div class="maintop">
			<div class="maintop1">추천(시,군)</div>
			<div class="maintop2">여행지</div>
		</div>
		<br /> <br />
		<div class="main">
			<div class="mainleft">
				<ul id="selectlist" class="dropfalse">
					<c:if test="${addlist !=null }">
						<c:forEach var="add" items="${addlist}">
							<li class="sellist">${add }</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			<div class="mainright">
			</div>
		</div>
		<br style="clear: both">
	</center>
</body>
</html>

