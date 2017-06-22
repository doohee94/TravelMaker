package tm.alliance.dto;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class AllianceDTO {
	/*
CREATE TABLE partner (
	partner_num       VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_partner_num PRIMARY key, -- 제휴번호
	partner_reginum   VARCHAR2(50)   NOT NULL, -- 사업자등록번호
	partner_comname   VARCHAR2(50)   NOT NULL, -- 회사명
	partner_photo     VARCHAR2(50)   ,         -- 사업자등록증사진경로
	partner_photofake VARCHAR2(500)  ,         -- 사업자등록증 가짜이름
	partner_ceoname   VARCHAR2(50)   NOT NULL, -- 대표명
	partner_email     VARCHAR2(50)   NOT NULL, -- EMAIL
	partner_tel       VARCHAR2(50)   NOT NULL, -- 연락처
	partner_content   VARCHAR2(1024) NOT NULL, -- 문의내용
	partner_date      date           NOT NULL, -- 등록일
	partner_state     NUMBER         NOT NULL, -- 승인/비승인상태
	partner_type      NUMBER         NOT NULL  -- 제휴종류상태
);
	 */
	
	private String partnerNum;
	private String partnerReginum;
	private String partnerComname;
	private String partnerPhoto;
	private String partnerPhotofake;
	private String partnerCeoname;
	private String partnerEmail;
	private String partnerTel;
	private String partnerTel1;
	private String partnerTel2;
	private String partnerTel3;
	private String partnerContent;
	private String partnerDate;
	private int partnerState;
	private int partnerType;

	
	MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		//파일 저장 부분
		if( ! file.isEmpty() ){
			//업로드 되는 파일 이름
			this.partnerPhoto = file.getOriginalFilename();
			//중복방지 파일명처리
			String genId = UUID.randomUUID().toString();
			this.partnerPhotofake = genId + partnerPhoto;
			//파일 저장 경로
//			File f = new File("C:\\TravelMaker\\TravelMaker\\WebContent\\upload\\alliance\\"+partnerPhotofake);
			File f = new File("C:\\TravelMaker\\Test\\WebContent\\upload\\alliance\\"+partnerPhotofake);
			try {
				file.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				System.out.println("파일 저장 실패 : " + e.getMessage());
			}
		}
	}
	public String getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(String partnerNum) {
		this.partnerNum = partnerNum;
	}
	public String getPartnerReginum() {
		return partnerReginum;
	}
	public void setPartnerReginum(String partnerReginum) {
		this.partnerReginum = partnerReginum.substring(0,3) + "-" + partnerReginum.substring(3,5) + "-" + partnerReginum.substring(5);
	}
	public String getPartnerComname() {
		return partnerComname;
	}
	public void setPartnerComname(String partnerComname) {
		this.partnerComname = partnerComname;
	}
	public String getPartnerPhoto() {
		return partnerPhoto;
	}
	public void setPartnerPhoto(String partnerPhoto) {
		this.partnerPhoto = partnerPhoto;
	}
	public String getPartnerPhotofake() {
		return partnerPhotofake;
	}
	public void setPartnerPhotofake(String partnerPhotofake) {
		this.partnerPhotofake = partnerPhotofake;
	}
	public String getPartnerCeoname() {
		return partnerCeoname;
	}
	public void setPartnerCeoname(String partnerCeoname) {
		this.partnerCeoname = partnerCeoname;
	}
	public String getPartnerEmail() {
		return partnerEmail;
	}
	public void setPartnerEmail(String partnerEmail) {
		this.partnerEmail = partnerEmail;
	}
	public String getPartnerTel() {
		return partnerTel;
	}
	public void setPartnerTel(String partnerTel) {
		this.partnerTel = partnerTel;
	}
	public String getPartnerContent() {
		return partnerContent;
	}
	public void setPartnerContent(String partnerContent) {
		this.partnerContent = partnerContent;
	}
	public int getPartnerState() {
		return partnerState;
	}
	public void setPartnerState(int partnerState) {
		this.partnerState = partnerState;
	}
	public int getPartnerType() {
		return partnerType;
	}
	public void setPartnerType(int partnerType) {
		this.partnerType = partnerType;
	}
	public String getPartnerDate() {
		return partnerDate;
	}
	public void setPartnerDate(String partnerDate) {
		this.partnerDate = partnerDate;
	}
	public String getPartnerTel1() {
		return partnerTel1;
	}
	public void setPartnerTel1(String partnerTel1) {
		this.partnerTel1 = partnerTel1;
	}
	public String getPartnerTel2() {
		return partnerTel2;
	}
	public void setPartnerTel2(String partnerTel2) {
		this.partnerTel2 = partnerTel2;
	}
	public String getPartnerTel3() {
		return partnerTel3;
	}
	public void setPartnerTel3(String partnerTel3) {
		this.partnerTel3 = partnerTel3;
		this.partnerTel = partnerTel1+"-"+partnerTel2+"-"+partnerTel3;
	}
	
}
