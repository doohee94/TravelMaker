package tm.mypage_checklist.controller;

import java.util.ArrayList;

import org.apache.ibatis.annotations.UpdateProvider;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mongodb.WriteResult;

import tm.schedule.dto.placeDTO;
import tm.schedule.dto.tourDTO;

/**
 * Mypage_checklistController
 * 완성된 일정 체크리스트
 * dir : 폴더경로 
 * */

@Controller
@RequestMapping("/mypage_checklist")
public class Mypage_checklistController {
	
	@Autowired
	private MongoTemplate mongoTemplate;

	private String dir = "mypage_checklist/";
	
	@RequestMapping("/{url}.tm")
	public String checklist(@PathVariable String url){
	   return dir + url;
	      
	}
	
	@RequestMapping("/checklist.tm")
	public ModelAndView showlist(){
		ModelAndView mv = new ModelAndView();
		
		String _id="128"; //dla
		//불러올 정보의 조건을 지정(_id를 가지고 지정)
		Criteria criteria = new Criteria("_id");
		criteria.is(Integer.parseInt(_id));
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
			mv.addObject("obj", jsonobj);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping("/modifyPopupList.tm")
	@ResponseBody
	public JSONObject modifyPopup(){
		String _id="128"; //dla
		//불러올 정보의 조건을 지정(_id를 가지고 지정)
		Criteria criteria = new Criteria("_id");
		criteria.is(Integer.parseInt(_id));
		Query query = new Query(criteria);
		
		//tour정보를 arraylist로 받아온다
				ArrayList<String> tourlist = (ArrayList<String>)mongoTemplate.find(query,String.class,"schedule");
				//출력
				for(int i=0; i<tourlist.size(); i++){
					System.out.println("수정팝업"+tourlist.get(i));
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
				
				
				return jsonobj;
		
	}
	
	@RequestMapping("/changeCheckState.tm")
	@ResponseBody
	public void changeCheckState(@RequestBody String goData){
		System.out.println("체크리스트 스프링@@"+goData);
		try{
			// ajax를 통해 들어온 데이터를 파싱
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(goData);

			String _id = jsonObj.get("_id").toString(); //일정 아이디
			String state = jsonObj.get("state").toString(); //체크상태
			String one_line = jsonObj.get("one_line").toString(); //한줄평
			String date = jsonObj.get("date").toString(); //해당하는 day
			String num = jsonObj.get("num").toString(); //몇번째인지
			
			Criteria criteria = new Criteria();
			criteria.where("_id").is(Integer.parseInt(_id));
			//Criteria.where("tour.date").is(date)
			criteria.where("tour.place.num").is(Integer.parseInt(num));
			Query query = new Query(criteria);
			
			Update update  =  new Update();
			update.set("tour.1.place.$.check",state).set("tour.1.place.$.oneline_review",one_line);
			
			System.out.println("쿼리"+query);
			System.out.println("업데이트묹ㅇ"+update);
			
			WriteResult ws= mongoTemplate.updateFirst(query,update,"shcedule");
			System.out.println("결과"+ws);
			
			
			
			
			
			
			
			
			
			
//			/** _id를 통해 우선 데이터를 find해온 후 파싱해온 데이터로 수정해서 save 해주기 */
//			// find
//			Criteria criteria = new Criteria("_id");
//			criteria.is(Integer.parseInt(_id));
//			Query query = new Query(criteria);
//
//			// tour정보를 String으로 받아온다
//			String tourlist = mongoTemplate.find(query, String.class, "schedule").toString();
//			
//			JSONArray tour = (JSONArray)jsonParser.parse(tourlist);
//	        JSONArray place[] = new JSONArray[tour.size()];
//			
//	        //palce배열에 바싱해온 데이터들 넣기 
//	        for(int i=0; i<tour.size(); i++){
//	        	JSONObject temp = new JSONObject();
//	        	temp = (JSONObject)tour.get(i);
//	        	place[i] = (JSONArray)temp.get("place");
//	        	System.out.println(i+">>>>place>>>>>"+place[i]);
//	        }
//	        
//	        
//			//JSONArray에 있는 데이터 중 들어온 정보랑 맞는 정보를 바꿔준다.
//	        for(int i=0; i<tour.size() && place[i] != null; i++){
//	        	
//	        	JSONObject tourtemp = (JSONObject)tour.get(i);
//	        	String tourStr = tourtemp.get("date").toString();
//	        	System.out.println("저장돼 있는 날짜"+tourStr);
//	        	if(tourStr.equals(date)){ //저장돼 있는 목록과 내가 가져온 date가 같으면
//	        		
//	        		for(int j=0; j<place[i].size(); i++){
//	        			
//	        			if(j ==Integer.parseInt(num)){
//	        				
//	        				JSONObject statetemp = (JSONObject)place[i].get(j);
//	        				String check = statetemp.get("check").toString();
//	        				String one_line_text = statetemp.get("one-line").toString();
//	        				
//	        				
//	        				
//	        			}//end 
//	        			
//	        			
//	        			
//	        		}//end for j
//	        	}//end equals
//	        }//end for i
//	        
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	
	
	

	
}
