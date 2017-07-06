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
	public ModelAndView showlist(String _id){
		ModelAndView mv = new ModelAndView();
		
		System.out.println("체크리스트 아이디"+_id);
		//불러올 정보의 조건을 지정(_id를 가지고 지정)
		Criteria criteria = new Criteria("_id");
		criteria.is(_id);
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
			
			int temp = 0;
			
			if(date.length() > 4){
				temp = Integer.parseInt(date.substring(4,5));
				System.out.println("1번--------------"+temp);
			}else if(date.length() == 4){
				temp = Integer.parseInt(date.substring(3,4));
				System.out.println("2번--------------"+temp);
			}
			
			String condition1="tour."+(temp-1)+".place."+num+".check";
			String condition2="tour."+(temp-1)+".place."+num+".oneline_review";

			
			
			Query query = new Query(new Criteria().andOperator(
					Criteria.where("_id").is(_id),
					Criteria.where("tour.date").is(date),
					Criteria.where("tour.place.num").is(Integer.parseInt(num))			
			));
			
			Update update = new Update();
			update.set(condition1,state).set(condition2,one_line);
			
			WriteResult ws= mongoTemplate.updateFirst(query,update,"schedule");
			System.out.println("결과"+ws);
		
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	
	
	

	
}
