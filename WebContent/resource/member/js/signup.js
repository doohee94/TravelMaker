/* 약관동의 */
$(function(){
	$("#agreeF").click(function(){
		if($("#req").is(":checked")){
		}else{
			alert("약관에 동의하셔야 합니다.");
		}
	});
	$("#noagreeF").click(function(){
		alert("동의하지 않으면 가입하실 수 없습니다");
	});
});

/* 동의함 누르면 버튼 readonly */
$(function(){
	$("#agreeF").click(function(){
		$("#req").attr("onclick","return false;");
	});
});
 
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
 
 /* 유효성처리 */
 $(function(){
  $("#signup").click(function(){ 
		
		/* 아이디 정규화 */
	  var reg_id=/^[a-z0-9_]{4,20}$/;
		if(!(reg_id.test($("#userId").val()))){
			alert("ID는 5자 이상이여야 하며 영어만 가능합니다");
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
	/*$(function(){
		$('#userId').blur(function(){
			$.ajax({
				type:"POST",
				url:"idCheck.tm",
				data:{
					"userId":$('#userId').val()
				},
				success:function(data){
					if(data.trim()=="YES"){
						$('#idchk').html('<b style="font.size:18px;color:blue">사용가능</b>');
					}else{
						$('#idchk').html('<b style="font.size:18px;color:red">사용불가</b>');
					}
				}
			});
		});
닉네임 중복확인
		$('#userNick').blur(function(){
			$.ajax({
				type:"POST",
				url:"nickcCheck.tm",
				data:{
					"userNick":$('#userNick').val()
				},
				success:function(data){
					if(data.trim()=="YES"){
						$('#nickchk').html('<b style="font.size:18px;color:blue">사용가능</b>');
					}else{
						$('#nickchk').html('<b style="font.size:18px;color:red">사용불가</b>'); 
					}
				}
			});
		});
이메일 중복확인 
	});*/


/* 비밀번호 체크 */
$(function(){
	  $('#userPw').keyup(function(){
	   $('font[name=passcheck]').text('');
	  }); //#userPw.keyup

	  $('#userPasswordcheck').keyup(function(){
	   if($('#userPw').val()!=$('#userPasswordcheck').val()){
	    $('font[name=passcheck]').text('');
	    $('font[name=passcheck]').html("<span style='color: red'>암호틀림</span>");
	   }else{
	    $('font[name=passcheck]').text('');
	    $('font[name=passcheck]').html("<span style='color: blue'>암호맞음</span>");
	   }
	  }); //#passwordcheck.keyup
	 });

/* 체크확인 보이게 안보이게 */
$(function(){
		$("#passcheck").hide();
	$("#userPasswordcheck").keyup(function(){
		$("#passcheck").show();
		$("#pw-block").hide();
	});
});

/* 시도 눌렀을 때 나오는 구 */
function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
       
    removeAll(targetE);

    if(val == '서울특별시 '){
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

       else if(val == '부산광역시 '){
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

       else if(val == '대구광역시 '){
          addOption('중구', targetE);
           addOption('동구', targetE);
           addOption('서구', targetE);
           addOption('남구', targetE);
           addOption('북구', targetE);
           addOption('수성구', targetE);
           addOption('달서구', targetE);
           addOption('달성군', targetE);
          
       }
       else if(val == '인천광역시 '){
           addOption('중구', targetE);                 addOption('동구', targetE);                 addOption('남구', targetE);
            addOption('연수구', targetE);                 addOption('남동구', targetE);                 addOption('부평구', targetE);
            addOption('계양구', targetE);                 addOption('서구', targetE);
        }
    

       else if(val == '광주광역시 '){
           addOption('동구', targetE);                 addOption('서구', targetE);                 addOption('남구', targetE);
            addOption('북구', targetE);                 addOption('광산구', targetE);
        }
    
       else if(val == '대전광역시 '){
           addOption('동구', targetE);                 addOption('중구', targetE);                 addOption('서구', targetE);
           addOption('유성구', targetE);                 addOption('대덕구', targetE);
       }
    
       else if(val == '울산광역시 '){
           addOption('중구', targetE);                addOption('남구', targetE);                addOption('동구', targetE);
           addOption('북구', targetE);                addOption('울주군', targetE);
       }
       else if(val == '세종특별자치시 '){
      	 addOption('조치원읍', targetE);                 addOption('연기면', targetE);                 addOption('연동면', targetE);
           addOption('부강면', targetE);                 addOption('금남면', targetE);                 addOption('장군면', targetE);                 addOption('연서면', targetE);
           addOption('전의면', targetE);                 addOption('전동면', targetE);                 addOption('소정면', targetE);
           addOption('한솔동', targetE);                 addOption('도담동', targetE);                 addOption('아름동', targetE);
           addOption('종촌동', targetE);                 addOption('고운동', targetE);                 addOption('보람동', targetE);
      }
    
       else if(val == '경기도 '){
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
    
       else if(val == '강원도 '){
           addOption('춘천시', targetE);                addOption('원주시', targetE);                addOption('강릉시', targetE);
           addOption('동해시', targetE);                addOption('태백시', targetE);                addOption('속초시', targetE);
           addOption('삼척시', targetE);                addOption('홍천군', targetE);                addOption('횡성군', targetE);
           addOption('영월군', targetE);                addOption('평창군', targetE);                addOption('정선군', targetE);
           addOption('철원군', targetE);                addOption('화천군', targetE);                addOption('양구군', targetE);
           addOption('인제군', targetE);                addOption('고성군', targetE);                addOption('양양군', targetE);
       }
    
       else if(val == '충청북도 '){
           addOption('상당구', targetE);                addOption('서원구', targetE);                addOption('흥덕구', targetE);
           addOption('청원구', targetE);                addOption('충주시', targetE);                addOption('제천시', targetE);
           addOption('보은군', targetE);                addOption('옥천군', targetE);                addOption('영동군', targetE);
           addOption('진천군', targetE);                addOption('괴산군', targetE);                addOption('음성군', targetE);
           addOption('단양군', targetE);                addOption('증평군', targetE);
           }
    
       else if(val == '충청남도 '){
           addOption('동남구', targetE);                addOption('서북구', targetE);                addOption('공주시', targetE);
           addOption('보령시', targetE);                addOption('아산시', targetE);                addOption('서산시', targetE);
           addOption('논산시', targetE);                addOption('계롱시', targetE);                addOption('당진시', targetE);
           addOption('금산군', targetE);                addOption('부여군', targetE);                addOption('서천군', targetE);
           addOption('청양군', targetE);                addOption('홍성군', targetE);                addOption('예산군', targetE);
           addOption('태안군', targetE);
           }
       else if(val == '전라북도 '){
           addOption('완산구', targetE);                addOption('덕진구', targetE);                addOption('군산시', targetE);
           addOption('익산시', targetE);                addOption('정읍시', targetE);                addOption('남원시', targetE);
           addOption('김제시', targetE);                addOption('완주군', targetE);                addOption('진안군', targetE);
           addOption('무주군', targetE);                addOption('장수군', targetE);                addOption('임실군', targetE);
           addOption('순창군', targetE);                addOption('고창군', targetE);                addOption('부안군', targetE);
       }
    
       else if(val == '전라남도 '){
           addOption('목포시', targetE);                addOption('여수시', targetE);                addOption('순천시', targetE);
           addOption('나주시', targetE);                addOption('광양시', targetE);                addOption('담양군', targetE);
           addOption('곡성군', targetE);                addOption('구례군', targetE);                addOption('고흥군', targetE);
           addOption('보성군', targetE);                addOption('화순군', targetE);                addOption('장흥군', targetE);
           addOption('강진군', targetE);                addOption('해남군', targetE);                addOption('영암군', targetE);
           addOption('무안군', targetE);                addOption('함평군', targetE);                addOption('영광군', targetE);
           addOption('장성군', targetE);                addOption('완도군', targetE);                addOption('진도군', targetE);
           addOption('신안군', targetE);
       }
    
       else if(val == '경상북도 '){
           addOption('포항시 남구', targetE);                addOption('포항시 북구', targetE);                addOption('경주시', targetE);
           addOption('김천시', targetE);                addOption('안동시', targetE);                addOption('구미시', targetE);
           addOption('영주시', targetE);                addOption('영천시', targetE);                addOption('상주시', targetE);                
           addOption('문경시', targetE);                addOption('경산시', targetE);                addOption('군위군', targetE);                addOption('의성군', targetE);
           addOption('청송군', targetE);                addOption('영양군', targetE);                addOption('영덕군', targetE);
           addOption('청도군', targetE);                addOption('고령군', targetE);                addOption('성주군', targetE);
           addOption('칠곡군', targetE);                addOption('예천군', targetE);                addOption('봉화군', targetE);
           addOption('울진군', targetE);                addOption('울릉군', targetE);
       }
    
       else if(val == '경상남도 '){
           addOption('의창구', targetE);                addOption('성산구', targetE);                addOption('마산합포구', targetE);
           addOption('마산회원구', targetE);                addOption('진해구', targetE);                addOption('진주시', targetE);
           addOption('통영시', targetE);                addOption('사천시', targetE);                addOption('김해시', targetE);
           addOption('밀양시', targetE);                addOption('거제시', targetE);                addOption('양산시', targetE);
           addOption('의령군', targetE);                addOption('함안군', targetE);                addOption('창녕군', targetE);
           addOption('고성군', targetE);                addOption('남해군', targetE);                addOption('하동군', targetE);
           addOption('신청군', targetE);                addOption('함양군', targetE);                addOption('거창군', targetE);
           addOption('합천군', targetE);
       }
    
       else if(val == '제주특별자치도 '){
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


