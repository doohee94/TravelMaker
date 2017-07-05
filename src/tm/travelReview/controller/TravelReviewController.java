package tm.travelReview.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tm.reviewlike.dao.ReviewLikeDAO;
import tm.reviewlike.dto.ReviewLikeDTO;
import tm.totalre.dao.TotalreDAO;
import tm.totalre.dto.TotalreDTO;


/**
 * TravelReviewController
 * 여행리뷰리스트, 상세페이지
 * dir : 폴더경로 
 * */

@Controller
@RequestMapping("/travelReview")
public class TravelReviewController {
	
	@Autowired
	private MongoTemplate mongoTemplate;

	private String dir = "travelReview/";
	
	@RequestMapping("/{url}.tm")
	   public String checklist(@PathVariable String url){
	      return dir + url;
	      
	}
	
	@Autowired
	TotalreDAO dao;
	
	@RequestMapping("/reviewlist.tm")
	public ModelAndView reviewList(String searchContent){
		ModelAndView mv = new ModelAndView();

		ArrayList<TotalreDTO> list = dao.reviewList(searchContent);
		mv.addObject("list",list);
		mv.setViewName(dir+"reviewlist");
		return mv;
	}
	

	
	@RequestMapping(value="/reviewDetail.tm")
	//public ModelAndView showReviewDetail(@RequestParam("id") String _id){
	public ModelAndView showReviewDetail(){
		
		//임의로 준 유저아이디
		String user_id = "maro";
		//임의로 준 번호
		String _id = "128";
		
		ModelAndView mv = new ModelAndView();
		
		TotalreDTO dto = dao.showReview(_id);
		
		//이미 좋아요를 누른건지 아닌지 확인
		
		int reviewlike = 0;
		reviewlike = dao.checkLike(user_id,_id);
		
		mv.addObject("result",reviewlike);
		
		mv.addObject("totalre", dto);
		

	//몽고디비에서 일정 불러오기
		//불러올 정보의 조건을 지정(_id를 가지고 지정)
		Criteria criteria = new Criteria("_id");
		criteria.is(Integer.parseInt(_id));
		Query query = new Query(criteria);
		
		//tour정보를 arraylist로 받아온다
		ArrayList<String> tourlist = (ArrayList<String>)mongoTemplate.find(query,String.class,"schedule");
		
		JSONObject jsonobj = null;
		try {
			//디비에서 가져온 String을 JSON으로 파싱 후 배열에 저장 
			JSONParser jsonParser = new JSONParser();
			jsonobj =  (JSONObject)jsonParser.parse(tourlist.get(0));
			
			//받아온 schedule정보에서 tour배열을 가져온다
			JSONArray tourarray = (JSONArray)jsonobj.get("tour");
			mv.addObject("obj", tourarray);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	
	
}
