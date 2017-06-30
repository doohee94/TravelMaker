package tm.step1.dto;

public class Step1DTO {
	/*
	CREATE TABLE member (
	  user_id       VARCHAR2(50)    NOT NULL CONSTRAINT pk_tm_user_id PRIMARY KEY, -- 회원ID
	  user_pw       VARCHAR2(50)    NOT NULL, -- 비밀번호
	  user_nick     VARCHAR2(50)    NOT NULL, -- 닉네임
	  user_name     VARCHAR2(50)    NOT NULL, -- 이름
	  user_addr     VARCHAR2(100)   NOT NULL, -- 주소
	  user_tel      VARCHAR2(50)    NOT NULL, -- 전화번호
	  user_type     NUMBER          NOT NULL, -- 회원타입
	  user_date     DATE            NOT NULL, -- 가입날짜
	  user_email	VARCHAR2(50)	NOT NULL  -- 이메일
	);
		 */
	private String userId;
	private String userName;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}

