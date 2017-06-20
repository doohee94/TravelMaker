var wsocket;

	$(document).ready(function() {
		connect();
		
		
		$("#chat_text").keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				send();
			}
			event.stopPropagation();
		});
		
		$("#send").click(function() {
			send();
		});
	
	});

	function connect() {
		wsocket = new WebSocket("Ws://192.168.0.104:8080/WebSocket/chat-ws");
		wsocket.onopen = onOpen;
		wsocket.onclose = onClose;
		wsocket.onmessage = onMessage;
	}
	
	function disconnect() {
		wsocket.close();
	}
	
	function send() {
		var nickname = "내아이디";
		var msg = $("#chat_text").val();
		wsocket.send("msg:" + nickname + ":" + msg);
		$("#chat_text").val("");
	}	
	
	function onOpen(evt) {
		appendMessage("연결되었습니다.");
	}
	
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}

	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}


	function appendMessage(msg) {
		$("#chatMessageArea").append(msg + "<br>");
		
		  $("#chat_body").append(' <div class="row message-bubble">'+
                  '<p class="text-muted">'+'누가보내찌'+'</p>'+
                  '<p>'+msg+'</p></div>');

		
		
		var chatAreaHeight = $("#chatArea").height();
		 $("#chat_body").scrollTop($("#chat_body")[0].scrollHeight); 
	}
	