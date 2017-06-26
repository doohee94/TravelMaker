package tm.mypage.dto;

public class LikeSpotDTO {
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