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
	private String userPw;
	private String userNick;
	private String userName;
	private String userAddr;
	private String userTel;
	private String userType;
	private String userDate;
	private String userEmail;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate.split(" ")[0];
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
}

