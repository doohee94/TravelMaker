package tm.admin.dto;

public class AdminStempDTO {
/*
CREATE TABLE parstemp (
	parstemp_num     VARCHAR2(50)   NOT NULL CONSTRAINT pk_tm_parstemp_num PRIMARY KEY, --제휴 스템프 번호
	partner_num      VARCHAR2(50)   NOT NULL, -- 제휴ID
	partner_name     VARCHAR2(50)   NOT NULL, -- 제휴스템프 지점명
	partner_addr     VARCHAR2(50)   NOT NULL, -- 지점 주소
	PARSTEMP_QRCODEIMG VARCHAR2(20)			  -- QR이미지
    CONSTRAINT fk_tm_stemp_partner_num FOREIGN Key (partner_num) REFERENCES partner(partner_num)
);
 */
	private String parstempNum;
	private String partnerNum;
	private String partnerName;
	private String partnerAddr;
	private String parstempQrcodeimg;
	
	private String partnerReginum;
	private String partnerComname;
	private String partnerPhoto;
	private String partnerPhotofake;
	private String partnerCeoname;
	private String partnerEmail;
	private String partnerTel;
	private String partnerContent;
	private String partnerDate;
	private int partnerState;
	private int partnerType;
	
	
	public String getParstempNum() {
		return parstempNum;
	}
	public void setParstempNum(String parstempNum) {
		this.parstempNum = parstempNum;
	}
	public String getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(String partnerNum) {
		this.partnerNum = partnerNum;
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
	public String getPartnerReginum() {
		return partnerReginum;
	}
	public void setPartnerReginum(String partnerReginum) {
		this.partnerReginum = partnerReginum;
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
	public String getPartnerDate() {
		return partnerDate;
	}
	public void setPartnerDate(String partnerDate) {
		this.partnerDate = partnerDate;
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
	public String getParstempQrcodeimg() {
		return parstempQrcodeimg;
	}
	public void setParstempQrcodeimg(String parstempQrcodeimg) {
		this.parstempQrcodeimg = parstempQrcodeimg;
	}
	
}
