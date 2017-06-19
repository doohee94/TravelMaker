<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Sortable - Handle empty lists</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
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

.panel-front { /* Only for this preview */
display:inline-block;
	margin-right:20px;
	width : 30%;
    margin-bottom:20px;
    margin-top:20px;
}

.panel-front .panel-heading .panel-title img {
	border-radius:3px 3px 0px 0px;
	width:100%;
}

.panel-front .panel-heading {
	padding: 0px;	
}

.panel-front .panel-heading h4 {
	line-height: 0;
}

.panel-front .panel-body h4 {
	font-weight: bold;
	margin-top: 5px;
	margin-bottom: 15px;
}

.text-right {
    margin-top: 10px;
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
    
  } );
</script>
</head>

<body>
	<br /><br /><br /><br />
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
					<div class="stepwizard-step">
						<button type="button" class="btn btn-primary btn-circle" disabled="disabled">start</button>
						<p>출발지</p>
					</div>
					<div class="stepwizard-step">
						<button type="button" class="btn btn-default btn-circle" disabled="disabled">1</button>
						<p>경유지</p>
					</div>
					<div class="stepwizard-step">
						<button type="button" class="btn btn-default btn-circle" disabled="disabled">2</button>
						<p>경유지</p>
					</div>
					<div class="stepwizard-step">
						<button type="button" class="btn btn-default btn-circle" disabled="disabled">3</button>
						<p>경유지</p>
					</div>
					<div class="stepwizard-step">
						<button type="button" class="btn btn-primary btn-circle" disabled="disabled">end</button>
						<p>도착지</p>
					</div>
					
				</div>
			</div>
		<div>


		<br /><br />
		<div><a href="#" class="btn btn-primary btn-info" style="float: right;"><span class="glyphicon glyphicon-check"></span>변경</a><span style="padding-right:30px; float:right; text-align: right; font-size: 1.5em;">변경 여행 리스트</span></div>
		<br /><br />
		<div style="border: 2px inset #EAEAEA;">
			<ul id="changelist" class="changelist">
				<li class="changelist">출발지</li>
				<li class="changelist">경유</li>
				<li class="changelist">경유</li>
				<li class="changelist">경유</li>
				<li class="changelist">도착지</li>
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
					<li class="sellist">경유</li>
					<li class="sellist">경유</li>
					<li class="sellist">경유</li>
					<li class="sellist">경유</li>
					<li class="sellist">경유</li>
					<li class="sellist">경유</li>
					<li class="sellist">경유</li>
					<li class="sellist">경유</li>
					<li class="sellist">경유</li>
				</ul>
			</div>
			<div class="mainright">
				<div class="panel panel-default panel-front">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="#"><img src="http://blog.fujixerox.co.kr/wp-content/uploads/1/cfile5.uf.1402B64B5146BF16164376.jpg" style="width: 100%; height: 100	%;"></a>
						</h4>
					</div>
					<div class="panel-body">
						<h4>장소이름</h4>
							주소
					</div>
				</div>
				<div class="panel panel-default panel-front">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="#"><img src="http://blog.fujixerox.co.kr/wp-content/uploads/1/cfile5.uf.1402B64B5146BF16164376.jpg" style="width: 100%; height: 100	%;"></a>
						</h4>
					</div>
					<div class="panel-body">
						<h4>장소이름</h4>
							주소
					</div>
				</div>
				<div class="panel panel-default panel-front">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="#"><img src="http://blog.fujixerox.co.kr/wp-content/uploads/1/cfile5.uf.1402B64B5146BF16164376.jpg" style="width: 100%; height: 100	%;"></a>
						</h4>
					</div>
					<div class="panel-body">
						<h4>장소이름</h4>
							주소
					</div>
				</div>
			</div>
		</div>
		<br style="clear: both">
	</center>
</body>
</html>

