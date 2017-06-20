package tm.step3.Step3ChatWebSocketHandler;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class Step3ChatWebSocketHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + "연결 됨");
		// 웹소켓 클라이언트가 연결하면, 클라이언트 목록에 추가
		users.put(session.getId(), session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결 끊김" + session.getId());
		// 웹소켓 클라이언트가 연결이 끊으면, 클라이언트 목록에서 제거
		users.remove(session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log(session.getId() +"로 부터 메시지 수신 :" + message.getPayload());		
		// 웹소켓 클라이언트가 메세지를 전송하면, 클라이언트 목록에 저장된 모든 클라이언트에 메세지를 전달
		for(WebSocketSession s : users.values()){
			s.sendMessage(message);
			log(s.getId() + "에 메시지 발송 " + message.getPayload());
		}
	}

	@Override
	// 웹소켓 클라이언트와의 연결에 문제가 발생하면 호출됨
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + "exception 발생 :" + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
}
