package tm.mobile.dto;

public class MoblieStemoDTO {
	/*
CREATE TABLE stemp (
	stemp_num     VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_stemp_num PRIMARY KEY, -- 스템프 번호
	parstemp_num   VARCHAR2(50)   NOT NULL, -- 제휴 스템프 번호
	user_id       VARCHAR2(50)   NOT NULL, -- 회원ID
	stemp_date    DATE,                    -- 찍은 날짜
	CONSTRAINT fk_tm_stemp_user_id FOREIGN Key (user_id) REFERENCES member(user_id),
    CONSTRAINT fk_tm_stemp_parstemp_num FOREIGN Key (parstemp_num) REFERENCES parstemp(parstemp_num)
);
	 */
	
	private String stempNum;
	private String parstempNum;
	private String userId;
	private String stempDate;
	
	public String getStempNum() {
		return stempNum;
	}
	public void setStempNum(String stempNum) {
		this.stempNum = stempNum;
	}
	public String getParstempNum() {
		return parstempNum;
	}
	public void setParstempNum(String parstempNum) {
		this.parstempNum = parstempNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStempDate() {
		return stempDate;
	}
	public void setStempDate(String stempDate) {
		this.stempDate = stempDate;
	}
	
}
