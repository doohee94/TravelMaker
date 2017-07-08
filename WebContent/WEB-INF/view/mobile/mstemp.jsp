<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jQuery Mobile 기본구조 -->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet" href="/resource/mobile/css/base.css" />
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<div data-role="page" id="pageone">
		<div data-role="header">
			<img id="logo" src="/resource/mobile/images/samplelogo.png" />
		</div>

		<div data-role="main" class="ui-content">
			<br />
			<div class="images">
				<c:choose>
					<c:when test="${empty result }">
						<img id="stamp" src="/resource/mobile/images/d-stamp.png" />
					</c:when>
					<c:otherwise>
						<img id="stamp" src="/resource/mobile/images/stamp.png" />
					</c:otherwise>
				</c:choose>
				
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
			</div>
			<div id="result">
			<c:choose>
				<c:when test="${empty result }">
					<form action="insert.tm" method="post">
						<input type="hidden" id="parstempNum" name="parstempNum" value="${parstempNum }" />
						<input type="submit" class="ui-btn ui-corner-all" value="스템프 찍기" id="btnok">
					</form>
				</c:when>
				<c:otherwise>
					찍은 날짜 : ${checkdate }
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>

</body>
</html>
