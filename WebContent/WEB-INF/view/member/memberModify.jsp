<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 회원정보수정 페이지 -->
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
<!DOCTYPE html>
<html>
<head>

<!--  메뉴바 -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/base.css" />
<link rel="stylesheet" type="text/css" href="/resource/member/css/style.css" />

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/insert.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 팝업 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <link rel="stylesheet" type="text/css" href="/resource/member/css/alopex-ui-default.css" />


</head>
<body>

<!--  메뉴네비게이션 -->
	<div class="lnb">
		<h1>마이페이지</h1>
		<div class="subtitle"><a href="#">내정보</a></div>
			<ul class="sub" style="display:none;">
				<li><a href="memberUpdate.tm">정보보기</a></li>
				<li><a href="memberDelete.tm">회원탈퇴</a></li>
			</ul>
		<div class="subtitle"><a href="http://localhost:8080/TravelMakerTest/mylist/menubar.tm">나의일정</a></div>
		<div class="subtitle"><a href="">관심일정</a></div>
		<div class="subtitle"><a href="">관심여행지</a></div>
		<div class="subtitle"><a href="">QnA</a></div>
		<div class="subtitle sub_end"><a href="">스탬프</a></div>
	</div>

<form id="frm">
 <!--this was made my Agil Asadi. You are free to delete this comment line and use it as you wish-->   

<div class="row col-md-8 col-md-offset-2 registeration">
    
<div class="registerInner">
        <div class="col-md-6 signUp">
            <h3 class="headerSign">회원정보수정</h3>
            <form action="" method="post">
<br/>
<br/>
<br/>
				

				<br/>
                <div class="form-group">
                    <input class="form-control" type="text" name="id" id="id" value="hong90" placeholder="아이디" required="required" disabled>
                	
                </div>
                
				<div class="form-group ">
                    <input class="form-control" type="password" name="pass" id="pass" value="1111" placeholder="비밀번호" required="required">
                </div>
                
                <div class="form-group ">
                    <input class="form-control" type="password" name="passwordcheck" id="passwordcheck" value="1111" placeholder="비밀번호확인" required="required">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="name" id="name" value="홍길동" placeholder="이름" required="required">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="nick" id="nick" value="홍홍홍" placeholder="닉네임" required="required">
                	
                </div>
                
                <!-- ****전화번호 하나하나 나누기**** -->
                <div class="form-group">
                    <input class="form-control" type="text" name="tel" id="tel" value="010-7254-4218" placeholder="전화번호" required="required">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="email" id="email" value="hong90@naver.com" placeholder="이메일" required="required">
                </div>
                <!-- ****플러스누르면 추가되게**** -->
                <script type="text/javascript">
                
                function doChange(srcE, targetId){
                    var val = srcE.options[srcE.selectedIndex].value;
                    var targetE = document.getElementById(targetId);
                       
                    removeAll(targetE);
            
                    if(val == 'seoul'){
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

                       else if(val == 'busan'){
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

                       else if(val == 'daegu'){
                          addOption('중구', targetE);
                           addOption('동구', targetE);
                           addOption('서구', targetE);
                           addOption('남구', targetE);
                           addOption('북구', targetE);
                           addOption('수성구', targetE);
                           addOption('달서구', targetE);
                           addOption('달성군', targetE);
                          
                       }
                       else if(val == 'incheon'){
                           addOption('중구', targetE);                 addOption('동구', targetE);                 addOption('남구', targetE);
                            addOption('연수구', targetE);                 addOption('남동구', targetE);                 addOption('부평구', targetE);
                            addOption('계양구', targetE);                 addOption('서구', targetE);
                        }
                    

                       else if(val == 'gzn'){
                           addOption('동구', targetE);                 addOption('서구', targetE);                 addOption('남구', targetE);
                            addOption('북구', targetE);                 addOption('광산구', targetE);
                        }
                    
                       else if(val == 'daezn'){
                           addOption('동구', targetE);                 addOption('중구', targetE);                 addOption('서구', targetE);
                           addOption('유성구', targetE);                 addOption('대덕구', targetE);
                       }
                    
                       else if(val == 'woolsan'){
                           addOption('중구', targetE);                addOption('남구', targetE);                addOption('동구', targetE);
                           addOption('북구', targetE);                addOption('울주군', targetE);
                       }
                       else if(val == 'saejong'){
                      	 addOption('조치원읍', targetE);                 addOption('연기면', targetE);                 addOption('연동면', targetE);
                           addOption('부강면', targetE);                 addOption('금남면', targetE);                 addOption('장군면', targetE);                 addOption('연서면', targetE);
                           addOption('전의면', targetE);                 addOption('전동면', targetE);                 addOption('소정면', targetE);
                           addOption('한솔동', targetE);                 addOption('도담동', targetE);                 addOption('아름동', targetE);
                           addOption('종촌동', targetE);                 addOption('고운동', targetE);                 addOption('보람동', targetE);
                      }
                    
                       else if(val == 'ggdo'){
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
                    
                       else if(val == 'gangwondo'){
                           addOption('춘천시', targetE);                addOption('원주시', targetE);                addOption('강릉시', targetE);
                           addOption('동해시', targetE);                addOption('태백시', targetE);                addOption('속초시', targetE);
                           addOption('삼척시', targetE);                addOption('홍천군', targetE);                addOption('횡성군', targetE);
                           addOption('영월군', targetE);                addOption('평창군', targetE);                addOption('정선군', targetE);
                           addOption('철원군', targetE);                addOption('화천군', targetE);                addOption('양구군', targetE);
                           addOption('인제군', targetE);                addOption('고성군', targetE);                addOption('양양군', targetE);
                       }
                    
                       else if(val == 'ccnort'){
                           addOption('상당구', targetE);                addOption('서원구', targetE);                addOption('흥덕구', targetE);
                           addOption('청원구', targetE);                addOption('충주시', targetE);                addOption('제천시', targetE);
                           addOption('보은군', targetE);                addOption('옥천군', targetE);                addOption('영동군', targetE);
                           addOption('진천군', targetE);                addOption('괴산군', targetE);                addOption('음성군', targetE);
                           addOption('단양군', targetE);                addOption('증평군', targetE);
                           }
                    
                       else if(val == 'ccsouth'){
                           addOption('동남구', targetE);                addOption('서북구', targetE);                addOption('공주시', targetE);
                           addOption('보령시', targetE);                addOption('아산시', targetE);                addOption('서산시', targetE);
                           addOption('논산시', targetE);                addOption('계롱시', targetE);                addOption('당진시', targetE);
                           addOption('금산군', targetE);                addOption('부여군', targetE);                addOption('서천군', targetE);
                           addOption('청양군', targetE);                addOption('홍성군', targetE);                addOption('예산군', targetE);
                           addOption('태안군', targetE);
                           }
                       else if(val == 'zrnorth'){
                           addOption('완산구', targetE);                addOption('덕진구', targetE);                addOption('군산시', targetE);
                           addOption('익산시', targetE);                addOption('정읍시', targetE);                addOption('남원시', targetE);
                           addOption('김제시', targetE);                addOption('완주군', targetE);                addOption('진안군', targetE);
                           addOption('무주군', targetE);                addOption('장수군', targetE);                addOption('임실군', targetE);
                           addOption('순창군', targetE);                addOption('고창군', targetE);                addOption('부안군', targetE);
                       }
                    
                       else if(val == 'zrsouth'){
                           addOption('목포시', targetE);                addOption('여수시', targetE);                addOption('순천시', targetE);
                           addOption('나주시', targetE);                addOption('광양시', targetE);                addOption('담양군', targetE);
                           addOption('곡성군', targetE);                addOption('구례군', targetE);                addOption('고흥군', targetE);
                           addOption('보성군', targetE);                addOption('화순군', targetE);                addOption('장흥군', targetE);
                           addOption('강진군', targetE);                addOption('해남군', targetE);                addOption('영암군', targetE);
                           addOption('무안군', targetE);                addOption('함평군', targetE);                addOption('영광군', targetE);
                           addOption('장성군', targetE);                addOption('완도군', targetE);                addOption('진도군', targetE);
                           addOption('신안군', targetE);
                       }
                    
                       else if(val == 'ksnorth'){
                           addOption('포항시 남구', targetE);                addOption('포항시 북구', targetE);                addOption('경주시', targetE);
                           addOption('김천시', targetE);                addOption('안동시', targetE);                addOption('구미시', targetE);
                           addOption('영주시', targetE);                addOption('영천시', targetE);                addOption('상주시', targetE);                
                           addOption('문경시', targetE);                addOption('경산시', targetE);                addOption('군위군', targetE);                addOption('의성군', targetE);
                           addOption('청송군', targetE);                addOption('영양군', targetE);                addOption('영덕군', targetE);
                           addOption('청도군', targetE);                addOption('고령군', targetE);                addOption('성주군', targetE);
                           addOption('칠곡군', targetE);                addOption('예천군', targetE);                addOption('봉화군', targetE);
                           addOption('울진군', targetE);                addOption('울릉군', targetE);
                       }
                    
                       else if(val == 'kssouth'){
                           addOption('의창구', targetE);                addOption('성산구', targetE);                addOption('마산합포구', targetE);
                           addOption('마산회원구', targetE);                addOption('진해구', targetE);                addOption('진주시', targetE);
                           addOption('통영시', targetE);                addOption('사천시', targetE);                addOption('김해시', targetE);
                           addOption('밀양시', targetE);                addOption('거제시', targetE);                addOption('양산시', targetE);
                           addOption('의령군', targetE);                addOption('함안군', targetE);                addOption('창녕군', targetE);
                           addOption('고성군', targetE);                addOption('남해군', targetE);                addOption('하동군', targetE);
                           addOption('신청군', targetE);                addOption('함양군', targetE);                addOption('거창군', targetE);
                           addOption('합천군', targetE);
                       }
                    
                       else if(val == 'jeju'){
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
                    <select name="selOne" id="selOne" onchange="doChange(this, 'selTwo')">
		            <option value="default">시,도</option>
		            <option value="seoul">서울특별시</option>
		            <option value="busan">부산광역시</option>
		            <option value="daegu">대구광역시</option>
		            <option value="incheon">인천광역시</option>
		            <option value="gzn">광주광역시</option>
		            <option value="daezn">대전광역시</option>
		            <option value="woolsan">울산광역시</option>
		            <option value="saejong">세종특별자치시</option>
		            <option value="ggdo">경기도</option>
		            <option value="gangwondo">강원도</option>
		            <option value="ccnorth">충청북도</option>
		            <option value="ccsouth">충청남도</option>
		            <option value="zrnorth">전라북도</option>
		            <option value="zrsouth">전라남도</option>
		            <option value="ksnorth">경상북도</option>
		            <option value="kssouth">경상남도</option>
		            <option value="jeju">제주특별자치도</option>
		          </select>
		          
		          <select name="selTwo" id="selTwo">
		          	<option value="default">시, 군, 구</option>
		          </select>
                </div>
                
				<div class="form-group">
                    <select name="selOne" id="selOne" onchange="doChange(this, 'selThree')">
		            <option value="default">시,도</option>
		            <option value="seoul">서울특별시</option>
		            <option value="busan">부산광역시</option>
		            <option value="daegu">대구광역시</option>
		            <option value="incheon">인천광역시</option>
		            <option value="gzn">광주광역시</option>
		            <option value="daezn">대전광역시</option>
		            <option value="woolsan">울산광역시</option>
		            <option value="saejong">세종특별자치시</option>
		            <option value="ggdo">경기도</option>
		            <option value="gangwondo">강원도</option>
		            <option value="ccnorth">충청북도</option>
		            <option value="ccsouth">충청남도</option>
		            <option value="zrnorth">전라북도</option>
		            <option value="zrsouth">전라남도</option>
		            <option value="ksnorth">경상북도</option>
		            <option value="kssouth">경상남도</option>
		            <option value="jeju">제주특별자치도</option>
		          </select>
		          
		          <select name="selThree" id="selThree">
		          	<option value="default">시, 군, 구</option>
		          </select>
                </div>
                
                <center><button type="submit" class=" modify btn btn-primary" id="modify" name="modify"><a href="#" onClick="history.back();">완료</a></button></center>
                <br/><br/><br/><br/>
                </form>
        </div>
        
        
</div>
</form>
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

<!-- 유효성처리 -->
<script type="text/javascript">
$(function(){
  $("#signup").click(function(){ 
	  
  });
  });
</script>
</html>