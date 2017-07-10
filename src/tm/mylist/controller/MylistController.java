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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tm.mylist.dao.MylistDAO;

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
	
	@Autowired
	MylistDAO dao;
	/**
	 * 일정 리스트에서 _id를 받아와 일정 삭제/ 여행한 일정+리뷰가 작성 된 경우 오라클쪽도 삭제
	 * 파라메터 : _id 몽고디비 아이디 값 // num :몽고디비 save_state값
	 * 리턴타입 : 바로 리스트로 갈 수 잇도록 
	 * */
	@RequestMapping("/delete.tm")
	public String delete(String _id, String num){
		
		String result = "";
		Criteria c = new Criteria("_id").is(_id);
		Query query = new Query(c);
		mongoTemplate.remove(query, "schedule");
		
		
		//여행한 일정일 경우 -> 리뷰를 작성한 경우 
		if(num.equals("3")){
			String totalre_num = dao.findReview(_id);
			
			if(totalre_num != null){
				dao.deleteReview(_id);
			}
			
		}
		
		
		
		if(num.equals("0")){
			result = "redirect:/mylist/inglist.tm";
		}else if(num.equals("1")){
			result ="redirect:/mylist/donelist.tm";
		}else if(num.equals("2")){
			result = "redirect:/mylist/startlist.tm";
		}else if(num.equals("3")){
			result ="redirect:/mylist/endlist.tm";
		}
		
		return result;
		
	}
	
	
	/**
	 * 해당 일정의 리뷰가 등록되어있는경우 삭제
	 * 파라메터 : _id 일정 번호
	 * 리턴타입 : 리스트로 바로 갈 수 있는 경로 
	 * */
	@RequestMapping("/deleteReview.tm")
	public String deleteReview(@RequestParam("_id") String _id){
		
		dao.deleteReview(_id);
		
		return "redirect:/mylist/endlist.tm";
	}
	
	@RequestMapping("/findReview.tm")
	@ResponseBody
	public String findReview(@RequestBody String _idData){
		
		JSONParser parser = new JSONParser();
		JSONObject obj =null;
		try {
			obj = (JSONObject)parser.parse(_idData);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String _id = obj.get("_id").toString();
		String totalre_num = dao.findReview(_id);
		
		return totalre_num; 
	}
	
	
}
