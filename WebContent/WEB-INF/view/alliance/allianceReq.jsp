<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>
<body>
<br/>
<br/>
<br/>
<br/>
	<div class="container">
		<form class="form-horizontal" role="form" id="frm" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>
					<h1>제휴 등록</h1><br/>
					<h4>
					아래 내용을 작성해주시면 빠른 시일 내로<br/>
					등록된 EMAIL로 답변드리겠습니다<br/>
					</h4>
				</legend>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="txt1">회사명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="txt1" id="txt1" placeholder="회사명을 입력해주세요">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="txt2">이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="txt2" id="txt2" placeholder="이름을 입력해주세요">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="txt3">대표명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="txt3" id="txt3" placeholder="대표자 성함을 입력해주세요">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="txt4">사업자 등록번호</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="txt4" id="txt4"
							placeholder="사업자번호를 (-) 없이 입력해주세요" >
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="txt5">E-Mail</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="txt5" id="txt5"
							placeholder="E-mail 주소를 입력해주세요">
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 control-label" for="txt6">연락처</label>
					<div class="row">
						<div class="col-sm-1">
							<input type="text" class="form-control" name="txt6" id="txt6">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" name="txt7" id="txt7">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" name="txt8" id="txt8">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="txt9">파일업로드</label>
					<div class="col-sm-3">
						<input type="file" class="form-control" name="file" id="file"
							placeholder="">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="txt10">문의내용</label>
					<div class="col-sm-5">
						<textarea name="textarea" class="form-control" name="txt10" id="txt10" rows="5"></textarea>
					</div>
				</div>


				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-check"></span> 문의하기</button>
						<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> 취소</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>   
	<script type="text/javascript">
		$(".btn-info").click(function(){
			if($("#txt1").val() == "" || $("#txt1").val() == null){
				alert("회사명 누락");
				$("#txt1").focus();
				return false;
			}
			
			if($("#txt2").val() == "" || $("#txt2").val() == null){
				alert("이름 누락");
				$("#txt2").focus();
				return false;
			}
			
			if($("#txt3").val() == "" || $("#txt3").val() == null){
				alert("대표자명 누락");
				$("#txt3").focus();
				return false;
			}
			
			if($("#txt4").val() == "" || $("#txt4").val() == null){
				alert("사업자번호 누락");
				$("#txt4").focus();
				return false;
			}
			
			var pattern1=/[0-9]{10}$/;
			if(!(pattern1.test($("#txt4").val()))){
				alert("잘못된 입력");
				$("#txt4").focus();
				return false;
			}
			
			if($("#txt5").val() == "" || $("#txt5").val() == null){
				alert("E-mail 누락");
				$("#txt5").focus();
				return false;
			}
			
			var pattern2=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			if(!(pattern2.test($("#txt5").val()))){
				alert("E-mail 잘못");
				$("#txt5").focus();
				return false;
			}
			
			var pattern3=/[0-9]{2,3}$/;
			if($("#txt6").val() == "" || $("#txt6").val() == null){
				alert("전화번호 누락");
				$("#txt6").focus();
				return false;
			}
			if(!(pattern3.test($("#txt6").val()))){
				alert("전화번호 잘못된입력");
				$("#txt6").focus();
				return false;
			}
			
			var pattern4=/[0-9]{3,4}$/;
			if($("#txt7").val() == "" || $("#txt7").val() == null){
				alert("전화번호 누락");
				$("#txt7").focus();
				return false;
			}
			if(!(pattern4.test($("#txt7").val()))){
				alert("전화번호 잘못된입력");
				$("#txt7").focus();
				return false;
			}
			
			var pattern5=/[0-9]{4}$/;
			if($("#txt8").val() == "" || $("#txt8").val() == null){
				alert("전화번호 누락");
				$("#txt8").focus();
				return false;
			}
			if(!(pattern5.test($("#txt8").val()))){
				alert("전화번호 잘못된입력");
				$("#txt8").focus();
				return false;
			}
			
			if($("#txt10").val() == "" || $("#txt10").val() == null){
				alert("내용 누락");
				$("#txt10").focus();
				return false;
			}
			
			$("#frm").attr("action","allianceOk.tm");
			$("#frm").submit();
		});
	</script>

</body>
</html>