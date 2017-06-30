<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- ������ ��õ ������ -->
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>������ ��õ ������</title>

<!-- �� �� �� css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<!-- css  -->
<link rel="stylesheet" href="/resource/recommandTravelRegion/css/recommandTravelRegion.css"/>
<link rel="stylesheet" href="/resource/recommandTravelRegion/css/myInterestOrder.css"/>
<link rel="stylesheet" href="/resource/recommandTravelRegion/css/popularOrder.css"/>
	
<!-- �� �� �� script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- top ��ư script -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/resource/recommandTravelRegion/js/recommandTravelRegion.js"></script>

</head>
<body>
<div style="height:75px; background-color: #103e68;">
   <br/>
   <div style="color:#fff; font-size: 2em; display: inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��õ ������</div>
   <div style="float:right; margin-right: 50px;">
   <input type="submit" value="���� >" id="nextbtn">
   </div>
</div>

	<div class="container" id="container">
	
	<!-- top3 ���� -->
		<div class="topthreelb" id="topthreelb"><h2>TOP 3</h2></div>
		<div class="topthreediv">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		        <div class="hovereffect">
		        	
		            <img class="topoth" src="http://placehold.it/350x200" alt="">
		            <div class="overlay">
		               <img class="img-responsive" src="/resource/recommandTravelRegion/img/fullheart.jpg" alt="">
		               <h2>top1</h2>
		               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
		               <a href="#">read more</a></p>
		              
		            </div>
		        </div>
	   		</div>
		    
		    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		        <div class="hovereffect">
		            <img class="topoth" src="http://placehold.it/350x200" alt="">
		            <div class="overlay">
		               <img class="img-responsive" src="/resource/recommandTravelRegion/img/fullheart.jpg" alt="">
		               <h2>top2</h2>
		               <p class="info">�׽�Ʈ �׽�Ʈ �׽� �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ
		               <a href="#">read more</a></p>
		               
		            </div>
		        </div>
		    </div>
		    
		    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		        <div class="hovereffect">
		            <img class="topoth" src="http://placehold.it/350x200" alt="">
		            <div class="overlay">
		               <img class="img-responsive" src="/resource/recommandTravelRegion/img/fullheart.jpg" alt="">
		               <h2>top3</h2>
		               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
		               <a href="#">read more</a></p>
		               
		            </div>
		        </div>
		    </div>
		</div><!-- end top3 div  -->
		
		<div class="hiddenbr"><h2>�����</h2></div>
	
	
	
	
	<!--  �α�� �����ɼ� ��	-->
		  <ul class="nav nav-tabs">
		    <li class="active"><a data-toggle="tab" href="#menu1" >�α��</a></li>
		    <li><a data-toggle="tab" href="#menu2">�����ɼ�</a></li>
<!-- 		    <input type="button" value="����" id="nextbtn"> -->
		  </ul>

 		<div class="tab-content">
 			<!-- �α�� �� -->
    		<div id="menu1" class="tab-pane fade in active">
     		 	<p>
     		 	<!-- ������ ��õ ������ - �α�� ������ -->
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
<!-- end ������ ��õ ������ - �α�� ������ -->
     		 	</p>	 
   			</div>
   			
   			<!-- �� ���ɼ� �� -->
   			<div id="menu2" class="tab-pane fade">
			    <p>
				<!--��������õ������ - �α�� ������ -->

	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>�����ɼ�</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div><div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="hovereffect">
            <img class="img-responsive" src="http://placehold.it/350x200" alt="">
            <div class="overlay">
               <h2>����</h2>
               <p class="info">�׽�Ʈ �׽�Ʈ �׽�Ʈ �׽��׽�Ʈ 
               <a href="#">read more</a></p>
            </div>
        </div>
    </div>

<!-- end ��������õ������ - �α�� ������ -->			   
			    </p>
  		  	</div>
  		  	
  		</div>

	<!-- top ��ư Ŭ���� ������ �ö󰣴�. -->
<!-- 	<a href="#topthreelb" class="topbtn">TOP</a> -->
	<a class="return-top" href="#" style="right:15px; bottom:15px; position:fixed; z-index:9999;
	width:40px;height:30px; font-size:20px;">TOP</a>
	
	</div><!-- end class container -->
	
</body>
</html> 