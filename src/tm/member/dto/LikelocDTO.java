package tm.member.dto;

public class LikelocDTO {
/*
CREATE TABLE likeloc (
	likeloc_num  VARCHAR2(50) NOT NULL CONSTRAINT pk_tm_likeloc_num PRIMARY KEY, -- 관심지역번호
	user_id      VARCHAR2(50) NOT NULL, -- 회원ID
	likeloc_name VARCHAR2(50) NOT NULL,  -- 지역이름
	CONSTRAINT fk_tm_likeloc_user_id FOREIGN Key (user_id) REFERENCES member(user_id)
);
 */
	private String likelocNum;
	private String userId;
	private String likelocName;
	
	public String getLikelocNum() {
		return likelocNum;
	}
	public void setLikelocNum(String likelocNum) {
		this.likelocNum = likelocNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLikelocName() {
		return likelocName;
	}
	public void setLikelocName(String likelocName) {
		this.likelocName = likelocName;
	}
	
}
