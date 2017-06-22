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
					<label class="col-sm-3 control-label" for="partnerComname">회사명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerComname" id="partnerComname" placeholder="회사명을 입력해주세요">
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerCeoname">대표명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerCeoname" id="partnerCeoname" placeholder="대표자 성함을 입력해주세요">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerReginum">사업자 등록번호</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerReginum" id="partnerReginum"
							placeholder="사업자번호를 (-) 없이 입력해주세요" >
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerEmail">E-Mail</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="partnerEmail" id="partnerEmail"
							placeholder="E-mail 주소를 입력해주세요">
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 control-label" for="partnerTel1">연락처</label>
					<div class="row">
						<div class="col-sm-1">
							<input type="text" class="form-control" name="partnerTel1" id="partnerTel1">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" name="partnerTel2" id="partnerTel2">
						</div>
						<div class="col-sm-1">
							<input type="text" class="form-control" name="partnerTel3" id="partnerTel3">
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
					<label class="col-sm-3 control-label" for="partnerContent">문의내용</label>
					<div class="col-sm-5">
						<textarea class="form-control" name="partnerContent" id="partnerContent" rows="5"></textarea>
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
			if($("#partnerComname").val() == "" || $("#partnerComname").val() == null){
				alert("회사명 누락");
				$("#partnerComname").focus();
				return false;
			}
			
			if($("#partnerCeoname").val() == "" || $("#partnerCeoname").val() == null){
				alert("대표자명 누락");
				$("#partnerCeoname").focus();
				return false;
			}
			
			if($("#partnerReginum").val() == "" || $("#partnerReginum").val() == null){
				alert("사업자번호 누락");
				$("#partnerReginum").focus();
				return false;
			}
			
			var pattern1=/[0-9]{10}$/;
			if(!(pattern1.test($("#partnerReginum").val()))){
				alert("잘못된 입력");
				$("#partnerReginum").focus();
				return false;
			}
			
			if($("#partnerEmail").val() == "" || $("#partnerEmail").val() == null){
				alert("E-mail 누락");
				$("#partnerEmail").focus();
				return false;
			}
			
			var pattern2=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			if(!(pattern2.test($("#partnerEmail").val()))){
				alert("E-mail 잘못");
				$("#partnerEmail").focus();
				return false;
			}
			
			var pattern3=/[0-9]{2,3}$/;
			if($("#partnerTel1").val() == "" || $("#partnerTel1").val() == null){
				alert("전화번호 누락");
				$("#partnerTel1").focus();
				return false;
			}
			if(!(pattern3.test($("#partnerTel1").val()))){
				alert("전화번호 잘못된입력");
				$("#partnerTel1").focus();
				return false;
			}
			
			var pattern4=/[0-9]{3,4}$/;
			if($("#partnerTel2").val() == "" || $("#partnerTel2").val() == null){
				alert("전화번호 누락");
				$("#partnerTel2").focus();
				return false;
			}
			if(!(pattern4.test($("#partnerTel2").val()))){
				alert("전화번호 잘못된입력");
				$("#partnerTel2").focus();
				return false;
			}
			
			var pattern5=/[0-9]{4}$/;
			if($("#partnerTel3").val() == "" || $("#partnerTel3").val() == null){
				alert("전화번호 누락");
				$("#partnerTel3").focus();
				return false;
			}
			if(!(pattern5.test($("#partnerTel3").val()))){
				alert("전화번호 잘못된입력");
				$("#partnerTel3").focus();
				return false;
			}
			
			if($("#partnerContent").val() == "" || $("#partnerContent").val() == null){
				alert("내용 누락");
				$("#partnerContent").focus();
				return false;
			}
			
			$("#frm").attr("action","allianceOk.tm");
			$("#frm").submit();
		});
	</script>

</body>
</html>