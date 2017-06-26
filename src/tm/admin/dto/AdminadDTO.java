package tm.admin.dto;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class AdminadDTO {
/*
CREATE TABLE advertisement (
	ad_num       VARCHAR2(50)  NOT NULL CONSTRAINT pk_tm_ad_num PRIMARY KEY, -- 광고번호
	partner_num  VARCHAR2(50)  NOT NULL, -- 제휴번호
	ad_title     VARCHAR2(50)  NULL,     -- 타이틀
	ad_photo     VARCHAR2(50)  NOT NULL, -- 광고사진이름
	ad_photofake VARCHAR2(500) NOT NULL, -- 광고사진가짜이름
	ad_check     NUMBER        NOT NULL, -- 체크
	ad_stdate    DATE          NOT NULL, -- 시작날짜
 	ad_eddate    DATE          NOT NULL, -- 끝날짜
  CONSTRAINT fk_tm_partner_num FOREIGN Key (partner_num) REFERENCES partner(partner_num)
);
*/
	
	private String adNum;
	private String partnerNum;
	private String adTitle;
	private String adPhoto;
	private String adPhotofake;
	private int adCheck;
	private String adStdate;
	private String startyear;
	private String startmonth;
	private String startday;
	
	private String adEddate;
	private String endyear;
	private String endmonth;
	private String endday;
	
	
	MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		//파일 저장 부분
		if( ! file.isEmpty() ){
			//업로드 되는 adPhoto 이름
			this.adPhoto = file.getOriginalFilename();
			//중복방지 파일명처리
			String genId = UUID.randomUUID().toString();
			this.adPhotofake = genId + adPhoto;
			//파일 저장 경로
			File f = new File("C:\\TravelMaker\\TravelMaker\\WebContent\\upload\\admin\\"+adPhotofake);
			try {
				file.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				System.out.println("파일 저장 실패 : " + e.getMessage());
			}
		}
	}
	
	
	
	public String getAdNum() {
		return adNum;
	}
	public void setAdNum(String adNum) {
		this.adNum = adNum;
	}
	public String getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(String partnerNum) {
		this.partnerNum = partnerNum;
	}
	public String getAdTitle() {
		return adTitle;
	}
	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}
	public String getAdPhoto() {
		return adPhoto;
	}
	public void setAdPhoto(String adPhoto) {
		this.adPhoto = adPhoto;
	}
	public String getAdPhotofake() {
		return adPhotofake;
	}
	public void setAdPhotofake(String adPhotofake) {
		this.adPhotofake = adPhotofake;
	}
	public int getAdCheck() {
		return adCheck;
	}
	public void setAdCheck(int adCheck) {
		this.adCheck = adCheck;
	}
	public String getAdStdate() {
		return adStdate;
	}
	public void setAdStdate(String adStdate) {
		this.adStdate = adStdate;
	}
	public String getAdEddate() {
		return adEddate;
	}
	public void setAdEddate(String adEddate) {
		this.adEddate = adEddate;
	}
	public String getStartyear() {
		return startyear;
	}
	public void setStartyear(String startyear) {
		this.startyear = startyear;
	}
	public String getStartmonth() {
		return startmonth;
	}
	public void setStartmonth(String startmonth) {
		this.startmonth = startmonth;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndyear() {
		return endyear;
	}
	public void setEndyear(String endyear) {
		this.endyear = endyear;
	}
	public String getEndmonth() {
		return endmonth;
	}
	public void setEndmonth(String endmonth) {
		this.endmonth = endmonth;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	
}
