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
import org.springframework.data.mongodb.core.query.Update;
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
	 * 
	 * userId에 해당하는 일정을 모두 불러와 날짜를 비교 후 일정 저장상태 변경 
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

				//로그인 할 경우 오늘 날짜와 비교해서 디비에 저장된 저장 상태값 바꿔주기 3 : 시작된 일정 //4: 여행한 일정
				Criteria criteria = new Criteria("member_id").is(user_id).orOperator(
								Criteria.where("save_state").is(0),
								Criteria.where("save_state").is(1),
								Criteria.where("save_state").is(2));
				Query query = new Query(criteria);

				//tour정보를 arraylist로 받아온다
				ArrayList<String> tourlist =  new ArrayList<String>();
				tourlist = (ArrayList<String>)mongoTemplate.find(query,String.class,"schedule");
				ArrayList<String> start_idList = new ArrayList<String>();
				ArrayList<String> end_idList = new ArrayList<String>();
				String curDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
				System.out.println(curDate);
				if(tourlist.size() != 0){
					//출력
					for(int i=0; i<tourlist.size(); i++){
						JSONObject jsonobj = null;
						try {
							//디비에서 가져온 String을 JSON으로 파싱 후 배열에 저장 
							JSONParser jsonParser = new JSONParser();
							jsonobj =  (JSONObject)jsonParser.parse(tourlist.get(i));
							
							String sDate = jsonobj.get("sDate").toString();
							String eDate = jsonobj.get("eDate").toString();
							//날짜 구하는 부분
							String []sDateArr = new String[3];
							String []eDateArr = new String[3];
							
							String sDateStr = "";
							String eDateStr = "";
							
							sDateArr = sDate.split("-");
							eDateArr = eDate.split("-");
							
							for(int x=0; x<3; x++){								
								sDateStr+=sDateArr[x];
								eDateStr+=eDateArr[x];								
							}		
							String _id = jsonobj.get("_id").toString();						
							//오늘날짜랑 시작날짜랑 비교해서 오늘날짜가 크거나 같으면 상태 바꿔주기
							if(Integer.parseInt(sDateStr) <= Integer.parseInt(curDate)){ 
								Criteria _idCriteria = new Criteria("_id");
								_idCriteria.is(_id);
								Query _idQuery = new Query(_idCriteria);
								Update update = new Update();
								update.set("save_state",2);
								mongoTemplate.updateFirst(_idQuery, update, "schedule");
								
							}
							//오늘날짜랑 종료날짜랑 비교해서 오늘날짜가 크면 상태 바꿔주기
							if(Integer.parseInt(eDateStr) < Integer.parseInt(curDate)){
								Criteria _idCriteria = new Criteria("_id");
								_idCriteria.is(_id);
								Query _idQuery = new Query(_idCriteria);
								Update update = new Update();
								update.set("save_state",3);
								mongoTemplate.updateFirst(_idQuery, update, "schedule");	
							}
														
						} catch (ParseException e) {
							e.printStackTrace();
						}//end catch
					
					}//end for

					
				}//end if
				//현재날짜 가져와서 디비에 저장된 일정 시작날짜랑 비교해서 시작된 일정인지 아닌지 비교
				

			}else if(dto.getUserType() == 30){
				session.setAttribute("admin", "admin");
				result = "redirect:/tmadmin/adminMember.tm";
			}


		}else{
			System.out.println("로그인 실패");
			result = "redirect:/member/loginForm.tm?state=20";
		}
		System.out.println(result);
		return result;
	}

}