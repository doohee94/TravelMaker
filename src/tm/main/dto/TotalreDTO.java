package tm.main.dto;

public class TotalreDTO {
/*	
  	totalre
 	totalre_num      	VARCHAR2(50)  NOT NULL,		-- 전체 리뷰 번호
	user_id				VARCHAR2(50)   NOT NULL,	--회원 아이디 
	sc_num				VARCHAR2(50)   NOT NULL,	--일정 번호 
	totalre_title		VARCHAR2(50)   NOT NULL,	--리뷰 제목 
	totalre_content		VARCHAR2(1024)   NOT NULL,	--리뷰 내용 
	totalre_photo4		VARCHAR2(50)   NOT NULL,	--사진 4 
	totalre_photo4fake	VARCHAR2(500)   NOT NULL,	--사진 4 가짜 
	totalre_photo3		VARCHAR2(50)   NOT NULL,	--사진 3
	totalre_photo3fake	VARCHAR2(500)   NOT NULL,	--사진 3 가짜 
	totalre_photo2		VARCHAR2(50)   NOT NULL,	--사진 2
	totalre_photo2fake	VARCHAR2(500)   NOT NULL,	--사진 2 가짜 
	totalre_photo1		VARCHAR2(50)   NOT NULL,	--사진 1
	totalre_photo1fake	VARCHAR2(500)   NOT NULL,	--사진 1 가짜 
	totalre_likecount	VARCHAR2(50)   NOT NULL,	--좋아요수	
*/	
	private	String totalreNum;
	private	String userId;
	private	String scNum;
	private	String totalreTitle;
	private	String totalreContent;
	private	String totalrePhoto4;
	private	String totalrePhoto4fake;
	private	String totalrePhoto3;
	private	String totalrePhoto3fake;
	private	String totalrePhoto2;
	private	String totalrePhoto2fake;
	private	String totalrePhoto1;
	private	String totalrePhoto1fake;
	private	String totalreLikecount;
	
	public String getTotalreNum() {
		return totalreNum;
	}
	public void setTotalreNum(String totalreNum) {
		this.totalreNum = totalreNum;
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
	public String getTotalreTitle() {
		return totalreTitle;
	}
	public void setTotalreTitle(String totalreTitle) {
		this.totalreTitle = totalreTitle;
	}
	public String getTotalreContent() {
		return totalreContent;
	}
	public void setTotalreContent(String totalreContent) {
		this.totalreContent = totalreContent;
	}
	public String getTotalrePhoto4() {
		return totalrePhoto4;
	}
	public void setTotalrePhoto4(String totalrePhoto4) {
		this.totalrePhoto4 = totalrePhoto4;
	}
	public String getTotalrePhoto4fake() {
		return totalrePhoto4fake;
	}
	public void setTotalrePhoto4fake(String totalrePhoto4fake) {
		this.totalrePhoto4fake = totalrePhoto4fake;
	}
	public String getTotalrePhoto3() {
		return totalrePhoto3;
	}
	public void setTotalrePhoto3(String totalrePhoto3) {
		this.totalrePhoto3 = totalrePhoto3;
	}
	public String getTotalrePhoto3fake() {
		return totalrePhoto3fake;
	}
	public void setTotalrePhoto3fake(String totalrePhoto3fake) {
		this.totalrePhoto3fake = totalrePhoto3fake;
	}
	public String getTotalrePhoto2() {
		return totalrePhoto2;
	}
	public void setTotalrePhoto2(String totalrePhoto2) {
		this.totalrePhoto2 = totalrePhoto2;
	}
	public String getTotalrePhoto2fake() {
		return totalrePhoto2fake;
	}
	public void setTotalrePhoto2fake(String totalrePhoto2fake) {
		this.totalrePhoto2fake = totalrePhoto2fake;
	}
	public String getTotalrePhoto1() {
		return totalrePhoto1;
	}
	public void setTotalrePhoto1(String totalrePhoto1) {
		this.totalrePhoto1 = totalrePhoto1;
	}
	public String getTotalrePhoto1fake() {
		return totalrePhoto1fake;
	}
	public void setTotalrePhoto1fake(String totalrePhoto1fake) {
		this.totalrePhoto1fake = totalrePhoto1fake;
	}
	public String getTotalreLikecount() {
		return totalreLikecount;
	}
	public void setTotalreLikecount(String totalreLikecount) {
		this.totalreLikecount = totalreLikecount;
	}

	
}
