package tm.mypage.dto;

import java.util.Date;

public class StempDTO {
/*
 	CREATE TABLE STEPM (
			stemp_num    	VARCHAR2(50)   NOT NULL, -- 스템프 번호
			parstemp_num   	VARCHAR2(50)   NOT NULL, -- 제휴 스템프 번호
			user_id       	VARCHAR2(50)   NOT NULL, -- 회원ID
			stemp_date    	DATE,                    -- 찍은 날짜
			partner_name	VARCHAR2(50)			 -- 지점이름
			partner_addr	VARCHAR2(50)			 --	지점 주소
	);		
*/	
	String stempNum;
	String parstempNum;
	String userId;
	Date stempDate;
	String partnerName;
	String partnerAddr;
	
	
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
	public Date getStempDate() {
		return stempDate;
	}
	public void setStempDate(Date stempDate) {
		this.stempDate = stempDate;
	}
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public String getPartnerAddr() {
		return partnerAddr;
	}
	public void setPartnerAddr(String partnerAddr) {
		this.partnerAddr = partnerAddr;
	}
	
}
