$(".replybtn").click(function() {
	$(this).parents().parents().attr("action", "adminQnaReply.tm");
	$(this).parents().parents().submit();
});

$("#prevPage").click(function() {
	var pageNumber = $("#pageNumber").val();
	var nextNumber = 0;
	if (pageNumber % 10 - 1 <= 0) {
		if (parseInt(pageNumber / 10) == 0) {
			var temp = parseInt(pageNumber / 10);
			nextNumber = temp * 10 + 1;
		}
	} else {
		nextNumber = pageNumber - 1;
	}
	location.href = "/tmadmin/adminQna.tm?pageNumber=" + nextNumber;
});

$("#nextPage").click(function() {
	var pageNumber = $("#pageNumber").val();
	var totalpage = $("#totalpage").val();
	var nextNumber = 0;

	if (pageNumber + 1 > totalpage) {
		nextNumber = totalpage;
	} else {
		nextNumber = parseInt(pageNumber) + 1;
	}

	location.href = "/tmadmin/adminQna.tm?pageNumber=" + nextNumber;
});