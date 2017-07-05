

$(function() {
	// step2 로 페이지 이동시 나오는 로딩화면
	$(function() {
		$("#loading").hide();

		$(".nextbtnstep2").click(function(event) {
			//form 태그에 있는 정보를 중간 정보 저장공간에 넣어주고 그걸  hidden 에 넣어주기
			
			//중간 저장공간에 넣어줌.
			temptitle = $(".traveltitle").val();
			templiststart = $(".liststart").val();
			templistthrough = $(".listthrough").val();
			templistarrival = $(".listarrival").val();
			tempfellowpeople = $(".fellowpeople").val();
			tempstartdate = $("#startdate").val();
			tempenddate =  $("#arrivaldate").val();
			
			// hidden에 넣어줌.
			$("#ttitle").val(temptitle);
			$("#sregion").val(templiststart);
			$("#tregion").val(templistthrough);
			$("#aregion").val(templistarrival);
			$("#ffellow").val(tempfellowpeople);
			$("#stdate").val(tempstartdate);
			$("#enddate").val(tempenddate);
			//hidden에 넣어준 값을 넘겨주기.
			//
		    
		    //#("#infofrm").attr('action=');
		    $("#hiddeninfofrm").submit();
//		    var url = "/step1/step1.tm";
//		    $(location).attr('href', url);
		    $(".container").hide();
		    $(".navbar").hide();
		    $("#loading").show();

		});
	});
		// 동행자 팝업 창에서 완료 버튼을 누르면 리스트에 나온 값들을 동행자 버튼 왼쪽 텍스트공간에
		// 적어 끌고오기
//		$(".ftokbtn").click(function(){
//			var idgroup= $("#idlist").val();
//			
//			$("#fellowpeople").val(idgroup);
//			
//		});
//		
		
		$(document).on('click', '.ftokbtn', function(){
			
			// step1 동행자 공간 id,class 는 fellowpeople
			// 선택된 아이디가 있는 곳은 li 의 class mbulli 
			
			// 동행자 팝업 창에서 선택된 아이디 값을 모달창에서 step1 페이지 동행자란에 가져오기.
			var idgroup = $(".modal-body-bottom").find(".mbulli").text();
			
			$("#fellowpeople").val(idgroup);
			
		});
		// 아이디를 검색후 o 버튼을 누르면 선택한 아이디가 modal-body 하단에 기입되는 기능.
		$(document).on('click', '.okbtn', function(){
			$(".mbbul").append("<li class='mbulli'>"+$(this).prev().prev().prev().val()+" ");
		});
	
		//동행자 팝업 창에서 x 버튼 (close 버튼) 누르면 동행자 목록이 초기화.
		$(".close").click(function(){
			// 동행자 목록 초기화
			$(".modal-body").find(".secondtr *").detach();
			// 동행자 목록에서 선택한 아이디 값들을 초기화
			$(".modal-body-bottom").find(".mbbul *").detach();
		});

		$(".ftrsbtn").click(function(){
			// 동행자 목록 초기화
//			$(".modal-body").find
			$(".secondtr *").detach();
			// 동행자 목록에서 선택한 아이디 값들을 초기화
//			$(".modal-body-bottom").find
			$(".mbbul *").detach();
		});
		
		// 동행자 팝업 창에서 search 버튼 눌렀을때
		$("#modalsearchbtn").click(function(){
			
			$("#modalfrm").submit();
//			$(".idlistfrm").append( 
//					"<c:forEach var='row' items='${map.list}'>"+
//					
//					"<label class='idlb'>ID</label>"+
//					"<input type='textarea' value='' class='idlist' id='idlist' name='idlist'>" +
//					"<label class='nicklb'>닉네임</label>"+
//					"<input type+'textarea' value='' class='nicklist' id='nicklist' name='nicklist'>" +
//					"<input type='button' value='O' id='okbtn' class='okbtn'>"+
//					"<br/>"+
//					
//					"</c:forEach>"
//					
//					);
			
			//검색창의 내용을 con 이라는 변수에 저장.
//			var con = $("#modalsearchplace").val() ;
//			$.ajax({
//				url :"/step1/setp1searchfellow.tm" ,
//				type : "POST" ,
//				data : {"con":con},
//				dataType :"json" ,
//				success: function(data){
//					alert('11');
					//내용값을 지우고
//					$(".idlistfrm *").detach();
					//결과 리스트를 읽어와서 추가 
//					for(var i =0; i < data.length; i++){
////						$(".idlistfrm").append(
//							"<input type='textarea' value='"+data[i].userId+"' class='idlist' id='idlist' name='idlist'>"+
//							"<input type+'textarea' value='"+data[i].userNick+"'class='nicklist' id='nicklist' name='nicklist'>" +
//							"<input type='button' value='O' id='okbtn' class='okbtn'>"
//							);
//					}
//				}
				
			});
		
		
	
		// 제목 입력란 유효성 글자 25자 내로 입력
		$('.traveltitle').on('keydown', function() {
			if ($(this).val().length > 25) {
				$(this).val($(this).val().substring(0, 25));
			}

		});

		//경유지 리셋 버튼 기능
		$(".reset").click(function() {

			$(".listthrough").val("");
			temp='';

		});
		
		//출발날짜 도착날짜 
		//datepicker1 = 출발날짜, datepicker2 = 도착날짜
		$("#startdate").datepicker({
			minDate : 0,
			dateFormat : "yy-mm-dd",
			onSelect : function(selected) {
				$("#arrivaldate").datepicker("option", "minDate", selected)
			}
		});
		
		$("#arrivaldate").datepicker({
			minDate : 0,
			dateFormat : "yy-mm-dd",
			onSelect : function(selected) {
				$("#startdate").datepicker("option", "maxDate", selected)
			}
		});

		
		//여행지 지역 메뉴 탭의 하위 메뉴 펼치기/접기
		
		//출발지 탭
		//출발지 탭 강원도 펼치기/접기
		$(".Gangwondo").click(function() {
			// 현재 클릭한 태그가 a 이기 때문에
			// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
			//             $(".Gangwondodiv").show();

			var con = document.getElementById("Gangwondodiv");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}

			// 		$(".Gangwondodiv").css("display","block");
		});
		
		//출발지 탭 경기도 펼치기/접기
		$(".Gyeonggido").click(function() {
			var con = document.getElementById("Gyeonggidodiv");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
			//         	  $(".Gyeonggidodiv").slideToggle("fast");
		});

		//출발지 탭 경상남도 펼치기/접기
		$(".Gyeongsangnamdo").click(function() {
			var con = document.getElementById("Gyeongsangnamdodiv");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
			//         	$(".Gyeongsangnamdodiv").slideToggle("fast");
		});

		//출발지 탭 경상북도 펼치기/접기
		$(".Gyeongsangbukdo").click(function() {
			var con = document.getElementById("Gyeongsangbukdodiv");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
			//         	 $(".Gyeongsangbukdodiv").slideToggle("fast");
		});

		//출발지 탭 전라남도 펼치기/접기
		$(".Jeollanamdo").click(function() {
			var con = document.getElementById("Jeollanamdodiv");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//출발지 탭 전라북도 펼치기/접기
		$(".Jeollabukdo").click(function() {
			var con = document.getElementById("Jeollabukdodiv");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//출발지 탭 충청남도 펼치기/접기
		$(".Chungcheongnamdo").click(function() {
			var con = document.getElementById("Chungcheongnamdodiv");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//출발지 탭 충청북도 펼치기/접기
		$(".Chungcheongbukdo").click(function() {
			var con = document.getElementById("Chungcheongbukdodiv");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//경유지 탭
		//경유지 탭 강원도 접기/펼치기
		$(".Gangwondo2").click(function() {
			// 현재 클릭한 태그가 a 이기 때문에
			// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
			//            $(".Gangwondodiv").show();

			var con = document.getElementById("Gangwondodiv2");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}

			//		$(".Gangwondodiv").css("display","block");
		});

		//경유지 탭 경기도 접기/펼치기
		$(".Gyeonggido2").click(function() {
			var con = document.getElementById("Gyeonggidodiv2");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
			//        	  $(".Gyeonggidodiv").slideToggle("fast");
		});

		////경유지 탭 경상남도 접기/펼치기
		$(".Gyeongsangnamdo2").click(function() {
			var con = document.getElementById("Gyeongsangnamdodiv2");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
			//        	$(".Gyeongsangnamdodiv").slideToggle("fast");
		});

		//경유지 탭 경상북도 접기/펼치기
		$(".Gyeongsangbukdo2").click(function() {
			var con = document.getElementById("Gyeongsangbukdodiv2");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
			//        	 $(".Gyeongsangbukdodiv").slideToggle("fast");
		});

		//경유지 탭 전라남도 접기/펼치기
		$(".Jeollanamdo2").click(function() {
			var con = document.getElementById("Jeollanamdodiv2");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//경유지 탭 전라남도 접기/펼치기
		$(".Jeollabukdo2").click(function() {
			var con = document.getElementById("Jeollabukdodiv2");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});
		
		////경유지 탭 충청남도 접기/펼치기
		$(".Chungcheongnamdo2").click(function() {
			var con = document.getElementById("Chungcheongnamdodiv2");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//경유지 탭 충청북도 접기/펼치기
		$(".Chungcheongbukdo2").click(function() {
			var con = document.getElementById("Chungcheongbukdodiv2");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//도착지 탭
		//도착지 탭 강원도 접기/펼치기
		$(".Gangwondo3").click(function() {
			// 현재 클릭한 태그가 a 이기 때문에
			// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
			//           $(".Gangwondodiv").show();

			var con = document.getElementById("Gangwondodiv3");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}

			//		$(".Gangwondodiv").css("display","block");
		});

		//도착지 탭 경기도 접기/펼치기
		$(".Gyeonggido3").click(function() {
			var con = document.getElementById("Gyeonggidodiv3");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
			//       	  $(".Gyeonggidodiv").slideToggle("fast");
		});

		//도착지 탭 경상남도 접기/펼치기
		$(".Gyeongsangnamdo3").click(function() {
			var con = document.getElementById("Gyeongsangnamdodiv3");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
			//       	$(".Gyeongsangnamdodiv").slideToggle("fast");
		});

		//도착지 탭 경상북도 접기/펼치기
		$(".Gyeongsangbukdo3").click(function() {
			var con = document.getElementById("Gyeongsangbukdodiv3");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
			//       	 $(".Gyeongsangbukdodiv").slideToggle("fast");
		});

		//도착지 탭 전라남도 접기/펼치기
		$(".Jeollanamdo3").click(function() {
			var con = document.getElementById("Jeollanamdodiv3");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//도착지 탭 전라북도 접기/펼치기
		$(".Jeollabukdo3").click(function() {
			var con = document.getElementById("Jeollabukdodiv3");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//도착지 탭 충청남도 접기/펼치기
		$(".Chungcheongnamdo3").click(function() {
			var con = document.getElementById("Chungcheongnamdodiv3");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//도착지 탭 충청북도 접기/펼치기
		$(".Chungcheongbukdo3").click(function() {
			var con = document.getElementById("Chungcheongbukdodiv3");
			if (con.style.display == "none") {
				con.style.display = "block";
			} else {
				con.style.display = "none";
			}
		});

		//여행지 버튼클릭 이벤트
		
		// 출발지 탭
		//여행지 지역 선택 3행으로 이루어진상태
		var tempstart;
		
		//1행 travelregion
		$(".wrap .city0 .a").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});
		
		//2행 travelregion
		$(".wrap .city1 .a").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});
		
		//3행 travelregion
		$(".wrap .city2 .a").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});

		/** 강원도 하위 버튼 (travelregion)*/
		$(".wrap .Gangwondodiv input").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});
		
		/** 경기도 하위 버튼 (travelregion)*/
		$(".wrap .Gyeonggidodiv input").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});

		/** 경상남도 하위 버튼 (travelregion)*/
		$(".wrap .Gyeongsangnamdodiv input").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});
		/** 경상북도 하위 버튼 (travelregion)*/
		$(".wrap .Gyeongsangbukdodiv input").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});
		/** 전남 하위 버튼 (travelregion)*/
		$(".wrap .Jeollanamdodiv input").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});
		/** 전북 하위 버튼 (travelregion)*/
		$(".wrap .Jeollabukdodiv input").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});
		/** 충남 하위 버튼 (travelregion)*/
		$(".wrap .Chungcheongnamdodiv input").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});
		/** 충북 하위 버튼 (travelregion)*/
		$(".wrap .Chungcheongbukdodiv input").click(function() {
			tempstart= $(this).val();
			$(".liststart").val(tempstart);
		});

		/** 1행 travelregion2 */
		var temp=[];
		$(".wrap .city0 .b").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});
		/** 2행 travelregion*/
		$(".wrap .city1 .b").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});
		/** 3행 travelregion*/
		$(".wrap .city2 .b").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});

		/** 강원도 하위 버튼 (travelregion2)*/
		$(".wrap .Gangwondodiv2 input").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});
		/** 경기도 하위 버튼 (travelregion2)*/
		$(".wrap .Gyeonggidodiv2 input").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});

		/** 경상남도 하위 버튼 (travelregion2)*/
		$(".wrap .Gyeongsangnamdodiv2 input").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});
		/** 경상북도 하위 버튼 (travelregion2)*/
		$(".wrap .Gyeongsangbukdodiv2 input").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});
		/** 전남 하위 버튼 (travelregion2)*/
		$(".wrap .Jeollanamdodiv2 input").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});
		/** 전북 하위 버튼 (travelregion2)*/
		$(".wrap .Jeollabukdodiv2 input").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});
		/** 충남 하위 버튼 (travelregion2)*/
		$(".wrap .Chungcheongnamdodiv2 input").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});
		/** 충북 하위 버튼 (travelregion2)*/
		$(".wrap .Chungcheongbukdodiv2 input").click(function() {
			temp += $(this).val()+">";
			$(".listthrough").val(temp);
		});

		/** 1행 travelregion3 */
		$(".wrap .city0 .c").click(function() {
			// 			$(".container .liststart").val($(this).val());
			$(".listarrival").val($(this).val());
		});
		/** 2행 travelregion*/
		$(".wrap .city1 .c").click(function() {
			$(".listarrival").val($(this).val());
		});
		/** 3행 travelregion*/
		$(".wrap .city2 .c").click(function() {
			$(".listarrival").val($(this).val());
		});

		/** 강원도 하위 버튼 (travelregion3)*/
		$(".wrap .Gangwondodiv3 input").click(function() {
			$(".listarrival").val($(this).val());
		});
		/** 경기도 하위 버튼 (travelregion3)*/
		$(".wrap .Gyeonggidodiv3 input").click(function() {
			$(".listarrival").val($(this).val());
		});

		/** 경상남도 하위 버튼 (travelregion3)*/
		$(".wrap .Gyeongsangnamdodiv3 input").click(function() {
			$(".listarrival").val($(this).val());
		});
		/** 경상북도 하위 버튼 (travelregion3)*/
		$(".wrap .Gyeongsangbukdodiv3 input").click(function() {
			$(".listarrival").val($(this).val());
		});
		/** 전남 하위 버튼 (travelregion3)*/
		$(".wrap .Jeollanamdodiv3 input").click(function() {
			$(".listarrival").val($(this).val());
		});
		/** 전북 하위 버튼 (travelregion3)*/
		$(".wrap .Jeollabukdodiv3 input").click(function() {
			$(".listarrival").val($(this).val());
		});
		/** 충남 하위 버튼 (travelregion3)*/
		$(".wrap .Chungcheongnamdodiv3 input").click(function() {
			$(".listarrival").val($(this).val());
		});
		/** 충북 하위 버튼 (travelregion3)*/
		$(".wrap .Chungcheongbukdodiv3 input").click(function() {
			$(".listarrival").val($(this).val());
		});

	});


