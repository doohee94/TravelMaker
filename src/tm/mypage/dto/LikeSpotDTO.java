package tm.mypage.dto;

public class LikeSpotDTO {
/*	
	CREATE TABLE QNA (
			likespot_num     	VARCHAR2(50)     NOT NULL CONSTRAINT pk_tm_likespot_num PRIMARY KEY, -- likespot번호
			user_id     		VARCHAR2(50)   	 NOT NULL, -- 회원ID
			likespot_name  		VARCHAR2(50)     NOT NULL, -- 관심여행지 이름
			likespot_reason     VARCHAR2(1024)   NOT NULL, -- 이유
			image_path 			VARCHAR2(1024) 	 NOT NULL, -- 이미지 주소
		);	
*/	
	private String likespotNum;
	private String userId;
	private String likespotName;
	private String likespotReason;
	private String imagePath;
	

	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getLikespotNum() {
		return likespotNum;
	}
	public void setLikespotNum(String likespotNum) {
		this.likespotNum = likespotNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLikespotName() {
		return likespotName;
	}
	public void setLikespotName(String likespotName) {
		this.likespotName = likespotName;
	}
	public String getLikespotReason() {
		return likespotReason;
	}
	public void setLikespotReason(String likespotReason) {
		this.likespotReason = likespotReason;
	}
	
	
}