package tm.member.dto;

public class MemberDTO {
	/*
	CREATE TABLE member (
			  user_id       VARCHAR2(50)    NOT NULL CONSTRAINT pk_tm_user_id PRIMARY KEY, -- 회원ID
			  user_pw       VARCHAR2(50)    NOT NULL, -- 비밀번호
			  user_name     VARCHAR2(10)    NOT NULL, -- 이름
			  user_nick     VARCHAR2(50)    NOT NULL, -- 닉네임
			  user_addr     VARCHAR2(100)   NOT NULL, -- 주소
			  user_tel      VARCHAR2(50)    NOT NULL, -- 전화번호
			  user_email	VARCHAR2(50)	NOT NULL, -- 이메일
			  user_type     NUMBER          NOT NULL, -- 회원타입
			  user_date     DATE            NOT NULL  -- 가입날짜
			);
	*/
	private String userId;
	private String userPw;
	private String userName;
	private String userNick;
	private String userCity;
	private String userBorough;
	private String userAddr;
	private String userTel;
	private String userEmail;
	private int userType;
	private String userDate;
	private String selOneCity;
	private String selOneBorough;
	private String selTwoCity;
	private String selTwoBorough;
	private String selThrCity;
	private String selThrBorough;
	
	
	
	
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserCity() {
		return userCity;
	}
	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}
	public String getUserBorough() {
		return userBorough;
	}
	public void setUserBorough(String userBorough) {
		this.userBorough = userBorough;
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	public String getSelOneCity() {
		return selOneCity;
	}
	public void setSelOneCity(String selOneCity) {
		this.selOneCity = selOneCity;
	}
	public String getSelOneBorough() {
		return selOneBorough;
	}
	public void setSelOneBorough(String selOneBorough) {
		this.selOneBorough = selOneBorough;
	}
	public String getSelTwoCity() {
		return selTwoCity;
	}
	public void setSelTwoCity(String selTwoCity) {
		this.selTwoCity = selTwoCity;
	}
	public String getSelTwoBorough() {
		return selTwoBorough;
	}
	public void setSelTwoBorough(String selTwoBorough) {
		this.selTwoBorough = selTwoBorough;
	}
	public String getSelThrCity() {
		return selThrCity;
	}
	public void setSelThrCity(String selThrCity) {
		this.selThrCity = selThrCity;
	}
	public String getSelThrBorough() {
		return selThrBorough;
	}
	public void setSelThrBorough(String selThrBorough) {
		this.selThrBorough = selThrBorough;
	}
	
}
