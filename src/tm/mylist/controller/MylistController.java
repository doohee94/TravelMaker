package tm.mylist.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("mylist/")
public class MylistController {

	 @Autowired
	  private MongoTemplate mongoTemplate;
/**
* index에서 member 폴더 안써도 가지게
*/
	private String dir = "mylist/";
	
/**
* 인자값 전달을 할수있게
*/
	@RequestMapping("/{url}.tm")
	public String list(@PathVariable String url){
		return dir + url;
	}
	
	@RequestMapping("/inglistsearch.tm")
	@ResponseBody
	public ArrayList<JSONObject> ingList(@RequestBody String list_num,HttpSession session){
		
		//리스트 save_state가져오기
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject)parser.parse(list_num);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String num = obj.get("num").toString();
		String member_id = (String)session.getAttribute("userId");
		
		Criteria c = new Criteria().andOperator(
				Criteria.where("member_id").is(member_id),
				Criteria.where("save_state").is(Integer.parseInt(num))
				);
		Query query = new Query(c);
		ArrayList<JSONObject> list = 
				(ArrayList<JSONObject>)mongoTemplate.find(query, JSONObject.class, "schedule");
		
				
		return list; 
	}
	
	
	
	
	
}
