package tm.mypage.dto;

public class LikeSCDTO {
/*	
	CREATE TABLE likesc (
			likesc_num		VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_likesc_num PRIMARY KEY, -- 관심일정번호
			user_id			VARCHAR2(50)   NOT NULL,    -- 회원ID
			sc_num			VARCHAR2(50)   NOT NULL,    -- 지역이름
			likesc_reason	VARCHAR2(50)   NOT NULL,    -- 이유
		);
*/		
	private String likescNum;
	private String userId;
	private String scNum;
	private String likescReason;
	private String totalrePhoto1fake;
	private String totalreTitle;
	private String totalreLikecount;
	
	public String getTotalreTitle() {
		return totalreTitle;
	}
	public void setTotalreTitle(String totalreTitle) {
		this.totalreTitle = totalreTitle;
	}
	public String getTotalreLikecount() {
		return totalreLikecount;
	}
	public void setTotalreLikecount(String totalreLikecount) {
		this.totalreLikecount = totalreLikecount;
	}
	public String getLikescNum() {
		return likescNum;
	}
	public void setLikescNum(String likescNum) {
		this.likescNum = likescNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getScNum() {
		return scNum;
	}
	public void setScNum(String scNum) {
		this.scNum = scNum;
	}
	public String getLikescReason() {
		return likescReason;
	}
	public void setLikescReason(String likescReason) {
		this.likescReason = likescReason;
	}
	public String getTotalrePhoto1fake() {
		return totalrePhoto1fake;
	}
	public void setTotalrePhoto1fake(String totalrePhoto1fake) {
		this.totalrePhoto1fake = totalrePhoto1fake;
	}
	
	
}
