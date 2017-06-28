package tm.mypage_checklist.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	

	
}
