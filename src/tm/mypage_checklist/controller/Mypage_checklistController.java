package tm.mypage_checklist.controller;

import java.util.ArrayList;

import org.bson.Document;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/showlist.tm")
	@ResponseBody
	public void showlist(@RequestBody String _id){
		
		//불러올 정보의 조건을 지정(_id를 가지고 지정)
		Criteria criteria = new Criteria("_id");
		criteria.is(_id);
		
		
		Query query = new Query(criteria);
		
		//ArrayList tourlist = mongoTemplate.find(query,,"schedule.tour");
	}
}
