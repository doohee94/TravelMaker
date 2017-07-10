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
            <form id="frm" name="frm" action="signupOk.tm" method="post">
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
                </div>
                
                <div class="form-group ">
                    <input class="form-control" type="password" name="userPasswordcheck" id="userPasswordcheck" placeholder="비밀번호확인" required="required">
               </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userName" id="userName" placeholder="이름" required="required">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userNick" id="userNick" placeholder="닉네임" required="required">
                	
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userTel" id="userTel" placeholder="전화번호" required="required">
                </div>
                
                <div class="form-group">
                    <input class="form-control" type="text" name="userEmail" id="userEmail" value="" placeholder="이메일" required="required">
                </div>
                
                <!-- *******+버튼누르면 추가되게******** -->
                
                <div class="form-group">
                <label>주소 :　</label>
                    <select name="userCity" id="userCity" onchange="doChange(this, 'userBorough')">
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
		          
		          <select name="userBorough" id="userBorough">
		          	<option value="default">시, 군, 구</option>
		          </select>
                </div>
                
				<div class="form-group">
                <label>관심지역 :　</label>
                    <select name="selOne" id="selOne" onchange="doChange(this, 'selTwo')">
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
		          
		          <select name="selTwo" id="selTwo">
		          	<option value="default">시, 군, 구</option>
		          </select>&emsp;<img src="/resource/member/image/signupplus.png" width="20" height="20"> 
                </div>
                
                <button type="submit" class="signbuttons btn btn-primary" id="signupbutton" name="signupbutton" style="background: #5d6062;">회원가입하기</button>
                
           </form>     
        </div>
        
        
		<div class ="col-md-6">
			<h3 class="headerSign"></h3>
				<form action="">
                
                				<br/><br/><br/><br/><br/><br/>
            	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="checkbox" name = "req" id="req" >내용을 확인하였습니다
				<input type="button" id="agreeF" name="agreeF" onclick="chk" value="동의함" >
				<input type="button" id="noagreeF" name="noagreeF" onclick="nochk()" value="동의안함" >
				
                
                <div class="form-group">
                	<span id="idchk">　　</span>
                </div>
                
                <div class="form-group">
                	<p class="help-block">숫자 또는 특수문자 포함 6자 이상이여야 합니다</p>
                </div>
                
                <div class="form-group">
	                <font id="passcheck" name="passcheck" size="2" color="red"></font>
	                <p class="help-block" id="pw-block">비밀번호를 한번 더 입력해주세요</p><span id="passchk"></span>
                </div>
                
                <div class="form-group"></div>
                
                <div class="form-group">
                	<span id="nickchk">　　</span>
                </div>
                
                <div class="form-group"></div>
                
                <div class="form-group">
                	<p class="help-block">ID/PW 찾기 시 꼭 필요한 항목이오니 정확히 적어주시기 바랍니다</p>
                </div>
                                
         </form>   
</div>
        
</div>
</div>
</body>


</html>