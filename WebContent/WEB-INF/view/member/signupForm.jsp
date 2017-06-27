<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 회원가입 페이지 -->
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    
<!DOCTYPE html>
<html>
<head>
<!-- 팝업 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"  src="/resource/member/js/alopex-ui.min.js"></script>  

<script type="text/javascript">

/* 약관동의 */
  function chk(){ 
 var req = document.form.req.checked;
 var num = 0;
 if(req == true){
  num = 1;
 }
 if(num==1){
  document.form.submit();
 }else{
  alert("약관에 동의하셔야 합니다.");
 }
}
function nochk(){
 alert("동의하지 않으면 가입하실 수 없습니다");};  
 
 
 /* 약관동의 자세히 보기 팝업 */
 $(function(){
 $('#btn_popup').click( function() {
     $a.popup({
    	 title : "약관동의"
         , url: "popUp.tm" // 팝업에 표시될 HTML
         , width : 1200 //크기
         , height : 500
         , iframe: true // default
    });
 });
 });
 </script>
<script type="text/javascript">
 /* 유효성처리 */
 $(function(){
  $("#signup").click(function(){ 
		
		/* 아이디 정규화 */
	  var reg_id=/^[a-z0-9_]{4,20}$/;
		if(!(reg_id.test($("#userId").val()))){
			alert("ID는 5자 이상이여야 합니다");
			$("#userId").focus();
			return false;
		}
		/* 비밀번호 정규화 */
 		var reg_pass=/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
		if(!(reg_pass.test($("#userPw").val()))){
			alert("비밀번호 형식이 잘못되었습니다");
			$("#userPw").focus();
			return false;
		}
		/* 이름 정규화 */
		var reg_name=/^[가-힣]+$/;
		if(!(reg_name.test($("#userName").val()))){
			alert("이름 형식이 잘못되었습니다");
			$("#userName").focus();
			return false;
		} 
		/* 닉네임 정규화 */
 		var reg_nick=/^[가-힣a-zA-Z0-9]+$/;
		if(!(reg_pass.test($("#userNick").val()))){
			alert("닉네임 형식이 잘못되었습니다");
			$("#userNick").focus();
			return false;
		}
		/* 전화번호 정규화 */
		var reg_tel=/^\d{2,3}-\d{3,4}-\d{4}$/;;
		if(!(reg_tel.test($("#userTel").val()))){
			alert("전화번호 형식이 잘못되었습니다");
			$("#userTel").focus();
			return false;
		}
		/* 이메일 정규화 */
		 var reg_email=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(!(reg_email.test($("#userEmail").val()))){
			alert("이메일 형식이 잘못되었습니다");
			$("#userEmail").focus();
			return false;
		} 
		
		$("#frm").submit();
	}); 
 });
 
 /*아이디 중복확인*/
	$(function(){
		$('#userId').blur(function(){
			$.ajax({
				type:"POST",
				url:"idCheck.tm",
				contentType: "application/json;charset=UTF-8",
				data:{
					"userId":$('#userId').val()
				},
				success:function(data){
					if($.trim(data)=="YES"){
						//alert('사용가능');
						$('#idchk').html('<b style="font.size:18px;color:blue">사용가능</b>');
					}else{
						//alert('사용불가');
						$('#idchk').html('<b style="font.size:18px;color:red">사용불가</b>');
					}
				}
			});
		});
/*닉네임 중복확인*/
		$('#userNick').blur(function(){
			$.ajax({
				type:"POST",
				url:"nickcCheck.tm",
				contentType: "application/json;charset=UTF-8",
				data:{
					"userNick":$('#userNick').val()
				},
				success:function(data){
					if($.trim(data)=="YES"){
						//alert('사용가능');
						$('#nickchk').html('<b style="font.size:18px;color:blue">사용가능</b>');
					}else{
						//alert('사용불가');
						$('#nickchk').html('<b style="font.size:18px;color:red">사용불가</b>');
					}
				}
			});
		});
	});
</script>


<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/signup.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 팝업 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <link rel="stylesheet" type="text/css" href="/resource/member/css/alopex-ui-default.css" />

<!-- 정규화 -->
<script type="text/javascript" src="/resource/member/js/signup.js"></script>
  

</head>
<body>
 <!--this was made my Agil Asadi. You are free to delete this comment line and use it as you wish-->   

<div class="row col-md-8 col-md-offset-2 registeration">
    
<div class="registerInner">
        <div class="col-md-6 signUp">
            <h3 class="headerSign">회원가입</h3>
            <form id="frm" action="signupOk.tm" method="post">
<br/>
<br/>
<br/>
				
				<div><span>약관 <button id="btn_popup" class="Button" href="popUp.tm">상세보기</button></span>
				</div>
				<br/>
				<!-- ****중복확인하기**** -->
                <div class="form-group">
                    <input class="form-control" type="text" name="userId" id="userId" placeholder="아이디" required="required">
                	
                </div>
                
				<div class="form-group ">
                    <input class="form-control" type="password" name="userPw" id="userPw" placeholder="비밀번호" required="required">
                    <!-- <p class="help-block">숫자 또는 특수문자 포함 6자 이상</p> -->
                </div>
                
                <div class="form-group ">
                    <input class="form-control" type="password" name="passwordcheck" id="passwordcheck" placeholder="비밀번호확인" required="required">
                	<!-- <p class="help-block">비밀번호를 한번 더 입력해주세요.</p> -->
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userName" id="userName" placeholder="이름" required="required">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userNick" id="userNick" placeholder="닉네임" required="required">
                	
                </div>
                
                <!-- ****전화번호 하나하나 나누기**** -->
                <div class="form-group">
                    <input class="form-control" type="text" name="userTel" id="userTel" placeholder="전화번호" required="required">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userEmail" id="userEmail" value="" placeholder="이메일" required="required">
                </div>
                
                <!-- *******+버튼누르면 추가되게******** -->
                <!-- 주소 -->
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
                    <select name="userCity" id="userCity" onchange="doChange(this, 'userBorough')">
		            <option value="시,도">시,도</option>
		            <option value="서울특별시">서울특별시</option>
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
		          
		          <select name="userBorough" id="userBorough">
		          	<option value="default">시, 군, 구</option>
		          </select>
                </div>
                
				<div class="form-group">
                    <select name="selOne" id="selOne" onchange="doChange(this, 'selTwo')">
		            <option value="시,도">시,도</option>
		            <option value="서울특별시">서울특별시</option>
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
		          
		          <select name="selTwo" id="selTwo">
		          	<option value="default">시, 군, 구</option>
		          </select>
                </div>
                
                <button type="button" class="signbuttons btn btn-primary" id="signup" name="signup" >회원가입하기</button>
                
                
        </div>
        
        
		<div class ="col-md-6">
			<h3 class="headerSign"></h3>
				<form action="" method="">
                
                				<br/><br/><br/><br/><br/><br/>
            	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="checkbox" name = "req">내용을 확인하였습니다
				<input type="button" id="agreeF" name="agreeF" onclick="chk" value="동의함" >
				<input type="button" id="noagreeF" name="noagreeF" onclick="nochk()" value="동의안함" >
								
                <div class="form-group">
                <span id="idchk">　　</span><br/>
                <p class="help-block">숫자 또는 특수문자 포함 6자 이상이여야 합니다</p>
                <p class="help-block">비밀번호를 한번 더 입력해주세요</p>
                <span id="nickchk">　　</span>
                <p class="help-block">- 빼고 입력해주세요</p>
                </div>
                                
            
</div>
        
</div>
</form>
</body>
</html>