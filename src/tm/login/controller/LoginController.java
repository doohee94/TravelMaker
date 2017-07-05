package tm.login.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tm.login.dao.LoginDAO;
import tm.login.dto.LoginDTO;

/**
 * LoginController
 * 로그인화면 매핑 처리
 * dir : 폴더 경로
 */
@Controller
@RequestMapping("/tmlogin")
public class LoginController {
   
   private String dir = "login/";
   
   @Autowired
   LoginDAO dao;
   
   @Autowired
   private MongoTemplate mongoTemplate;
   
   /**
    * login
    * 인자값 전달이 필요없는 부분 담당
    */   
   
   @RequestMapping("/{url}.tm")
   public String login(@PathVariable String url){
      return dir+url;
   }
   /*
    * Login시 DB에서 id와 pw값으로 비교후
    * 리턴 받은 id와 nick를
    * session에 userId와 userNick를 저장하고 메인페이지로 이동 
   */
   @RequestMapping("/loginUser.tm")
      public String loginUser(String user_id, String user_pw, HttpSession session){
         LoginDTO dto = dao.loginUser(user_id, user_pw);
         String result = "";
         if(dto !=null){
            session.setAttribute("userId", dto.getUserId());
            session.setAttribute("userNick", dto.getUserNick());
            System.out.println("로그인 성공");
            if(dto.getUserType() == 10){
               result = "redirect:/tmmain/main.tm";
               
               
               Criteria criteria = new Criteria("member_id");
            criteria.is(user_id);
            Query query = new Query(criteria);
                     
            //tour정보를 arraylist로 받아온다
            ArrayList<String> tourlist = (ArrayList<String>)mongoTemplate.find(query,String.class,"schedule");
            
            //출력
            for(int i=0; i<tourlist.size(); i++){
               System.out.println(tourlist.get(i));
            }
               
            JSONObject jsonobj = null;
            try {
               //디비에서 가져온 String을 JSON으로 파싱 후 배열에 저장 
               JSONParser jsonParser = new JSONParser();
               jsonobj =  (JSONObject)jsonParser.parse(tourlist.get(0));
               System.out.println(jsonobj);
            } catch (ParseException e) {
               e.printStackTrace();
            }
            //현재날짜 가져와서 디비에 저장된 일정 시작날짜랑 비교해서 시작된 일정인지 아닌지 비교
            String curDate = new java.text.SimpleDateFormat("yy-MM-dd").format(new java.util.Date());
               System.out.println(curDate);
               
            }else if(dto.getUserType() == 30){
               result = "redirect:/tmadmin/adminMember.tm";
            }
            
            
         }else{
            System.out.println("로그인 실패");
            result = "redirect:/member/loginForm.tm";
         }
         System.out.println(result);
         return result;
      }

}