package tm.totalre.dto;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class TotalreDTO {

   private String totalreNum;
   private String userId;
   private String scNum;
   private String totalreTitle;
   private String totalreContent;
   private String totalrePhoto4;
   private String totalrePhoto4fake;
   private String totalrePhoto3;
   private String totalrePhoto3fake;
   private String totalrePhoto2;
   private String totalrePhoto2fake;
   private String totalrePhoto1;
   private String totalrePhoto1fake;
   private String totalreLikecount;
   private String hashtag;

   public String getHashtag() {
	return hashtag;
}
public void setHashtag(String hashtag) {
	this.hashtag = hashtag;
}
MultipartFile photo1,photo2,photo3,photo4;

   public MultipartFile getPhoto1() {
      return photo1;
   }
   public void setPhoto1(MultipartFile photo1) {
      this.photo1 = photo1;

      //파일 저장 부분
      if( ! photo1.isEmpty() ){
         //업로드 되는 파일 이름
         this.totalrePhoto1 = photo1.getOriginalFilename();
         //중복방지 파일명처리
         String genId = UUID.randomUUID().toString();
         this.totalrePhoto1fake = genId + totalrePhoto1;
         //파일 저장 경로
         File f = new File("C:\\TravelMaker\\TravelMaker\\WebContent\\upload\\review\\"+totalrePhoto1fake);
         try {
            photo1.transferTo(f);
         } catch (IllegalStateException | IOException e) {
            System.out.println("파일 저장 실패 : " + e.getMessage());
         }
      }
   }
   public MultipartFile getPhoto2() {
      return photo2;
   }
   public void setPhoto2(MultipartFile photo2) {
      this.photo2 = photo2;
      
      //파일 저장 부분
            if( ! photo2.isEmpty() ){
               //업로드 되는 파일 이름
               this.totalrePhoto2 = photo2.getOriginalFilename();
               //중복방지 파일명처리
               String genId = UUID.randomUUID().toString();
               this.totalrePhoto2fake = genId + totalrePhoto2;
               //파일 저장 경로
               File f = new File("C:\\TravelMaker\\TravelMaker\\WebContent\\upload\\review\\"+totalrePhoto2fake);
               try {
                  photo2.transferTo(f);
               } catch (IllegalStateException | IOException e) {
                  System.out.println("파일 저장 실패 : " + e.getMessage());
               }
            }
   }
   public MultipartFile getPhoto3() {
      return photo3;
   }
   public void setPhoto3(MultipartFile photo3) {
      this.photo3 = photo3;
      
      //파일 저장 부분
            if( ! photo3.isEmpty() ){
               //업로드 되는 파일 이름
               this.totalrePhoto3 = photo3.getOriginalFilename();
               //중복방지 파일명처리
               String genId = UUID.randomUUID().toString();
               this.totalrePhoto3fake = genId + totalrePhoto3;
               //파일 저장 경로
               File f = new File("C:\\TravelMaker\\TravelMaker\\WebContent\\upload\\review\\"+totalrePhoto3fake);
               try {
                  photo3.transferTo(f);
               } catch (IllegalStateException | IOException e) {
                  System.out.println("파일 저장 실패 : " + e.getMessage());
               }
            }
   }
   public MultipartFile getPhoto4() {
      return photo4;
   }
   public void setPhoto4(MultipartFile photo4) {
      this.photo4 = photo4;
      
      //파일 저장 부분
            if( ! photo4.isEmpty() ){
               //업로드 되는 파일 이름
               this.totalrePhoto4 = photo4.getOriginalFilename();
               //중복방지 파일명처리
               String genId = UUID.randomUUID().toString();
               this.totalrePhoto4fake = genId + totalrePhoto4;
               //파일 저장 경로
               File f = new File("C:\\TravelMaker\\TravelMaker\\WebContent\\upload\\review\\"+totalrePhoto4fake);
               try {
                  photo4.transferTo(f);
               } catch (IllegalStateException | IOException e) {
                  System.out.println("파일 저장 실패 : " + e.getMessage());
               }
            }
   }


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