 /* 유효성처리 */
 $(function(){
  $("#update").click(function(){ 
		
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

 
	/* 회원수정 수정버튼 눌림시 완료버튼 뜨게 */
	$(function(){
			$("#insertbutton").hide();
			$("#userPasswordcheck").hide();
		$("#updatebutton").click(function(){
			$("#insertbutton").show();
			$("#userPasswordcheck").show();
			$("#updatebutton").hide();
		});
		
		/* 관심일정 수정버튼 눌림시 완료버튼 뜨게 */
			$("#insertsel").hide();
		$("#updatesel").click(function(){
			$("#insertsel").show();
			$("#updatesel").hide();
		});
		
		/* 수정버튼 누르면 readonly 해제 */
		$("#updatebutton").click(function(){
			$("#userPw").removeAttr("readonly");
			$("#userPasswordcheck").removeAttr("readonly");
			$("#userName").removeAttr("readonly");
			$("#userNick").removeAttr("readonly");
			$("#userTel").removeAttr("readonly");
			$("#userEmail").removeAttr("readonly");
			$("#localplus").removeAttr("readonly");
		});
	});
	
	/* 비밀번호 체크 */
	$(function(){
		  $('#userPw').keyup(function(){
		   $('font[name=passcheck]').text('');
		   $('font[name=passcheck]').text('');
		  }); //#userPw.keyup

		  $('#userPasswordcheck').keyup(function(){
		   if($('#userPw').val()!=$('#userPasswordcheck').val()){
		    $('font[name=passcheck]').html("<span style='color: red'>암호틀림</span>");
		   }else{
		    $('font[name=passcheck]').html("<span style='color: blue'>암호맞음</span>");
		   }
		  }); //#passwordcheck.keyup
		 });

	/* 비밀번호 확인 보이게 안보이게 */
	$(function(){
			$("#passcheck").hide();
		$("#userPasswordcheck").keyup(function(){
			$("#passcheck").show();
			$("#pw-block").hide();
		});
	});
	
	/* 회원가입시 입력했던 주소값 가져오기 */
	$(function(){
		
		$("#userCity").change(doChange);
		$("#selOne").change(doChange);
		$("#selTwo").change(doChange);
		$("#selThree").change(doChange);
		
		var str = $("#userCitydto").val();
		var str2 = $("#userBoroughdto").val();
		
		$("#userCity").find("option").each(function(){
			if($(this).val().match(str) != null){
				$(this).attr("selected","selected");
				$("#userCity").trigger("change");
			}
		});
		
		$("#userBorough").find("option").each(function(){
			if($(this).val().match(str2) != null){
				$(this).attr("selected","selected");
			}
		});
		
		var si = ['서울특별시','대구광역시','인천광역시','광주광역시','대전광역시','울산광역시','부산광역시'];

		var dos = ['경기도','강원도','충청북도','충청남도','전라북도','전라남도','경상북도','경상남도','제주특별자치도'];

		var loc0 =
		['광명시','평택시','과천시','오산시','시흥시','군포시','의왕시','하남시','이천시','안성시','김포시','화성시','광주시','여주시','부천시','양평군','고양시','일산시','의정부시','동두천시','구리시','남양주시','파주시','양주시','포천시','연천군','가평군'];
		    
		var loc1 =
		['춘천시','원주시','강릉시','동해시','태백시','속초시','삼척시','홍천군','횡성군','영월군','평창군','정선군','철원군','화천군','양구군','인제군','고성군','양양군'];
		    
		var loc2 =
		['청주시','충주시','제천시','보은군','옥천군','영동군','진천군','괴산군','음성군','단양군','증평군'];
		    
		var loc3 =
		['천안시','공주시','보령시','아산시','서산시','논산시','계롱시','당진시','금산군','부여군','서천군','청양군','홍성군','예산군','태안군'];
		       
		var loc4 =
		['전주시','군산시','익산시','정읍시','남원시','김제시','완주군','진안군','무주군','장수군','임실군','순창군','고창군','부안군'];
		    
		var loc5 =
		['목포시','여수시','순천시','나주시','광양시','담양군','곡성군','구례군','고흥군','보성군','화순군','장흥군','강진군','해남군','영암군','무안군','함평군','영광군','장성군','완도군','진도군','신안군'];
		    
		var loc6 =
		['포항시','포항시','경주시','김천시','안동시','구미시','영주시','영천시','상주시','문경시','경산시','군위군','의성군','청송군','영양군','영덕군','청도군','고령군','성주군','칠곡군','예천군','봉화군','울진군','울릉군'];
		    
		var loc7 =
		['창원시','진주시','통영시','사천시','김해시','밀양시','거제시','양산시','의령군','함안군','창녕군','고성군','남해군','하동군','신청군','함양군','거창군','합천군'];

		var loc8 =
		['제주시','서귀포시'];
		
		
		var OneCity = $("#OneCity").val();
		var TwoCity = $("#TwoCity").val();
		var ThrCity = $("#ThrCity").val();
		var temp = "";
		var state = 0;
		for(var i = 0 ; i < si.length ; i++){
			if(si[i].match(OneCity) != null){
				temp = si[i];
				state = 1;
			}
		}
		
		
		for(var j = 1 ;  j < 9 ; j++){
			for(var i = 0 ; i < (eval('loc'+j)).length  ; i++){
				if((eval('loc'+j))[i].match(OneCity) != null){
					temp = dos[j];
					state = 2;
				}
			}
		}
		
		if(OneCity == ""){
			state = 0;
		}
		if(state == 0){
			
		}else if(state == 1){
			$("#selOne").find("option").each(function(){
				if($(this).val().match(temp) != null){
					$(this).attr("selected","selected");
					$("#selOne").trigger("change");
				}
			});
		}else{
			$("#selOne").find("option").each(function(){
				if($(this).val().match(temp) != null){
					$(this).attr("selected","selected");
					$("#selOne").trigger("change");
					$("#oneSel").find("option").each(function(){
						if($(this).val().match(OneCity) != null){
							$(this).attr("selected","selected");
						}
					});
				}
			});
		}
		
		
		for(var i = 0 ; i < si.length ; i++){
			if(si[i].match(TwoCity) != null){
				temp = si[i];
				state = 1;
			}
		}
		
		for(var j = 1 ;  j < 9 ; j++){
			for(var i = 0 ; i < (eval('loc'+j)).length  ; i++){
				if((eval('loc'+j))[i].match(TwoCity) != null){
					temp = dos[j];
					state = 2;
				}
			}
		}
		
		if(TwoCity == ""){
			state = 0;
		}
		
		if(state == 0){
			
		}else if(state == 1){
			$("#selTwo").find("option").each(function(){
				if($(this).val().match(temp) != null){
					$(this).attr("selected","selected");
					$("#selTwo").trigger("change");
				}
			});
		}else{
			$("#selTwo").find("option").each(function(){
				if($(this).val().match(temp) != null){
					$(this).attr("selected","selected");
					$("#selTwo").trigger("change");
					$("#twoSel").find("option").each(function(){
						if($(this).val().match(TwoCity) != null){
							$(this).attr("selected","selected");
						}
					});
				}
			});
		}
		
		
		for(var i = 0 ; i < si.length ; i++){
			if(si[i].match(ThrCity) != null){
				temp = si[i];
				state = 1;
			}
		}
		
		for(var j = 1 ;  j < 9 ; j++){
			for(var i = 0 ; i < (eval('loc'+j)).length  ; i++){
				if((eval('loc'+j))[i].match(ThrCity) != null){
					temp = dos[j];
					state = 2;
				}
			}
		}
		
		if(ThrCity == ""){
			state = 0;
		}
		if(state == 0){
			
		}else if(state == 1){
			$("#selThree").find("option").each(function(){
				if($(this).val().match(temp) != null){
					$(this).attr("selected","selected");
					$("#selThree").trigger("change");
				}
			});
		}else{
			$("#selThree").find("option").each(function(){
				if($(this).val().match(temp) != null){
					$(this).attr("selected","selected");
					$("#selThree").trigger("change");
					$("#threeSel").find("option").each(function(){
						if($(this).val().match(ThrCity) != null){
							$(this).attr("selected","selected");
						}
					});
				}
			});
		}

	});
	
	
	
	
	
	/* 시도 눌렀을 때 나오는 구 */
	function doChange(){
	    var val = $(this).val();
	    var targetE = $(this).next();
	    targetE.find("option").remove();
	    

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
	      	 addOption('조치원읍', targetE);                 addOption('세종시', targetE);
	      }
	    
	       else if(val == '경기도 '){
	           addOption('광명시', targetE);
	           addOption('평택시', targetE);                addOption('과천시', targetE);                addOption('오산시', targetE);
	           addOption('시흥시', targetE);                addOption('군포시', targetE);                addOption('의왕시', targetE);
	           addOption('하남시', targetE);                addOption('이천시', targetE);                addOption('안성시', targetE);
	           addOption('김포시', targetE);                addOption('화성시', targetE);                addOption('광주시', targetE);
	           addOption('여주시', targetE);                addOption('부천시', targetE);                addOption('양평군', targetE);
	           addOption('고양시', targetE);                addOption('일산', targetE); 
	           addOption('의정부시', targetE);                addOption('동두천시', targetE);                addOption('구리시', targetE);
	           addOption('남양주시', targetE);                addOption('파주시', targetE);                addOption('양주시', targetE);
	           addOption(' 포천시', targetE);                addOption(' 연천군', targetE);                addOption('가평군', targetE);
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
	           addOption('청주시', targetE);                addOption('충주시', targetE);                addOption('제천시', targetE);
	           addOption('보은군', targetE);                addOption('옥천군', targetE);                addOption('영동군', targetE);
	           addOption('진천군', targetE);                addOption('괴산군', targetE);                addOption('음성군', targetE);
	           addOption('단양군', targetE);                addOption('증평군', targetE);
	           }
	    
	       else if(val == '충청남도 '){
	           addOption('천안시', targetE);                addOption('공주시', targetE);
	           addOption('보령시', targetE);                addOption('아산시', targetE);                addOption('서산시', targetE);
	           addOption('논산시', targetE);                addOption('계롱시', targetE);                addOption('당진시', targetE);
	           addOption('금산군', targetE);                addOption('부여군', targetE);                addOption('서천군', targetE);
	           addOption('청양군', targetE);                addOption('홍성군', targetE);                addOption('예산군', targetE);
	           addOption('태안군', targetE);
	           }
	       else if(val == '전라북도 '){
	           addOption('전주시', targetE);                addOption('군산시', targetE);
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
	           addOption('포항시', targetE);                addOption('포항시', targetE);                addOption('경주시', targetE);
	           addOption('김천시', targetE);                addOption('안동시', targetE);                addOption('구미시', targetE);
	           addOption('영주시', targetE);                addOption('영천시', targetE);                addOption('상주시', targetE);                
	           addOption('문경시', targetE);                addOption('경산시', targetE);                addOption('군위군', targetE);                addOption('의성군', targetE);
	           addOption('청송군', targetE);                addOption('영양군', targetE);                addOption('영덕군', targetE);
	           addOption('청도군', targetE);                addOption('고령군', targetE);                addOption('성주군', targetE);
	           addOption('칠곡군', targetE);                addOption('예천군', targetE);                addOption('봉화군', targetE);
	           addOption('울진군', targetE);                addOption('울릉군', targetE);
	       }
	    
	       else if(val == '경상남도 '){
	           addOption('창원시', targetE);                addOption('진주시', targetE);
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
	            e.append("<option value="+value+">"+value+"</option>");
	        }

	        function removeAll(e){
	            for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
	                e.remove(1);
	            }
	        }