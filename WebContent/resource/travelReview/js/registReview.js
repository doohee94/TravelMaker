$(function(){

	//입력 폼에서 엔터누를때 디비가는거 못하게막기
	$('#noEnter').on('keyup keypress', function(e) {
		var keyCode = e.keyCode || e.which;
		if (keyCode === 13) { 
			e.preventDefault();
			return false;
		}
	});

	//미리보기 부분
	$("#photo1").change(function(){
		showImg1(this);
	});

	$("#photo2").change(function(){
		showImg2(this);
	});

	$("#photo3").change(function(){
		showImg3(this);
	});

	$("#photo4").change(function(){
		showImg4(this);
	});



	//현재 이미지를 읽어서 미리보여줌
	function showImg1(input){	
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#photow1').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]); 
		}
	}

	function showImg2(input){	
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#photow2').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]); 
		}
	}

	function showImg3(input){	
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#photow3').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]); 
		}
	}

	function showImg4(input){	
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#photow4').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]); 
		}
	}

});