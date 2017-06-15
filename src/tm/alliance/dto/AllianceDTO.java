package tm.alliance.dto;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class AllianceDTO {
	private String txt1;
	private String txt2;
	private String txt3;
	private String txt4;
	private String txt5;
	private String txt6;
	private String txt7;
	private String txt8;
	private String txt9;
	private String txt10;
	
	MultipartFile file;
	
	private String savefile;
	private String originfile;
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		//파일 저장 부분
		if( ! file.isEmpty() ){
			//업로드 되는 파일 이름
			this.originfile = file.getOriginalFilename();
			//중복방지 파일명처리
			String genId = UUID.randomUUID().toString();
			this.savefile = genId + originfile;
			//파일 저장 경로
			File f = new File("C:\\TravelMaker\\TravelMaker\\WebContent\\upload\\alliance\\"+savefile);
			System.out.println(savefile);
			try {
				file.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				System.out.println("파일 저장 실패 : " + e.getMessage());
			}
		}
	}
	
	public String getSavefile() {
		return savefile;
	}
	public void setSavefile(String savefile) {
		this.savefile = savefile;
	}
	public String getOriginfile() {
		return originfile;
	}
	public void setOriginfile(String originfile) {
		this.originfile = originfile;
	}
	public String getTxt1() {
		return txt1;
	}
	public void setTxt1(String txt1) {
		this.txt1 = txt1;
	}
	public String getTxt2() {
		return txt2;
	}
	public void setTxt2(String txt2) {
		this.txt2 = txt2;
	}
	public String getTxt3() {
		return txt3;
	}
	public void setTxt3(String txt3) {
		this.txt3 = txt3;
	}
	public String getTxt4() {
		return txt4;
	}
	public void setTxt4(String txt4) {
		this.txt4 = txt4;
	}
	public String getTxt5() {
		return txt5;
	}
	public void setTxt5(String txt5) {
		this.txt5 = txt5;
	}
	public String getTxt6() {
		return txt6;
	}
	public void setTxt6(String txt6) {
		this.txt6 = txt6;
	}
	public String getTxt7() {
		return txt7;
	}
	public void setTxt7(String txt7) {
		this.txt7 = txt7;
	}
	public String getTxt8() {
		return txt8;
	}
	public void setTxt8(String txt8) {
		this.txt8 = txt8;
	}
	public String getTxt9() {
		return txt9;
	}
	public void setTxt9(String txt9) {
		this.txt9 = txt9;
	}
	public String getTxt10() {
		return txt10;
	}
	public void setTxt10(String txt10) {
		this.txt10 = txt10;
	}
	
}
